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
	String topMenuUrl = "http://mall.cqapg.com/asn";
%>

<% 
	
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
%>

<title>绿色农产品网上商城|mall.cqapg.com</title>
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui-1.8rc3.custom.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bcart/bcart.js"></script>
<link rel="stylesheet" href="<%=cp%>/js/bcart/bcart.css" type="text/css" /> 

<style>
<!--
.ncp_login_header{font-size: 12px;}
.ncp_login_header a{font-size: 12px;}
.ncp_login_header a:link {
	color: #555555;
	text-decoration: none;	
}
.ncp_login_header a:visited {
	color: #555555;
	text-decoration: none;
}
.ncp_login_header a:hover {
	color: #ff0000;
	text-decoration: underline;
}
.ncp_login_header a:active {
	color: #555555;
	text-decoration: none;
}



.t01 a:link {
	color: #fff;
	text-decoration: none;
}
.t01 a:visited {
	color: #fff;
	text-decoration: none;
}
.t01 a:hover {
	color: #fff;
	text-decoration: underline;
}
.t01 a:active {
	color: #fff;
	text-decoration: none;
}

.t02 a:link {
	color: #327a17;
	text-decoration: none;
}
.t02 a:visited {
	color: #327a17;
	text-decoration: none;
}
.t02 a:hover {
	color: #327a17;
	text-decoration: underline;
}
.t02 a:active {
	color: #327a17;
	text-decoration: none;
}



.logo{ background:url(<%=request.getContextPath()%>/image/channel/ncp/logo_wssc.jpg) no-repeat; width:310px; height:85px;}
.litter1{ background-image:url(<%=request.getContextPath()%>/image/channel/ncp/litter1.jpg);width:77px; height:28px; line-height:28px; text-align:right}
.litter2{ background-image:url(<%=request.getContextPath()%>/image/channel/ncp/litter2.jpg);width:96px; height:28px;line-height:28px; text-align:right} 
.litter3{ background-image:url(<%=request.getContextPath()%>/image/channel/ncp/litter3.jpg);width:150px; height:28px;line-height:28px; text-align:right}
.litter4{ background-image:url(<%=request.getContextPath()%>/image/channel/ncp/litter4.jpg);width:54px; height:28px;line-height:28px; text-align:right}
.litter5{ background-image:url(<%=request.getContextPath()%>/image/channel/ncp/litter5.jpg);width:91px; height:28px;line-height:28px; text-align:center;}
.qq{ background:url(<%=request.getContextPath()%>/image/channel/ncp/qq.jpg) no-repeat; background-position:center 50%;}
.msn{ background:url(<%=request.getContextPath()%>/image/channel/ncp/msn.jpg) no-repeat; background-position:center 50%;}
.skype{ background:url(<%=request.getContextPath()%>/image/channel/ncp/skype.jpg) no-repeat; background-position:center 50%;}
.phone{ background:url(<%=request.getContextPath()%>/image/channel/ncp/phone230.jpg) no-repeat; background-position:right 50%;}
.daohang{ background:url(<%=request.getContextPath()%>/image/channel/ncp/dnavbt.jpg) repeat-x;}
.t01{ font-size:14px; font-weight:bold; text-align:center; color:#FFFFFF; height:36px; line-height:36px;}
.t02{ font-size:14px; font-weight:bold; text-align:center; color:#c4241a; background:url(<%=request.getContextPath()%>/image/channel/ncp/dnav4.gif); height:36px; line-height:36px;}
.search_bg{ background:url(<%=request.getContextPath()%>/image/channel/ncp/search_m.jpg) repeat-x;}
.saerch{ background:url(<%=request.getContextPath()%>/image/channel/ncp/search_bg.jpg) no-repeat; background-position: left 50%; height:22px; border:none; width:275px; color: #666666; padding-left:10px;}
-->
</style> 

<script type="text/javascript">
<!--

function show(id){	
	var arrA = new Array("index","male","hot","ncp","bjp","syfw","wmcp");
	for(var i=0; i<arrA.length; i++){
		if(id == arrA[i]){
			document.getElementById("ncp_"+arrA[i]).className='t02';
		}else{
			document.getElementById("ncp_"+arrA[i]).className='t01';
		}
	}
				
}

$(document).ready(function(){
	var arrA = new Array("index","male","hot","ncp","bjp","syfw","wmcp");
	var menuType = document.getElementById("ncpMenuType").value;
	for(var i=0; i<arrA.length; i++){
		if(menuType == arrA[i]){
			document.getElementById("ncp_"+arrA[i]).className='t02';
		}else{
			document.getElementById("ncp_"+arrA[i]).className='t01';
		}
	}
});

//-->
</script>

<table width="980" border="0" cellspacing="0" cellpadding="0" align="center" height="85" class="ncp_login_header">
  <tr>
    <td rowspan="2" class="logo" width="350"></td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="10">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="28">&nbsp;</td>
        <td width="77" class="litter1"><a href="http://appsvr.aiecp.com:8080/ptnsso/reLoginapg.sso?http://mall.cqapg.com/asn/front/channel/ncp/ncpIndex" target="_blank">会员登录</a></td>
        <td width="96" class="litter2"><a href="http://appsvr.aiecp.com:8080/ptnsso/registerActionapg.sso?http://mall.cqapg.com/asn/front/channel/ncp/ncpIndex" target="_blank">新用户注册</a></td>
        <td width="127" class="litter3"><a href="javascript:void(bcart.showCart());">购物车有(<span class="redb"><%=amount %></span>)件商品 </a></td>
        <td width="54" class="litter4"><a href="toConfirmInfoPage.action" target="_blank">结算</a></td>
        <td width="91" class="litter5"><a href="<%=request.getContextPath()%>/do/queryBuyOrder.action" style="padding-left:15px;">我的订单</a></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="47">
	 <table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
      <tr>
        <td width="246" style="font-size: 12px;color: #555555;">
        	<% if(member == null){ %>
        		尊敬的用户，请登录农产品网电子商务平台！
        	<% }else{ %>
        		<span class="redb"><%=member.getSsoAccount() %></span>您好，欢迎来到农产品网电子商务平台！
        	<% } %>	
        	</td>
        <td width="70" class="qq">&nbsp;</td>
        <td width="43" class="msn">&nbsp;</td>
        <td width="34" class="skype">&nbsp;</td>
        <td width="238" class="phone" >&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>



<input type="hidden" name="ncpMenuType" id="ncpMenuType" value="<%=request.getSession().getAttribute("ncpMenuType") == null?"male":request.getSession().getAttribute("ncpMenuType")%>" />
<table width="980" height="36" border="0" align="center" cellpadding="0" cellspacing="0" class="daohang">
  <tr>
    <td  width="40"><img src="<%=cp%>/image/channel/ncp/dnav1.jpg" width="40" height="36" /></td>
	
    <td valign="top" class="t01" width="84" id="ncp_index"><a href="http://www.cqapg.com"  onmousedown="show('index')" target="_top">集团首页</a></td>
	<td valign="top"  width="52">&nbsp;</td>
	
    <td valign="top" class="t02" width="84" id="ncp_male"><a href="<%=topMenuUrl%>/front/channel/ncp/ncpIndex?type=male" onmousedown="show('male')">商城首页</a></td>
	<td valign="top"  width="52">&nbsp;</td>

    <td valign="top" class="t01" width="84" id="ncp_hot"><a href="<%=topMenuUrl%>/front/channel/ncp/hotNcp?type=hot"  onmousedown="show('hot')">热卖产品</a></td>
	<td valign="top" width="52">&nbsp;</td>
	

    <td valign="top" class="t01" width="84" id="ncp_ncp"><a href="<%=topMenuUrl%>/front/channel/ncp/listNcp?type=ncp"  onmousedown="show('ncp')">农副产品</a></td>
	<td valign="top" width="52">&nbsp;</td>
	

    <td valign="top" class="t01" width="84" id="ncp_bjp"><a href="<%=topMenuUrl%>/front/channel/ncp/listNcp?type=bjp"  onmousedown="show('bjp')">保健品</a></td>
	<td valign="top"  width="52">&nbsp;</td>
	
    <td valign="top" class="t01" width="84" id="ncp_syfw"><a href="<%=topMenuUrl%>/front/channel/ncp/listNcp?type=syfw"  onmousedown="show('syfw')">商业服务</a></td>
	<td valign="top"  width="52">&nbsp;</td>
	
    <td valign="top" class="t01" width="84" id="ncp_wmcp"><a href="#"  onmousedown="show('wmcp')">外贸产品</a></td>
	
    <td width="40"><img src="<%=cp%>/image/channel/ncp/dnav2.jpg" width="40" height="36" /></td>
  </tr>
</table>




