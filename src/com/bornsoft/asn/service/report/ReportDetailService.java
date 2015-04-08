package com.bornsoft.asn.service.report;

import java.util.HashMap;
import java.util.Map;

import com.bornsoft.asn.dao.report.ReportDetailDao;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class ReportDetailService {
	
//	
//	//取得订单详情
//	public static Map getReportDetail(HashMap mm) throws Exception{
//		return ReportDetailDao.getReportDetail(mm);
//	}
	
	//取得已到账金额
	public static Float getInAccountSumMoney(HashMap mm) throws Exception{
		return ReportDetailDao.getInAccountSumMoney(mm);
	}
	
	//已支出金额
	public static Float getOutAccountSumMoney(HashMap mm) throws Exception{
		return ReportDetailDao.getOutAccountSumMoney(mm);
	}
	
	//应支出金额
	public static Float getUnOutAccountMoney(HashMap mm) throws Exception{
		return ReportDetailDao.getUnOutAccountMoney(mm);
	}
	
	//佣金
	public static Float getCommision(Map mm) throws Exception{
		return ReportDetailDao.getCommision(mm);
	}
	
	//未付款订单数
	public static int getUnPayedOrders(Map mm) throws Exception{
		return ReportDetailDao.getUnPayedOrders(mm);
	}
	
	//已付款订单数
	public static int getPayedOrders(Map mm) throws Exception{
		return ReportDetailDao.getPayedOrders(mm);
	}
	
	//已发货订单数
	public static int getYfhOrders(Map mm) throws Exception{
		return ReportDetailDao.getYfhOrders(mm);
	}
	
	//已取消订单数
	public static int getYqxOrders(Map mm) throws Exception{
		return ReportDetailDao.getYqxOrders(mm);
	}
	
	//交易关闭订单数
	public static int getYgbOrders(Map mm) throws Exception{
		return ReportDetailDao.getYgbOrders(mm);
	}
	
	//交易成功订单数
	public static int getJycOrders(Map mm) throws Exception{
		return ReportDetailDao.getJycOrders(mm);
	}
	
	//即时订单数
	public static int getImmediatelyOrders(Map mm) throws Exception{
		return ReportDetailDao.getImmediatelyOrders(mm);
	}
	
	//担保订单数
	public static int getAssureOrders(Map mm) throws Exception{
		return ReportDetailDao.getAssureOrders(mm);
	}
	
	//已划账担保订单数
	public static int getPayedAssureOrders(Map mm) throws Exception{
		return ReportDetailDao.getPayedAssureOrders(mm);
	}
	
	//未划账担保订单数
	public static int getUnPayedAssureOrders(Map mm) throws Exception{
		return ReportDetailDao.getUnPayedAssureOrders(mm);
	}
}
