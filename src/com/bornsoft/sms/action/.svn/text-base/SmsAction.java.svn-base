package com.bornsoft.sms.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.service.advert.AdvertService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.utils.common.PageTool;
import com.bornsoft.asn.utils.common.SmsMobileType;
import com.bornsoft.sms.bean.SmsSend;
import com.bornsoft.sms.service.SmsService;

public class SmsAction extends BaseAction{
	
	private SmsSend smsSend;
	private List<Member> listMember;
	private int page=1;
    private int pageSize=10 ;
    private String pageBar ;
    private List<SmsSend> listSmsSend;
    private String startTime;
    private String endTime;
    
    
    
	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public List<SmsSend> getListSmsSend() {
		return listSmsSend;
	}

	public void setListSmsSend(List<SmsSend> listSmsSend) {
		this.listSmsSend = listSmsSend;
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

	public List<Member> getListMember() {
		return listMember;
	}

	public void setListMember(List<Member> listMember) {
		this.listMember = listMember;
	}

	public SmsSend getSmsSend() {
		return smsSend;
	}

	public void setSmsSend(SmsSend smsSend) {
		this.smsSend = smsSend;
	}

	
	public String insertSms() throws Exception{
		String[] strMobileNo = smsSend.getMobileNo().split(",");
		String type = this.request("type");
		for(int i=0; i<strMobileNo.length;i++ ){
			if(!SmsMobileType.getMobileType(strMobileNo[i]).equals("E")){
				if(type != null){
					smsSend.setSmsStatus("C");
				}
				smsSend.setCreateMan(MemberService.getMemberId());
				SmsService.sendSms(smsSend,strMobileNo[i]);
			}
		}
		
		this.getRequest().setAttribute("sms_msg", "发送成功");
		return SUCCESS;
	}
	/***
	 * 发件箱
	 * **/
	public String listSend()throws Exception{
		String pageType = request("pageType"); //如果是查询按钮的提交，就把页数值为初始值
		if(pageType != null){
			page = 1;
			pageSize = 10;
		}
		
		PageTool pageTool=new PageTool();
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;
		Map<String, Object> para=new HashMap<String, Object>();
		para.put("startCount", startCount);
		para.put("endCount", endCount);
		
		if(smsSend != null){
			para.put("mobileNo", smsSend.getMobileNo());
			para.put("sendType", smsSend.getSendType());
			para.put("smsStatus", smsSend.getSmsStatus());
			para.put("isReply", smsSend.getIsReply());
		}
		para.put("startTime", startTime);
		para.put("endTime", endTime);
		
		int count = SmsService.getSmsSendCount(para);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	
	   	listSmsSend = SmsService.listSmsSend(para);
		return SUCCESS;
	}
	
	/***
	 * 草稿箱
	 * **/
	public String listDraft()throws Exception{
		String pageType = request("pageType"); //如果是查询按钮的提交，就把页数值为初始值
		if(pageType != null){
			page = 1;
			pageSize = 10;
		}
		
		PageTool pageTool=new PageTool();
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;
		Map<String, Object> para=new HashMap<String, Object>();
		para.put("startCount", startCount);
		para.put("endCount", endCount);
		
		if(smsSend != null){
			para.put("mobileNo", smsSend.getMobileNo());
			para.put("sendType", smsSend.getSendType());
			para.put("isReply", smsSend.getIsReply());
		}
		para.put("startTime", startTime);
		para.put("endTime", endTime);
		
		int count = SmsService.getSmsDraftCount(para);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	
	   	listSmsSend = SmsService.listSmsDraft(para);
		return SUCCESS;
	} 
	
	public String allMember()throws Exception{
		String pageType = request("pageType"); //如果是查询按钮的提交，就把页数值为初始值
		String memberName = "";
		if(pageType != null){
			page = 1;
			pageSize = 10;
			memberName = this.request("memberName");
		}
		PageTool pageTool=new PageTool();
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;
		Map<String, Object> para=new HashMap<String, Object>();
		para.put("startCount", startCount);
		para.put("endCount", endCount);
		if(!memberName.equals("")){
			para.put("memberName", memberName);
		}
		
		int count = SmsService.getAllCountMember(para);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
		listMember = SmsService.getAllMember(para);
		return SUCCESS;
	}
	
	public String RepeatSend()throws Exception{
		String id = this.request("id");
		String[] strId = id.split(",");
		for(int i=0; i<strId.length;i++ ){
			smsSend = SmsService.getSmsById(new Long(strId[i]));
			if(!SmsMobileType.getMobileType(smsSend.getMobileNo()).equals("E")){
				smsSend.setSendType("N");
				smsSend.setSetTime(null);
				SmsService.sendSms(smsSend,smsSend.getMobileNo());
			}
		}
		return SUCCESS; 
	}
	
	public String RepeatSend2()throws Exception{
		String id = this.request("id");
		String[] strId = id.split(",");
		for(int i=0; i<strId.length;i++ ){
			smsSend = SmsService.getSmsById(new Long(strId[i]));
			if(!SmsMobileType.getMobileType(smsSend.getMobileNo()).equals("E")){
				smsSend.setSmsStatus("N");
				SmsService.sendSms(smsSend,smsSend.getMobileNo());
			}
		}
		return SUCCESS; 
	}

	public String delDraftSms() throws Exception{
		String id = this.request("id");
		String[] strId = id.split(",");
		for(int i=0; i<strId.length;i++ ){
			SmsService.delDraftSms(new Long(strId[i]));
		}
		return SUCCESS;
	}
}
