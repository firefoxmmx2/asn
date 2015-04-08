package com.bornsoft.asn.bean.productType;

public class ProductType {
	private int ptid;
	private String ptcode;
	private String pttypeName;
	private int ptparentid;
	//+++ add by hooxin -- 10.3.24
	private int priority;
	//+++ addy by hooxin 10.4.26
	private int ptseq;
	//+++ add by hooxin 10.5.7
	private int productCount;
	
	public void setPriority(int priority) {
		this.priority = priority;
	}
	public int getPriority() {
		return priority;
	}
	//--- end by hooxin
	public int getPtid() {
		return ptid;
	}
	public void setPtid(int ptid) {
		this.ptid = ptid;
	}
	public String getPtcode() {
		return ptcode;
	}
	public void setPtcode(String ptcode) {
		this.ptcode = ptcode;
	}
	public String getPttypeName() {
		return pttypeName;
	}
	public void setPttypeName(String pttypeName) {
		this.pttypeName = pttypeName;
	}
	public int getPtparentid() {
		return ptparentid;
	}
	public void setPtparentid(int ptparentid) {
		this.ptparentid = ptparentid;
	}
	public void setPtseq(int ptseq) {
		this.ptseq = ptseq;
	}
	public int getPtseq() {
		return ptseq;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	public int getProductCount() {
		return productCount;
	}
	

}
