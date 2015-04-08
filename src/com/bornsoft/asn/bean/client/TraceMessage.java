package com.bornsoft.asn.bean.client;

import java.util.Date;


public class TraceMessage {
	private Long id;
	private String title;
	private String customer;
	private Date createTime;
	private Date modifyTime;
	private Long createMan;
	private String content;
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCustomer() {
		return customer;
	}
	public void setCustomer(String customer) {
		this.customer = customer;
	}
	public Long getCreateMan() {
		return createMan;
	}
	public void setCreateMan(Long createMan) {
		this.createMan = createMan;
	}

}
