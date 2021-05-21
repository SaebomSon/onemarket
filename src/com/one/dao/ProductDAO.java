package com.one.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.one.dto.ProductDTO;

public class ProductDAO {

	private static ProductDAO instance = new ProductDAO();

	private ProductDAO() {
	}

	public static ProductDAO getInstance() {
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
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	// 검색결과
	public List<ProductDTO> searchProducts(String search) throws Exception {
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from product where name like ? order by idx desc;";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, search + "%");
		rs = pstmt.executeQuery();

		while (rs.next()) {
			ProductDTO dto = new ProductDTO();
			dto.setIdx(rs.getInt("idx"));
			dto.setCategory(rs.getString("category"));
			dto.setName(rs.getString("name"));
			dto.setStock(rs.getInt("stock"));
			dto.setPrice(rs.getInt("price"));
			dto.setImg_src(rs.getString("img_src"));
			dto.setSeller_idx(rs.getInt("seller_idx"));
			dto.setHitcount(rs.getInt("hitcount"));

			list.add(dto);

		}
		closeConnection(conn, pstmt, rs);
		return list;
	}

	// 메인화면 구성 dao
	public List<ProductDTO> showProducts() throws Exception {
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from product order by idx desc;";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			ProductDTO dto = new ProductDTO();
			dto.setIdx(rs.getInt("idx"));
			dto.setCategory(rs.getString("category"));
			dto.setName(rs.getString("name"));
			dto.setStock(rs.getInt("stock"));
			dto.setPrice(rs.getInt("price"));
			dto.setImg_src(rs.getString("img_src"));
			dto.setSeller_idx(rs.getInt("seller_idx"));
			dto.setHitcount(rs.getInt("hitcount"));

			list.add(dto);

		}
		closeConnection(conn, pstmt, rs);
		return list;
	}

	// 조회수가 많은 제품목록
	public List<ProductDTO> topProducts() throws Exception {
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from product order by hitcount desc limit 6;";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			ProductDTO dto = new ProductDTO();
			dto.setIdx(rs.getInt("idx"));
			dto.setCategory(rs.getString("category"));
			dto.setName(rs.getString("name"));
			dto.setStock(rs.getInt("stock"));
			dto.setPrice(rs.getInt("price"));
			dto.setImg_src(rs.getString("img_src"));
			dto.setSeller_idx(rs.getInt("seller_idx"));
			dto.setHitcount(rs.getInt("hitcount"));

			list.add(dto);

		}
		closeConnection(conn, pstmt, rs);
		return list;
	}

	// 제품상세
	public ProductDTO showProduct(int idx) throws Exception {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ProductDTO dto = new ProductDTO();

		String sql = "select * from product where idx=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			dto.setIdx(rs.getInt("idx"));
			dto.setCategory(rs.getString("category"));
			dto.setName(rs.getString("name"));
			dto.setStock(rs.getInt("stock"));
			dto.setPrice(rs.getInt("price"));
			dto.setImg_src(rs.getString("img_src"));
			dto.setSeller_idx(rs.getInt("seller_idx"));
			dto.setHitcount(rs.getInt("hitcount"));
			dto.setDetails(rs.getString("details"));
		}

		sql = "UPDATE product SET hitcount = hitcount + 1 WHERE idx=" + idx;
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();

		closeConnection(conn, pstmt, rs);
		return dto;
	}

	// 카테고리별 제품검색
	public List<ProductDTO> searchProductsByCategory(String search) throws Exception {
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from product where category like ? order by idx desc;";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, search);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			ProductDTO dto = new ProductDTO();
			dto.setIdx(rs.getInt("idx"));
			dto.setCategory(rs.getString("category"));
			dto.setName(rs.getString("name"));
			dto.setStock(rs.getInt("stock"));
			dto.setPrice(rs.getInt("price"));
			dto.setImg_src(rs.getString("img_src"));
			dto.setSeller_idx(rs.getInt("seller_idx"));
			dto.setHitcount(rs.getInt("hitcount"));

			list.add(dto);

		}
		closeConnection(conn, pstmt, rs);
		return list;
	}

	public void insertProduct(ProductDTO productDto, int seller_idx) throws Exception { // 제품 등록시 필요함
		Connection conn = null;
		PreparedStatement pstmt = null;

		conn = getConnection();
		String sql = "INSERT INTO product(category, name, price, details, stock, img_src, seller_idx) values(?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productDto.getCategory());
		pstmt.setString(2, productDto.getName());
		pstmt.setInt(3, productDto.getPrice());
		pstmt.setString(4, productDto.getDetails());
		pstmt.setInt(5, productDto.getStock());
		pstmt.setString(6, productDto.getImg_src());
		pstmt.setInt(7, seller_idx);
		pstmt.executeUpdate();

		closeConnection(conn, pstmt, null);
	}

	public ProductDTO selectedProduct(int idx) throws Exception { // 선택된 제품 상세보기시 필요함
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = null;
		ProductDTO pDTO = new ProductDTO();

		conn = getConnection();
		pstmt = conn.prepareStatement("SELECT * FROM product WHERE idx=?;");
		pstmt.setInt(1, idx);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			pDTO.setIdx(rs.getInt("idx"));
			pDTO.setCategory(rs.getString("category"));
			pDTO.setName(rs.getString("name"));
			pDTO.setPrice(rs.getInt("price"));
			pDTO.setDetails(rs.getString("details"));
			pDTO.setStock(rs.getInt("stock"));
			pDTO.setImg_src(rs.getString("img_src"));
		}

		closeConnection(conn, pstmt, rs);
		return pDTO;
	}

	public ProductDTO getProductInfo(int idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ProductDTO dto = new ProductDTO();
		try {
			conn = getConnection();

			String sql = "select * from product where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setIdx(rs.getInt("idx"));
				dto.setCategory(rs.getString("category"));
				dto.setName(rs.getString("name"));
				dto.setStock(rs.getInt("stock"));
				dto.setPrice(rs.getInt("price"));
				dto.setImg_src(rs.getString("img_src"));
				dto.setSeller_idx(rs.getInt("seller_idx"));
				dto.setHitcount(rs.getInt("hitcount"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		closeConnection(conn, pstmt, rs);
		return dto;

	}

}
