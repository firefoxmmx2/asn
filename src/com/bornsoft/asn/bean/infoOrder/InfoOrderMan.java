package com.bornsoft.asn.bean.infoOrder;

import java.io.Serializable;
import java.util.Date;

public class InfoOrderMan implements Serializable{
	private Long id;
	private Long infoTypeId;
	private Long memberId;
	private String email;
	private String cancel;
	private Date createTime;
	private Date modifyTime;
	public InfoOrderMan() {
		super();
	}
	public InfoOrderMan(Long id, Long infoTypeId, Long memberId, String email,
			String cancel, Date createTime, Date modifyTime) {
		super();
		this.id = id;
		this.infoTypeId = infoTypeId;
		this.memberId = memberId;
		this.email = email;
		this.cancel = cancel;
		this.createTime = createTime;
		this.modifyTime = modifyTime;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getInfoTypeId() {
		return infoTypeId;
	}
	public void setInfoTypeId(Long infoTypeId) {
		this.infoTypeId = infoTypeId;
	}
	public Long getMemberId() {
		return memberId;
	}
	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCancel() {
		return cancel;
	}
	public void setCancel(String cancel) {
		this.cancel = cancel;
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
	
	
}
