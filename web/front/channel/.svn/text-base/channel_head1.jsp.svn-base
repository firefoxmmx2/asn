<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bornsoft.asn.bean.member.Member" %>
<%@ page import="com.bornsoft.asn.service.member.MemberService" %>
<%@ page import="com.bornsoft.asn.bean.shoppingCart.Cart" %>
<%@ page import="java.util.*" %>
<%@ page import="com.bornsoft.asn.bean.shoppingCart.CartItem" %>
<%@ page import="com.bornsoft.sso.util.*"%>
<%@ page import="com.bornsoft.sso.config.*" %>
<%
	String cp = request.getContextPath(); 
	
	response.setHeader("P3P","CP=\"CURa ADMa DEVa PSAo PSDo OUR BUS UNI PUR INT DEM STA PRE COM NAV OTC NOI DSP COR\"");

	boolean boo = MemberService.isLogin(request);
	Object loginMemberId = request.getSession().getAttribute("loginMemberId");
	Member member = null;      
	boolean isLogin = Validate.checkLogin(request);
	if(loginMemberId != null){
		member = MemberService.getMember(session);
	}
	
	Object obj=request.getSession().getAttribute("storeList");
	int amount = 0;
	Cart cart=null;
   	if( obj != null){
   		 cart = (Cart)obj;
	   	 Hashtable<Long, Hashtable<Long, CartItem>> list= cart.getValue();
	     for(Iterator it = list.keySet().iterator(); it.hasNext();) {
	     Long key=(Long)it.next(); 
		     if(((Hashtable<Long, CartItem>)list.get(key)).size()>0){
		    	 Hashtable<Long, CartItem>   value   = (Hashtable<Long, CartItem>)list.get(key);
	             for(int i =0; i< value.size();i++) {
	             	amount++;
	             }
		     }
	     }
    }
   	
   	request.setAttribute("amount",amount);
%>
<table width="980" border="0" cellspacing="0" cellpadding="0"
	align="center" height="26" class="head">
	<tr>
		<td align="left" width="30%" class="pl5">
        		<span class="redb"><% if(member != null) out.println(member.getSsoAccount()) ;%></span>您好，欢迎使用本电子商务平台！
        </td>
		<td align="center" width="10%"></td>
		<td align="right" class="pr5"><a
			href="http://www.aiecp.com/aiecp/72057594037927936" target="_blank">首页</a>
		| <a href="${pageContext.request.contextPath}/front/mall/info/showInfoMain"
			target="_blank">供求</a> | <a
			href="${pageContext.request.contextPath}/front/mall/mallIndex" target="_blank">产品</a>|
		<a href="${pageContext.request.contextPath }/front/mall/supplier/searchSupplier"
			target="_blank">企业</a> | <a
			href="${pageContext.request.contextPath }/front/mall/quotation/QuotationList"
			target="_blank">行情</a><!-- | <a href="http://appsvr.aiecp.com:8080/ptnsso/reLoginapg.sso?http://www.cqncp.com/asn/front/channel/zys/home" target="_blank">会员登录</a>--></td>
	</tr>
</table>