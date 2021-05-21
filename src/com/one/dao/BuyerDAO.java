package com.one.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.one.dto.BuyerDTO;

public class BuyerDAO {

	private static BuyerDAO instance = new BuyerDAO();

	private BuyerDAO() {
		super();
	}

	public static BuyerDAO getInstance() {
		return instance;
	}

	// 1. getConnection()
	private Connection getConnection() throws Exception {

		Connection conn = null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/shop?characterEncoding=UTF-8&serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "root", "bom56");

		return conn;
	}

	// 2. closeConnection()
	private void closeConnection(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	// buyer idx 받아오기
	public int getIdx(String id) throws Exception {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      conn = getConnection();
	      pstmt = conn.prepareStatement("select idx from buyer where id=?;");
	      pstmt.setString(1, id);
	      int idx = 1;
	      rs = pstmt.executeQuery();
	      if (rs.next()) {
	         idx = rs.getInt("idx");
	      }
	      
	      return idx;
	}
	
	public boolean checkId(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		conn = getConnection();
		
		boolean result = false;
		
		pstmt = conn.prepareStatement("Select * from buyer where id=?");
		pstmt.setNString(1, id);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			result = true;
		}
		
		if(result) {
			return true;
		} else {
			return false;
		}
	}
	
	//마이페이지 내정보 수정 로그인 체크
	public String checkPassword(int idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();

			String sql = "select pw from buyer where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return rs.getString("pw");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		closeConnection(conn, pstmt, rs);
		return null;
	}

	// 회원정보 수정 완료(update)
	public BuyerDTO updateMyInfo(int idx, String pw, String address, String phone, String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		BuyerDTO dto = new BuyerDTO();

		try {
			conn = getConnection();
			String sql = "update buyer set pw=?, address=?, phone=?, email=? where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, address);
			pstmt.setString(3, phone);
			pstmt.setString(4, email);
			pstmt.setInt(5, idx);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		closeConnection(conn, pstmt, null);
		return dto;
	}

	// 주문페이지 주문자 정보
	public ArrayList<BuyerDTO> getBuyerInfo(int idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<BuyerDTO> list = new ArrayList<BuyerDTO>();

		try {
			conn = getConnection();

			String sql = "select * from buyer where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			BuyerDTO dto = null;
			if (rs.next()) {
				dto = new BuyerDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setAddress(rs.getString("address"));
				dto.setPhone(rs.getString("phone"));
				dto.setName(rs.getString("name"));
				dto.setInterest(rs.getString("interest"));
				dto.setGender(rs.getString("gender"));
				dto.setEmail(rs.getString("email"));
				
				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		closeConnection(conn, pstmt, rs);
		return list;
	}
	
	// �쉶�썝媛��엯 湲곕뒫 
		public void insertBuyer(BuyerDTO dto){
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				conn = getConnection();
				String sql = "insert into buyer(id, pw, address, phone, name, interest, gender , email)"
						+" values(?,?,?,?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPw());
				pstmt.setString(3, dto.getAddress());
				pstmt.setString(4, dto.getPhone());
				pstmt.setString(5, dto.getName());
				pstmt.setString(6, dto.getInterest());
				pstmt.setString(7, dto.getGender());
				pstmt.setString(8, dto.getEmail());
				
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		// 以묐났�븘�씠�뵒 泥댄겕湲곕뒫 
		public BuyerDTO selectMemberById(String id) throws Exception {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			BuyerDTO Buyervo = null;// 
			
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM shop.buyer WHERE id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			// 留뚯빟 李얜뒗 媛믪씠 �뾾�떎硫� �떎�뻾�븞�릺�뒗 肄붾뱶�엫
			
			// �떎�뻾�릺硫� rs.next() �뿉 �엳�떎�뒗寃�
			
			if(rs.next()) {
				Buyervo = new BuyerDTO();
				//以묐났�릺�뒗寃� �엳�쓬 洹몃젃�떎硫�  dto媛앹껜 �깮�꽦 
				
				Buyervo.setId(rs.getString("id"));
			}	
			
			closeConnection(conn, pstmt, rs);
			return Buyervo;
			//BuyerDTO�씪�뒗 媛앹껜媛� 由ы꽩 
		
		}
		
		// 濡쒓렇�씤 
		public boolean loginMember(String id , String pw) throws Exception {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			BuyerDTO Buyervo = null;// 
			
			conn = getConnection();
			pstmt = conn.prepareStatement("select pw from buyer where id=?;");
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
				
			boolean result = false;
			
			if(rs.next()) {
				if(rs.getString("pw").equals(pw)) {
					result= true;
				}
			}
			return result;
			
		}
		
		//7. �븘�씠�뵒 李얘린(�닔�뿰異붽�)
		   public String searchId(String name, String phone) throws Exception {
			   
			   Connection conn = null;
			   PreparedStatement pstmt = null;
			   ResultSet rs = null; 
			   String result = null;
			   
			   conn = getConnection();
			   pstmt = conn.prepareStatement("SELECT id FROM shop.buyer WHERE name=? and phone=?");
			   pstmt.setString(1, name);
			   pstmt.setString(2, phone);
			   rs = pstmt.executeQuery();
			   
			   if(rs.next()) {
				   result = rs.getString("id");
			   }
			   closeConnection(conn, pstmt, rs);
			   return result; //�떎�뻾 �븞�릺硫� 洹몃�濡� null媛�,, 
			   
		   }
		

}
