package com.bornsoft.asn.action.member;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.common.MessagePage;
import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.bean.supplier.Supplier;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.utils.common.AsnConstLib;
import com.bornsoft.asn.utils.common.ImageSize;
import com.bornsoft.asn.utils.common.PageTool;
import com.bornsoft.asn.utils.common.AsnConstLib.MemberApproveState;
import com.bornsoft.asn.utils.common.AsnConstLib.MemberLockState;
import com.bornsoft.asn.utils.common.AsnConstLib.SupplierApproveState;
import com.bornsoft.asn.utils.json.Json;
import com.opensymphony.xwork2.ActionContext;

public class MemberAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	
	private Member member;
	private List<Member> list;
	private File certPhoto;
	
	private int page=1;
    private int pageSize=10 ;
    private String pageBar ;
	
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

	public File getCertPhoto() {
		return certPhoto;
	}

	public void setCertPhoto(File certPhoto) {
		this.certPhoto = certPhoto;
	}

	public List<Member> getList() {
		return list;
	}

	public void setList(List<Member> list) {
		this.list = list;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	/**
	 * 开通商务功能
	 * @return
	 * @throws Exception
	 */
	public String enrollMember() throws Exception{
		//从session中获取验证码
		String validatecode = String.valueOf(ActionContext.getContext()
				.getSession().get("validatecode"));
		if (!validatecode.equals(member.getCheckcode())) {
			this.addActionMessage("验证码错误");
			return "fail";
		} else {
			member.setApproveState(MemberApproveState.MailVerify);
			
			//cl add 2010-03-02 把登陆用户插入到商务开通表 
			member.setSsoAccount(String.valueOf(MemberService.getSsoInfo().get("account")));
			member.setRegisterTime(new java.sql.Timestamp(new java.util.Date().getTime()));
			member.setLastLoginTime(member.getRegisterTime());
			member.setLastLoginIp(this.getRequest().getRemoteAddr());
			member.setLockState(MemberLockState.Unlocked);
			MemberService.insertMember(member);
			if(certPhoto != null){
				String picName = "member_"+member.getMemberId()+".jpg";
				ImageSize.uploadImage(certPhoto,picName);
			}
			// update member state in session
			MemberService.loginMember(this.getRequest());
			return SUCCESS;
		}
		
	}
	
	/**
	 * list member by given parameters
	 * @return
	 * @throws Exception
	 */
	public String listMemberByParam() throws Exception{
		String pageType = request("pageType"); //如果是查询按钮的提交，就把页数值为初始值
		String approveState = request("approveState"); //从管理员后台首页过来的参数
		
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
		if(member != null){
			if(member.getFullName() != null){
				para.put("fullName",member.getFullName().trim()); 
			}
			if(member.getApproveState()!=null){
				para.put("approveState",member.getApproveState());
			}
			if(member.getMemberType()!=null){
				para.put("memberType", member.getMemberType());		
			}
			if(member.getArea().length() >0){
				para.put("area",member.getArea().substring(7,9));
			}
		}
		if(approveState != null){
			member = new Member();
			member.setApproveState(MemberApproveState.ManualVerify);
			para.put("approveState",member.getApproveState());
		}
		int count = MemberService.getMemberCount(para);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	
		List<Member> list=MemberService.listMemberByParam(para);
		this.request("memberList", list);
		return SUCCESS;
	}
	
	/***
	 * 综合查询所有会员
	 * 2010-11-25
	 * */
	public String listGeneralMember() throws Exception{
		String pageType = request("pageType"); //如果是查询按钮的提交，就把页数值为初始值
		String approveState = request("approveState"); //从管理员后台首页过来的参数
		
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
		if(member != null){
			if(member.getFullName() != null){
				para.put("fullName",member.getFullName().trim()); 
			}
			if(member.getApproveState()!=null){
				para.put("approveState",member.getApproveState());
			}
			if(member.getMemberType()!=null){
				para.put("memberType", member.getMemberType());		
			}
			if(member.getArea().length() >0){
				para.put("area",member.getArea().substring(7,9));
			}
		}
		if(approveState != null){
			member = new Member();
			member.setApproveState(MemberApproveState.ManualVerify);
			para.put("approveState",member.getApproveState());
		}
		int count = MemberService.getGeneralMemberCount(para);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	
		List<Member> list=MemberService.listGeneralMember(para);
		this.request("memberList", list);
		return SUCCESS;
	}
	
	/**
	 * @author cl
	 * @discription 修改会员资料
	 * @date 2010-03-08
	 * */
	public String updateMember() throws Exception{
		//从session中获取验证码
		String validatecode = String.valueOf(ActionContext.getContext()
				.getSession().get("validatecode"));
		if (!validatecode.equals(member.getCheckcode())) {
			this.addActionMessage("验证码错误");
			return "fail";
		} else {
			// 保存新资料
			MemberService.updateMemberById(member);
			// 重设审核状态
//			member.setApproveState(MemberApproveState.ManualVerify);
//			MemberService.updateApproveState(member);
			
			if(certPhoto != null){
				String picName = "member_"+member.getMemberId()+".jpg";
				ImageSize.uploadImage(certPhoto,picName);
			}
			
			MessagePage mp=new MessagePage(AsnConstLib.MessageType.Error, "信息已修改成功。请等待管理员重新审核。")
			.addLink("查看状态", "member_others.jsp", "_self", 3)
			.addLink("再次修改", "member_update.jsp", "_self", 0);
			this.getRequest().setAttribute("messagePage", mp);
			
			MemberService.loginMember(getRequest());  // 重新登录，更新状态

			return "back-message";
		}
	}
	
	/**
	 * @author cl
	 * @discription 查询企业会员资料
	 * @date 2010-03-09
	 * */
	public String listEnterprise() throws Exception{
		list = MemberService.getAllenterprise();
		return SUCCESS;
	}
	/**
	 * @author cl
	 * @discription 查询企业会员资料——————根据会员名称
	 * @date 2010-03-09
	 * */
	public String checkEnterprise() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String memberName = request.getParameter("memberName");
		
		list = MemberService.getEnterpriseByName(memberName);
		return SUCCESS;
	}
	
	
	/**
	 * @author cl
	 * @discription 邮件验证
	 * @date 2010-03-15
	 * */
	public String mailVerify() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String mailCode = request.getParameter("mailCode");
		
		member = MemberService.getMemberByMailCode(mailCode);
		if(member != null){
			member.setApproveState(MemberApproveState.ManualVerify);
			MemberService.updateApproveState(member);
			request.getSession().invalidate();  // state changed , logout if he/she logged in!!!
			return SUCCESS;
		}else{
			//return "fail";
			MessagePage mp=new MessagePage(AsnConstLib.MessageType.Error, "查无此验证码！")
						.addLink("转到首页", this.getRequest().getContextPath(), "_top", 0);
			this.getRequest().setAttribute("messagePage", mp);
			return "front-message";
		}
	}
	
	/**
	 * @author cl
	 * @discription 重新获取邮件验证编码
	 * @date 2010-03-15
	 * */
	public String remailVerifyCode() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String memberid = request.getParameter("memberid");
		
		member = MemberService.getMember(new Long(memberid));
		
		MemberService.updateMailVerifyCode(member);
		return SUCCESS;
	}
	
	/**
	 * @author cl
	 * @discription 重新获取邮件验证编码
	 * @date 2010-03-15
	 * */
	public String updateEmail() throws Exception{	
		
		MemberService.updateMail(member);
		
		return SUCCESS;
	}
	/**
	 * @author cl
	 * @discription 管理员审核用户信息
	 * @date 2010-03-16
	 * */
	public String adminCheckMember() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String memberIdset = request.getParameter("memberIdset");
		String checktype = request.getParameter("checktype");
		
		String[] memberIdArray = memberIdset.split(",");
		
		for (int i = 0; i < memberIdArray.length; i++) {
			MemberService.updateApproveState(memberIdArray[i],checktype);
		}
		
		return SUCCESS;
	}
	
	
	/**
	 * @author cl
	 * @discription 管理员彻底删除用户信息
	 * @date 2010-03-18
	 * */
	public String delMemberInfo()throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String memberIdset = request.getParameter("memberIdset");
		
		String[] memberIdArray = memberIdset.split(",");
		for(int i = 0; i<memberIdArray.length; i++){
			MemberService.deleteMemberAllInfo(new Long(memberIdArray[i]));
		}
		return SUCCESS;
	}
	/**
	 * @author cl
	 * @discription 修改会员锁定状态
	 * @date 2010-04-01
	 * */
	public String updMemberLocked()throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String memberIdset = request.getParameter("memberIdset");
		String lock = request.getParameter("lock");
		
		String[] memberIdArray = memberIdset.split(",");
		for(int i = 0; i<memberIdArray.length; i++){
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("memberId", memberIdArray[i]);
			m.put("lockState", lock);
			MemberService.updMemberLocked(m);
		}
		return SUCCESS;
	}
	/**
	 * @author cl
	 * @discription 查询会员详细信息
	 * @date 2010-04-01
	 * */
	public String getMemberById() throws Exception{
		member = MemberService.getMember(Long.parseLong(request("id")));
		//print(Json.getString(member, "class"));
		return SUCCESS;
	}
	
	/**
	 * 会员退出
	 * 2010-4-14
	 * @author yuwenqiang
	 * @return
	 */
	public String logQuit(){
		this.getRequest().getSession().invalidate();
		return SUCCESS;
	} 
	
	public String process()throws Exception{
		
		return SUCCESS;
	}
	
}
