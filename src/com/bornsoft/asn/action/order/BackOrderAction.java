package com.bornsoft.asn.action.order;

import java.sql.SQLException;
import java.util.List;
import com.bornsoft.asn.bean.order.Order;
import com.bornsoft.asn.exception.ActionException;
import com.bornsoft.asn.service.order.OrderService;
import com.bornsoft.asn.utils.common.PageUtil;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 后台订单控制ACTION
 * @author yuwenqiang
 * 2010-4-9
 */
public class BackOrderAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	/**后台订单集合*/
	private List<Order> backOrderList;
	
	
	
	public int pages=1;
	public int pagesize=5;
	public String pageBar ;
	public String formId;
	public PageUtil page = new PageUtil(); 
	
	/**订单编号*/
	private String orderCode;
	/**订单状态*/
	private String orderStatus;
	/**订单ID*/
	private Long orderId;
	
	public Long getOrderId() {
		return orderId;
	}
	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public int getPages() {
		return pages;
	}
	public void setPages(int pages) {
		this.pages = pages;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public String getPageBar() {
		return pageBar;
	}
	public void setPageBar(String pageBar) {
		this.pageBar = pageBar;
	}
	public String getFormId() {
		return formId;
	}
	public void setFormId(String formId) {
		this.formId = formId;
	}
	public PageUtil getPage() {
		return page;
	}
	public void setPage(PageUtil page) {
		this.page = page;
	}
	public List<Order> getBackOrderList() {
		return backOrderList;
	}
	public void setBackOrderList(List<Order> backOrderList) {
		this.backOrderList = backOrderList;
	}
	
	
	/**
	 * 后台查询订单集合
	 * 2010-4-9
	 * @author yuwenqiang
	 * @return
	 */
	public String findBackOrderList()throws Exception{
		try {
		page.setCurPage(pages);
	   	page.setPageSize(pagesize);
	   	page.setTotalRow(OrderService.findBackOrderCount(orderCode,orderStatus));
	   	page.setFormid(1);
	   	pageBar = page.getToolsMenu();
		//backOrderList=OrderService.findBackOrderList(page.getStart(),page.getEnd(),orderCode,orderStatus);
		return SUCCESS;
		} catch (SQLException e) {
			throw new ActionException("后台查询订单失败",e);
		}
	}
	
	
	/**
	 * 根据订单的ID查询订单的详细信息
	 * 2010-4-14
	 * @author yuwenqiang
	 * @return
	 */
	public String findOrderInfoById(){
		 
		return SUCCESS;
	}
	
}
