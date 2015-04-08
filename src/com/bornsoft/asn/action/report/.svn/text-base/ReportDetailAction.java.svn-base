package com.bornsoft.asn.action.report;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.service.report.ReportDetailService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
import java.util.Calendar;

public class ReportDetailAction extends BaseAction{
    private int payedMoney;//到账金额
	private String startTime;//查询开始时间
	private String endTime;//查询结束时间
	private String inAccountMoney;//到账金额
	private String outAccountMoney;//已支出金额
	private String unOutAccountMoney;//应支出金额
	private String commision;//佣金
	private String unPayedOrders;//未付款订单数
	private String payedOrders;//已付款订单数
	private String yfhOrders;//已发货订单数
	private String yqxOrders;//已取消订单数
	private String ygbOrders;//交易关闭订单数
	private String jycOrders;//交易成功订单数
	private String immediatelyOrders;//即时订单数
	private String assureOrders;//担保订单数
	private String payedAssureOrders;//已划账担保订单数
	private String unPayedAssureOrders;//未划账担保订单数
    
	public String getInAccountMoney() {
		return inAccountMoney;
	}

	public void setInAccountMoney(String inAccountMoney) {
		this.inAccountMoney = inAccountMoney;
	}

	public String getOutAccountMoney() {
		return outAccountMoney;
	}

	public void setOutAccountMoney(String outAccountMoney) {
		this.outAccountMoney = outAccountMoney;
	}

	public String getUnOutAccountMoney() {
		return unOutAccountMoney;
	}

	public void setUnOutAccountMoney(String unOutAccountMoney) {
		this.unOutAccountMoney = unOutAccountMoney;
	}

	public String getCommision() {
		return commision;
	}

	public void setCommision(String commision) {
		this.commision = commision;
	}

	public String getUnPayedOrders() {
		return unPayedOrders;
	}

	public void setUnPayedOrders(String unPayedOrders) {
		this.unPayedOrders = unPayedOrders;
	}

	public String getPayedOrders() {
		return payedOrders;
	}

	public void setPayedOrders(String payedOrders) {
		this.payedOrders = payedOrders;
	}

	public String getYfhOrders() {
		return yfhOrders;
	}

	public void setYfhOrders(String yfhOrders) {
		this.yfhOrders = yfhOrders;
	}

	public String getYqxOrders() {
		return yqxOrders;
	}

	public void setYqxOrders(String yqxOrders) {
		this.yqxOrders = yqxOrders;
	}

	public String getYgbOrders() {
		return ygbOrders;
	}

	public void setYgbOrders(String ygbOrders) {
		this.ygbOrders = ygbOrders;
	}

	public String getJycOrders() {
		return jycOrders;
	}

	public void setJycOrders(String jycOrders) {
		this.jycOrders = jycOrders;
	}

	public String getImmediatelyOrders() {
		return immediatelyOrders;
	}

	public void setImmediatelyOrders(String immediatelyOrders) {
		this.immediatelyOrders = immediatelyOrders;
	}

	public String getAssureOrders() {
		return assureOrders;
	}

	public void setAssureOrders(String assureOrders) {
		this.assureOrders = assureOrders;
	}

	public String getPayedAssureOrders() {
		return payedAssureOrders;
	}

	public void setPayedAssureOrders(String payedAssureOrders) {
		this.payedAssureOrders = payedAssureOrders;
	}

	public String getUnPayedAssureOrders() {
		return unPayedAssureOrders;
	}

	public void setUnPayedAssureOrders(String unPayedAssureOrders) {
		this.unPayedAssureOrders = unPayedAssureOrders;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	public int getPayedMoney() {
		return payedMoney;
	}

	public void setPayedMoney(int payedMoney) {
		this.payedMoney = payedMoney;
	}
	
	//取得到账金额
	public Float getInAccountSumMoney(HashMap mm) throws Exception{
		return ReportDetailService.getInAccountSumMoney(mm);
	}
	
	//已支出金额
	public Float getOutAccountMoney(HashMap mm) throws Exception{
		return ReportDetailService.getOutAccountSumMoney(mm);
	}
	
	//应支出金额
	public Float getUnOutAccountMoney(HashMap mm) throws Exception{
		return ReportDetailService.getUnOutAccountMoney(mm);
	}
	
	//佣金
	public static Float getCommision(Map mm) throws Exception{
		return ReportDetailService.getCommision(mm);
	}
	
	//未付款订单数
	public static int getUnPayedOrders(Map mm) throws Exception{
		return ReportDetailService.getUnPayedOrders(mm);
	}
	
	//已付款订单数
	public static int getPayedOrders(Map mm) throws Exception{
		return ReportDetailService.getPayedOrders(mm);
	}
	
	//已发货订单数
	public static int getYfhOrders(Map mm) throws Exception{
		return ReportDetailService.getYfhOrders(mm);
	}
	
	//已取消订单数
	public static int getYqxOrders(Map mm) throws Exception{
		return ReportDetailService.getYqxOrders(mm);
	}
	
	//交易关闭订单数
	public static int getYgbOrders(Map mm) throws Exception{
		return ReportDetailService.getYgbOrders(mm);
	}
	
	//交易成功订单数
	public static int getJycOrders(Map mm) throws Exception{
		return ReportDetailService.getJycOrders(mm);
	}
	
	//即时订单数
	public static int getImmediatelyOrders(Map mm) throws Exception{
		return ReportDetailService.getImmediatelyOrders(mm);
	}
	
	//担保订单数
	public static int getAssureOrders(Map mm) throws Exception{
		return ReportDetailService.getAssureOrders(mm);
	}
	
	//已划账担保订单数
	public static int getPayedAssureOrders(Map mm) throws Exception{
		return ReportDetailService.getPayedAssureOrders(mm);
	}
	
	//未划账担保订单数
	public static int getUnPayedAssureOrders(Map mm) throws Exception{
		return ReportDetailService.getUnPayedAssureOrders(mm);
	}
	
	//取得订单信息详情
	public String getReportDetail() throws Exception{
		
		//取得查询的开始时间
		if(startTime ==null)
			startTime="";
		//startTime="2009-11-11";
		//取得查询的结束时间
		if(endTime==null)
			endTime="";
		//endTime="2010-12-30";
		
		HashMap mm=new HashMap();
		mm.put("startTime", startTime);
		mm.put("endTime", endTime);
		
		inAccountMoney=String.valueOf(getInAccountSumMoney(mm));
		outAccountMoney=String.valueOf(getOutAccountMoney(mm));
		unOutAccountMoney=String.valueOf(getUnOutAccountMoney(mm));
		if(getCommision(mm)==null)
		{commision="0";}
		else
		{commision=String.valueOf(getCommision(mm));}
		unPayedOrders=String.valueOf(getUnPayedOrders(mm));
		payedOrders=String.valueOf(getPayedOrders(mm));
		yfhOrders=String.valueOf(getYfhOrders(mm));
		yqxOrders=String.valueOf(getYqxOrders(mm));
		ygbOrders=String.valueOf(getYgbOrders(mm));
		jycOrders=String.valueOf(getJycOrders(mm));
		immediatelyOrders=String.valueOf(getImmediatelyOrders(mm));
		assureOrders=String.valueOf(getAssureOrders(mm));
		payedAssureOrders=String.valueOf(getPayedAssureOrders(mm));
		unPayedAssureOrders=String.valueOf(getUnPayedAssureOrders(mm));
		
		return SUCCESS;
	}
}
