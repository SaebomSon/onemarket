package com.one.dto;

import java.util.Date;

public class ReplyDTO {
	private int product_idx;
	private int repNo;
	private String buyer_id;
	private String repCom;
	private Date repDate;
	
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	public int getRepNo() {
		return repNo;
	}
	public void setRepNo(int repNo) {
		this.repNo = repNo;
	}
	public String getRepCom() {
		return repCom;
	}
	public void setRepCom(String repCom) {
		this.repCom = repCom;
	}
	public Date getRepDate() {
		return repDate;
	}
	public void setRepDate(Date repDate) {
		this.repDate = repDate;
	}
	public String getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}
	
	
}
