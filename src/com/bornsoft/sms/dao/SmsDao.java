package com.bornsoft.sms.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.bean.quotation.QuotationProduct;
import com.bornsoft.asn.dao.quotation.QuotationProductDAO;
import com.bornsoft.asn.utils.common.sqlMapFactory;
import com.bornsoft.sms.bean.SmsReceive;
import com.bornsoft.sms.bean.SmsSend;

/**
 * @author liujunwei (liujunwei.cq@163.com)
 * company:重庆市博恩软件公司 
 *    duty:project manager
 *    name:刘军伟
 *    time:2010-8-30
 */
public class SmsDao 
{

    /**
     * @param smsSend
     * @throws Exception
     */
    public static void insert(SmsSend smsSend) throws Exception {
        try{
            sqlMapFactory.getSqlMap().insert("addSmsSend", smsSend);
        }catch(Exception e){
            Logger log = Logger.getLogger(SmsDao.class);
            log.error("下行短信信息 插入出错 DAO", e);
            throw e;
        }
    }

    public static void insertReceiveSms(SmsReceive smsReceive) throws Exception {
        try{
            sqlMapFactory.getSqlMap().insert("addSmsReceive", smsReceive);
        }catch(Exception e){
            Logger log = Logger.getLogger(SmsDao.class);
            log.error("上行短信信息 插入出错 DAO", e);
            throw e;
        }
    }
    
    public static List<Member> getAllMember(Map m) throws Exception{
    	 try{
    		 return (List<Member>)sqlMapFactory.getSqlMap().queryForList("getAllMember-sms",m);
		    }catch(Exception e){
		        Logger log = Logger.getLogger(SmsDao.class);
		        log.error("查询所有记录 DAO", e);
		        throw e;
		    }
    }
    
    public static Integer getAllCountMember(Map m) throws Exception{
   	 try{
   		 return (Integer)sqlMapFactory.getSqlMap().queryForObject("getAllCountMember-sms",m);
		    }catch(Exception e){
		        Logger log = Logger.getLogger(SmsDao.class);
		        log.error("查询所有总记录 DAO", e);
		        throw e;
		    }
   }
    
    public static Integer getSmsSendCount(Map m)throws SQLException{
    	
    	return (Integer)sqlMapFactory.getSqlMap().queryForObject("getSmsSendCount", m);
    }
    
    public static List<SmsSend> listSmsSend(Map m)throws SQLException{
    	return (List<SmsSend>) sqlMapFactory.getSqlMap().queryForList("getSmsSend", m);
    }
    
    public static Integer getSmsDraftCount(Map m)throws SQLException{
    	
    	return (Integer)sqlMapFactory.getSqlMap().queryForObject("getSmsDraftCount", m);
    }
    
    public static List<SmsSend> listSmsDraft(Map m)throws SQLException{
    	return (List<SmsSend>) sqlMapFactory.getSqlMap().queryForList("getSmsDraft", m);
    }
    
    public static SmsSend getSmsById(Long smsId)throws SQLException{
    	
    	return (SmsSend)sqlMapFactory.getSqlMap().queryForObject("getSmsById", smsId);
    }
    
    public static void delDraftSms(Long id)throws SQLException{
    	sqlMapFactory.getSqlMap().delete("deleteDraftSms", id);
    }
}
