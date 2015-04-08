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
	String topMenuUrl = "http://www.cqncp.com/asn";
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


<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui-1.8rc3.custom.min.js"></script>
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


.logo{ background:url(<%=request.getContextPath()%>/image/platform/logo_dzsw.jpg) no-repeat; width:490px; height:85px;}
.litter1{ background-image:url(<%=request.getContextPath()%>/image/platform/litter1.jpg);width:77px; height:28px; line-height:28px; text-align:right}
.litter2{ background-image:url(<%=request.getContextPath()%>/image/platform/litter2.jpg);width:96px; height:28px;line-height:28px; text-align:right} 
.litter3{ background-image:url(<%=request.getContextPath()%>/image/platform/litter3.jpg);width:150px; height:28px;line-height:28px; text-align:right}
.litter4{ background-image:url(<%=request.getContextPath()%>/image/platform/litter4.jpg);width:54px; height:28px;line-height:28px; text-align:right}
.litter5{ background-image:url(<%=request.getContextPath()%>/image/platform/litter5.jpg);width:91px; height:28px;line-height:28px; text-align:center;}

.qq{ background:url(<%=request.getContextPath()%>/image/platform/qq.jpg) no-repeat; background-position:center 50%;}
.msn{ background:url(<%=request.getContextPath()%>/image/platform/msn.jpg) no-repeat; background-position:center 50%;}
.skype{ background:url(<%=request.getContextPath()%>/image/platform/skype.jpg) no-repeat; background-position:center 50%;}
.phone{ background:url(<%=request.getContextPath()%>/image/platform/phone230.jpg) no-repeat; background-position:right 50%;}
.daohang{ background:url(<%=request.getContextPath()%>/image/platform/dnavbt.jpg) repeat-x;}
.t01{ font-size:14px; font-weight:bold; text-align:center; color:#FFFFFF; height:36px; line-height:36px;}
.t02{ font-size:14px; font-weight:bold; text-align:center; color:#327a17; background:url(<%=request.getContextPath()%>/image/platform/dnav4.gif); height:36px; line-height:36px;}
.search_bg{ background:url(<%=request.getContextPath()%>/image/platform/search_m.jpg) repeat-x;}
.saerch{ background:url(<%=request.getContextPath()%>/image/platform/search_bg.jpg) no-repeat; background-position: left 50%; height:22px; border:none; width:275px; color: #666666; padding-left:5px;}
-->
</style>    

  
    
<table width="980" border="0" cellspacing="0" cellpadding="0" align="center" height="85" class="ncp_login_header">
  <tr>
    <td rowspan="2" class="logo" width="320"></td>
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
        <td width="77" class="litter1"><a href="http://appsvr.aiecp.com:8080/ptnsso/reLoginncp.sso?<%=cp%>/front/mall/mallIndex" target="_blank">会员登录</a></td>
        <td width="96" class="litter2"><a href="http://appsvr.aiecp.com:8080/ptnsso/registerActionncp.sso?<%=cp%>/front/mall/mallIndex" target="_blank">新用户注册</a></td>
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
        <td width="236" style="font-size: 12px; color: #555555;">        	
        	<% if(!isLogin){ %>
        		尊敬的用户，请登录农产品电子商务平台！  
        	<% }else{ %>
        		<span class="redb">尊敬的<%=member==null?"":member.getSsoAccount() %></span>用户，欢迎登录农产品电子商务平台！
        	<% } %>	
        </td>                <!--class="qq" class="msn" class="skype"-->
        <td width="70" ><A href="tencent://message/?uin=1637918889&amp;Site=重庆农产品网 重庆市农产品电子商务平台 www.cqncp.com&amp;Menu=yes" style="cursor:hand"><img src="<%=cp%>/image/channel/ncp/qq.jpg" style="border:none"></A></td>
        <td width="43" ><a href="msnim:chat?contact=ied@cqapg.com" ><img src="<%=cp%>/image/channel/ncp/msn.jpg" style="border:none"></a></td>
        <td width="44" ><a href="callto://cp-apg/"><img src="<%=cp%>/image/channel/ncp/skype.jpg" style="border:none"></a></td>
        <td width="260" class="phone" >&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>



<table width="980" height="36" border="0" align="center" cellpadding="0" cellspacing="0" class="daohang">
  <tr>
    <td  width="40"><img src="<%=cp%>/image/platform/dnav1.jpg" width="40" height="36" /></td>
	<!-- 
    <td valign="top" class="t01" width="84"><a href="http://www.aiecp.com/aiecp/76563392688553984/index.html" target="_top">网站首页</a></td>
		<td valign="top"  width="79">&nbsp;</td>  -->
	
    <td valign="top" class="t02" width="84"><a href="<%=topMenuUrl%>/front/mall/mallIndex" target="_top">网站首页</a></td>
		<td valign="top"  width="33">&nbsp;</td>
		
	<td valign="top" class="t01" width="84"><a href="<%=topMenuUrl%>/front/info/showSupplyInfoList" target="_top">供 求</a></td>
		<td valign="top"  width="25">&nbsp;</td>
		
	<td valign="top" class="t01" width="84"><a href="<%=topMenuUrl%>/front/mall/product/searchProduct-1" target="_top">产 品</a></td>
		<td valign="top"  width="25">&nbsp;</td>	
		
	<td valign="top" class="t01" width="84"><a href="<%=topMenuUrl%>/front/supplier/searchSupplier" target="_top">企 业</a></td>
		<td valign="top"  width="25">&nbsp;</td>
		
	<td valign="top" class="t01" width="84"><a href="<%=topMenuUrl%>/front/quotation/QuotationList" target="_top">行 情</a></td>
		<td valign="top"  width="32">&nbsp;</td>
		
	<td valign="top" class="t01" width="84"><a href="http://xs.cqncp.com" target="_blank">区县子站</a></td>
		<td valign="top"  width="46">&nbsp;</td>

    <td valign="top" class="t01" width="84"><a href="<%=topMenuUrl%>/front/channel/zys/home" target="_blank">专业社产品</a></td>
		<td valign="top" width="46">&nbsp;</td>
		
	<td valign="top" class="t01" width="84"><a href="http://www.aiecp.com/aiecp/75998243711877120/" target="_blank">林下产品</a></td>		
	
	
	<!--     
	<td valign="top" class="t01" width="84"><a href="<%=cp%>/front/channel/nz/home" target="_top">农资</a></td>
		<td valign="top" width="79">&nbsp;</td>
	                   

    <td valign="top" class="t01" width="84"><a href="<%=cp%>/front/channel/zszy/home" target="_top">再生资源</a></td>
		<td valign="top"  width="89">&nbsp;</td>
	
    <td valign="top" class="t01" width="84"><a href="<%=cp%>/front/channel/yhbz/home" target="_top">烟花爆竹</a></td>
	-->
    <td width="40"><img src="<%=cp%>/image/platform/dnav2.jpg" width="40" height="36" /></td>
  </tr>
</table>

<input type="hidden" name="searchTypeID" id="searchTypeID" value="sp">



<!-- 热点词检索begin  -->
<script language="javascript">
	function searchHotWords(strVal)
	{
		znsearch.keywords.value=strVal;
		znsearch.submit();
	}
	function searchSubText(stext, searchType){
		document.getElementById("searchkey").value=stext;
		if(searchType == "zx"){

			//url ="http://www.aiecp.com/aiecp/72339069014638592";
			document.getElementById("keywords").value=searchkey;
			document.search_zn.submit();
			return false;
		}	
		else if(searchType == "qy"){
			url =encodeURI("http://pubsvr.aiecp.com/asn/front/supplier/searchSupplier?searchTypeId=qy&searchkey="+stext+"");
		}
		else if(searchType == "gy"){
			url=encodeURI("http://pubsvr.aiecp.com/asn/front/info/showSupplyInfoList?searchTypeId=gy&searchkey="+stext+"");
		}
		else if(searchType == "qg"){
			url=encodeURI("http://pubsvr.aiecp.com/asn/front/info/showPurchaseInfoList?searchTypeId=qg&searchkey="+stext+"");
		}
		else if(searchType == "sp"){					
			url=encodeURI("http://pubsvr.aiecp.com/asn/front/mall/product/searchProduct-1?searchTypeId=sp&searchkey="+stext+"");
		}
		else if(searchType == "hq"){
			url=encodeURI("http://pubsvr.aiecp.com/asn/front/quotation/QuotationList?searchTypeId=hq&searchkey="+stext+"");
		}
		//searchform.action=url;
		//searchform.method="POST";
		//searchform.submit();
		window.open(url,'searchfrm');
		return false;
	}
	function searchSub(elem){
		var searchType = document.getElementById("searchTypeID").value;
		var searchkey = document.getElementById("searchkey").value;
		var url =""	;
		if(searchType == "zx"){

			//url ="http://www.aiecp.com/aiecp/72339069014638592";
			document.znsearch.keywords.value=searchkey;
			document.znsearch.submit();
			return;
		}	
		else if(searchType == "qy"){
			url =encodeURI("http://pubsvr.aiecp.com/asn/front/supplier/searchSupplier?searchTypeId=qy&searchkey="+searchkey+"");
		}
		else if(searchType == "gy"){
			url=encodeURI("http://pubsvr.aiecp.com/asn/front/info/showSupplyInfoList?searchTypeId=gy&searchkey="+searchkey+"");
		}
		else if(searchType == "qg"){
			url=encodeURI("http://pubsvr.aiecp.com/asn/front/info/showPurchaseInfoList?searchTypeId=qg&searchkey="+searchkey+"");
		}
		else if(searchType == "sp"){					
			url=encodeURI("http://pubsvr.aiecp.com/asn/front/mall/product/searchProduct-1?searchTypeId=sp&searchkey="+searchkey+"");
		}
		else if(searchType == "hq"){
			url=encodeURI("http://pubsvr.aiecp.com/asn/front/quotation/QuotationList?searchTypeId=hq&searchkey="+searchkey+"");
		}
		//elem.form.action=url;
		//elem.form.method="GET";
		//elem.form.method="POST";
		//elem.form.submit();
		
		window.open(url,"searchfrm");
	//	return false;
	}
	
</script> 

<form id="search_zn" name="znsearch" method="post" action="http://appsvr.aiecp.com:8090/bornsearch/sgsearch.do"  target="_blank">
	<input type="hidden" name="forwardType" value="out" />
	<input type="hidden" name="currentPage" value="1" />

	<input type="hidden" name="columnId" value="72057594037927936" />
	<input type="hidden" name="sitePrefix" value="aiecp" />
	<input type="hidden" name="headType" value="aiecp" />
	<input type="hidden" name="isSearchAll" value="Y" />
	<input type="hidden" name="pageWidth" value="1000" />
	<input type="hidden" name="pageHeightHeader" value="183" />
	<input type="hidden" name="pageHeightFooter" value="240" />

	<input type="hidden" id="searchType" name="searchType" value="self" />

	<input type="hidden" id="keywords" name="keywords" value="全文检索" />

</form>
<!-- 热点词检索end  -->

