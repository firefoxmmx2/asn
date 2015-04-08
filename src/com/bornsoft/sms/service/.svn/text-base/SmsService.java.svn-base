package com.bornsoft.sms.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.utils.common.SmsMobileType;
import com.bornsoft.asn.utils.common.sqlMapFactory;
import com.bornsoft.sms.bean.SmsReceive;
import com.bornsoft.sms.bean.SmsSend;
import com.bornsoft.sms.dao.SmsDao;

/**
 * @author liujunwei (liujunwei.cq@163.com)
 * company:重庆市博恩软件公司 
 *    duty:project manager
 *    name:刘军伟
 *    time:2010-8-30
 */
public class SmsService 
{
	/**
	 * @param mobileNo
	 * @param sendContent
	 * @param isReply
	 * @return
	 * @throws Exception
	 */
	public boolean sendSms(String mobileNo, String sendContent, String isReply) throws Exception
	{
		
		try 
		{
			sqlMapFactory.getSqlMap().startTransaction(); 
			SmsSend smsSend = new SmsSend();
			smsSend.setId(IdMakerService.newId("tbl_sms_send"));
			smsSend.setIsReply(isReply);
			smsSend.setMobileNo(mobileNo);
			smsSend.setSendContent(sendContent);
			smsSend.setExtNumber(IdMakerService.newId("sms_ext_number"));
			smsSend.setMobileType(SmsMobileType.getMobileType(mobileNo));
			smsSend.setSendType("N");
			
			//将短信存入待发送表
			SmsDao.insert(smsSend);
			
			sqlMapFactory.getSqlMap().commitTransaction();
		}
		catch (Exception e) {
            Logger log = Logger.getLogger(SmsDao.class);
            log.error("短信信息 插入出错 service", e);
            throw e;
		}finally{
        	try {
				sqlMapFactory.getSqlMap().endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
        }
		
		return true;
	}
	

	public boolean receiveSms(String mobileNo, String replyContent, String extNumber) throws Exception
	{
		boolean isExecute = true;
		if(extNumber==null || extNumber.trim().length()<=0 || Long.parseLong(extNumber)<=0)
			isExecute = false;
		if(mobileNo==null || mobileNo.trim().length()<=0)
			isExecute = false;
		if(!isExecute)
			return false;
		
		try 
		{
			sqlMapFactory.getSqlMap().startTransaction(); 

			SmsReceive smsRec = new SmsReceive();
			smsRec.setId(IdMakerService.newId("tbl_sms_receive"));

			smsRec.setMobileNo(mobileNo);
			smsRec.setReplyContent(replyContent);
			smsRec.setExtNumber(new Long(extNumber));
			
			//将短信存入待发送表
			SmsDao.insertReceiveSms(smsRec);
			
			sqlMapFactory.getSqlMap().commitTransaction();
		}
		catch (Exception e) {
            Logger log = Logger.getLogger(SmsDao.class);
            log.error("上行短信信息 插入出错 service", e);
            throw e;
		}finally{
        	try {
				sqlMapFactory.getSqlMap().endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
        }
		
		return true;
	}
	
	public static void sendSms(SmsSend smsSend,String mobileNo) throws Exception
	{
		
		try 
		{
			sqlMapFactory.getSqlMap().startTransaction(); 
			smsSend.setId(IdMakerService.newId("tbl_sms_send"));			
			smsSend.setExtNumber(IdMakerService.newId("sms_ext_number"));	
			smsSend.setMobileNo(mobileNo);
			
			//将短信存入待发送表
			SmsDao.insert(smsSend);
			
			sqlMapFactory.getSqlMap().commitTransaction();
		}
		catch (Exception e) {
            Logger log = Logger.getLogger(SmsDao.class);
            log.error("短信信息 插入出错 service", e);
            throw e;
		}finally{
        	try {
				sqlMapFactory.getSqlMap().endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
        }
		
	}
	
	
	public static List<Member> getAllMember(Map m) throws Exception {
		try {
			sqlMapFactory.getSqlMap().startTransaction();

			List<Member> list = SmsDao.getAllMember(m);

			sqlMapFactory.getSqlMap().commitTransaction();
			return list;
		} catch (Exception e) {
			Logger log = Logger.getLogger(SmsDao.class);
			log.error("查询所有有手机号码的用户 service", e);
			throw e;
		} finally {
			try {
				sqlMapFactory.getSqlMap().endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static Integer getAllCountMember(Map m) throws Exception {
		int count;
		try {
			sqlMapFactory.getSqlMap().startTransaction();

			count = SmsDao.getAllCountMember(m);

			sqlMapFactory.getSqlMap().commitTransaction();
			return count;
		} catch (Exception e) {
			Logger log = Logger.getLogger(SmsDao.class);
			log.error("查询所有有手机号码的用户 service", e);
			throw e;
		} finally {
			try {
				sqlMapFactory.getSqlMap().endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}
	
	public static Integer getSmsSendCount(Map m) throws Exception {
		int count;
		try {
			sqlMapFactory.getSqlMap().startTransaction();
			count = SmsDao.getSmsSendCount(m);
			sqlMapFactory.getSqlMap().commitTransaction();
			return count;
		} catch (Exception e) {
			Logger log = Logger.getLogger(SmsDao.class);
			log.error("查询所有发送信息总数", e);
			throw e;
		} finally {
			try {
				sqlMapFactory.getSqlMap().endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}
	
	public static List<SmsSend> listSmsSend(Map m) throws Exception {
		try {
			sqlMapFactory.getSqlMap().startTransaction();
			List<SmsSend> list = SmsDao.listSmsSend(m);
			sqlMapFactory.getSqlMap().commitTransaction();
			return list;
		} catch (Exception e) {
			Logger log = Logger.getLogger(SmsDao.class);
			log.error("查询所有已发信息 ", e);
			throw e;
		} finally {
			try {
				sqlMapFactory.getSqlMap().endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}
	
	public static Integer getSmsDraftCount(Map m) throws Exception {
		int count;
		try {
			sqlMapFactory.getSqlMap().startTransaction();
			count = SmsDao.getSmsDraftCount(m);
			sqlMapFactory.getSqlMap().commitTransaction();
			return count;
		} catch (Exception e) {
			Logger log = Logger.getLogger(SmsDao.class);
			log.error("查询所有发送信息总数", e);
			throw e;
		} finally {
			try {
				sqlMapFactory.getSqlMap().endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}
	
	public static List<SmsSend> listSmsDraft(Map m) throws Exception {
		try {
			sqlMapFactory.getSqlMap().startTransaction();
			List<SmsSend> list = SmsDao.listSmsDraft(m);
			sqlMapFactory.getSqlMap().commitTransaction();
			return list;
		} catch (Exception e) {
			Logger log = Logger.getLogger(SmsDao.class);
			log.error("查询所有已发信息 ", e);
			throw e;
		} finally {
			try {
				sqlMapFactory.getSqlMap().endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	 public static SmsSend getSmsById(Long smsId)throws Exception{
		 try {
				sqlMapFactory.getSqlMap().startTransaction();
				SmsSend smsSend = SmsDao.getSmsById(smsId);
				sqlMapFactory.getSqlMap().commitTransaction();
				return smsSend;
			} catch (Exception e) {
				Logger log = Logger.getLogger(SmsDao.class);
				log.error("查询信息根据 ", e);
				throw e;
			} finally {
				try {
					sqlMapFactory.getSqlMap().endTransaction();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	 }
	 
	 public static void delDraftSms(Long id)throws Exception{
		 try {
				sqlMapFactory.getSqlMap().startTransaction();
				SmsDao.delDraftSms(id);
				sqlMapFactory.getSqlMap().commitTransaction();
			} catch (Exception e) {
				Logger log = Logger.getLogger(SmsDao.class);
				log.error("删除草稿箱信息错误 ", e);
				throw e;
			} finally {
				try {
					sqlMapFactory.getSqlMap().endTransaction();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	    }
}
