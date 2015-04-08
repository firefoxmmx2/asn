package com.bornsoft.asn.bean.order;

import java.io.Serializable;

/**
 * 订单下面的商品子项
 * @author yuwenqiang
 * 2010-3-3
 */
public class OrderItem implements Serializable{

	private static final long serialVersionUID = 1L;
    /**主键*/
	private long id;
	/**订单号*/
	private long orderId;
	/**产品主键*/
	private long itemProductId;
	/**产品的名称*/
	private String itemProductName;
	/**产品的数量*/
	private int quantity;
	/**产品的价格*/
	private float proPrice;
	/**图片路径*/
	private String picPath;
	
	private Double postFree;    // 运费说明 cl 2010-07-20 add
	
	public Double getPostFree() {
		return postFree;
	}
	public void setPostFree(Double postFree) {
		this.postFree = postFree;
	}
	public long getId() {
		return id;
	}
	public String getPicPath() {
		return picPath;
	}
	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getOrderId() {
		return orderId;
	}
	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}
	public long getItemProductId() {
		return itemProductId;
	}
	public void setItemProductId(long itemProductId) {
		this.itemProductId = itemProductId;
	}
	public String getItemProductName() {
		return itemProductName;
	}
	public void setItemProductName(String itemProductName) {
		this.itemProductName = itemProductName;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public float getProPrice() {
		return proPrice;
	}
	public void setProPrice(float proPrice) {
		this.proPrice = proPrice;
	}

}
