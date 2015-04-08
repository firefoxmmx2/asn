package com.bornsoft.asn.action.client;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;




import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.bean.order.Order;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.member.MemberGroupService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.service.client.ClientService;
import com.bornsoft.asn.utils.common.PageCreator;
import com.bornsoft.asn.utils.common.PageTool;

import com.bornsoft.asn.bean.client.TraceMessage;

public class ClientManageAction extends BaseAction{
	private Member member;
	private List<Member> memberList;
	private List<Order> orderList;
	private int page=1;
	private int pageSize=10 ;
	private String pageBar;
	private List<Member> unGroupedMemberList;
	private String ssoAccount;
	private TraceMessage traceMessage;
	private List<TraceMessage> traceMessageList;
	private String TITLE;
	private String CUSTOMER;
	private String CONTENT;
	private String selTitle;//搜索客户跟踪记录的标题条件
	private String selCustomer;//搜索客户跟踪记录的客户条件
	private String startTime;//搜索客户跟踪记录的开始时间条件
	private String endTime;//搜索客户跟踪记录的结束时间条件
	private String upId;//修改客户跟踪记录的ID
	private String gradeScore; //客户积分等级
	private String drawerName;//搜索客户消费信息管理的客户姓名
	
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public String getDrawerName() {
		return drawerName;
	}

	public void setDrawerName(String drawerName) {
		this.drawerName = drawerName;
	}

	public List<Order> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}

	
	public String getGradeScore() {
		return gradeScore;
	}

	public void setGradeScore(String gradeScore) {
		this.gradeScore = gradeScore;
	}

	public String getUpId() {
		return upId;
	}

	public void setUpId(String upId) {
		this.upId = upId;
	}

	public List<TraceMessage> getTraceMessageList() {
		return traceMessageList;
	}

	public void setTraceMessageList(List<TraceMessage> traceMessageList) {
		this.traceMessageList = traceMessageList;
	}
	
	public String getSelTitle() {
		return selTitle;
	}

	public void setSelTitle(String selTitle) {
		this.selTitle = selTitle;
	}

	public String getSelCustomer() {
		return selCustomer;
	}

	public void setSelCustomer(String selCustomer) {
		this.selCustomer = selCustomer;
	}

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
	
	public String getTITLE() {
		return TITLE;
	}

	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}

	public String getCUSTOMER() {
		return CUSTOMER;
	}

	public void setCUSTOMER(String cUSTOMER) {
		CUSTOMER = cUSTOMER;
	}

	public String getCONTENT() {
		return CONTENT;
	}

	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}

	public TraceMessage getTraceMessage() {
		return traceMessage;
	}

	public void setTraceMessage(TraceMessage traceMessage) {
		this.traceMessage = traceMessage;
	}

	public List<Member> getMemberList() {
		return memberList;
	}

	public void setMemberList(List<Member> memberList) {
		this.memberList = memberList;
	}

	public String getSsoAccount() {
		return ssoAccount;
	}

	public void setSsoAccount(String ssoAccount) {
		this.ssoAccount = ssoAccount;
	}

	public List<Member> getUnGroupedMemberList() {
		return unGroupedMemberList;
	}

	public void setUnGroupedMemberList(List<Member> unGroupedMemberList) {
		this.unGroupedMemberList = unGroupedMemberList;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
	
	public List<Member> getList() {
		return memberList;
	}

	public void setList(List<Member> list) {
		this.memberList = list;
	}
	
	public String getPageBar() {
		return pageBar;
	}

	public void setPageBar(String pageBar) {
		this.pageBar = pageBar;
	}
	
	
	/**
	 * @author cz 
	 * @description 查询该供货商的企业会员资料
	 * @date 2010-03-09
	 * */
	public String getClientInfo() throws Exception{	
			
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;
		
		HashMap mm=new HashMap();
		mm.put("startCount", startCount);
		mm.put("endCount", endCount);
		
		//从Member类里取得用户ID，以memberId变量存放
		Member mem = MemberService.getMember();
		Long mId = mem.getMemberId();
		mm.put("mId", mId);		
		
		if(member != null){
			if(member.getFullName() != null){
				mm.put("fullName",member.getFullName().trim()); 
			}
			if(member.getApproveState()!=null){
				mm.put("approveState",member.getApproveState());
			}
			if(member.getMemberType()!=null){
				mm.put("memberType", member.getMemberType());		
			}
			if(member.getArea()!=null){
				if(member.getArea().length() >0)
				{mm.put("area",member.getArea().substring(7,9));}	
			}
		}
		
		
		int count = ClientService.getClientCount(mm);
		//PageCreator pc = new PageCreator();
		//pc.setCurrentPage(page);
		//pc.setTotalRow(count);
		//pageBar = pc.getPageBar();
		
		PageTool pageTool=new PageTool();
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
		
		
		memberList=ClientService.getClientInfo(mm);	
		this.request("memberList", memberList);
		
		return SUCCESS;
	}
	
	/**
	 * list member by given parameters
	 * @return 返回供货商未分组的组员LIST
	 * @throws Exception
	 */
	public String getUnGroupedMember() throws Exception{
		//从Member类里取得用户ID，以memberId变量存放
		Member member = MemberService.getMember();
		Long mId = member.getMemberId();
		
		//取得要查询的账户名
		if(ssoAccount==null)
			ssoAccount="";
		
		unGroupedMemberList=ClientService.getUnGroupedMemberList(ssoAccount,String.valueOf(mId));
		
		this.request("memberList", unGroupedMemberList);
		this.request("ssoAccount", ssoAccount);
		return SUCCESS;
	}
	
	/**
	 * list member by given parameters
	 * @return 返回客户跟踪记录的LIST
	 * @throws Exception
	 */
	public String getClientServiceRecord() throws Exception{	
		//从Member类里取得用户ID，以memberId变量存放
		Member member = MemberService.getMember();
		Long mId = member.getMemberId();
		
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;
		
		//取得要查询客户服务记录的标题
		if(selTitle==null)
			selTitle="";
		
		//取得要查询客户服务记录的客户
		if(selCustomer==null)
			selCustomer="";
		
		//取得要查询客户服务记录的开始时间
		if(startTime ==null)
			startTime="";
		
		//取得要查询客户服务记录的结束时间
		if(endTime==null)
			endTime="";
		
		HashMap mm=new HashMap();
		mm.put("selTitle", selTitle);
		mm.put("selCustomer", selCustomer);
		mm.put("startTime", startTime);
		mm.put("endTime", endTime);
		mm.put("mId", mId);
		mm.put("startCount", startCount);
		mm.put("endCount", endCount);
		
			
		int count = ClientService.getClientServiceRecordCount(mm);
//		PageCreator pc = new PageCreator();
//		pc.setCurrentPage(page);
//		pc.setTotalRow(count);
//		pageBar = pc.getPageBar();
		
		PageTool pageTool=new PageTool();
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	
	   	this.request("selTitle", selTitle);
	   	this.request("selCustomer", selCustomer);
	   	this.request("startTime", startTime);
	   	this.request("endTime", endTime);
			
		traceMessageList=ClientService.getClientServiceRecord(mm);
		return SUCCESS;
	}
	
	/**
	 * list member by given parameters
	 * @return 删除客户服务跟踪记录
	 * @throw
	 */
	public String delClientServiceRecord() throws Exception{	
		HttpServletRequest request = ServletActionContext.getRequest();
		//从Member类里取得用户ID，以memberId变量存放
		Member member = MemberService.getMember();
		Long mId = member.getMemberId();
		
		String delId = request.getParameter("delId");
		String[] delIdArray = delId.split(",");
		for(int i = 0; i<delIdArray.length; i++){
			ClientService.delClientServiceRecord(String.valueOf(delIdArray[i]));
		}
		return SUCCESS;
	}
	
	/**
	 * list member by given parameters
	 * @return 插入客户服务跟踪记录
	 * @throws Exception
	 */
	public String addClientServiceRecord() throws Exception{	
		traceMessage=new TraceMessage();
		//从Member类里取得用户ID，以memberId变量存放
		Member member = MemberService.getMember();
		Long mId = member.getMemberId();
		Long getId=IdMakerService.newId("TBL_MEMBER_TRACE_MESSAGE");
		
		if(TITLE==null)
		{TITLE="";}
		if(CUSTOMER==null)
		{CUSTOMER="";}
		if(CONTENT==null)
		{CONTENT="";}
		
		traceMessage.setTitle(TITLE);
		traceMessage.setCustomer(CUSTOMER);
		traceMessage.setContent(CONTENT);
			
		traceMessage.setCreateTime(new Date());
		traceMessage.setModifyTime(new Date());
		traceMessage.setCreateMan(mId);
		traceMessage.setId(getId);
		
		ClientService.addClientServiceRecord(traceMessage);
		return SUCCESS;
	}
	
	/**
	 * list member by given parameters
	 * @return 取得要修改的客户跟踪记录的信息
	 * @throws Exception
	 */
	public String getUpClientServiceRecord() throws Exception{		
		traceMessage=ClientService.getUpClientServiceRecord(upId);
		return SUCCESS;
	}
	
	/**
	 * list member by given parameters
	 * @return 修改客户服务跟踪记录
	 * @throws Exception
	 */
	public String upClientServiceRecord() throws Exception{	
		traceMessage=new TraceMessage();
		HttpServletRequest request = ServletActionContext.getRequest();
		Long upId=Long.parseLong(request.getParameter("upId"));
		
		if(TITLE==null)
		{TITLE="";}
		if(CUSTOMER==null)
		{CUSTOMER="";}
		if(CONTENT==null)
		{CONTENT="";}
		
		traceMessage.setTitle(TITLE);
		traceMessage.setCustomer(CUSTOMER);
		traceMessage.setContent(CONTENT);
		traceMessage.setModifyTime(new Date());
		traceMessage.setId(upId);
		
		ClientService.UpClientServiceRecord(traceMessage);
		
		return SUCCESS;
	}
	
	/**
	 * list member by given parameters
	 * @return 取得要修改客户积分等级的客户信息
	 * @throws Exception
	 */
	public String getUpGradeScore() throws Exception{	
		long GradeScore=ClientService.getClientGradeScore(Long.parseLong(upId));
		this.request("GradeScore", GradeScore);
		return SUCCESS;
	}
	
	public String upGradeScore() throws Exception{	
		member=new Member();
		member.setMemberId(Long.parseLong(upId));
		member.setGradeScore(Long.parseLong(gradeScore));
		ClientService.upGradeScore(member);
		
		return SUCCESS;
	}
	
	/**
	 * list member by given parameters
	 * @return 取得客户消费信息
	 * @throws Exception
	 */
	public String getClientConsumeInfo() throws Exception{	
//		HttpServletRequest request = ServletActionContext.getRequest();
		//从Member类里取得用户ID，以memberId变量存放
		Member member = MemberService.getMember();
		Long mId = member.getMemberId();
			
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;
		
		if(drawerName==null)
			drawerName="";
		if(startTime==null)
			startTime="";
		if(endTime==null)
			endTime="";
		
		HashMap mm=new HashMap();
		mm.put("mId", mId);
		mm.put("drawerName", drawerName);
		mm.put("startTime", startTime);
		mm.put("endTime", endTime);
		mm.put("startCount", startCount);
		mm.put("endCount", endCount);
			
		
		int count =ClientService.getClientConsumeCount(mId);
		//PageCreator pc = new PageCreator();
		//pc.setCurrentPage(page);
		//pc.setTotalRow(count);
		//pageBar = pc.getPageBar();
		
		PageTool pageTool=new PageTool();
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	
	   	this.request("drawerName", drawerName);
	   	this.request("startTime", startTime);
	   	this.request("endTime", endTime);
		
		orderList=ClientService.getClientConsumeInfo(mm);	
		return SUCCESS;
	}
}
