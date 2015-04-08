package com.bornsoft.asn.bean.bizOpp;

import java.io.File;
import java.io.Serializable;
import java.sql.Blob;
import java.util.Date;

public class SaleSource implements Serializable {
	private Long id;
	private Long supplierId;
	private Date createTime;
	private String title;
	private String source;
	private String proce;
	private String fileName;
	private String fileId;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(Long supplierId) {
		this.supplierId = supplierId;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getProce() {
		return proce;
	}
	public void setProce(String proce) {
		this.proce = proce;
	}
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	
	
	
}
