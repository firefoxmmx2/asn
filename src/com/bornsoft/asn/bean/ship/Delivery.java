package com.bornsoft.asn.bean.ship;

import java.util.Date;

public class Delivery {
	
	private Integer Id;
	private Long orderId;
	private Long logisticsId;
	private Integer deliveryId; //发货单ID
	private String logisticsMan;
	private Date logisticsTime;
	private String deliverer;
	private Date delivererTime;
	private String status;
	private String createMan;
	private Date createTime;
	private Logistics logistics;
	
	
	public Logistics getLogistics() {
		return logistics;
	}
	public void setLogistics(Logistics logistics) {
		this.logistics = logistics;
	}
	public Long getLogisticsId() {
		return logisticsId;
	}
	public void setLogisticsId(Long logisticsId) {
		this.logisticsId = logisticsId;
	}
	public Integer getId() {
		return Id;
	}
	public void setId(Integer id) {
		Id = id;
	}
	
	public Long getOrderId() {
		return orderId;
	}
	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	public Integer getDeliveryId() {
		return deliveryId;
	}
	public void setDeliveryId(Integer deliveryId) {
		this.deliveryId = deliveryId;
	}
	
	public String getLogisticsMan() {
		return logisticsMan;
	}
	public void setLogisticsMan(String logisticsMan) {
		this.logisticsMan = logisticsMan;
	}
	public Date getLogisticsTime() {
		return logisticsTime;
	}
	public void setLogisticsTime(Date logisticsTime) {
		this.logisticsTime = logisticsTime;
	}
	public String getDeliverer() {
		return deliverer;
	}
	public void setDeliverer(String deliverer) {
		this.deliverer = deliverer;
	}
	public Date getDelivererTime() {
		return delivererTime;
	}
	public void setDelivererTime(Date delivererTime) {
		this.delivererTime = delivererTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCreateMan() {
		return createMan;
	}
	public void setCreateMan(String createMan) {
		this.createMan = createMan;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	
}
