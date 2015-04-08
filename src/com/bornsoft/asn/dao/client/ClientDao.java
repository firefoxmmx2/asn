package com.bornsoft.asn.dao.client;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.action.member.MemberGroup;
import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.bean.order.Order;
import com.bornsoft.asn.dao.quotation.QuotationDAO;
import com.bornsoft.asn.utils.common.sqlMapFactory;
import com.bornsoft.asn.bean.client.TraceMessage;

public class ClientDao {
	/**
	 * get member by id 
	 * @param memberId
	 * @return
	 * @throws SQLException
	 */
	public static List<Member> getClientInfo(HashMap mm) throws SQLException{
		return (List)sqlMapFactory.getSqlMap().queryForList("getClient", mm);
	}
	
	public static int getClientCount(HashMap mm) throws SQLException{
		try{
			return (Integer)sqlMapFactory.getSqlMap().queryForObject("getClientCount",mm);
		}catch (Exception e) {
			Logger log = Logger.getLogger(QuotationDAO.class);
			log.error("取供货商客户数目出错 DAO", e);
			throw new SQLException(e);
		}
	}
	
	public static List<Member> getUnGroupedMemberList(String ssoAccount,String mId) throws SQLException{
		Map<String,String> m = new HashMap<String, String>();
			m.put("BELONG_TO", mId);
		
		if(ssoAccount!=null&&ssoAccount.trim().length()>0)
		{
			m.put("ssoAccount", ssoAccount);
		}
		else
		{
			m.put("ssoAccount", "");
		}
		
		return (List<Member>)sqlMapFactory.getSqlMap().queryForList("UnGroupedMemberList", m);
	}
	
	public static void addClientServiceRecord(TraceMessage tm) throws SQLException{
		sqlMapFactory.getSqlMap().insert("addClientServiceRecord",tm);
	}
	
	//查询客户跟踪记录数
	public static int getClientServiceRecordCount(HashMap mm) throws SQLException{
		return (Integer)sqlMapFactory.getSqlMap().queryForObject("getClientServiceRecordCount",mm);
	}
	
	//查询客户跟踪记录
	public static List<TraceMessage> getClientServiceRecord(HashMap mm) throws SQLException{
		return (List<TraceMessage>)sqlMapFactory.getSqlMap().queryForList("getClientServiceRecord", mm);
	}
	
	//删除客户跟踪记录
	public static void delClientServiceRecord(String delId) throws SQLException{
		sqlMapFactory.getSqlMap().delete("delClientServiceRecord",delId);
	}
	
	//取得要修改的客户跟踪记录
	public static TraceMessage getUpClientServiceRecord(String upId) throws SQLException{
		return (TraceMessage)sqlMapFactory.getSqlMap().queryForObject("getUpClientServiceRecord",upId);
	}
	
	//修改客户跟踪记录
	public static void UpClientServiceRecord(TraceMessage tm) throws SQLException{
		sqlMapFactory.getSqlMap().update("upClientServiceRecord",tm);
	}
	
	//取得要修改的客户积分等级
	public static Long getClientGradeScore(long upId) throws SQLException{
		return (Long)sqlMapFactory.getSqlMap().queryForObject("getClientGradeScore", upId);
	}
	
	//修改科技积分等级
	public static void upGradeScore(Member mm) throws SQLException{
		sqlMapFactory.getSqlMap().update("upGradeScore",mm);
	}
	
	//取得客户消费信息
	public static List<Order> getClientConsumeInfo(HashMap mm) throws Exception{
		return (List<Order>)sqlMapFactory.getSqlMap().queryForList("getClientConsumeInfo", mm);
	}
	
	//取得客户消费信息记录数
	public static int getClientConsumeCount(long mid) throws Exception{
		return Integer.parseInt(String.valueOf(sqlMapFactory.getSqlMap().queryForObject("getClientConsumeCount", mid)));
	}
}
