package com.bornsoft.asn.bean.account;

import java.io.Serializable;
import java.util.Date;

/**
 * 账单
 * 
 * @author ffmmx
 *
 */
public class Account implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4290357461967924620L;
	private Long id;
	private Float income;
	private Float expenditure;
	private Float balance;
	private Long memberId;
	private String description;
	private Date createTime;
	private String payType;
	private Long orderId;
	
	public Long getId() {
		return id;
	}
	public Float getIncome() {
		return income;
	}
	public Float getExpenditure() {
		return expenditure;
	}
	public Float getBalance() {
		return balance;
	}
	public Long getMemberId() {
		return memberId;
	}
	public String getDescription() {
		return description;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public void setIncome(Float income) {
		this.income = income;
	}
	public void setExpenditure(Float expenditure) {
		this.expenditure = expenditure;
	}
	public void setBalance(Float balance) {
		this.balance = balance;
	}
	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public Long getOrderId() {
		return orderId;
	}
	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	public Account(Long id, Float income, Float expenditure, Float balance,
			Long memberId, String description, Date createTime, String payType,
			Long orderId) {
		super();
		this.id = id;
		this.income = income;
		this.expenditure = expenditure;
		this.balance = balance;
		this.memberId = memberId;
		this.description = description;
		this.createTime = createTime;
		this.payType = payType;
		this.orderId = orderId;
	}
	public Account() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
