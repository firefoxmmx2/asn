package com.bornsoft.asn.action.huazhang;

import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.Number;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.bank.BankInfo;
import com.bornsoft.asn.bean.order.Order;
import com.bornsoft.asn.service.bank.BankInfoService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.service.order.HuaZhangOrderService;
import com.bornsoft.asn.service.order.OrderService;
import com.bornsoft.asn.utils.common.PageTool;

public class HuaZhangAction extends BaseAction{
	private List<Order> orderList;
	private int page=1;
    private int pageSize=5 ;
    private String pageBar ;
	
	
	public List<Order> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
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

	public String toOrderList() throws Exception{
		String drawerName=this.getRequest().getParameter("drawerName");
		String detailAddress=this.getRequest().getParameter("detailAddress");
		String mobileNumber=this.getRequest().getParameter("mobileNumber");
		String ssoAccount=this.getRequest().getParameter("ssoAccount");
		String fullName=this.getRequest().getParameter("fullName");
		String email=this.getRequest().getParameter("email");
		String certId=this.getRequest().getParameter("certId");
		String orderId=this.getRequest().getParameter("orderId");
		String isPayed=this.getRequest().getParameter("isPayed");
  	   	if(isPayed==null||isPayed.trim().equals("")){
  	   		isPayed="N";
  	   	}
		
		int count = HuaZhangOrderService.getOrderListCount("1390", ssoAccount,fullName, email,certId,drawerName,detailAddress,mobileNumber,isPayed,orderId,"JYC");
		PageTool pageTool=new PageTool();
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	Integer start=(page-1)*pageSize+1;
	   	Integer end=page*pageSize;
		orderList = HuaZhangOrderService.getOrderList("1390", ssoAccount,fullName, email,certId, drawerName,detailAddress,mobileNumber,isPayed,orderId,"JYC", start, end);
  	   	this.getRequest().setAttribute("drawerName", drawerName);
  	   	this.getRequest().setAttribute("detailAddress", detailAddress);
  	   	this.getRequest().setAttribute("mobileNumber", mobileNumber);
  	   	this.getRequest().setAttribute("ssoAccount", ssoAccount);
  	   	this.getRequest().setAttribute("fullName", fullName);
  	   	this.getRequest().setAttribute("email", email);
  	   	this.getRequest().setAttribute("certId", certId);
  	   	this.getRequest().setAttribute("orderId", orderId);
  	   	this.getRequest().setAttribute("isPayed", isPayed);
	    return SUCCESS;
	}
	
	public String huaZhang()throws Exception{
		String s=this.getRequest().getParameter("ids");
		String[] ids=s.split(",");
		HuaZhangOrderService.huaZhang(ids, "Y");
		return SUCCESS;
	}
	
	
	
	public void downloadExcel()throws Exception{
		String ids=this.getRequest().getParameter("ids");
		String[] orderIds=ids.split(","); 
		HttpServletResponse response=this.getResponse();
		OutputStream out=response.getOutputStream();
		response.reset();// 清空输出流   
        response.setHeader("Content-disposition", "attachment; filename="+new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss").format(new Date())+".xls");// 设定输出文件头   
        response.setContentType("application/msexcel");// 定义输出类型   
		WritableWorkbook workbook = Workbook.createWorkbook(out);
		WritableSheet sheet = workbook.createSheet("First Sheet", 0);
		Label label1 = new Label(1, 1, "订单号"); 
		sheet.addCell(label1);
		Label label2 = new Label(4, 1, "收款人"); 
		sheet.addCell(label2); 
		Label label3= new Label(7, 1, "开户行"); 
		sheet.addCell(label3); 
		Label label4 = new Label(10, 1, "银行账号"); 
		sheet.addCell(label4); 
		Label label5 = new Label(13, 1, "开户人"); 
		sheet.addCell(label5); 
		Label label6 = new Label(16, 1, "转账金额（元）"); 
		sheet.addCell(label6);
		
		int i=0;
		for(String orderId:orderIds){
			Order order=OrderService.findOrderById(Long.parseLong(orderId));
			Long memberId=order.getSupplierId();
			BankInfo b=BankInfoService.getBankInfoById(memberId);
			Label value1 = new Label(1, 3+i, order.getId()+""); 
			sheet.addCell(value1);
			Label label7 = new Label(4, 3+i, MemberService.getMember(memberId).getFullName()); 
			sheet.addCell(label7); 
			Label label8= new Label(7, 3+i, b.getBankName()); 
			sheet.addCell(label8); 
			Label label9 = new Label(10, 3+i, b.getAccount()); 
			sheet.addCell(label9); 
			Label label10 = new Label(13, 3+i, b.getOwnerName());   
			sheet.addCell(label10);   
			Label label11 = new Label(16, 3+i, order.getTotalAmount()+"");     
			sheet.addCell(label11);   
			i+=2;
		}
		
		
		workbook.write(); 
		workbook.close();
		out.close();
	}

}
