package com.bornsoft.asn.bean.storage;

import java.io.Serializable;

public class StorageInOutDetail implements Serializable {
	private Long id;
	private Long storageInOutId;
	private Integer productId;
	private Integer billAmount;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getStorageInOutId() {
		return storageInOutId;
	}
	public void setStorageInOutId(Long storageInOutId) {
		this.storageInOutId = storageInOutId;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public Integer getBillAmount() {
		return billAmount;
	}
	public void setBillAmount(Integer billAmount) {
		this.billAmount = billAmount;
	}
	

}
