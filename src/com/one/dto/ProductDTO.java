package com.one.dto;

public class ProductDTO {
	private int idx;
	private String category;
	private String name;
	private int stock;
	private int price;
	private String details;
	private String img_src;
	private int seller_idx;
	private int hitcount;
	
	public ProductDTO() {
		
	}
	
	public ProductDTO(int idx, String name, int price, String img_src) {
		this.idx = idx;
		this.name = name;
		this.price = price;
		this.img_src = img_src;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getImg_src() {
		return img_src;
	}

	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}

	public int getSeller_idx() {
		return seller_idx;
	}

	public void setSeller_idx(int seller_idx) {
		this.seller_idx = seller_idx;
	}

	public int getHitcount() {
		return hitcount;
	}

	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}
	
	

}
