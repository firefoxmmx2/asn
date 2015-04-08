package com.bornsoft.asn.dao.report;

import java.util.HashMap;
import java.util.Map;

import com.bornsoft.asn.utils.common.sqlMapFactory;

public class ReportDetailDao {
	
	//取得订单详情
//	public static Map getReportDetail(Map mm) throws Exception{
//		return sqlMapFactory.getSqlMap().queryForMap("getOrderDetail", mm, null);		
//	}
	
	//取得到账金额
	public static Float getInAccountSumMoney(HashMap mm) throws Exception{
		return (Float)sqlMapFactory.getSqlMap().queryForObject("getInAccountSumMoney",mm);
	}
	
	//已支出金额
	public static Float getOutAccountSumMoney(HashMap mm) throws Exception{
		return (Float)sqlMapFactory.getSqlMap().queryForObject("getOutAccountSumMoney",mm);
	}
	
	//应支出金额
	public static Float getUnOutAccountMoney(Map mm) throws Exception{
		return (Float)sqlMapFactory.getSqlMap().queryForObject("getUnOutAccountMoney",mm);	
	}
	
	//佣金
	public static Float getCommision(Map mm) throws Exception{
		return (Float)sqlMapFactory.getSqlMap().queryForObject("getCommision",mm);	
	}
	
	//未付款订单数
	public static int getUnPayedOrders(Map mm) throws Exception{
		return (Integer)sqlMapFactory.getSqlMap().queryForObject("getUnPayedOrders",mm);	
	}
	
	//已付款订单数
	public static int getPayedOrders(Map mm) throws Exception{
		return (Integer)sqlMapFactory.getSqlMap().queryForObject("getPayedOrders",mm);	
	}
	
	//已发货订单数
	public static int getYfhOrders(Map mm) throws Exception{
		return (Integer)sqlMapFactory.getSqlMap().queryForObject("getYfhOrders",mm);	
	}
	
	//已取消订单数
	public static int getYqxOrders(Map mm) throws Exception{
		return (Integer)sqlMapFactory.getSqlMap().queryForObject("getYqxOrders",mm);	
	}
	
	//交易关闭订单数
	public static int getYgbOrders(Map mm) throws Exception{
		return (Integer)sqlMapFactory.getSqlMap().queryForObject("getYgbOrders",mm);	
	}
	
	//交易成功订单数
	public static int getJycOrders(Map mm) throws Exception{
		return (Integer)sqlMapFactory.getSqlMap().queryForObject("getJycOrders",mm);	
	}
	
	//即时订单数
	public static int getImmediatelyOrders(Map mm) throws Exception{
		return (Integer)sqlMapFactory.getSqlMap().queryForObject("getImmediatelyOrders",mm);	
	}
	
	//担保订单数
	public static int getAssureOrders(Map mm) throws Exception{
		return (Integer)sqlMapFactory.getSqlMap().queryForObject("getAssureOrders",mm);	
	}
	
	//已划账担保订单数
	public static int getPayedAssureOrders(Map mm) throws Exception{
		return (Integer)sqlMapFactory.getSqlMap().queryForObject("getPayedAssureOrders",mm);	
	}
	
	//未划账担保订单数
	public static int getUnPayedAssureOrders(Map mm) throws Exception{
		return (Integer)sqlMapFactory.getSqlMap().queryForObject("getUnPayedAssureOrders",mm);
	}
}
