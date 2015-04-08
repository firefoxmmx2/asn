/**
 * 
 */
package com.bornsoft.asn.service.member;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.bean.product.Product;
import com.bornsoft.asn.dao.bank.BankInfoDao;
import com.bornsoft.asn.dao.license.LicenseDao;
import com.bornsoft.asn.dao.member.MemberDao;
import com.bornsoft.asn.dao.product.PT2DYDao;
import com.bornsoft.asn.dao.product.ProductCustomPropertyDao;
import com.bornsoft.asn.dao.product.ProductDao;
import com.bornsoft.asn.dao.supplier.SupplierDao;
import com.bornsoft.asn.exception.ActionException;
import com.bornsoft.asn.filter.SecurityFilter;
import com.bornsoft.asn.service.discount.DiscountService;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.utils.common.AsnConstLib;
import com.bornsoft.asn.utils.common.AsnConstLib.AdminRoles;
import com.bornsoft.asn.utils.common.AsnConstLib.MemberApproveState;
import com.bornsoft.asn.utils.common.AsnConstLib.MemberLockState;
import com.bornsoft.asn.utils.common.PropertyFactory;
import com.bornsoft.asn.utils.common.Str;
import com.bornsoft.asn.utils.common.TimeDebug;
import com.bornsoft.asn.utils.common.WebContext;
import com.bornsoft.asn.utils.common.sqlMapFactory;
import com.bornsoft.sms.service.SmsService;
import com.bornsoft.sso.util.Validate;

/**
 * Member Service
 * 
 * @author Ken Liu Kunyun
 *         Created on Feb 25, 2010
 */
public class MemberService
{
	public static final Logger log = Logger.getLogger(MemberService.class);
	/**
	 * Get Member by Id
	 * 
	 * @return
	 * @throws SQLException
	 */
	public static Member getMember(long memberId) throws Exception
	{
		log.debug("getMember starts .....");
		try{
			Member ret = new MemberDao().getMemberById(memberId);
			
			log.debug("getMember finished ....");
			return ret;
		}catch(Exception e){
			log.error("get member error",e);
			throw e;
		}
	}

	/**
	 * Get current member
	 * call only in struts2 action stack
	 * 
	 * @return
	 * @throws SQLException
	 */
	public static Member getMember() throws Exception
	{
		log.debug("getMember starts .....");
		try{
			Long id = (Long) WebContext.session("loginMemberId");
			if (id == null)
			{
				return null;
			}
			Member member = getMember(id);
			
			log.debug("getMember finished ....");
			return member;
		}catch(Exception e){
			log.error("get member error",e);
			throw e;
		}
		
	}

	/**
	 * get current member
	 * 
	 * @param session
	 * @return
	 * @throws SQLException
	 */
	public static Member getMember(HttpSession session) throws Exception
	{
		log.debug("getMember starts ....");
		try{
			Long id = (Long) WebContext.session(session, "loginMemberId");
			Member member = getMember(id);
			
			log.debug("getMember finished ...");
			return member;
		}catch(Exception e){
			log.error("",e);
			throw e;
		}
	}

	/**
	 * get SSO info
	 * propertyMap包含下列Key
	 * 登录者账号 account
	 * 登录者姓名 userName
	 * 登录者电话 phone
	 * 登录者手机 mobile
	 * 登录者邮编 mailno
	 * 登录者地址 address
	 * 登录者地址 description
	 * 登录者邮箱 email
	 * 登录者生日 birthday
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Map<String,Object> getSsoInfo()
	{
		return (Map<String,Object>) WebContext.session("ssoInfo");
	}

	/**
	 * get sso info
	 * 
	 * @param session
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Map<String,Object> getSsoInfo(HttpSession session)
	{
		return (Map<String,Object>) WebContext.session(session, "ssoInfo");
	}

	/**
	 * get member ID
	 * call only in struts2 action stack
	 * 
	 * @return
	 */
	public static long getMemberId()
	{
		Long id = (Long) WebContext.session("loginMemberId");
		if (id == null)
			id = 0L;
		return id;
	}

	/**
	 * get member id
	 * 
	 * @param session
	 * @return
	 */
	public static long getMemberId(HttpSession session)
	{
		Long id = (Long) WebContext.session(session, "loginMemberId");
		if (id == null)
			id = 0L;
		return id;
	}

	/**
	 * get member full name
	 * call only in struts2 action stack
	 * 
	 * @return
	 */
	public static String getMemberFullName()
	{
		String name = (String) WebContext.session("loginMemberFullName");
		if (name == null)
			name = getSsoName(WebContext.getRequest().getSession());
		return name;
	}

	/**
	 * get member full name
	 * 
	 * @param session
	 * @return
	 */
	public static String getMemberFullName(HttpSession session)
	{
		String name = (String) WebContext.session(
				session,
				"loginMemberFullName");
		if (name == null)
			name = getSsoName(session);
		return name;
	}

	/**
	 * get member short name
	 * call only in struts2 action stack
	 * 
	 * @return
	 */
	public static String getMemberShortName()
	{
		String name = (String) WebContext.session("loginMemberShortName");
		if (name == null)
			name = getSsoName(WebContext.getRequest().getSession());
		return name;
	}

	/**
	 * get member short name
	 * 
	 * @param session
	 * @return
	 */
	public static String getMemberShortName(HttpSession session)
	{
		String name = (String) WebContext.session(
				session,
				"loginMemberShortName");
		if (name == null)
			name = getSsoName(session);
		return name;
	}

	/**
	 * 用户姓名
	 * 
	 * @param session
	 * @return
	 */
	public static String getSsoName(HttpSession session)
	{
		String ret = "";
		Map info = getSsoInfo(session);
		if (info != null)
			ret = (String) info.get("userName");
		return ret;
	}

	/**
	 * save login information for a member
	 * 
	 * @param m
	 * @throws Exception
	 */
	public static Member loginMember(HttpServletRequest request)throws Exception
	{
		Member m = null;
		HttpSession session = request.getSession();
		Map ssoInfo = getSsoInfo(session);
		String ssoAccount = (String) getSsoInfo(session).get("account");
		
		log.debug("loginMember starts ....");
		try
		{
			m = new MemberDao().getMemberBySsoAccount(ssoAccount);
			// 不存在资料
			if (m == null)
			{
				// 初始化资料
				m = new Member();
				m.setMemberId(IdMakerService.newId("memberId"));
				m.setSsoAccount(ssoAccount);
				m.setFullName(getSsoInfo(session).get("userName").toString());
				m.setShortName("");
				m.setAddress("");
				m.setApproveState(MemberApproveState.ManualVerify);
				m.setArea("");
				m.setCertId("");
				m.setContactor("");
				String email = (String) ssoInfo.get("email");
				if (email.equals("") && ssoAccount.indexOf("@") > 0)
					email = "";
				m.setEmail(email);
				m.setFixedPhone("");
				m.setMemberType(Byte.valueOf(Validate.isCompany(MemberService
						.getSsoInfo(session)) ? "1" : "2"));
				m.setMobilePhone(ssoAccount.matches("\\d\\d\\d\\d\\d\\d") ? ssoAccount: "");
				m.setZip("");
				m.setSsoType(""); //add 2010-12-16 cl 账号类型
				
				insertMember(m);
				
				m = new MemberDao().getMemberBySsoAccount(ssoAccount);
			}
			if (m != null)
			{
				session.setAttribute("loginMemberId", m.getMemberId());
				session.setAttribute("loginMemberShortName", m.getShortName());
				session.setAttribute("loginMemberFullName", m.getFullName());
				session.setAttribute("loginMemberApproveState",	m.getApproveState());
				session.setAttribute("loginMemberLockState", m.getLockState());
				session.setAttribute("loginMemberLastIp", m.getLastLoginIp());
				session.setAttribute("loginMemberLastTime",	m.getLastLoginTime());
				// update last login time
				try
				{
					HashMap<String,Object> lastLogin = new HashMap<String,Object>();
					lastLogin.put("memberId", m.getMemberId());
					lastLogin.put("lastLoginIp", request.getRemoteAddr());
					lastLogin.put("lastLoginTime", new java.sql.Timestamp(new java.util.Date().getTime()));
					sqlMapFactory.getSqlMap().startTransaction();
					MemberDao.updateMemberLastLogin(lastLogin);
					sqlMapFactory.getSqlMap().commitTransaction();
					
					log.debug("update member finished .....");
				}
				catch (Exception e)
				{
					log.info("修改会员出错", e);
					throw e;
				}
				finally
				{
					sqlMapFactory.getSqlMap().endTransaction();
				}
			}
		}
		catch (Exception e)
		{
			log.info("会员登录出错", e);
			throw e;
		}
		return m;
	}

	/**
	 * get member approve state
	 * 
	 * @param session
	 * @return
	 */
	public static MemberApproveState getApproveState(HttpSession session)
	{
		MemberApproveState ret = (MemberApproveState) session.getAttribute("loginMemberApproveState");
		if (ret == null)
			ret = MemberApproveState.None;
		return ret;
	}

	/**
	 * get member lock state
	 * 
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public static MemberLockState getLockState(HttpServletRequest request)throws Exception
	{
		HttpSession session = request.getSession();
		long id = getMemberId(session);
		if (id < 1)
		{
			loginMember(request);
		}
		MemberLockState ret = (MemberLockState) session	.getAttribute("loginMemberLockState");
		
		if (ret == null)
			ret = MemberLockState.None;
		return ret;
	}

	public static List<Member> listMemberByParam(Map parameters)throws Exception
	{
		log.debug("listMemberByParam starts .........");
		try{
			List<Member> ret = null;
			ret = new MemberDao().listMemberByParam(parameters);
			
			log.debug("listMemberByParam finished ......");
			return ret;
		}catch(Exception e){
			log.error("search member error",e);
			throw e;
		}
	}
	
	/**
	 * @author cl
	 * @description 获取所有记录  -----综合查询
	 * @date 2010-11-25
	 */
	public static List<Member> listGeneralMember(Map parameters)throws Exception
	{
		log.debug("listGeneralMember starts .........");
		try{
			List<Member> ret = null;
			ret = new MemberDao().listGeneralMember(parameters);
			
			log.debug("listGeneralMember finished .....");
			return ret;
		}catch(Exception e){
			log.error("search member error",e);
			throw e;
		}
	}

	/**
	 * @author cl
	 * @description 用户注册
	 * @date 2010-02-26
	 */
	public static void insertMember(Member member) throws Exception
	{
		UUID uuid = UUID.randomUUID();
		String mailCode = uuid.toString().replaceAll("-", ""); // 获取邮箱验证编码
		
		log.debug("insertMember starts .........");
		try
		{
			sqlMapFactory.getSqlMap().startTransaction();
			member.setMailVerifyCode(mailCode);

			new MemberDao().insertMember(member); // 添加会员信息

			/****** 发送邮件 *****/
			// if(member.getNotifyMail().equals("1")){
			// String stemp = AsnConstLib.sysMailMemberRegisterMsg;
			// MailDaemon md = new MailDaemon(MailService.PROTOCOL_IMAP,
			// AsnConstLib.sysMailImapHost,
			// AsnConstLib.sysMailSmtpHost, AsnConstLib.sysMailUser,
			// AsnConstLib.sysMailPassword, true, true);
			// md.send("望龙门-农业综合服务网络平台  邮箱验证", member.getEmail(), null,
			// MailService.parseMsgCont(stemp, new Object[] {
			// " <a href='"+getMailVerifyAction()+"?mailCode="+mailCode+"'>"+
			// getMailVerifyAction()+"?mailCode="+mailCode+"</a>",member.getFullName()}),
			// true);
			// }
			/****** 发送邮件完成 *****/

			sqlMapFactory.getSqlMap().commitTransaction();
			
			log.debug("insertMember finished ....");
		}
		catch (Exception e)
		{
			log.info("完善会员信息  新增出错", e);
			throw e;
		}
		finally
		{
			sqlMapFactory.getSqlMap().endTransaction();
		}

	}

	/**
	 * @author cl
	 * @description 修改会员资料
	 * @date 2010-03-08
	 */
	public static void updateMemberById(Member member) throws Exception
	{
		log.debug("updateMemberById starts .........");
		try
		{
			sqlMapFactory.getSqlMap().startTransaction();
			MemberDao.updateMemberById(member);
			sqlMapFactory.getSqlMap().commitTransaction();
			
			log.debug("updateMemberById finished .........");
		}catch (Exception e){
			log.info("修改会员出错", e);
			throw e;
		}
		finally
		{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}

	/**
	 * @author cl
	 * @description 查询所有的企业会员资料
	 * @date 2010-03-09
	 */
	public static List<Member> getAllenterprise() throws Exception
	{
		log.debug("getAllenterprise starts ......");
		try{
			List<Member> list = MemberDao.getAllenterprise();
			
			log.debug("getAllenterprise finished ......");
			return list;
		}catch(Exception e){
			log.error("search enterprise member error", e);
			throw e;
		}
	}

	/**
	 * @author cl
	 * @description 查询的企业会员资料————根据会员名称
	 * @date 2010-03-09
	 */
	public static List<Member> getEnterpriseByName(String strname)throws Exception
	{
		log.debug("getEnterpriseByName starts ......");
		try{
			List<Member> list = MemberDao.getEnterpriseByName(strname);
			
			log.debug("getEnterpriseByName finished ......");
			return list;
		}catch(Exception e){
			log.error("search enterpriseByName member error", e);
			throw e;
		}
	}

	/**
	 * has permission
	 * 
	 * @param typeCode
	 * @return
	 */
	public static Boolean hasPermission(AdminRoles role)
	{
		return SecurityFilter.useStubSso
				|| Validate.hasPermission(WebContext.getRequest(), role.name());
	}

	/**
	 * has permission
	 * 
	 * @param request
	 * @param typeCode
	 * @return
	 */
	public static Boolean isRole(HttpServletRequest request, AdminRoles role)
	{
		return isRole(request, role.toString());
	}

	public static Boolean isRole(HttpServletRequest request, String role)
	{
		TimeDebug.print("M3");
		boolean ret = SecurityFilter.useStubSso
				|| Validate.isRole(request, role);
		TimeDebug.print("M4");
		return ret;
	}

	/**
	 * @author cl
	 * @description 邮箱验证，获取用户信息
	 * @date 2010-03-15
	 */
	public static Member getMemberByMailCode(String mailCode)throws Exception
	{
		return MemberDao.getMemberByMailCode(mailCode);
	}

	/**
	 * @author cl
	 * @description 修改审核状态
	 * @date 2010-03-15
	 */
	public static void updateApproveState(Member member) throws Exception
	{
		log.debug("updateApproveState starts ......");
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			MemberDao.updateApproveState(member);
			sqlMapFactory.getSqlMap().commitTransaction();
			
			log.debug("updateApproveState finished ......");
		}catch(Exception e){
			log.error("修改审核状态", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}

	/**
	 * @author cl
	 * @description 修改审核状态
	 * @date 2010-03-15
	 */
	public static void updateApproveState(String memberId, String checktype)
			throws Exception
	{
		
		Member member = new Member();
		// member = MemberService.getMember(new Long(memberIdArray[i]));
		member.setMemberId(new Long(memberId));
		if (checktype.equals("1"))
		{
			member.setApproveState(MemberApproveState.Completed);
		}
		else if (checktype.equals("2"))
		{
			member.setApproveState(MemberApproveState.Rejected);
		}

		log.debug("updateApproveState starts ......");
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			MemberDao.updateApproveState(member);
			sqlMapFactory.getSqlMap().commitTransaction();
			
			log.debug("updateApproveState finished ......");
		}catch(Exception e){
			log.error("修改审核状态", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
		
		/********************* 发送短信 **********************/
		if (checktype.equals("1"))
		{
			if (AsnConstLib.smsSendSettingMap
					.get("checkMember")
					.toString()
					.equals("Y"))
			{
				try
				{
					String strSendContent = PropertyFactory
							.getDefaultProperty()
							.getProperty("asn.smsSend.checkMember");
					Member mb = MemberService.getMember(new Long(memberId));
					strSendContent = Str.parseString(
							strSendContent,
							new Object[] { mb.getFullName() });
					SmsService sms = new SmsService();
					sms.sendSms(mb.getMobilePhone(), strSendContent, "N");
				}catch (Exception e)
				{
					log.error("发送短信出错", e);
					throw e;
				}
			}
		}
		else if (checktype.equals("2"))
		{
			if (AsnConstLib.smsSendSettingMap
					.get("checkMemberNo")
					.toString()
					.equals("Y"))
			{
				try
				{
					String strSendContent = PropertyFactory
							.getDefaultProperty()
							.getProperty("asn.smsSend.checkMemberNo");
					Member mb = MemberService.getMember(new Long(memberId));
					strSendContent = Str.parseString(
							strSendContent,
							new Object[] { mb.getFullName() });
					SmsService sms = new SmsService();
					sms.sendSms(mb.getMobilePhone(), strSendContent, "N");
				}catch (Exception e)
				{
					log.error("发送短信出错", e);
					throw e;
				}
			}
		}
		/********************* 发送短信 **********************/
	}

	/**
	 * @author cl
	 * @description 修改邮件验证码
	 * @date 2010-03-15
	 */
	public static void updateMailVerifyCode(Member member) throws Exception
	{
		UUID uuid = UUID.randomUUID();
		String mailCode = uuid.toString().replaceAll("-", ""); // 获取邮箱验证编码
		try
		{
			sqlMapFactory.getSqlMap().startTransaction();
			member.setMailVerifyCode(mailCode);

			MemberDao.updateMailVerifyCode(member); // 修改邮箱验证编码

			// /******发送邮件*****/
			// MailService ms = new MailService(MailService.PROTOCOL_IMAP, true,
			// true);
			// ms.isDebug(true);
			// ms.setSmtphost(AsnConstLib.sysMailSmtpHost);
			// ms.connect(AsnConstLib.sysMailImapHost, AsnConstLib.sysMailUser,
			// AsnConstLib.sysMailPassword);
			// String stemp = AsnConstLib.sysMailMemberRegisterMsg;
			// ms.send("望龙门-农业综合服务网络平台  邮箱验证", member.getEmail(), null,
			// ms.parseMsgCont(stemp, new Object[] {" <a href='"+
			// getMailVerifyAction()+"?mailCode="+mailCode+"'>"+getMailVerifyAction()+"?mailCode="+mailCode+"</a>",member.getFullName()}),
			// true);
			// ms.close();
			// /******发送邮件完成*****/

			/****** 发送邮件 *****/
			// if(member.getNotifyMail().equals("1")){
			// String stemp = AsnConstLib.sysMailMemberRegisterMsg;
			// MailDaemon md = new MailDaemon(MailService.PROTOCOL_IMAP,
			// AsnConstLib.sysMailImapHost,
			// AsnConstLib.sysMailSmtpHost, AsnConstLib.sysMailUser,
			// AsnConstLib.sysMailPassword, true, true);
			// md.send("望龙门-农业综合服务网络平台  邮箱验证", member.getEmail(), null,
			// MailService.parseMsgCont(stemp, new Object[] {
			// " <a href='"+getMailVerifyAction()+"?mailCode="+mailCode+"'>"+
			// getMailVerifyAction()+"?mailCode="+mailCode+"</a>",member.getFullName()}),
			// true);
			// }
			/****** 发送邮件完成 *****/

			sqlMapFactory.getSqlMap().commitTransaction();

		}
		catch (Exception e)
		{
			log.info("修改邮件验证码出错", e);
			throw e;
		}
		finally
		{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}

	private static String getMailVerifyAction()
	{
		return WebContext.fullUrl("~/front/member/mailVerify");
	}

	/**
	 * @author cl
	 * @description 删除会员所有信息
	 * @date 2010-03-18
	 */
	public static void deleteMemberAllInfo(long memberid) throws Exception
	{
		log.debug("deleteMemberAllInfo starts .......");
		try
		{
			sqlMapFactory.getSqlMap().startTransaction();

			// ProductPurchaseService.deleteProductPurchaseByMemberId(String.valueOf(memberid));//删除求购信息
			// List<ProductSupply>
			// l=ProductSupplyDao.getProductSuppluList((int)memberid);
			// for(ProductSupply ps:l){
			// ProductCustomDao.deleteProductCustomList(ps.getProductId());
			// }
			// ProductSupplyDao.deleteProductSupplyBySupplierId((int)memberid);
			List<Product> l = ProductDao.getProductListChenL((int) memberid);
			for (Product p : l)
			{
				ProductCustomPropertyDao.deleteProductCustomPropertyList(p
						.getProductId());
				PT2DYDao.deleteList(p.getProductId());
			}
			ProductDao.deleteProductBySupplierId((int) memberid);// 删除供应信息

			LicenseDao.delLicenseByMemberId(memberid); // 删除证件信息
			BankInfoDao.deleteBankinfo(memberid); // 删除银行信息
			SupplierDao.deleteSupplier(memberid); // 删除供应商信息
			MemberDao.deleteMember(memberid); // 删除会员信息

			sqlMapFactory.getSqlMap().commitTransaction();
			
			log.debug("deleteMemberAllInfo finished ........");                                               
		}
		catch (Exception e)
		{
			log.info("删除会员所有信息出错", e);
			throw e;
		}
		finally
		{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}

	/**
	 * check if a member logged in
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public static boolean isLogin(HttpServletRequest request)
	{
		boolean ret = false;// (request.getSession().getAttribute("ssoInfo")!=null);
		if (!ret)
		{
			ret = Validate.checkLogin(request);
			if (ret)
			{
				Map propertyMap = (Map) request.getAttribute("propertyMap");
				request.getSession().setAttribute("ssoInfo", propertyMap);
				try
				{
					loginMember(request);
				}
				catch (Exception e)
				{
					log.error("登录出错了",e);
				}
			}
			// propertyMap包含下列Key
			// 登录者账号 account
			// 登录者姓名 userName
			// 登录者电话 phone
			// 登录者手机 mobile
			// 登录者邮编 mailno
			// 登录者地址 address
			// 登录者地址 description
			// 登录者邮箱 email
			// 登录者生日 birthday
		}
		return ret;
	}

	/**
	 * check if current user is a member
	 * 
	 * @param request
	 * @return
	 */
	public static boolean isMember(HttpServletRequest request)
	{
		return (WebContext.session(request.getSession(), "loginMemberId") != null);
	}

	/**
	 * @author cl
	 * @description 修改邮件验证码
	 * @date 2010-03-15
	 */
	public static void updateMail(Member member) throws Exception
	{
		UUID uuid = UUID.randomUUID();
		String mailCode = uuid.toString().replaceAll("-", ""); // 获取邮箱验证编码
		try
		{
			sqlMapFactory.getSqlMap().startTransaction();
			member.setMailVerifyCode(mailCode);

			MemberDao.updateMail(member); // 修改邮箱

			// /******发送邮件*****/
			// MailService ms = new MailService(MailService.PROTOCOL_IMAP, true,
			// true);
			// ms.isDebug(true);
			// ms.setSmtphost(AsnConstLib.sysMailSmtpHost);
			// ms.connect(AsnConstLib.sysMailImapHost, AsnConstLib.sysMailUser,
			// AsnConstLib.sysMailPassword);
			// String stemp = AsnConstLib.sysMailMemberRegisterMsg;
			// ms.send("望龙门-农业综合服务网络平台  邮箱验证", member.getEmail(), null,
			// ms.parseMsgCont(stemp, new Object[] {" <a href='"+
			// getMailVerifyAction()+"?mailCode="+mailCode+"'>"+getMailVerifyAction()+"?mailCode="+mailCode+"</a>",member.getFullName()}),
			// true);
			// ms.close();
			// /******发送邮件完成*****/

			/****** 发送邮件 *****/
			// if(member.getNotifyMail().equals("1")){
			// String stemp = AsnConstLib.sysMailMemberRegisterMsg;
			// MailDaemon md = new MailDaemon(MailService.PROTOCOL_IMAP,
			// AsnConstLib.sysMailImapHost,
			// AsnConstLib.sysMailSmtpHost, AsnConstLib.sysMailUser,
			// AsnConstLib.sysMailPassword, true, true);
			// md.send("望龙门-农业综合服务网络平台  邮箱验证", member.getEmail(), null,
			// MailService.parseMsgCont(stemp, new Object[] {
			// " <a href='"+getMailVerifyAction()+"?mailCode="+mailCode+"'>"+
			// getMailVerifyAction()+"?mailCode="+mailCode+"</a>",member.getFullName()}),
			// true);
			// }
			/****** 发送邮件完成 *****/

			sqlMapFactory.getSqlMap().commitTransaction();

		}
		catch (Exception e)
		{
			Logger log = Logger.getLogger("MemberService");
			log.info("修改邮箱出错", e);
			throw e;
		}
		finally
		{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}

	/**
	 * @author cl
	 * @description 获取记录总行数
	 * @date 2010-03-25
	 */
	public static int getMemberCount(Map para) throws Exception
	{
		int count;
		
		log.debug("getMemberCount starts .....");
		try
		{
			count = MemberDao.getMemberCount(para);

			log.debug("getMemberCount finished ......");
			return count;
		}
		catch (Exception e)
		{
			log.error("修改邮箱出错", e);
			throw e;
		}
	}
	
	
	/**
	 * @author cl
	 * @description 获取记录总行数  -----综合查询
	 * @date 2010-11-25
	 */
	public static int getGeneralMemberCount(Map para) throws Exception
	{
		int count;
		
		log.debug("getGeneralMemberCount starts .......");
		try
		{
			count = MemberDao.getGeneralMemberCount(para);

			log.debug("getGeneralMemberCount finished .......");
			return count;
		}
		catch (Exception e)
		{
			log.error("修改邮箱出错", e);
			throw e;
		}
	}

	/**
	 * @author cl
	 * @discription 修改会员锁定状态
	 * @date 2010-04-01
	 */
	public static void updMemberLocked(Map m) throws Exception
	{
		log.debug("updMemberLocked starts ....");
		try
		{
			sqlMapFactory.getSqlMap().startTransaction();
			MemberDao.updMemberLocked(m);
			sqlMapFactory.getSqlMap().commitTransaction();

			log.debug("updMemberLocked finished ........");
			/********************* 发送短信 **********************/
			if (m.get("lockState").toString().equals("Locked"))
			{
				if (AsnConstLib.smsSendSettingMap
						.get("memberLock")
						.toString()
						.equals("Y"))
				{
					try
					{
						String strSendContent = PropertyFactory
								.getDefaultProperty()
								.getProperty("asn.smsSend.memberLock");
						Member mb = MemberService.getMember(new Long(m.get(
								"memberId").toString()));
						strSendContent = Str.parseString(
								strSendContent,
								new Object[] { mb.getFullName() });
						SmsService sms = new SmsService();
						sms.sendSms(mb.getMobilePhone(), strSendContent, "N");
					}
					catch (Exception e)
					{
						log.error("发送短信出错",e);
					}
				}
			}
			else if (m.get("lockState").toString().equals("Unlocked"))
			{
				if (AsnConstLib.smsSendSettingMap
						.get("memberLockNo")
						.toString()
						.equals("Y"))
				{
					try
					{
						String strSendContent = PropertyFactory
								.getDefaultProperty()
								.getProperty("asn.smsSend.memberLockNo");
						Member mb = MemberService.getMember(new Long(m.get(
								"memberId").toString()));
						strSendContent = Str.parseString(
								strSendContent,
								new Object[] { mb.getFullName() });
						SmsService sms = new SmsService();
						sms.sendSms(mb.getMobilePhone(), strSendContent, "N");
					}
					catch (Exception e)
					{
						log.error("发送短信出错了",e);
					}
				}
			}
			/********************* 发送短信 **********************/
		}
		catch (Exception e)
		{
			log.error("修改锁定状态出错", e);
			throw e;
		}
		finally
		{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}

	/**
	 * 检查当会员状态，根据状态做一些必要的转向
	 * 
	 * @param request
	 * @param response
	 */
	public static String checkState(HttpServletRequest request)
			throws IOException
	{
		// check member approve state
		String url = null;
		MemberApproveState state = MemberService.getApproveState(request.getSession());
		switch(state)
		{
			case None:
			case Register:
				// register
				url = PropertyFactory.getSecurityProperties().getProperty(
						"member_apply_begin_url");
				break;
			case MailVerify:
				// go mail verify
				url = PropertyFactory.getSecurityProperties().getProperty(
						"member_verify_mail_url");
				break;
			case ManualVerify:
				// go applicaton result
				url = PropertyFactory.getSecurityProperties().getProperty(
						"member_apply_result_url");
				break;
		}
		// redirect to ulr according to member state
		if (url != null)
		{
			url = WebContext.fullUrl(request, url);
		}
		return url;

	}

	// add by hooxin

	/**
	 * 获取指定用户的客户
	 * 
	 * @param MemberId
	 *            用户ID
	 * @return 客户
	 * @throws Exception
	 *             业务错误
	 * @author hooxin
	 * @since 2010-11-3
	 */
	public static List<Member> getCustomers(Long memberId)throws Exception
	{
		Map<String,Object> map = new HashMap<String,Object>();

		if (memberId == null || memberId == 0)
			throw new ActionException("member is null or 0 !!");
		map.put("memberId", memberId);
		
		log.debug("getCustomers starts .......");
		try{
			List<Member> list = (List<Member>) MemberDao.getCustomer(map);
			
			log.debug("getCustomers finished .......");
			return list;
		}catch(Exception e){
			log.error("获取指定用户的客户", e);
			throw e;
		}
	}

	/**
	 * @param start
	 * @param end
	 * @param memberId
	 * @return
	 */
	public static List<Member> getCustomers(
			Integer start, Integer end, Long memberId) throws Exception
	{
		Map<String,Object> map = new HashMap<String,Object>();

		if (memberId == null || memberId == 0)
			throw new ActionException("member is null or 0 !!");
		if (start != null)
			map.put("start", start);
		if (end != null)
			map.put("end", end);
		map.put("memberId", memberId);
		
		log.debug("getCustomers starts .......");
		try{
			List<Member> list = MemberDao.getCustomer(map);
			
			log.debug("getCustomers finished .......");
			return list;
		}catch(Exception e){
			log.error("获取指定用户的客户", e);
			throw e;
		}
	}
	
	public static Integer getCustomersCount(Long memberId)throws Exception
	{
		Map<String,Object> map = new HashMap<String,Object>();

		if (memberId == null || memberId == 0)
			throw new ActionException("member is null or 0 !!");
		map.put("memberId", memberId);
		
		int count =0;
		
		log.debug("getCustomersCount starts .......");
		try{
			count = MemberDao.getCustomerCount(map);
			
			log.debug("getCustomersCount finished .......");
			return count;
		}catch(Exception e){
			log.error("获取指定用户的客户总记录数", e);
			throw e;
		}
	}

}
