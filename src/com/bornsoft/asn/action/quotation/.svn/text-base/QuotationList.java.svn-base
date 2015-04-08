package com.bornsoft.asn.action.quotation;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.bornsoft.asn.bean.quotation.QuotationInfo;
import com.bornsoft.asn.service.quotation.QuotationService;
import com.bornsoft.asn.utils.common.PageCreator;
import com.bornsoft.asn.utils.common.WebContext;
import com.opensymphony.xwork2.ActionSupport;

public class QuotationList extends ActionSupport{
	private List<QuotationInfo> quotationList;
	private String pageBar;
	private int page = 1;
	
	public List<QuotationInfo> getQuotationList() {
		return quotationList;
	}

	public void setQuotationList(List<QuotationInfo> quotationList) {
		this.quotationList = quotationList;
	}

	public String execute() throws Exception {
		HttpServletRequest req = WebContext.getRequest();
		
		int count = QuotationService.findQuotationCount(null, null, null);
		PageCreator pc = new PageCreator();
		pc.setCurrentPage(page);
		pc.setTotalRow(count);
		pageBar = pc.getPageBar();
		
		quotationList = QuotationService.findQuotationwoStatList(pc.getStartCount(), pc.getEndCount(), 
				null, null, null);
		
		if(quotationList == null)
			quotationList = new ArrayList<QuotationInfo>();
		return SUCCESS;
	}

	public void setPageBar(String pageBar) {
		this.pageBar = pageBar;
	}

	public String getPageBar() {
		return pageBar;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPage() {
		return page;
	}
}
