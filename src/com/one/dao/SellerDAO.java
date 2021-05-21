package com.one.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.one.dto.SellerDTO;

public class SellerDAO {

	private static SellerDAO instance = new SellerDAO();

	private SellerDAO() {
	}

	public static SellerDAO getInstance() {
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
    // 3. seller_register(�뙋留ㅼ옄 �쉶�썝媛��엯 db���옣) 

    
    public void insertSeller(SellerDTO dto) throws Exception {
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       Connection conn = null;
    
    
    try {
       conn = getConnection();
       
       String sql = "INSERT INTO seller(id,pw,name,phone,products) VALUES(?,?,?,?,?)";
       pstmt = conn.prepareStatement(sql);
       pstmt.setString(1, dto.getId());
       pstmt.setString(2, dto.getPw());
       pstmt.setString(3, dto.getName());
       pstmt.setString(4, dto.getPhone());
       pstmt.setString(5, dto.getProducts());
       System.out.println(pstmt);
       pstmt.executeUpdate();
       } catch (Exception e) {
       e.printStackTrace();
       }
    }
    
    //5. �뙋留ㅼ옄 �쉶�썝媛��엯(�븘�씠�뵒 以묐났�솗�씤) 
    public SellerDTO selectMemberById(String id) throws Exception {
       Connection conn = null; 
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       SellerDTO sellerDto = null;
       
       conn = getConnection();
       pstmt = conn.prepareStatement("SELECT * FROM shop.seller WHERE id=?");
       pstmt.setString(1, id);
       rs = pstmt.executeQuery();
    
       if(rs.next()) { //李몄씪寃쎌슦, 
          sellerDto = new SellerDTO();
          sellerDto.setId(rs.getString("id"));
          sellerDto.setPw(rs.getString("pw"));
          sellerDto.setName(rs.getString("name"));
          sellerDto.setPhone(rs.getString("phone"));
          sellerDto.setProducts(rs.getString("products"));
          
       }
       closeConnection(conn, pstmt, rs);
       return sellerDto; //false-> null媛� 由ы꽩 
    }
    
   
   //濡쒓렇�씤 �븘�씠�뵒,鍮꾨쾲 �솗�씤 (�뙋留ㅼ옄)
   public boolean sellerLoginCheck(String id, String pw) throws Exception {

       Connection conn = null; 
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       
       conn = getConnection();
       pstmt = conn.prepareStatement("SELECT * FROM shop.seller WHERE id=? and pw=?");
       pstmt.setString(1, id);
       pstmt.setString(2, pw);
       rs = pstmt.executeQuery();
    
       if(rs.next()) { //李몄씪寃쎌슦 rs.next()硫붿꽌�뱶 �샇異� 寃곌낵 議곌굔�뿉 留욌뒗 �빐�떦 �젅肄붾뱶 �븳以꾩쓣 媛�由ы궡. 
         return true; //濡쒓렇�씤 �꽦怨�
       }
       closeConnection(conn, pstmt, rs);
       return false; //濡쒓렇�씤�떎�뙣 
    }
    
   // �븘�씠�뵒 李얘린(�뙋留ㅼ옄)
   public String searchId(String name, String phone) throws Exception {
	   
	   Connection conn = null;
	   PreparedStatement pstmt = null;
	   ResultSet rs = null; 
	   String result = null;
	   
	   conn = getConnection();
	   pstmt = conn.prepareStatement("SELECT id FROM shop.seller WHERE name=? and phone=?");
	   pstmt.setString(1, name);
	   pstmt.setString(2, phone);
	   rs = pstmt.executeQuery();
	   
	   if(rs.next()) {
		   result = rs.getString("id");
	   }
	   closeConnection(conn, pstmt, rs);
	   return result; //�떎�뻾 �븞�릺硫� 洹몃�濡� null媛�,, 
   }
	//seller idx 받아오기
	 public int getIdx(String id) throws Exception {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      conn = getConnection();
	      pstmt = conn.prepareStatement("select idx from seller where id=?;");
	      pstmt.setString(1, id);
	      int idx = 1;
	      rs = pstmt.executeQuery();
	      if (rs.next()) {
	         idx = rs.getInt("idx");
	      }
	      
	      return idx;
	   }
	
	public SellerDTO showSeller(int idx) throws Exception {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		SellerDTO dto = new SellerDTO();
		
		String sql = "select * from seller where idx=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			dto.setIdx(rs.getInt("idx"));
			dto.setId(rs.getString("id"));
			dto.setName(rs.getString("name"));
			dto.setPw(rs.getString("pw"));
			dto.setPhone(rs.getString("phone"));
			dto.setProducts(rs.getString("products"));
		}
		closeConnection(conn, pstmt, rs);
		return dto;
	}

}
