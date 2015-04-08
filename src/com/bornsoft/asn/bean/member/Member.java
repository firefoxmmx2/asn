/**
 * 
 */
package com.bornsoft.asn.bean.member;

import java.sql.Date;
import java.sql.Timestamp;

import com.bornsoft.asn.utils.common.AsnConstLib.MemberApproveState;
import com.bornsoft.asn.utils.common.AsnConstLib.MemberLockState;

/**
 * Member -会员
 * 
 * @author Ken Liu Kunyun
 * 
 */
public class Member {
	private Long memberId; // 会员id
	private Byte memberType; // 会员类型:机构/个人
	private String certType; // 有效证件类型
	private String certId; // 证件编号
	private String fullName; // 全称
	private String shortName; // 简称
	private String area; // 所属地区
	private String email; // 商务邮箱
	private String fixedPhone; // 固定电话
	private String mobilePhone; // 移动电话
	private String zip; // 邮政编码
	private String address; // 通信地址
	private String contactor; // 联系人
	private MemberApproveState approveState; // 审核状态
	private MemberLockState lockState; // 锁定状态
	private Timestamp registerTime;  // 注册时间
	private Timestamp lastLoginTime;  // 最后登录时间
	private String lastLoginIp;  // 最后登录IP
	private String checkcode; //验证码  cl add 20100301
	private String ssoAccount;  // 单点登录系统中的账号
	private String mailVerifyCode; //邮件验证 编
	private String qq; 
	private Long gradeScore; //等级积分
	
	private String ssoType; //用户注册类型 Y-自动 N -页面注册
	
	

	private String notifyMail= "0"; //2010-04-21 add cl 邮箱验证信息
	private String notifySms = "0";  //2010-04-21 add cl 手机验证信息

	
	
	public String getSsoType() {
		return ssoType;
	}

	public void setSsoType(String ssoType) {
		this.ssoType = ssoType;
	}

	public String getNotifyMail() {
		return notifyMail;
	}

	public Long getGradeScore() {
		return gradeScore;
	}

	public void setGradeScore(Long gradeScore) {
		this.gradeScore = gradeScore;
	}
	
	public void setNotifyMail(String notifyMail) {
		this.notifyMail = notifyMail;
	}

	public String getNotifySms() {
		return notifySms;
	}

	public void setNotifySms(String notifySms) {
		this.notifySms = notifySms;
	}

	public String getMailVerifyCode() {
		return mailVerifyCode;
	}

	public void setMailVerifyCode(String mailVerifyCode) {
		this.mailVerifyCode = mailVerifyCode;
	}

	public String getCheckcode() {
		return checkcode;
	}

	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}



	public String getLastLoginIp() {
		return lastLoginIp;
	}

	public void setLastLoginIp(String lastLoginIp) {
		this.lastLoginIp = lastLoginIp;
	}

	public Long getMemberId() {
		return memberId;
	}

	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}

	public Byte getMemberType() {
		return memberType;
	}

	public void setMemberType(Byte memberType) {
		this.memberType = memberType;
	}

	public String getCertType() {
		return certType;
	}

	public void setCertType(String certType) {
		this.certType = certType;
	}

	public String getCertId() {
		return certId;
	}

	public void setCertId(String certId) {
		this.certId = certId;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getShortName() {
		return shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFixedPhone() {
		return fixedPhone;
	}

	public void setFixedPhone(String fixedPhone) {
		this.fixedPhone = fixedPhone;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContactor() {
		return contactor;
	}

	public void setContactor(String contactor) {
		this.contactor = contactor;
	}

	public String getSsoAccount() {
		return ssoAccount;
	}

	public void setSsoAccount(String ssoAccount) {
		this.ssoAccount = ssoAccount;
	}

	public MemberApproveState getApproveState() {
		return approveState;
	}

	public void setApproveState(MemberApproveState approveState) {
		this.approveState = approveState;
	}

	public MemberLockState getLockState() {
		return lockState;
	}

	public void setLockState(MemberLockState lockState) {
		this.lockState = lockState;
	}

	public Timestamp getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Timestamp registerTime) {
		this.registerTime = registerTime;
	}

	public Timestamp getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Timestamp lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	
	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

}
