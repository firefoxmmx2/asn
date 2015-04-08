package com.bornsoft.asn.bean.report;

import java.io.Serializable;

public class ReportClick implements Serializable{

	private static final long serialVersionUID = -4075042414870659176L;
	private String productName;
	private int clickCount;
	
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getClickCount() {
		return clickCount;
	}
	public void setClickCount(int clickCount) {
		this.clickCount = clickCount;
	}

}
