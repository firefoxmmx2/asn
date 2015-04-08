package com.bornsoft.asn.bean.order;

import java.util.Date;

/**
 * 订单操作记录表
 * @author yuwenqiang
 *
 */
public class OrderOperateLog implements java.io.Serializable{
   
	private static final long serialVersionUID = 1L;
	/**主键*/
	private Long  logId;
	/**操作时间*/
	private Date operateTime;
	/**操作人*/
	private Long operaterId;	
	/**订单ID*/
    private Long orderId;
    /**操作描述*/
    private String operateDes;
	
    
	public Long getLogId() {
		return logId;
	}
	public void setLogId(Long logId) {
		this.logId = logId;
	}
	public Date getOperateTime() {
		return operateTime;
	}
	public void setOperateTime(Date operateTime) {
		this.operateTime = operateTime;
	}
	public Long getOperaterId() {
		return operaterId;
	}
	public void setOperaterId(Long operaterId) {
		this.operaterId = operaterId;
	}
	public Long getOrderId() {
		return orderId;
	}
	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	public String getOperateDes() {
		return operateDes;
	}
	public void setOperateDes(String operateDes) {
		this.operateDes = operateDes;
	}
	
}
