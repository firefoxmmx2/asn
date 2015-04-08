package com.bornsoft.asn.action.quotation;

import java.util.List;

import com.bornsoft.asn.bean.quotation.QuotationInfo;
import com.bornsoft.asn.service.quotation.QuotationService;
import com.opensymphony.xwork2.ActionSupport;

public class QuoMainPage extends ActionSupport {
	private List<QuotationInfo> quoList;
	private int showNum=5;
	
	public List<QuotationInfo> getQuoList() {
		return quoList;
	}

	public void setQuoList(List<QuotationInfo> quoList) {
		this.quoList = quoList;
	}

	public int getShowNum() {
		return showNum;
	}

	public void setShowNum(int showNum) {
		this.showNum = showNum;
	}

	public String execute() throws Exception {
		
		//初始版本，以后版本需改为分页记录数查询//###
		quoList = QuotationService.getQuotationwoStatList();
		for(int i=0;quoList != null && i<quoList.size(); i++){
			if(i>=(showNum-1))
				quoList.remove(i);
		}
		
		return SUCCESS;
	}
}
