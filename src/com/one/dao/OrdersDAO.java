package com.one.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.one.dto.BuyerDTO;
import com.one.dto.InnerJoinDTO;
import com.one.dto.OrdersDTO;
import com.one.dto.ProductDTO;
import com.one.dto.SellerDTO;

public class OrdersDAO {
	private static OrdersDAO instance = new OrdersDAO();

	private OrdersDAO() {
		super();
	}

	public static OrdersDAO getInstance() {
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

	//결제 하기 버튼 누른 후 실행되는 메소드(결제완료페이지로 넘어가면서)
	public ArrayList<OrdersDTO> insertProduct(OrdersDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<OrdersDTO> list = new ArrayList<OrdersDTO>();
		try {
			conn = getConnection();

			String sql = "insert into orders(buyer_idx, seller_idx, product_idx, payment_method, order_quantity)"
					+ " values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getBuyer_idx());
			pstmt.setInt(2, dto.getSeller_idx());
			pstmt.setInt(3, dto.getProduct_idx());
			pstmt.setString(4, dto.getPayment_method());
			pstmt.setInt(5, dto.getOrder_quantity());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		closeConnection(conn, pstmt, rs);
		return list;
	}
	
	// 결제 완료 되었을 때(구매 목록 클릭하면....)
	public ArrayList<InnerJoinDTO> completeOrder(int b_idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<InnerJoinDTO> list = new ArrayList<InnerJoinDTO>();
		
		try {
			conn = getConnection();
			String sql = "select distinct product.name,product.price,payment_method,order_date " + 
					"from orders inner join basket,product,buyer " + 
					"where product.idx=orders.product_idx and orders.buyer_idx=buyer.idx and orders.order_quantity=basket.quantity and buyer_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_idx);
			rs = pstmt.executeQuery();
			
			InnerJoinDTO dto = null;
			
			while(rs.next()) {
				dto = new InnerJoinDTO();
				
				dto.setP_name(rs.getString("product.name"));
				dto.setP_price(rs.getInt("product.price"));
				dto.setPayment_method(rs.getString("payment_method"));
				dto.setOrder_date(rs.getString("order_date"));
				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		closeConnection(conn, pstmt, rs);
		return list;
	}

}
