package com.bornsoft.asn.action.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.member.MemberGroupService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.utils.common.PageCreator;
import com.bornsoft.asn.utils.common.PageTool;
/**
 * @author Administrator
 *
 */
@SuppressWarnings("serial")
public class MemberInGroupAction extends BaseAction {
	
	private int page=1;
	private int pageSize=10 ;
	private String pageBar;
	private String memberId;
	private String addGroupName;
	private String delGroupName;
	private String memberIdset;
	private String groupId;
	private String ssoAccount;
	private String delGroupMember;
	private MemberGroup memberGroup; 	
	
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	
	public MemberGroup getMemberGroup() {
		return memberGroup;
	}

	public void setMemberGroup(MemberGroup memberGroup) {
		this.memberGroup = memberGroup;
	}

	public String getDelGroupMember() {
		return delGroupMember;
	}

	public void setDelGroupMember(String delGroupMember) {
		this.delGroupMember = delGroupMember;
	}

	public String getSsoAccount() {
		return ssoAccount;
	}

	public void setSsoAccount(String ssoAccount) {
		this.ssoAccount = ssoAccount;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getMemberIdset() {
		return memberIdset;
	}

	public void setMemberIdset(String memberIdset) {
		this.memberIdset = memberIdset;
	}

	public String getDelGroupName() {
		return delGroupName;
	}

	public void setDelGroupName(String delGroupName) {
		this.delGroupName = delGroupName;
	}

	public String getAddGroupName() {
		return addGroupName;
	}

	public void setAddGroupName(String addGroupName) {
		this.addGroupName = addGroupName;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getPageBar() {
		return pageBar;
	}

	public void setPageBar(String pageBar) {
		this.pageBar = pageBar;
	}

	private List<MemberGroup> MemberGroupList;
	
	
	
	public void setMemberGroupList(List<MemberGroup> memberGroupList) {
		MemberGroupList = memberGroupList;
	}

	public List<MemberGroup> getMemberGroupList(){
		return MemberGroupList;
	}
	
	private List<Member> memberList;
	private List<Member> unGroupedMemberList;
	
	
	public List<Member> getUnGroupedMemberList() {
		return unGroupedMemberList;
	}

	public void setUnGroupedMemberList(List<Member> unGroupedMemberList) {
		this.unGroupedMemberList = unGroupedMemberList;
	}

	public List<Member> getList() {
		return memberList;
	}

	public void setList(List<Member> list) {
		this.memberList = list;
	}

	/**
	 * list member by given parameters
	 * @return
	 * @throws Exception
	 */
	public String listGroup() throws Exception{	
		HttpServletRequest request = ServletActionContext.getRequest();
		String groupName=request.getParameter("groupName");
		//从Member类里取得用户ID，以memberId变量存放
		Member member = MemberService.getMember();
		Long mId = member.getMemberId();
		
		MemberGroupList=MemberGroupService.findMemberGroupList(groupName,String.valueOf(mId));
		
		if(MemberGroupList == null)
			MemberGroupList = new ArrayList<MemberGroup>();
		
		this.request("groupName", groupName);
		
		return SUCCESS;
	}
	
	
	//取得组名(不分页)
	public String checkGroup() throws Exception{	
		HttpServletRequest request = ServletActionContext.getRequest();
		String groupName=request.getParameter("groupName");
		//从Member类里取得用户ID，以memberId变量存放
		Member member = MemberService.getMember();
		Long mId = member.getMemberId();
		
		MemberGroupList=MemberGroupService.checkGroup(groupName,String.valueOf(mId));
		
		if(MemberGroupList == null)
			MemberGroupList = new ArrayList<MemberGroup>();
		
		return SUCCESS;
	}
	
	/**
	 * list member by given parameters
	 * @return 返回未分组的组员LIST
	 * @throws Exception
	 */
	public String listUnGroupedMember() throws Exception{
		//从Member类里取得用户ID，以memberId变量存放
		Member member = MemberService.getMember();
		Long mId = member.getMemberId();
		
		//取得要查询的账户名
		if(ssoAccount==null)
			ssoAccount="";
		
		unGroupedMemberList=MemberGroupService.getUnGroupedMemberList(ssoAccount,String.valueOf(mId));
		
		this.request("memberList", unGroupedMemberList);
		
		return SUCCESS;
	}
	
	
public String getGroupMember() throws Exception{
	HttpServletRequest request = ServletActionContext.getRequest();
	//从Member类里取得用户ID，以memberId变量存放
	Member member = MemberService.getMember();
	Long mId = member.getMemberId();
	
	if(groupId==null)
		groupId="";
	
	int count = MemberGroupService.getGroupMemberCount(groupId);
	PageCreator pc = new PageCreator();
	pc.setCurrentPage(page);
	pc.setTotalRow(count);
	
	pageBar = pc.getPageBar();
	memberList=MemberGroupService.getGroupMemberList(pc.getStartCount(), pc.getEndCount(), groupId,String.valueOf(mId));	
	this.request("memberList", memberList);
	
	return SUCCESS;
}

public String delGroupMember()throws Exception{
	if(delGroupMember==null)
		delGroupMember="";
	
	String[] memberIdArray = delGroupMember.split(",");
	
	for(int i = 0; i<memberIdArray.length; i++){
		MemberGroupService.delGroupMember(String.valueOf(memberIdArray[i]));
	}
	
	return SUCCESS;
}

public String addMemberGroup() throws Exception{
	HttpServletRequest request = ServletActionContext.getRequest();
		Member member = MemberService.getMember();
		Long mId = member.getMemberId();
	
		if(addGroupName==null)
		{
			addGroupName="";
		}
		if(memberId==null)
		{
			memberId="";
		}
		
		HashMap mm=new HashMap();
		String getId=String.valueOf(IdMakerService.newId("tbl_member_group"));
		
		mm.put("GROUP_NAME", addGroupName);
		mm.put("BELONG_TO", String.valueOf(mId));
		mm.put("ID", getId);
	
		MemberGroupService.addMemberGroup(mm,memberId);
		
		return SUCCESS;
	}

public String delMemberGroup() throws Exception{	
		HttpServletRequest request = ServletActionContext.getRequest();
		String groupIdset = request.getParameter("groupIdset");
		String[] groupIdArray = groupIdset.split(",");
		for(int i = 0; i<groupIdArray.length; i++){
			MemberGroupService.deleteGroupInfo(String.valueOf(groupIdArray[i]));
		}
		return SUCCESS;
	}

public String getEditGroup() throws Exception{	
	if(groupId==null)
		groupId="";
	memberGroup = MemberGroupService.getEditGroup(groupId);
	return SUCCESS;
}

public String editGroup() throws Exception{	
	
	return SUCCESS;
}

public String inGroup() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String groupIdset = request.getParameter("checkedGroupId");
		if(memberId==null)
		{
			memberId="";
		}
		String[] memberIdArray = memberId.split(",");
		for(int i = 0; i<memberIdArray.length; i++){
			MemberGroupService.inGroup(String.valueOf(memberIdArray[i]),groupIdset);
		}
		return SUCCESS;
	}

public String getAllMember() throws Exception{
	if(ssoAccount==null)
		ssoAccount="";
	
	memberList=MemberGroupService.getAllMember(ssoAccount);	
	this.request("memberList", memberList);
	return SUCCESS;
}

public String upGroupName() throws Exception{
	HttpServletRequest request = ServletActionContext.getRequest();
	String groupName=request.getParameter("groupName");
	String groupId=request.getParameter("groupId");
	HashMap mm=new HashMap();
	mm.put("GROUP_NAME", groupName);
	mm.put("GROUP_ID", groupId);
	MemberGroupService.upGroupName(mm);
	return SUCCESS;
}

}

	
	

