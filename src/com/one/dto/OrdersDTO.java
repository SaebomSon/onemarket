package com.one.dto;

public class OrdersDTO {
	private int idx;
	private int buyer_idx;
	private int seller_idx;
	private int product_idx;
	private String payment_method;
	private String order_date;
	private int order_quantity;
	
	public OrdersDTO() {
		
	}
	public OrdersDTO(int buyer_idx, int seller_idx, int product_idx, String payment_method,
			int order_quantity) {
		this.buyer_idx = buyer_idx;
		this.seller_idx = seller_idx;
		this.product_idx = product_idx;
		this.payment_method = payment_method;
		this.order_quantity = order_quantity;
	}
	
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getBuyer_idx() {
		return buyer_idx;
	}

	public void setBuyer_idx(int buyer_idx) {
		this.buyer_idx = buyer_idx;
	}

	public int getSeller_idx() {
		return seller_idx;
	}

	public void setSeller_idx(int seller_idx) {
		this.seller_idx = seller_idx;
	}

	public int getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}

	public String getPayment_method() {
		return payment_method;
	}

	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	public int getOrder_quantity() {
		return order_quantity;
	}

	public void setOrder_quantity(int order_quantity) {
		this.order_quantity = order_quantity;
	}

}
