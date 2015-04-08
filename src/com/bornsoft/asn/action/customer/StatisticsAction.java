package com.bornsoft.asn.action.customer;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.service.customer.StatisticsService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.utils.common.PageTool;

public class StatisticsAction extends BaseAction {
	private List list;
	
	private String statisticsType;//统计类型
	private int page=1;
    private int pageSize=10 ;
    private String pageBar ;
    private String orderCountDown;
    private String orderCountUp;
    private String orderMoneyDown;
    private String orderMoneyUp;
    private String fullName;
    private String startTime;
    private String endTime;
    private String productName;
    private String productTypeName;
    
    
	public String getProductTypeName() {
		return productTypeName;
	}


	public void setProductTypeName(String productTypeName) {
		this.productTypeName = productTypeName;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
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


	public String getFullName() {
		return fullName;
	}


	public void setFullName(String fullName) {
		this.fullName = fullName;
	}


	public String getOrderCountDown() {
		return orderCountDown;
	}


	public void setOrderCountDown(String orderCountDown) {
		this.orderCountDown = orderCountDown;
	}


	public String getOrderCountUp() {
		return orderCountUp;
	}


	public void setOrderCountUp(String orderCountUp) {
		this.orderCountUp = orderCountUp;
	}


	public String getOrderMoneyDown() {
		return orderMoneyDown;
	}


	public void setOrderMoneyDown(String orderMoneyDown) {
		this.orderMoneyDown = orderMoneyDown;
	}


	public String getOrderMoneyUp() {
		return orderMoneyUp;
	}


	public void setOrderMoneyUp(String orderMoneyUp) {
		this.orderMoneyUp = orderMoneyUp;
	}


	public int getPage() {
		return page;
	}


	public void setPage(int page) {
		this.page = page;
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public String getPageBar() {
		return pageBar;
	}


	public void setPageBar(String pageBar) {
		this.pageBar = pageBar;
	}


	public String getStatisticsType() {
		return statisticsType;
	}


	public void setStatisticsType(String statisticsType) {
		this.statisticsType = statisticsType;
	}


	public List getList() {
		return list;
	}


	public void setList(List list) {
		this.list = list;
	}

	/*******
	 * 消费排行榜
	 * ****/
	public String consumerTop()throws Exception{
		if(statisticsType == null){
			statisticsType = "order";
		}
		Long supplierId = MemberService.getMemberId();
		
		PageTool pageTool=new PageTool();
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;
		
		int count = StatisticsService.getCountByorderOrMoney(supplierId, statisticsType,orderCountDown,orderCountUp,orderMoneyDown,orderMoneyUp);
		
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
		
		list = StatisticsService.getStatisticsbyOrderCount(supplierId,statisticsType,startCount,endCount,orderCountDown,orderCountUp,orderMoneyDown,orderMoneyUp);
		return SUCCESS;
	}
	
	/*******
	 * 消费能力变化分析
	 * ****/
	public String consumePower()throws Exception{		
		Long supplierId = MemberService.getMemberId();
		PageTool pageTool=new PageTool();
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;
		
		int count = StatisticsService.getConsumePowerCount(supplierId,fullName,startTime,endTime);		
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
		list = StatisticsService.getConsumePower(supplierId,startCount,endCount,fullName,startTime,endTime);
		return SUCCESS;
	}
	
	/*******
	 * 产品销售排行榜
	 * ****/
	public String productSaleTop()throws Exception{
		if(statisticsType == null){
			statisticsType = "product";
		}
		Long supplierId = MemberService.getMemberId();
		PageTool pageTool=new PageTool();
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;
		
		int count = StatisticsService.getProductSaleTopCount(supplierId,statisticsType,productName,startTime,endTime,productTypeName);		
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
		list = StatisticsService.getProductSaleTop(supplierId,startCount,endCount,statisticsType,productName,startTime,endTime,productTypeName);
		return SUCCESS;
	}
	
	/*******
	 * 客户满意度分析
	 * ****/
	public String satisfaction()throws Exception{
		Long supplierId = MemberService.getMemberId();
		PageTool pageTool=new PageTool();
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;
		
		int count = StatisticsService.getsatisfactionCount(supplierId,fullName,startTime,endTime);		
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
		list = StatisticsService.getsatisfaction(supplierId,startCount,endCount,fullName,startTime,endTime);
		return SUCCESS;
	}
	

}
