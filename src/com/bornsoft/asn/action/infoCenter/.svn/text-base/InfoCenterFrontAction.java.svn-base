package com.bornsoft.asn.action.infoCenter;

import java.util.Date;
import java.util.List;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.infoCenter.InfoCenter;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.infoCenter.InfoCenterService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.service.supplier.SupplierService;
import com.bornsoft.asn.utils.common.PageCreator;
import com.bornsoft.asn.utils.common.PageTool;
import com.bornsoft.asn.utils.common.WebContext;

public class InfoCenterFrontAction extends BaseAction {
	private InfoCenter info;
	private List<InfoCenter> infoList;
	private int page=1;
    private int pageSize=20 ;
    private String pageBar ;
	public InfoCenter getInfo() {
		return info;
	}
	public void setInfo(InfoCenter info) {
		this.info = info;
	}
	public List<InfoCenter> getInfoList() {
		return infoList;
	}
	public void setInfoList(List<InfoCenter> infoList) {
		this.infoList = infoList;
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
    
    public String showInfoCenterList()throws Exception{
    	String id=WebContext.getRequest().getParameter("id");
    	Long createMan=Long.parseLong(id);
    	PageCreator pc=new PageCreator();
    	//pc.setPageSize(20);
    	pc.setPageSize(15);
    	pc.setCurrentPage(page);
    	pc.setTotalRow(InfoCenterService.getInfoListCount(null, "Y", null, createMan));
    	infoList=InfoCenterService.getInfoCenterList(null, "Y", null, createMan, pc.getStartCount(), pc.getEndCount());
    	pageBar=pc.getPageBar();
    	WebContext.getRequest().setAttribute("id", id);
    	return SUCCESS;
    }
    
    public String showInfoCenter()throws Exception{
    	String id=WebContext.getRequest().getParameter("id");
    	info=InfoCenterService.getInfoCenterById(id);
    	return SUCCESS;
    }
}
