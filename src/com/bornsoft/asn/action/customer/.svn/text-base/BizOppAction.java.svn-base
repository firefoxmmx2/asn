package com.bornsoft.asn.action.customer;

import java.util.Date;
import java.util.List;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.bizOpp.SaleSource;
import com.bornsoft.asn.service.customer.BizOppService;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.supplier.SupplierService;
import com.bornsoft.asn.utils.common.PageTool;
import com.bornsoft.asn.vo.BizOpp;
import com.bornsoft.asn.vo.ProductPriceLog;


public class BizOppAction extends BaseAction{
	private List<BizOpp> listBO;
	private int page=1;
    private int pageSize=5 ;
    private String pageBar ;
    private List<ProductPriceLog> listppl;
	public List<BizOpp> getListBO() {
		return listBO;
	}
	public void setListBO(List<BizOpp> listBO) {
		this.listBO = listBO;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getPageBar() {
		return pageBar;
	}
	public void setPageBar(String pageBar) {
		this.pageBar = pageBar;
	}
	public List<ProductPriceLog> getListppl() {
		return listppl;
	}
	public void setListppl(List<ProductPriceLog> listppl) {
		this.listppl = listppl;
	}
	
	public String toBizOppList()throws Exception{
		Long supplierId=SupplierService.getSupplierId();
		String productName=this.getRequest().getParameter("name");
		PageTool pageTool=new PageTool();
		int count=BizOppService.getBizOppListCount(supplierId,productName);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	Integer start=(page-1)*pageSize+1;
	   	Integer end=page*pageSize;
		listBO=BizOppService.getBizOppList(supplierId,productName,start, end);
		this.getRequest().setAttribute("name", productName);
		return SUCCESS;
	}
	
	public String toPriceLogList()throws Exception{
		Long supplierId=SupplierService.getSupplierId();
		String productName=this.getRequest().getParameter("name");
		PageTool pageTool=new PageTool();
		int count=BizOppService.getProductListLogCount(supplierId, productName);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	Integer start=(page-1)*pageSize+1;
	   	Integer end=page*pageSize;
	   	listppl=BizOppService.getProductListLog(supplierId, productName, start, end);
	   	this.getRequest().setAttribute("name", productName);
		return SUCCESS;
	}
	
}
