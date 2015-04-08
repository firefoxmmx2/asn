package com.bornsoft.asn.action.infoCenter;

import java.util.Date;
import java.util.List;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.infoCenter.InfoCenter;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.infoCenter.InfoCenterService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.service.supplier.SupplierService;
import com.bornsoft.asn.utils.common.PageTool;
import com.bornsoft.asn.utils.common.WebContext;

public class InfoCenterAction extends BaseAction {
	private InfoCenter info;
	private List<InfoCenter> infoList;
	private int page=1;
    private int pageSize=5 ;
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

	public String toCreateInfoCenter()throws Exception{
		return SUCCESS;
	}
	
	public String createInfoCenter()throws Exception{
		Long id=IdMakerService.newId("InfoCenter");
		Long createMan=((Long)SupplierService.getSupplierId());
		info.setId(id);
		info.setCreateMan(createMan);
		info.setCreateTime(new Date());
		info.setType("1001");
		InfoCenterService.insertInfoCenter(info);
		return SUCCESS;
	}
	
	public String toInfoCenterList()throws Exception{
		Long createMan=((Long)SupplierService.getSupplierId());
		String status=WebContext.getRequest().getParameter("status");
		String title=WebContext.getRequest().getParameter("title");
		if(status==null||status.trim().equals("")){
			if(info!=null){
				String s=info.getStatus();
				if(s!=null&&!s.trim().equals("")){
					status=s;
				}
			}else{
				status="Y";
			}
		}
		PageTool pageTool=new PageTool();
		int count=InfoCenterService.getInfoListCount(title, status, null, createMan);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	Integer start=(page-1)*pageSize+1;
	   	Integer end=page*pageSize;
	   	infoList=InfoCenterService.getInfoCenterList(title, status, null, createMan, start, end);
	   	WebContext.getRequest().setAttribute("title", title);
	   	WebContext.getRequest().setAttribute("status", status);
		return SUCCESS;
	}
	
	public String setInfoCenterStatus()throws Exception{
		String status=this.getRequest().getParameter("status");
		String ids=this.getRequest().getParameter("ids");
		String[] strings=ids.split(",");
		if(status==null||strings[0]==null||status.trim().equals("")||strings[0].trim().equals("")){
			return INPUT;
		}
		//validate
		for(String id:strings){
			info=InfoCenterService.getInfoCenterById(id);
			if(!validateInfoCenter(info, ((Long)SupplierService.getSupplierId()))){
				return INPUT;
			}
		}
		InfoCenterService.setInfoCenterStatus(strings, status);
		return SUCCESS;
	}
	
	public String deleteInfoCenter()throws Exception{
		String ids=this.getRequest().getParameter("ids");
		String[] strings=ids.split(",");
		//validate
		for(String id:strings){
			info=InfoCenterService.getInfoCenterById(id);
			if(!validateInfoCenter(info, ((Long)SupplierService.getSupplierId()))){
				return INPUT;
			}
		}
		InfoCenterService.deleteInfoCenter(strings);
		return SUCCESS;
	}
	
	public String toUpdateInfoCenter()throws Exception{
		String id=this.getRequest().getParameter("id");
		info=InfoCenterService.getInfoCenterById(id);
		if(!validateInfoCenter(info, ((Long)SupplierService.getSupplierId()))){
			return INPUT;
		}
		return SUCCESS;
	}
	
	public String updateInfoCenter()throws Exception{
		if(!validateInfoCenter(info, ((Long)SupplierService.getSupplierId()))){
			return INPUT;
		}
		InfoCenterService.updateInfoCenter(info);
		return SUCCESS;
	}
	//validate
	private boolean validateInfoCenter(InfoCenter i,Long id){
		if(i.getCreateMan().equals(id)){
			return true;
		}else{
			return false;
		}
	}
}
