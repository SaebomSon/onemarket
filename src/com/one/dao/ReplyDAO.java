package com.one.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.one.dto.ReplyDTO;

public class ReplyDAO {
	private static ReplyDAO instance = new ReplyDAO();
	private Connection getConnection() throws Exception {
		Connection conn = null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/shop?characterEncoding=UTF-8&serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "root", "bom56");

		return conn;
		
	}
	
	public static ReplyDAO getInstance() {
		return instance;
		
	}
	
	private void closeConnection(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		if(rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(pstmt!=null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn!=null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void addReply(String buyer_id, String repCom, int product_idx) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		conn = getConnection();
		
		String sql = "insert into reply(buyer_id, repCom, product_idx) values(?, ?, ?)";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, buyer_id);
		pstmt.setString(2, repCom);
		pstmt.setInt(3, product_idx);
		pstmt.executeUpdate();
		
		closeConnection(conn, pstmt, null);
		
	}
	
	public List<ReplyDTO> ReplyAll(int pageNum, int sizePerPage) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ReplyDTO rDTO = null;
		List<ReplyDTO> list = new ArrayList<ReplyDTO>();
		Connection conn = null;
		
		conn = getConnection();

		String sql = "SELECT * FROM reply ORDER BY idx DESC,"  // ¼öÁ¤
				+ "repNo ASC LIMIT ?,?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, (pageNum-1)*sizePerPage);
		pstmt.setInt(2, sizePerPage);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			rDTO = new ReplyDTO();
			rDTO.setProduct_idx(rs.getInt("product_idx"));
			rDTO.setRepNo(rs.getInt("repNo"));
			rDTO.setBuyer_id(rs.getString("buyer_id"));
			rDTO.setRepCom(rs.getString("repCom"));
			rDTO.setRepDate(rs.getDate("repDate"));
			list.add(rDTO);
		}
		closeConnection(conn, pstmt, rs);
		return list;
	}
}
