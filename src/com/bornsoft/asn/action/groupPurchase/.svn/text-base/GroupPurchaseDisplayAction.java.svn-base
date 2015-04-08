package com.bornsoft.asn.action.groupPurchase;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.groupPurchase.GroupPurchaseDetail;
import com.bornsoft.asn.bean.groupPurchase.GroupPurchaseInfo;
import com.bornsoft.asn.bean.groupPurchase.GroupPurchaseMemDetail;
import com.bornsoft.asn.bean.groupPurchase.GroupPurchaseMember;
import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.service.groupPurchase.GroupPurchaseService;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.sms.service.SmsService;

/**
 * 团购后台
 * 
 * @author hooxin
 * 
 */
@SuppressWarnings("serial")
public class GroupPurchaseDisplayAction extends BaseAction {
	
	private GroupPurchaseInfo groupPurchaseInfo;
	private List<GroupPurchaseDetail> groupPurchaseDetailList;
	private GroupPurchaseMember groupPurchaseMember;
	private List<GroupPurchaseMemDetail> groupPurchaseMemDetail;	
	


	public List<GroupPurchaseMemDetail> getGroupPurchaseMemDetail() {
		return groupPurchaseMemDetail;
	}

	public void setGroupPurchaseMemDetail(
			List<GroupPurchaseMemDetail> groupPurchaseMemDetail) {
		this.groupPurchaseMemDetail = groupPurchaseMemDetail;
	}

	public GroupPurchaseMember getGroupPurchaseMember() {
		return groupPurchaseMember;
	}

	public void setGroupPurchaseMember(GroupPurchaseMember groupPurchaseMember) {
		this.groupPurchaseMember = groupPurchaseMember;
	}

	public List<GroupPurchaseDetail> getGroupPurchaseDetailList() {
		return groupPurchaseDetailList;
	}

	public void setGroupPurchaseDetailList(
			List<GroupPurchaseDetail> groupPurchaseDetailList) {
		this.groupPurchaseDetailList = groupPurchaseDetailList;
	}

	public GroupPurchaseInfo getGroupPurchaseInfo() {
		return groupPurchaseInfo;
	}

	public void setGroupPurchaseInfo(GroupPurchaseInfo groupPurchaseInfo) {
		this.groupPurchaseInfo = groupPurchaseInfo;
	}
	
	
	public String getGroupPurchaseInfoById()throws Exception{
		String id = this.request("id");		
		groupPurchaseInfo = GroupPurchaseService.getGroupPurchaseById(new Long(id));		
		return SUCCESS;
	}
	
	public String getGroupPurchaseDetailById() throws Exception{
		String id=this.request("id");
		groupPurchaseInfo = GroupPurchaseService.getGroupPurchaseById(new Long(id));
		groupPurchaseDetailList=GroupPurchaseService.getGroupPurchaseDetailById(new Long(id));
		this.request("id", id);
		return SUCCESS;
	}
	
	public String addGroupPurchaseMember() throws Exception{		
		Long id =  IdMakerService.newId("GroupPurchaseMemberId");
		
		if(groupPurchaseMember != null){
			groupPurchaseMember.setId(id);
			groupPurchaseMember.setJoinTime(new Date());
			groupPurchaseMember.setStatus("Y");			
		}
		GroupPurchaseService.addGroupPurchaseMember(groupPurchaseMember); //add groupPurchaseMember		
		//临时测试代码片段
			if(groupPurchaseMemDetail!=null&&groupPurchaseMemDetail.size()>0){
				List<GroupPurchaseMemDetail> l=new ArrayList<GroupPurchaseMemDetail>();
				for(GroupPurchaseMemDetail g:groupPurchaseMemDetail){
					if(g!=null&&g.getSepcId()!=null){
						l.add(g);
					}
				}
				groupPurchaseMemDetail=l;
				GroupPurchaseService.addGroupPurchaseMemDetail(groupPurchaseMemDetail,id,groupPurchaseMember);
				GroupPurchaseService.updateCurrentUsers(groupPurchaseMember.getTblGroupId());
			}
			
			
			
		//自动注册
		String strSendContent = "尊敬的团友，你好！欢迎参加脐橙团购，订单号为："+(50000+id)+"。";
		String strCon = "尊敬的团友，你好！欢迎参加脐橙团购，订单号为：<font color=red>"+(50000+id)+"</font>";
		SmsService sms = new SmsService();
		Member member  = MemberService.getMember(); //判断用户是否已登录
		if(member != null){
			sms.sendSms(groupPurchaseMember.getMobile(), strSendContent, "N");
		}else{		
			boolean boo = GroupPurchaseService.groupPurchaseInsertMember(groupPurchaseMember);			
			
			//判断用户是否存在
			if(boo){					
				sms.sendSms(groupPurchaseMember.getMobile(), strSendContent, "N");
			}else{
				strSendContent  = strSendContent+"你已自动注册为重庆市农产品电子商务平台会员，账号："+groupPurchaseMember.getMobile()+"，密码："
											+groupPurchaseMember.getMobile().substring(groupPurchaseMember.getMobile().length()-6,groupPurchaseMember.getMobile().length())
											+"，请及时登录完善相关信息！";		
				
				strCon = strCon + "<br>你已经被重庆市农产品电子商务平台自动注册为会员，<br>账号：<font color=red>"+groupPurchaseMember.getMobile()+"</font>，密码：<font color=red>"
				+groupPurchaseMember.getMobile().substring(groupPurchaseMember.getMobile().length()-6,groupPurchaseMember.getMobile().length())
				+"</font>，<br>请及时登录完善相关信息和以便我们及时为你提供服务！";	
				
				sms.sendSms(groupPurchaseMember.getMobile(), strSendContent, "N");
			}
		}
		
		
		this.request("groupPurchaseMember", groupPurchaseMember);	
			
		this.request("strSendContent", strCon);
			
		//
//		GroupPurchaseService.addGroupPurchaseMemDetail(groupPurchaseMemDetail,id);
//		GroupPurchaseService.updateCurrentUsers(groupPurchaseMember.getTblGroupId());
		
		this.request("groupPurchaseMember", groupPurchaseMember);
		return SUCCESS;
	}
	
	public String getMemberBuyDetail() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		Long id=Long.parseLong(request.getParameter("id"));
		
		List memberBuyDetailList=GroupPurchaseService.getMemberBuyDetail(id);
		this.request("memberBuyDetailList", memberBuyDetailList);
		return SUCCESS;
	}
	
	/******
	 * 
	 * 绿优鲜网上超市—— 网购连接
	 * ***/
	public String getGroupPurchaseInfoByIdOnApg()throws Exception{
		String id = this.request("id");		
		groupPurchaseInfo = GroupPurchaseService.getGroupPurchaseById(new Long(id));		
		return SUCCESS;
	}
}
