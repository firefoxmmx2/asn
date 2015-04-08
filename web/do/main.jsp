<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bornsoft.asn.service.product.ProductSupplyService" %>
<%@ page import="com.bornsoft.asn.service.member.MemberService" %>
<%@ page import="com.bornsoft.asn.service.supplier.SupplierService" %>
<%@ page import="com.bornsoft.asn.bean.supplier.Supplier" %>
<%@ page import="com.bornsoft.asn.bean.member.Member" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String cp=request.getContextPath();
	Long sId=MemberService.getMemberId(session);
	Member member=MemberService.getMember(session);
	String lastLoginIp = (String)session.getAttribute("loginMemberLastIp");
	java.sql.Timestamp lastLoginTimeD = (java.sql.Timestamp)session.getAttribute("loginMemberLastTime");
	String lastLoginTime="";
	if(lastLoginTimeD!=null){ 
		lastLoginTime=new java.text.SimpleDateFormat("yyyy-M-d HH:mm").format(lastLoginTimeD);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>会员中心</title>
	<link href="../css/main.css" rel="stylesheet" type="text/css" />
	<style>
		.boldNumber{
			font-weight: 800;
			font-size: 16pt;
		}			
	</style>
</head>
<body>
	<div>
			<h1> 
				<span>欢迎来到会员中心！</span>
			</h1>
			<div>当前有<span class="boldNumber"><%=ProductSupplyService.getProductSupplyCountOn(sId.intValue())%></span>件商品上架销售，
			<span class="boldNumber"><%=ProductSupplyService.getProductSupplyCountOff(sId.intValue())%></span>件商品保存在仓库中。
			</div>
			<%
			if(!lastLoginTime.endsWith("")){
			%>
			<div>你上次进入电子商务系统的时间是<%=lastLoginTime%>，网络地址是<%=lastLoginIp%>。</div>
			<div>如果此记录与实情不符，请向网络管理中心查证。</div>
			<%	
			}
			%>
			
			<div style="padding-top:10px; ">
				<% 
					Supplier s= SupplierService.getSupplier(MemberService.getMember(session).getMemberId()); 
					if(s != null){
						if(s.getSupplierType().equals("2")){
							Member v=MemberService.getMember(new Long(s.getVoucherId().toString()));
							if(v!=null){
								String vouch = "<font color='blue'>"+v.getFullName()+"</font>";
								if(s.getVouchState().toString().equals("None")){
									out.println(vouch +" 还未查看你的身份担保申请，请与该单位联系。");
								}
								else if(s.getVouchState().toString().equals("Agree")){
									out.println("你的身份担保单位是 "+vouch+"。");
								}
								else if(s.getVouchState().toString().equals("Disagree")){
									out.println(vouch +" 不同意担保你的身份。你可与该单位联系或者更换担保单位。");
								}
							}
							
						}else if(s.getSupplierType().equals("1")){
							Map<String, Object> m=new HashMap<String, Object>();
							// 担保总数
							m.put("memberId",s.getSupplierId());
							long vCount=SupplierService.getVoucherCount(m);
							if(vCount>0){
								out.print("当前担保总数<span class=boldNumber>"+vCount+"</span>。");
							}
							// 未处理担保数
							m.put("vouchState","None");
							vCount=SupplierService.getVoucherCount(m);
							if(vCount>0){
								out.print("<br>未处理担保数<span class=boldNumber>"+SupplierService.getVoucherCount(m)+"</span>。");
								m.put("startCount", 1);
								m.put("endCount", SupplierService.getVoucherCount(m));
								out.println("未处理担保如下：<br>");
								List list = SupplierService.getVoucherByMemberId(m);
								for(int i=0; i< list.size();i++){
									Map ml = (Map)list.get(i);
									out.print("["+ml.get("fullName")+"]、");
								}
								out.println("<br><a href='voucher/listVoucher'>查看详细信息</a>");
							}
						
						}
					}
				%>
			</div>
			
			<h2>
				<span>请从左侧菜单选择操作。</span>
			</h2>
	</div>
</body>
</html>