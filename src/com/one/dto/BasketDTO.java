package com.one.dto;

public class BasketDTO {
	private int idx;
	private int b_idx;
	private int p_idx;
	private String p_name;
	private int p_price;
	private int quantity;
	private String img_src;
	
	public BasketDTO() {
		
	}
	public BasketDTO(int b_idx, int p_idx, String p_name, int p_price, int quantity, String img_src) {
		this.b_idx = b_idx;
		this.p_idx = p_idx;
		this.p_name = p_name;
		this.p_price = p_price;
		this.quantity = quantity;
		this.img_src = img_src;
	}
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getB_idx() {
		return b_idx;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	public int getP_idx() {
		return p_idx;
	}
	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getImg_src() {
		return img_src;
	}
	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}
	
	
}
