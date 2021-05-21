package com.one.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.one.dto.BasketDTO;

public class BasketDAO {
	private static BasketDAO instance = new BasketDAO();

	private BasketDAO() {
		super();
	}

	public static BasketDAO getInstance() {
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

	// 장바구니에 같은 상품이 있는지 없는지 check
	public boolean checkBasket(int b_idx, int p_idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean result = false;
		try {
			conn = getConnection();

			String sql = "select * from basket where b_idx=? and p_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_idx);
			pstmt.setInt(2, p_idx);
			rs = pstmt.executeQuery();

			// 갖고 있음
			if (rs.next()) {
				result = true;
			} else {
				result = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}

	// 장바구니 같은 상품 O
	public ArrayList<BasketDTO> hadProduct(int b_idx, int p_idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ArrayList<BasketDTO> list = new ArrayList<BasketDTO>();

		try {
			conn = getConnection();
			String sql = "update basket set quantity=quantity+1, p_price=quantity*p_price where b_idx=? and p_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_idx);
			pstmt.setInt(2, p_idx);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		closeConnection(conn, pstmt, null);
		return list;
	}

	// 장바구니에 같은 상품 X
	public ArrayList<BasketDTO> insertBasket(int b_idx, int p_idx, String p_name, int p_price, int quantity,
			String img_src) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ArrayList<BasketDTO> list = new ArrayList<BasketDTO>();

		try {
			conn = getConnection();
			String sql = "insert into basket(b_idx, p_idx, p_name, p_price, quantity, img_src)"
					+ " values(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_idx);
			pstmt.setInt(2, p_idx);
			pstmt.setString(3, p_name);
			pstmt.setInt(4, p_price);
			pstmt.setInt(5, quantity);
			pstmt.setString(6, img_src);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		closeConnection(conn, pstmt, null);
		return list;
	}

	// 장바구니에 있는 모든 상품 보여줌
	public ArrayList<BasketDTO> showBasket(int b_idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<BasketDTO> list = new ArrayList<BasketDTO>();

		try {
			conn = getConnection();
			String sql = "select * from basket where b_idx=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_idx);
			rs = pstmt.executeQuery();

			BasketDTO bdto = null;
			while (rs.next()) {
				bdto = new BasketDTO();
				bdto.setIdx(rs.getInt("idx"));
				bdto.setB_idx(rs.getInt("b_idx"));
				bdto.setP_idx(rs.getInt("p_idx"));
				bdto.setP_name(rs.getString("p_name"));
				bdto.setP_price(rs.getInt("p_price"));
				bdto.setQuantity(rs.getInt("quantity"));
				bdto.setImg_src(rs.getString("img_src"));

				list.add(bdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		closeConnection(conn, pstmt, rs);
		return list;
	}

	// 선택한 db 삭제하기(삭제 버튼)-basket의 idx(개별버튼)
	public ArrayList<BasketDTO> deleteBasket(int idx, int b_idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		ArrayList<BasketDTO> list = new ArrayList<BasketDTO>();

		try {
			conn = getConnection();

			String sql = "delete from basket where idx=? and b_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setInt(2, b_idx);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		closeConnection(conn, pstmt, null);
		return list;
	}

	public ArrayList<BasketDTO> getBasketInfo(int idx, int b_idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<BasketDTO> list = new ArrayList<BasketDTO>();
		BasketDTO bdto = null;

		try {
			conn = getConnection();
			String sql = "select * from basket where idx=? and b_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setInt(2, b_idx);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				bdto = new BasketDTO();
				bdto.setIdx(rs.getInt("idx"));
				bdto.setB_idx(rs.getInt("b_idx"));
				bdto.setP_idx(rs.getInt("p_idx"));
				bdto.setP_name(rs.getString("p_name"));
				bdto.setP_price(rs.getInt("p_price"));
				bdto.setQuantity(rs.getInt("quantity"));
				bdto.setImg_src(rs.getString("img_src"));

				list.add(bdto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		closeConnection(conn, pstmt, rs);
		return list;
	}
	
	public BasketDTO getQuantityInfo(int b_idx, int p_idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		BasketDTO bdto = null;

		try {
			conn = getConnection();
			String sql = "select quantity from basket where b_idx=? and p_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_idx);
			pstmt.setInt(2, p_idx);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				bdto = new BasketDTO();
				bdto.setQuantity(rs.getInt("quantity"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		closeConnection(conn, pstmt, rs);
		return bdto;
	}
	
	public void minusQuan(int idx) throws Exception {

	      Connection conn = getConnection();
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;

	      String sql = "update basket, product set quantity=quantity-1,p_price=p_price-product.price where basket.idx=? and basket.p_idx=product.idx;";
	      pstmt=conn.prepareStatement(sql);
	      pstmt.setInt(1, idx);
	      pstmt.executeUpdate();
	   }

	   public void plusQuan(int idx) throws Exception {
	      Connection conn = getConnection();
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;

	      String sql = "update basket, product set quantity=quantity+1,p_price=p_price+product.price where basket.idx=? and basket.p_idx=product.idx;";
	      pstmt=conn.prepareStatement(sql);
	      pstmt.setInt(1, idx);
	      pstmt.executeUpdate();
	   }

}
