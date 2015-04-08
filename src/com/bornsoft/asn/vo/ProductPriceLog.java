package com.bornsoft.asn.vo;

import java.io.Serializable;
import java.util.Date;

public class ProductPriceLog implements Serializable {
	private Long id;
	private Integer productId;
	private String picPath;
	private String productName;
	private Double oldPrice1;
	private Double oldPrice2;
	private Double oldPrice3;
	private Double newPrice1;
	private Double newPrice2;
	private Double newPrice3;
	private Date changeTime;
	private String changeMan;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public String getPicPath() {
		return picPath;
	}
	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Double getOldPrice1() {
		return oldPrice1;
	}
	public void setOldPrice1(Double oldPrice1) {
		this.oldPrice1 = oldPrice1;
	}
	public Double getOldPrice2() {
		return oldPrice2;
	}
	public void setOldPrice2(Double oldPrice2) {
		this.oldPrice2 = oldPrice2;
	}
	public Double getOldPrice3() {
		return oldPrice3;
	}
	public void setOldPrice3(Double oldPrice3) {
		this.oldPrice3 = oldPrice3;
	}
	public Double getNewPrice1() {
		return newPrice1;
	}
	public void setNewPrice1(Double newPrice1) {
		this.newPrice1 = newPrice1;
	}
	public Double getNewPrice2() {
		return newPrice2;
	}
	public void setNewPrice2(Double newPrice2) {
		this.newPrice2 = newPrice2;
	}
	public Double getNewPrice3() {
		return newPrice3;
	}
	public void setNewPrice3(Double newPrice3) {
		this.newPrice3 = newPrice3;
	}
	public Date getChangeTime() {
		return changeTime;
	}
	public void setChangeTime(Date changeTime) {
		this.changeTime = changeTime;
	}
	public String getChangeMan() {
		return changeMan;
	}
	public void setChangeMan(String changeMan) {
		this.changeMan = changeMan;
	}
	
	
}
