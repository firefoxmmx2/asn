package com.bornsoft.asn.service.client;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.action.member.MemberGroup;
import com.bornsoft.asn.bean.advert.Advert;
import com.bornsoft.asn.bean.client.TraceMessage;
import com.bornsoft.asn.dao.advert.AdvertDao;
import com.bornsoft.asn.dao.client.ClientDao;
import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.bean.order.Order;
import com.bornsoft.asn.dao.member.MemberGroupDao;
import com.bornsoft.asn.service.channel.NcpService;
import com.bornsoft.asn.service.quotation.QuotationService;
import com.bornsoft.asn.utils.common.sqlMapFactory;



public class ClientService {
	public static final Logger log = Logger.getLogger(ClientService.class);
	/**
	 * @author cz 
	 * @description 查询该供货商的客户资料
	 * @date 2010-03-09
	 * */
	public static List<Member> getClientInfo(HashMap mm) throws Exception{		
		log.debug("getClientInfo starts ...");
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			List<Member> list = ClientDao.getClientInfo(mm);
			sqlMapFactory.getSqlMap().commitTransaction();
			
			log.debug("getClientInfo finished ...");
			return list;
		}catch(Exception e){
			log.error("查询该供货商的客户资料 error", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	/**
	 * 得到该供货商的客户记录数
	*/
	public static int getClientCount(HashMap mm) throws Exception{		
		int count = 0;
		log.debug("getClientCount starts ...");
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			count = ClientDao.getClientCount(mm);
			sqlMapFactory.getSqlMap().commitTransaction();
			
			log.debug("getClientCount finished ...");
			return count;
		}catch(Exception e){
			log.error("得到行情信息记录数 SERVICE", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	/**
	 * @param startCount
	 * @param endCount
	 * @param groupId
	 * @return
	 * @throws Exception
	 */
	public static List<Member> getUnGroupedMemberList(String ssoAccount,String mId) throws Exception{
		log.debug("getUnGroupedMemberList starts ...");
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			List<Member> list = ClientDao.getUnGroupedMemberList(ssoAccount,mId);
			sqlMapFactory.getSqlMap().commitTransaction();
			
			log.debug("getUnGroupedMemberList finished ...");
			return list;
		}catch(Exception e){
			log.error("error", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
		
	}
	
	//查询客户跟踪记录数
	public static int getClientServiceRecordCount(HashMap mm) throws Exception{
		return ClientDao.getClientServiceRecordCount(mm);
	}
	
	//查询客户跟踪记录
	public static List<TraceMessage> getClientServiceRecord(HashMap mm) throws Exception{
		return ClientDao.getClientServiceRecord(mm);
	}
	
	//删除客户跟踪记录
	public static void delClientServiceRecord(String delId) throws Exception{
		try {
			ClientDao.delClientServiceRecord(delId);
		}catch (Exception e) {
			Logger log = Logger.getLogger(QuotationService.class);
			log.error("删除客户跟踪记录， 出错 SERVICE", e);
			throw e;
		} 
	}
	
	//插入客户跟踪记录
	public static void addClientServiceRecord(TraceMessage tm) throws Exception{
		ClientDao.addClientServiceRecord(tm);
	}
	
	//取得要修改的客户跟踪记录
	public static TraceMessage getUpClientServiceRecord(String upId) throws Exception{
		return ClientDao.getUpClientServiceRecord(upId);
	}
	
	//修改客户跟踪记录
	public static void UpClientServiceRecord(TraceMessage tm) throws Exception{
		ClientDao.UpClientServiceRecord(tm);
	}
	
	//取得客户积分等级
	public static long getClientGradeScore(long upId) throws Exception{
		return ClientDao.getClientGradeScore(upId);
	}
	
	//修改客户积分等级
	public static void upGradeScore(Member mm) throws Exception{
		ClientDao.upGradeScore(mm);
	}
	
	//取得客户消费信息
	public static List<Order> getClientConsumeInfo(HashMap mm) throws Exception{
		return ClientDao.getClientConsumeInfo(mm);
	}
	
	//取得客户消费信息记录数
	public static int getClientConsumeCount(long mid) throws Exception{
		return ClientDao.getClientConsumeCount(mid);
	}
}
