package com.bornsoft.asn.action.infoOrder;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.infoOrder.InfoOrder;
import com.bornsoft.asn.bean.infoOrder.InfoOrderMan;
import com.bornsoft.asn.bean.infoOrder.InfoOrderType;
import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.dao.infoOrder.InfoOrderDao;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.infoOrder.InfoOrderService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.utils.common.PageTool;
import com.bornsoft.asn.vo.InfoOrderManAll;

public class InfoOrderAction extends BaseAction{
	private List<InfoOrderMan> listM;
	private List<InfoOrderType> listT;
	private String newEmail;
	private List<InfoOrderManAll> listMA;
	private int page=1;
    private int pageSize=10 ;
    private String pageBar ;
    private List<InfoOrder> listIO;
    private InfoOrder infoOrder;
	public List<InfoOrderMan> getListM() {
		return listM;
	}
	public void setListM(List<InfoOrderMan> listM) {
		this.listM = listM;
	}
	public List<InfoOrderType> getListT() {
		return listT;
	}
	public void setListT(List<InfoOrderType> listT) {
		this.listT = listT;
	}
	public String getNewEmail() {
		return newEmail;
	}
	public void setNewEmail(String newEmail) {
		this.newEmail = newEmail;
	}
	public List<InfoOrderManAll> getListMA() {
		return listMA;
	}
	public void setListMA(List<InfoOrderManAll> listMA) {
		this.listMA = listMA;
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
	public List<InfoOrder> getListIO() {
		return listIO;
	}
	public void setListIO(List<InfoOrder> listIO) {
		this.listIO = listIO;
	}
	public InfoOrder getInfoOrder() {
		return infoOrder;
	}
	public void setInfoOrder(InfoOrder infoOrder) {
		this.infoOrder = infoOrder;
	}
	public String toInfoOrder()throws Exception{
		 listT=InfoOrderService.getInfoOrderType();
		 Long memberId=MemberService.getMemberId();
		 listM=InfoOrderService.getInfoOrderManByMemberId(memberId);
		 Member m=MemberService.getMember(memberId);
		 String email=m.getEmail();
		 List<Long> ids=new ArrayList<Long>();//yi ding yue
		 if(listM.size()>0){
			 for(InfoOrderMan iom:listM){
				 if(iom.getCancel().equals("N")){
					 ids.add(iom.getInfoTypeId());
				 }
				 email=iom.getEmail();	 
			 }
			 if(ids.size()==0){
				 this.getRequest().setAttribute("notOrder","notOrder" );
			 }
		 }else{
			 this.getRequest().setAttribute("notOrder","notOrder" );
		 }
		 this.getRequest().setAttribute("ids",ids);
		 this.getRequest().setAttribute("email",email);
		 return SUCCESS;
	}
	public String InfoOrder()throws Exception{
		String typeId=(String) this.getRequest().getParameter("typeId");
		String type=(String) this.getRequest().getParameter("type");
		Long memberId=MemberService.getMemberId();
		Member m=MemberService.getMember(memberId);
		String email=m.getEmail();
		listM=InfoOrderService.getInfoOrderManByMemberId(memberId);
		if(type.equals("0")){// 0 add
			if(listM.size()>0){
				boolean b=false;
				for(InfoOrderMan iom:listM){
					if(iom.getInfoTypeId().equals(Long.valueOf(typeId))){
						InfoOrderService.setInfoOrderManCancel(iom.getId(), "N");
						b=true;
					}
					email=iom.getEmail();
				}
				if(b==false){
					InfoOrderMan iom=new InfoOrderMan();
					iom.setId(IdMakerService.newId("InfoOrder"));
					iom.setCreateTime(new Date());
					iom.setEmail(email);
					iom.setInfoTypeId(Long.valueOf(typeId));
					iom.setMemberId(memberId);
					iom.setCancel("N");
					InfoOrderService.insertInfoOrderMan(iom);
				}
			}else{
				InfoOrderMan iom=new InfoOrderMan();
				iom.setId(IdMakerService.newId("InfoOrder"));
				iom.setCreateTime(new Date());
				iom.setEmail(email);
				iom.setInfoTypeId(Long.valueOf(typeId));
				iom.setMemberId(memberId);
				iom.setCancel("N");
				InfoOrderService.insertInfoOrderMan(iom);
			}
		}else{
			for(InfoOrderMan iom:listM){
				if(iom.getInfoTypeId().equals(Long.valueOf(typeId))){
					InfoOrderService.setInfoOrderManCancel(iom.getId(), "Y");
				}
			}
		}
		
		return SUCCESS;
	}
	
	public String InfoOrderEmail()throws Exception{
		Long memberId=MemberService.getMemberId();
		InfoOrderService.setInfoOrderManEmail(memberId, newEmail);
		return SUCCESS;
	}
	
	public String setAllCancel()throws Exception{
		Long memberId=MemberService.getMemberId();
		InfoOrderService.setInfoOrderManAllCancel(memberId, "Y");
		return SUCCESS;
	}
	
	//管理员方法
	public String toInfoOrderList()throws Exception{//准确的讲应该是toInfoOrderManList
		String fullName=this.getRequest().getParameter("fullName");
		String infoTypeId=this.getRequest().getParameter("infoTypeId");
		if(infoTypeId!=null&&infoTypeId.equals("all")){
			infoTypeId=null;
		}
		PageTool pageTool=new PageTool();
		int count=InfoOrderService.getInfoOrderManAllCount(fullName, "N", infoTypeId);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	Integer start=(page-1)*pageSize+1;
	   	Integer end=page*pageSize;
		listMA=InfoOrderService.getInfoOrderManAll(fullName, "N", infoTypeId,start,end);
		this.getRequest().setAttribute("fullName", fullName);
		this.getRequest().setAttribute("infoTypeId", infoTypeId);
		return SUCCESS;
	}
	
	public String setInfoOrderOff()throws Exception{
		String id=this.getRequest().getParameter("id");
		InfoOrderService.setInfoOrderManCancel(Long.parseLong(id), "Y");
		return SUCCESS;
	}
	
	public String toInfoList()throws Exception{
		String infoName=this.getRequest().getParameter("infoName");
		String infoTypeId=this.getRequest().getParameter("infoTypeId");
		String receiveEmail=this.getRequest().getParameter("receiveEmail");
		if(infoTypeId!=null&&infoTypeId.equals("all")){
			infoTypeId=null;
		}
		PageTool pageTool=new PageTool();
		int count=InfoOrderService.getInfoOrderListCount(infoName, infoTypeId, receiveEmail);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	Integer start=(page-1)*pageSize+1;
	   	Integer end=page*pageSize;
	   	listIO=InfoOrderService.getInfoOrderList(infoName, infoTypeId, receiveEmail, start, end);
	   	for(InfoOrder i:listIO){
	   		i.setInfoContent(splitAndFilterString(i.getInfoContent(),50));
	   	}
	   	this.getRequest().setAttribute("infoName",infoName);
	   	this.getRequest().setAttribute("infoTypeId",infoTypeId);
	   	this.getRequest().setAttribute("receiveEmail",receiveEmail);
		return SUCCESS;
	}
	
	public String getInfo()throws Exception{
		String id=this.getRequest().getParameter("id");
		infoOrder=InfoOrderService.getInfo(id);
		return SUCCESS;
	}
	
	private String splitAndFilterString(String input, int length) {  
        if (input == null || input.trim().equals("")) {  
            return "";  
        }  
        // 去掉所有html元素,  
        String str = input.replaceAll("\\&[a-zA-Z]{1,10};", "").replaceAll(  
                "<[^>]*>", "");  
        str = str.replaceAll("[(/>)<]", "");  
        int len = str.length();  
        if (len <= length) {  
            return str;  
        } else {  
            str = str.substring(0, length);  
            str += "......";  
        }  
        return str;  
    } 
}
