/**
 * 
 */
package com.bornsoft.asn.service.supplier;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.bank.BankInfo;
import com.bornsoft.asn.bean.license.License;
import com.bornsoft.asn.bean.license.LicenseBean;
import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.bean.product.Product;
import com.bornsoft.asn.bean.supplier.Supplier;
import com.bornsoft.asn.dao.bank.BankInfoDao;
import com.bornsoft.asn.dao.license.LicenseDao;
import com.bornsoft.asn.dao.product.PT2DYDao;
import com.bornsoft.asn.dao.product.ProductCustomDao;
import com.bornsoft.asn.dao.product.ProductCustomPropertyDao;
import com.bornsoft.asn.dao.product.ProductDao;
import com.bornsoft.asn.dao.supplier.SupplierDao;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.utils.common.AsnConstLib;
import com.bornsoft.asn.utils.common.ImageSize;
import com.bornsoft.asn.utils.common.MailDaemon;
import com.bornsoft.asn.utils.common.MailService;
import com.bornsoft.asn.utils.common.PropertyFactory;
import com.bornsoft.asn.utils.common.Str;
import com.bornsoft.asn.utils.common.WebContext;
import com.bornsoft.asn.utils.common.sqlMapFactory;
import com.bornsoft.asn.utils.common.AsnConstLib.PromiseState;
import com.bornsoft.asn.utils.common.AsnConstLib.SupplierApproveState;
import com.bornsoft.sms.service.SmsService;

/**
 * Supplier Service
 * @author Ken Liu Kunyun
 * Created on Feb 25, 2010
 *
 */
public class SupplierService {
	
	public static Supplier getSupplier(long supplierId) throws SQLException{
		Supplier ret=new SupplierDao().getSupplierById(supplierId);
		return ret;
	}
	
	/**
	 * Get current supplier
	 * @return
	 * @throws SQLException
	 */
	public static Supplier getCurrentSupplier() throws SQLException{
		return getSupplier(MemberService.getMemberId());
	}

	/**
	 * get id of current supplier
	 * @return
	 */
	public static Long getSupplierId(){
		return MemberService.getMemberId();
	}
	
	public static Supplier getCurrentSupplier(HttpSession session) throws SQLException{
		return getSupplier(MemberService.getMemberId(session));
	}

	/**
	 * current user is supplier
	 * @return
	 */
	public static boolean isSupplier(HttpSession session){
		boolean ret=false;
		try {
			ret=(getCurrentSupplier(session)!=null);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ret;
	}
	
	public static boolean isSupplier(){
		boolean ret=false;
		try {
			ret=(getCurrentSupplier()!=null);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ret;
	}
	
	/*****
	 * @author cl
	 * @discription 完善供应商信息
	 * @date 2010-03-04 
	 * ***/
	public static void insertSupplierInfo(Supplier supplier,BankInfo bankinfo)throws Exception{
		
		try {
			sqlMapFactory.getSqlMap().startTransaction();
			
			SupplierDao.insertSupplierInfo(supplier);
			BankInfoDao.insertBankInfo(bankinfo);
			
			sqlMapFactory.getSqlMap().commitTransaction();
			
		}catch(Exception e){
			Logger log = Logger.getLogger("SupplierService");
			log.info("完善供应商信息  新增出错", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
		
	/*****
	 * @author cl
	 * @throws Exception 
	 * @discription 完善供应商信息
	 * @date 2010-03-05
	 * ***/
	public static void insertSupplierInfo(Supplier supplier,BankInfo bankinfo,List<LicenseBean> LBlist)throws Exception{
		int m = 0;
		try {
			sqlMapFactory.getSqlMap().startTransaction();
			
			SupplierDao.insertSupplierInfo(supplier);
			BankInfoDao.insertBankInfo(bankinfo);
			if(LBlist != null && LBlist.size() >0){
				for(LicenseBean licensebean:LBlist){
				License license = new License();
				if(licensebean != null){
					license.setTitle(licensebean.getCertName());
					license.setAuthority(licensebean.getPermitUnit());
					license.setSerial(licensebean.getCertNumber());
					
					license.setLicenseid(String.valueOf(Integer.parseInt(licensebean.getLicenseid())+m));
					license.setMemberid(String.valueOf(MemberService.getMember().getMemberId()));
					LicenseDao.insertLicense(license);
					
					if(licensebean.getCertPhoto() != null){ //上传图片
						String picName = "supplier_"+license.getLicenseid()+".jpg";
						ImageSize.uploadImage(licensebean.getCertPhoto(),picName);
					}
					m++;
				}
			}
			}
			sqlMapFactory.getSqlMap().commitTransaction();
			
		}catch(Exception e){
			Logger log = Logger.getLogger("SupplierService");
			log.info("完善供应商信息  新增出错", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	/*****
	 * @author cl
	 * @throws Exception 
	 * @discription 修改供应商信息————机构
	 * @date 2010-03-05
	 * ***/
	public static void updateSupplier(Supplier supplier,BankInfo bankinfo,List<LicenseBean> LBlist) throws Exception{
		int m = 0;
		try {
			sqlMapFactory.getSqlMap().startTransaction();
			
			SupplierDao.updateSupplier(supplier);
			BankInfoDao.updateBankinfo(bankinfo);
			if(LBlist != null && LBlist.size() >0){
				for(LicenseBean licensebean:LBlist){
					License license = new License();
					if(licensebean != null){
						license.setTitle(licensebean.getCertName());
						license.setAuthority(licensebean.getPermitUnit());
						license.setSerial(licensebean.getCertNumber());
						if(licensebean.getLicensebeanid() != null){
							license.setLicenseid(licensebean.getLicensebeanid());
							LicenseDao.updateLicense(license);
						}else{
							license.setLicenseid(String.valueOf(Integer.parseInt(licensebean.getLicenseid())+m));
							license.setMemberid(String.valueOf(MemberService.getMember().getMemberId()));
							LicenseDao.insertLicense(license);
							m++;
						}
						if(licensebean.getCertPhoto() != null){ //上传图片
							String picName = "supplier_"+license.getLicenseid()+".jpg";
							ImageSize.uploadImage(licensebean.getCertPhoto(),picName);
						}
					}
				}
			}
	
			sqlMapFactory.getSqlMap().commitTransaction();
			
		}catch(Exception e){
			Logger log = Logger.getLogger("SupplierService");
			log.info("修改供应商信息出错信息", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}	
	}
	/*****
	 * @author cl
	 * @throws Exception 
	 * @discription 修改供应商信息————个人
	 * @date 2010-03-05
	 * ***/
	public static void updateSupplier(Supplier supplier,BankInfo bankinfo) throws Exception{
		try {
			sqlMapFactory.getSqlMap().startTransaction();
			
			SupplierDao.updateSupplier(supplier);
			BankInfoDao.updateBankinfo(bankinfo);
			
			sqlMapFactory.getSqlMap().commitTransaction();
			
		}catch(Exception e){
			Logger log = Logger.getLogger("SupplierService");
			log.info("修改供应商信息出错信息", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}	
	}
	
	/*****
	 * @author cl
	 * @discription 前台 ----查询供应商信息
	 * @date 2010-03-12
	 * ***/
	public static List searchSupplier(Map map) throws SQLException{
		return SupplierDao.searchSupplier(map);
	}
	
	/*****
	 * @author cl
	 * @discription 前台 ----查询供应商信息总记录
	 * @date 2010-04-15
	 * ***/
	public static long searchSupplierCount(Map m)throws Exception{
		try {
			sqlMapFactory.getSqlMap().startTransaction();
			
			long count = SupplierDao.searchSupplierCount(m);
			
			sqlMapFactory.getSqlMap().commitTransaction();
			return count;
		} catch (Exception e) {
			Logger log = Logger.getLogger("SupplierService");
			log.info("前台查询供应商总记录出错", e);
			throw e;
		} finally {
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	/*****
	 * @author cl
	 * @discription 查询供应商列表
	 * @date 2010-03-18
	 * ***/
	public static List listSupplier(Map para) throws SQLException{
		return SupplierDao.listSupplier(para);
	}
	
	/*****
	 * @author cl
	 * @discription 审核供应商状态
	 * @date 2010-03-18
	 * ***/
	public static void checkSupplier(String supplierId,String checktype)throws SQLException{
		Supplier supplier = new Supplier();
		supplier.setSupplierId(supplierId);
		if (checktype.equals("1")) {
			supplier.setApproveState(SupplierApproveState.Completed);
		} else if (checktype.equals("2")) {
			supplier.setApproveState(SupplierApproveState.Rejected);
		}
		SupplierDao.checkSupplier(supplier);
		
		/*********************发送短信**********************/
		if (checktype.equals("1")) {
			if(AsnConstLib.smsSendSettingMap.get("checkSupplier").toString().equals("Y")){
				try{
					String strSendContent = PropertyFactory.getDefaultProperty().getProperty("asn.smsSend.checkSupplier");
					Member mb = MemberService.getMember(new Long(supplierId));
					strSendContent = Str.parseString(strSendContent, new Object[]{mb.getFullName()});
					SmsService sms = new SmsService();
					sms.sendSms(mb.getMobilePhone(), strSendContent, "N");
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		} else if (checktype.equals("2")) {
			if(AsnConstLib.smsSendSettingMap.get("checkSupplierNo").toString().equals("Y")){
				try{
					String strSendContent = PropertyFactory.getDefaultProperty().getProperty("asn.smsSend.checkSupplierNo");
					Member mb = MemberService.getMember(new Long(supplierId));
					strSendContent = Str.parseString(strSendContent, new Object[]{mb.getFullName()});
					SmsService sms = new SmsService();
					sms.sendSms(mb.getMobilePhone(), strSendContent, "N");
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		/*********************发送短信**********************/
	}
	
	
	/*****
	 * @author cl
	 * @discription 删除供应商
	 * @date 2010-03-18
	 * ***/
	public static void deleteSupplierAllinfo(long supplierid) throws Exception{
		try {
			sqlMapFactory.getSqlMap().startTransaction();
			
//			ProductPurchaseService.deleteProductPurchaseByMemberId(String.valueOf(supplierid));//删除求购信息
//			List<ProductSupply> l=ProductSupplyDao.getProductSuppluList((int)supplierid);
//			for(ProductSupply ps:l){
//				ProductCustomDao.deleteProductCustomList(ps.getProductId());
//			}
//			ProductSupplyDao.deleteProductSupplyBySupplierId((int)supplierid);//删除供应产品信息
			
			List<Product> l=ProductDao.getProductListChenL((int)supplierid);
			for(Product p:l){
				ProductCustomPropertyDao.deleteProductCustomPropertyList(p.getProductId());
				PT2DYDao.deleteList(p.getProductId());
			}
			ProductDao.deleteProductBySupplierId((int)supplierid);//删除供应信息
			
			LicenseDao.delLicenseByMemberId(supplierid); //删除证件信息
			BankInfoDao.deleteBankinfo(supplierid);      //删除银行信息
			SupplierDao.deleteSupplier(supplierid);	   //删除供应商信息
			
			sqlMapFactory.getSqlMap().commitTransaction();
		} catch (Exception e) {
			Logger log = Logger.getLogger("SupplierService");
			log.info("删除供应商所有信息出错", e);
			throw e;
		} finally {
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	/*****
	 * @author cl
	 * @discription 查询供应商总的记录
	 * @date 2010-03-26
	 * ***/
	public static long getSupplierCount(Map para) throws Exception{
		long count;
		try {
			sqlMapFactory.getSqlMap().startTransaction();
				
			count = SupplierDao.getSupplierCount(para);
			
			sqlMapFactory.getSqlMap().commitTransaction();
			
			return count;
		}catch(Exception e){
			Logger log = Logger.getLogger("SupplierService");
			log.info("查询供应商总记录数出错", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}	
	}
	
	/**
	 * @author cl
	 * @discription 企业供应商 ---查询自己担保的个人供应商
	 * @date 2010-03-26
	 * */
	public static List getVoucherByMemberId(Map para) throws Exception{
		try {
			sqlMapFactory.getSqlMap().startTransaction();
				
			List list = SupplierDao.getVoucherByMemberId(para);
			
			sqlMapFactory.getSqlMap().commitTransaction();
			
			return list;
		}catch(Exception e){
			Logger log = Logger.getLogger("SupplierService");
			log.info("查询自己担保的个人供应商出错", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	/*****
	 * @author cl
	 * @discription 查询供应商总的记录
	 * @date 2010-03-26
	 * ***/
	public static long getVoucherCount(Map para) throws Exception{
		long count;
		try {
			sqlMapFactory.getSqlMap().startTransaction();
				
			count = SupplierDao.getVoucherCount(para);
			
			sqlMapFactory.getSqlMap().commitTransaction();
			
			return count;
		}catch(Exception e){
			Logger log = Logger.getLogger("SupplierService");
			log.info("查询供应商担保总记录数出错", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}	
	}
	
	/*****
	 * @author cl
	 * @discription 修改担保状态
	 * @date 2010-03-29
	 * ***/
	public static void updateVouchState(Map m)throws Exception{
		String ISvouch = "";
		try {
			sqlMapFactory.getSqlMap().startTransaction();
				
			SupplierDao.updateVouchState(m);
			
			Member member = new Member();
			if(m.get("supplierId") != null)
			member = MemberService.getMember(new Long(m.get("supplierId").toString()));
			if(m.get("vouchState").toString().equals("Disagree")){
				ISvouch = "对不起！"+MemberService.getMember().getFullName()+" 拒绝 了作为你的担保，请尽快与该企业联系。";
			}
			if(m.get("vouchState").toString().equals("Agree")){
				ISvouch = "恭喜你！"+MemberService.getMember().getFullName()+" 同意 了作为你的担保。";
			}
			
//			/******发送邮件*****/
//			MailService ms = new MailService(MailService.PROTOCOL_IMAP, true, true);
//			ms.isDebug(true);
//			ms.setSmtphost(AsnConstLib.sysMailSmtpHost);
//			ms.connect(AsnConstLib.sysMailImapHost, AsnConstLib.sysMailUser, AsnConstLib.sysMailPassword);
//			String stemp = AsnConstLib.sysMailSupplierVoucherMsg;
//			ms.send("望龙门-农业综合服务网络平台  担保信息", member.getEmail(), null, 
//					ms.parseMsgCont(stemp, new Object[] {ISvouch,member.getFullName()}), true);
//			ms.close();
//			/******发送邮件完成*****/
			/******发送邮件*****/
			if(member.getNotifyMail().equals("1")){
				String stemp = AsnConstLib.sysMailSupplierVoucherMsg;
				MailDaemon md = new MailDaemon(MailService.PROTOCOL_IMAP, AsnConstLib.sysMailImapHost,
						AsnConstLib.sysMailSmtpHost, AsnConstLib.sysMailUser, 
						AsnConstLib.sysMailPassword, true, true);
				md.send("望龙门-农业综合服务网络平台  担保信息", member.getEmail(), null, 
						MailService.parseMsgCont(stemp, new Object[] {ISvouch,member.getFullName()}), true);
			}
			/******发送邮件完成*****/
			
			sqlMapFactory.getSqlMap().commitTransaction();
			
		}catch(Exception e){
			Logger log = Logger.getLogger("SupplierService");
			log.info("修改供应商担保状态出错", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	/**
	 * @author cl
	 * @discription 管理员 ---查询所有担保
	 * @date 2010-03-29
	 * */
	public static List getAllVoucher(Map m) throws Exception{
		try {
			sqlMapFactory.getSqlMap().startTransaction();
				
			List list = SupplierDao.getAllVoucher(m);
			
			sqlMapFactory.getSqlMap().commitTransaction();
			
			return list;
		}catch(Exception e){
			Logger log = Logger.getLogger("SupplierService");
			log.info("管理员查询所有担保人出错", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	/*****
	 * @author cl
	 * @discription 查询所有担保总的记录
	 * @date 2010-03-29
	 * ***/
	public static long getAllVoucherCount(Map m) throws Exception{
		long count;
		try {
			sqlMapFactory.getSqlMap().startTransaction();
				
			count = SupplierDao.getAllVoucherCount(m);
			
			sqlMapFactory.getSqlMap().commitTransaction();
			
			return count;
		}catch(Exception e){
			Logger log = Logger.getLogger("SupplierService");
			log.info("查询所有担保总记录数出错", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}	
	}
	
	/**
	 * 检查当前供应商状态，根据状态做一些必要的转向
	 * @param request
	 * @param response
	 */
	public static String checkState(HttpServletRequest request) throws IOException{
		// check member approve state
		String url=MemberService.checkState(request);
		if(url==null){
			// check supplier approve state
			Supplier s=null;
			try {
				s=SupplierService.getCurrentSupplier(request.getSession());
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if(s==null){
				// apply
				url=PropertyFactory.getSecurityProperties().getProperty("supplier_profile_url");
			}else{
				switch(s.getApproveState()){
				case None:
					// go apply begin
					url=PropertyFactory.getSecurityProperties().getProperty("supplier_new_url");
					break;
				case ManualVerify:
				case Rejected:
					// go apply result
					url=PropertyFactory.getSecurityProperties().getProperty("supplier_state_url");
					break;
				}
			}
		}
		// redirect to ulr according to member state
		if(url!=null){
			url=WebContext.fullUrl(request, url);
		}
		return url;
	}
	
	/*****
	 * @author cl
	 * @discription 首页显示最新供应商
	 * @date 2010-05-06
	 * ***/
	public static List newSupplier()throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startCount", 1);
		map.put("endCount", AsnConstLib.indexsupplierMax);
		return SupplierDao.searchSupplier(map);
	}
	/*****
	 * @author cl
	 * @discription 首页显示最新供应商
	 * @date 2010-05-06
	 * ***/
	public static List newSupplier(String areaCode)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startCount", 1);
		map.put("endCount", 12);
		if(areaCode != null && !areaCode.substring(2, 6).equals("0000")){
			map.put("area", areaCode);
		}
		return SupplierDao.searchSupplier(map);
	}
	
	/*****
	 * @author cl
	 * @discription 供应商诚信承诺状态
	 * @date 2010-05-11
	 * ***/
	public static void updPromiseState(String supplierId,String promisetype)throws SQLException{
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("supplierId", supplierId);
		if (promisetype.equals("1")) {
			m.put("promiseState", PromiseState.promise);
		} else if (promisetype.equals("2")) {
			m.put("promiseState", PromiseState.dispromise);
		}
		SupplierDao.updPromiseState(m);
	}
	
	/*****
	 * @author cl
	 * @discription 冻结和恢复供应商
	 * @date 2010-05-28
	 * ***/
	public static void updLockState(Map m)throws Exception{
		try {
			sqlMapFactory.getSqlMap().startTransaction();				
			SupplierDao.updLockState(m);			
			sqlMapFactory.getSqlMap().commitTransaction();		
			
			/*********************发送短信**********************/
			if(m.get("lockState").toString().equals("Locked")){
				if(AsnConstLib.smsSendSettingMap.get("supplierLock").toString().equals("Y")){
					try{
						String strSendContent = PropertyFactory.getDefaultProperty().getProperty("asn.smsSend.supplierLock");
						Member mb = MemberService.getMember(new Long(m.get("supplierId").toString()));
						strSendContent = Str.parseString(strSendContent, new Object[]{mb.getFullName()});
						SmsService sms = new SmsService();
						sms.sendSms(mb.getMobilePhone(), strSendContent, "N");
					}catch(Exception e){
						e.printStackTrace();
					}
				}
			}else if(m.get("lockState").toString().equals("Unlocked")){
				if(AsnConstLib.smsSendSettingMap.get("supplierLockNo").toString().equals("Y")){
					try{
						String strSendContent = PropertyFactory.getDefaultProperty().getProperty("asn.smsSend.supplierLockNo");
						Member mb = MemberService.getMember(new Long(m.get("supplierId").toString()));
						strSendContent = Str.parseString(strSendContent, new Object[]{mb.getFullName()});
						SmsService sms = new SmsService();
						sms.sendSms(mb.getMobilePhone(), strSendContent, "N");
					}catch(Exception e){
						e.printStackTrace();
					}
				}
			}
			/*********************发送短信**********************/
			
		}catch(Exception e){
			Logger log = Logger.getLogger("SupplierService");
			log.info("冻结和恢复供应商出错", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}	
	}
		
}
