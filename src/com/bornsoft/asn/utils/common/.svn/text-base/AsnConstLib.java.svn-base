package com.bornsoft.asn.utils.common;

import java.util.HashMap;
import java.util.Map;

public class AsnConstLib {
	//客戶服務排程 自增長id類型
	public static final String CRM_SERVICE_PLAN_ID_TYPE = "tbl_service_plan";
	public static String quoInfoIdType;
	public static String quoStatIdType;
	// +++ 产品类型ID类别
	public static String ptIdType;
	// ---end
	// ID生成器，市场ID
	public static  String marketIdType;
	//ID生成器类型，行情产品ID
	public static String quoPdtIdType;
	//ID生成器类型，行情产品类型ID
	public static String quoPTIdType;
	
	
	/************支付宝常量************/
	public static String partner	  = "2088501631653839"; //支付宝合作伙伴id (账户内提取)
	public static String alipay_key    = "n7p4ni8pgck3s06grshrhltfo32ojq2x"; //支付宝安全校验码(账户内提取)
	public static String seller_email = "ecd@cqapg.com";		 //卖家支付宝帐户
	
	
	/************支付宝常量************/
	
	public static String[] HOME_PT= new String[] {
		"0002","0003","0004","0005","0006","0007","0008","0010"
	};
	
	public static String[] ZYS_PT = new String[]{
		"0001"
	};
	
	public static String[] NZ_PT = new String[] {
		"0002"
	};
	public static String[] YHBZ_PT = new String[] {
		"0006"
	};
	public static String[] ZSZY_PT = new String[] {
		"0005"
	};
	public static enum MemberApproveState { // 会员审核状态
		None, // 未知
		Register, // 注册
		MailVerify, // 邮件验证
		ManualVerify, // 人工审核
		Rejected, // 已被拒绝
		Completed
		// 已经完成
	}

	public static enum MemberLockState { // 会员锁定状态
		None, // 未知
		Locked, // 已锁定
		Unlocked
		// 未锁定
	}

	public static enum SupplierApproveState { // 供应商审核状态
		None, // 未知
		ManualVerify, // 人工审核
		Rejected, // 已被拒绝
		Completed
		// 已经完成
	}

	public static enum SupplierLockState { // 会员锁定状态
		None, // 未知
		Locked, // 已锁定
		Unlocked
		// 未锁定
	}

	public static enum VouchState { // 担保状态
		None, // 未知
		Agree, // 同意担保
		Disagree
		// 不同意担保
	}

	public static enum AdminRoles { // 管理员角色
		AsnSystemAdmin, // 系统管理员
		AsnMemberAdmin, // 会员管理员
		AsnSupplierAdmin, // 供应商管理员
		AsnQuotationAdmin
		// 行情管理员
	}

	public static enum MessageType { // 信息类型
		Normal, // 普通信息
		Warn, // 警告
		Error
		// 错误
	}

	public static enum SupplierRunState { // 供应商经营状态
		Opening, // 正在营业
		Suspend, // 暂停营业
		Closed
		// 清算退出
	}
	
	public static enum advertStatus{ //广告状态，
		N, //N－未发布；
		P, //P－发布；
		C, //C－撤销；
		S  //S－正常关闭
	}
	public static enum advertHandleStatus{//办理状态，N－未申请；A－申请中；P－申请成功；S－已签订合同
		N,	//N－未申请
		A,	//A－申请中	
		P,	//P－申请成功
		S	//S－已签订合同
	}
	
	public static enum proposerAdvertHandleStatus{//A－申请中；P－审核通过；S－已签合同；U－审核未过
		A,	//A－申请中	
		P,	//P－申请成功
		S,	//S－已签订合同
		U,	//U－申请失败
		C   //撤销申请
	}

	public static enum PromiseState { // 诚信保障状态
		None, promise, dispromise
	}

	public static final int Censor_DefaultPass = 1; // 审查状态-通过-默认通过
	public static final int Censor_ManualPass = 2; // 审查状态-通过 -人工通过
	public static final int Censor_Pending = 3; // 审查状态 -待查-限时审查
	public static final int Censor_BlackWord = 11; // 审查状态 -待查-包含禁用词
	public static final int Censor_Others = 19; // 审查状态 -待查-有其他可疑问题
	public static final int Censor_Block_BlackWord = 21; // 审查状态 -屏蔽-禁用词
	public static final int Censor_Block_Others = 29; // 审查状态 -屏蔽-其他问题

	// ++++++ 邮件服务 by HX
	// 系统邮件服务用户
	public static String sysMailUser = null;
	// 系统邮件服务密码
	public static String sysMailPassword = null;
	// 系统邮件服务imap服务主机
	public static String sysMailImapHost = null;
	// 系统邮件服务smtp服务主机
	public static String sysMailSmtpHost = null;
	// 系统邮件服务pop服务主机
	public static String sysMailPopHost = null;
	// 系统邮件注册MSG模板
	public static String sysMailMemberRegisterMsg = null;
	// 担保人信息
	public static String sysMailSupplierVoucherMsg = null;
	//
	// 产品导航
	public static String NavigatorLevel0 = "0",NavigatorLevel0_only1="0_only1", NavigatorLevel1 = "1",
			NavigatorLevel2 = "2", NavigatorLevel3 = "3",
			NavigatorFacades = "f";
	// ------

	// 地区表维护
	public static String geoLocUrl;
	// 供求类型ID类型
	public static String psTypeIdType;

	// 首页供应商最大显示个数
	public static String indexsupplierMax;

	// 订单状态
	// 交易成功
	public static String ORDER_STATUS_SUCCESS = "JYC";
	// 已付款
	public static String ORDER_STATUS_PAYED = "YFK";
	// 未付款
	public static String ORDER_STATUS_PAY = "WFK";
	// 已取消
	public static String ORDER_STATUS_CANCLED = "YQX";
	
	// 短信状态
	public static String strSmsSendSetting;
	public static Map<String,Object> smsSendSettingMap = new HashMap<String,Object>();
	

	static {
		quoInfoIdType = PropertyFactory.getDefaultProperty().getProperty(
				"asn.quotation.idType.quoInfoType");
		quoStatIdType = PropertyFactory.getDefaultProperty().getProperty(
				"asn.quotation.idType.quoStatType");
		// +++++++++ 邮件服务 by HX
		sysMailImapHost = PropertyFactory.getDefaultProperty().getProperty(
				"asn.utils.mail.imap_host");
		sysMailSmtpHost = PropertyFactory.getDefaultProperty().getProperty(
				"asn.utils.mail.smtp_host");
		sysMailPopHost = PropertyFactory.getDefaultProperty().getProperty(
				"asn.utils.mail.pop_host");
		sysMailUser = PropertyFactory.getDefaultProperty().getProperty(
				"asn.utils.mail.user");
		sysMailPassword = PropertyFactory.getDefaultProperty().getProperty(
				"asn.utils.mail.pword");
		sysMailMemberRegisterMsg = PropertyFactory.getDefaultProperty()
				.getProperty("asn.utils.mail.register_msg");
		sysMailSupplierVoucherMsg = PropertyFactory.getDefaultProperty()
				.getProperty("asn.utils.mail.voucher_msg");
		// ---------
		// +++ 产品分类ID类别 by hooxin -- 10.3.29
		ptIdType = PropertyFactory.getDefaultProperty().getProperty(
				"asn.productType.idType.productType");
		// ---end
		// +++ 地区表地址 by hooxin
		geoLocUrl = PropertyFactory.getDefaultProperty().getProperty(
				"asn.utils.common.geoLocUrl");
		// ---end

		// +++ 供求类型ID类型 by hooxin
		psTypeIdType = PropertyFactory.getDefaultProperty().getProperty(
				"asn.purchase-supplier-manage.idType.psType");
		// ---end

		indexsupplierMax = PropertyFactory.getDefaultProperty().getProperty(
				"new.supplier.list.max");

		marketIdType = PropertyFactory.getDefaultProperty().getProperty(
				"asn.quotation.idType.marketCode");
		
		quoPdtIdType = PropertyFactory.getDefaultProperty().getProperty("asn.quotation.idType.quoPdtCode");
		
		quoPTIdType = PropertyFactory.getDefaultProperty().getProperty("asn.quotation.idType.quoPTCode");
		
		
		strSmsSendSetting = PropertyFactory.getDefaultProperty().getProperty("asn.smsSend.rule");		
		if(strSmsSendSetting != null){
			String[] arraySmsSemd = strSmsSendSetting.split("#");
			for(int i=0;i < arraySmsSemd.length; i++){
				String[] arrayValue = arraySmsSemd[i].split(",");
				smsSendSettingMap.put(arrayValue[0], arrayValue[1]);
			}
		}
	}
	
	
	public static Map<String,String> recruitmentStatusMap=new HashMap<String,String>();	
	static{
		recruitmentStatusMap.put("0","已删除");//已删除
		recruitmentStatusMap.put("1","招聘中");//招聘中
		recruitmentStatusMap.put("2","已取消发布");//已取消发布
		recruitmentStatusMap.put("3","草稿");//草稿
	}
	
	public static Map<String,String> recruitmentWorkYearsMap=new HashMap<String,String>();
	static{
		recruitmentWorkYearsMap.put("0", "不限");
		recruitmentWorkYearsMap.put("1", "在读学生，应届毕业生");
		recruitmentWorkYearsMap.put("2", "1年以上");
		recruitmentWorkYearsMap.put("3", "2年以上");
		recruitmentWorkYearsMap.put("4", "3年以上");
		recruitmentWorkYearsMap.put("5", "4年以上");
		recruitmentWorkYearsMap.put("6", "5年以上");
		recruitmentWorkYearsMap.put("7", "10年以上");
	}
	
	public static Map<String,String> recruitmentEduRecordMap=new HashMap<String,String>();
	static{
		recruitmentEduRecordMap.put("0", "不限");
		recruitmentEduRecordMap.put("cz", "初中");
		recruitmentEduRecordMap.put("gz", "高中/中专");
		recruitmentEduRecordMap.put("dz", "大专");
		recruitmentEduRecordMap.put("bk", "本科");
		recruitmentEduRecordMap.put("ss", "硕士");
		recruitmentEduRecordMap.put("bs", "博士");
	}
	
	public static Map<String,String> recruitmentWorkTypeMap=new HashMap<String,String>();
	static{
		recruitmentWorkTypeMap.put("0", "全职");
		recruitmentWorkTypeMap.put("1", "兼职");
		recruitmentWorkTypeMap.put("2", "实习");
		recruitmentWorkTypeMap.put("3", "全/兼职");
	}
	
	public static Map<String,String> recruitmentTreatmentMap=new HashMap<String,String>();
	static{
		recruitmentTreatmentMap.put("0", "面议");
		recruitmentTreatmentMap.put("1", "1500以下");
		recruitmentTreatmentMap.put("2", "1500-1999");
		recruitmentTreatmentMap.put("3", "2000-2999");
		recruitmentTreatmentMap.put("4", "3000-3999");
		recruitmentTreatmentMap.put("5", "4000-4999");
		recruitmentTreatmentMap.put("6", "5000-5999");
		recruitmentTreatmentMap.put("7", "6000-6999");
		recruitmentTreatmentMap.put("8", "7000-7999");
		recruitmentTreatmentMap.put("9", "8000-8999");
		recruitmentTreatmentMap.put("10", "9000-9999");
		recruitmentTreatmentMap.put("11", "1万以上");
	}
	
	public static Map<String,String> employeeSexMap=new HashMap<String,String>();
	static{
		employeeSexMap.put("1", "男");
		employeeSexMap.put("0", "女");
	}
	
	public static Map<String,String> employeeCertTypeMap=new HashMap<String,String>();
	static{
		employeeCertTypeMap.put("0", "其它");
		employeeCertTypeMap.put("1", "身份证");
		employeeCertTypeMap.put("2", "护照");
		employeeCertTypeMap.put("3", "军人证");
		employeeCertTypeMap.put("4", "香港身份证");
	}
	
	public static Map<Boolean,String> employeeOverSeaMap=new HashMap<Boolean,String>();
	static{
		employeeOverSeaMap.put(true, "有");
		employeeOverSeaMap.put(false, "无");
	}
	
	public static Map<String,String> employeeBusinessNatureMap=new HashMap<String,String>();
	static{
		employeeBusinessNatureMap.put("0", "其它性质");
		employeeBusinessNatureMap.put("1", "外资");
		employeeBusinessNatureMap.put("2", "合资");
		employeeBusinessNatureMap.put("3", "国企");
		employeeBusinessNatureMap.put("4", "民营公司");
		employeeBusinessNatureMap.put("5", "外企代表处");
		employeeBusinessNatureMap.put("6", "政府机关");
		employeeBusinessNatureMap.put("7", "事业单位");
		employeeBusinessNatureMap.put("8", "非盈利机关");
	}
	
	public static Map<String,String> employeeCompanySizeMap=new HashMap<String,String>();
	static{
		employeeCompanySizeMap.put("1", "少于50人");
		employeeCompanySizeMap.put("2", "51-150人");
		employeeCompanySizeMap.put("3", "151-500");
		employeeCompanySizeMap.put("4", "500以上");
	}
	
	public static Map<String,String> employeeJobNatureMap=new HashMap<String,String>();
	static{
		employeeJobNatureMap.put("0", "全职");
		employeeJobNatureMap.put("1", "兼职");
		employeeJobNatureMap.put("2", "实习");
		employeeJobNatureMap.put("3", "全/兼职");
	}
	
	
	public static Map<String,String> employeeDutyTimeMap=new HashMap<String,String>();
	static{
		employeeDutyTimeMap.put("0", "待定");
		employeeDutyTimeMap.put("1", "即时");
		employeeDutyTimeMap.put("2", "1周内");
		employeeDutyTimeMap.put("3", "1个月内");
		employeeDutyTimeMap.put("4", "1至3个月内");
		employeeDutyTimeMap.put("5", "3个月后");
	}
	
	public static Map<String,String> storageBillTypeMap=new HashMap<String,String>();
	static{
		storageBillTypeMap.put("I", "入库");
		storageBillTypeMap.put("O", "订单出库");
		storageBillTypeMap.put("S", "手工出库");
		storageBillTypeMap.put("U", "修改产品");
	}
}
