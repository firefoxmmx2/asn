package com.bornsoft.asn.bean.product;

import java.io.Serializable;

public class PT2DY implements Serializable {
	private Integer deliveryId;
	private Integer productId;
	
	public PT2DY() {
		super();
	}
	
	public PT2DY(Integer deliveryId, Integer productId) {
		super();
		this.deliveryId = deliveryId;
		this.productId = productId;
	}

	public Integer getDeliveryId() {
		return deliveryId;
	}
	public void setDeliveryId(Integer deliveryId) {
		this.deliveryId = deliveryId;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	
	
}
