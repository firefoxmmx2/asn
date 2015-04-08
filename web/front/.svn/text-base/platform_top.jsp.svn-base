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
	
	String ncpSession = "index";
	if(request.getParameter("ncpType") != null){
		ncpSession = request.getParameter("ncpType");
	}
	else if(request.getSession().getAttribute("ncpGreenMenuType") != null){
		ncpSession = request.getSession().getAttribute("ncpGreenMenuType").toString();
	}
	request.getSession().setAttribute("ncpGreenMenuType",ncpSession);
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


<link href="<%=cp%>/css/platform/mallIndex.css" type="text/css" rel="stylesheet" />  
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui-1.8rc3.custom.min.js"></script>
<script type="text/javascript" src="<%=cp%>/front/js/bcart/bcart.js"></script>
<link rel="stylesheet" href="<%=cp%>/js/bcart/bcart.css" type="text/css" /> 
<script type="text/javascript">
<!--
function show(id){	
	var arrA = new Array("index","gq","product","supplier","hq");
	for(var i=0; i<arrA.length; i++){
		if(id == arrA[i]){
			document.getElementById("ncp_"+arrA[i]).className='t02';
		}else{
			document.getElementById("ncp_"+arrA[i]).className='t01';
		}
	}			
}
//-->
</script>    
    
<table width="980" border="0" cellspacing="0" cellpadding="0" align="center" height="85">
  <tr>
    <td rowspan="2" class="logo" width="490"></td>
    <td valign="top" width="490" align="right">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0"> 
	      <tr>
	        <td height="10">&nbsp;</td>
	        <td>&nbsp;</td>
	        <td>&nbsp;</td>    
	        <td>&nbsp;</td>
	        <td>&nbsp;</td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td height="28" >&nbsp;</td>
	        <td width="77" class="litter1"><a href="http://appsvr.aiecp.com:8080/ptnsso/reLoginncp.sso?<%=cp%>/front/mall/mallIndex" target="_blank">会员登录</a></td>
	        <td width="96" class="litter2"><a href="http://appsvr.aiecp.com:8080/ptnsso/registerActionncp.sso?<%=cp%>/front/mall/mallIndex" target="_blank">新用户注册</a></td>
	        <td width="127" class="litter3"><a href="javascript:void(bcart.showCart());">购物车有(<span class="redb"><%=amount %></span>)件商品 </a></td>
	        <td width="54" class="litter4"><a href="<%=cp%>/front/mall/toConfirmInfoPage.action" target="_blank">结算</a></td>
	        <td width="91" class="litter5"><a href="<%=request.getContextPath()%>/do/queryBuyOrder.action" style="padding-left:15px;">我的订单</a></td>
	      </tr>
	    </table>
    </td>      
  </tr>                    
  <tr>
    <td height="47" align="right">
		 <table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
	      <tr>
	        <!--class="qq" class="msn" class="skype"-->
	        <td width="70" ><A href="tencent://message/?uin=1637918889&amp;Site=重庆农产品网 重庆市农产品电子商务平台 www.cqncp.com&amp;Menu=yes" style="cursor:hand"><img src="<%=cp%>/image/channel/ncp/qq.jpg" style="border:none"></A></td>
	        <td width="43" ><a href="msnim:chat?contact=ied@cqapg.com" ><img src="<%=cp%>/image/channel/ncp/msn.jpg" style="border:none"></a></td>
	        <td width="44" ><a href="callto://cp-apg/"><img src="<%=cp%>/image/channel/ncp/skype.jpg" style="border:none"></a></td>
	        <td width="260" class="phone" >&nbsp;</td>
	      </tr>
	    </table>
	</td>
  </tr>
</table>


<table width="980" height="36" border="0" align="center" cellpadding="0" cellspacing="0" class="daohang">
  <tr>
    <td  width="40"><img src="<%=cp%>/image/platform/dnav1.jpg" width="40" height="36" /></td>
	<!-- 
    <td valign="top" class="t01" width="84"><a href="http://www.aiecp.com/aiecp/76563392688553984/index.html" target="_top">网站首页</a></td>
		<td valign="top"  width="79">&nbsp;</td>  -->
	
    <td valign="top" class="<%=ncpSession.equals("index")?"t02":"t01"%>" width="84" id="ncp_index"><a href="<%=topMenuUrl%>/front/mall/mallIndex?ncpType=index" onmousedown="show('index')" target="_top">网站首页</a></td>
		<td valign="top"  width="33">&nbsp;</td>
		
	<td valign="top" class="<%=ncpSession.equals("gq")?"t02":"t01"%>" width="84" id="ncp_gq"><a href="<%=topMenuUrl%>/front/mall/info/showSupplyInfoList?ncpType=gq" onmousedown="show('gq')" target="_top">供 求</a></td>
		<td valign="top"  width="25">&nbsp;</td>
		
	<td valign="top" class="<%=ncpSession.equals("product")?"t02":"t01"%>" width="84" id="ncp_product"><a href="<%=topMenuUrl%>/front/mall/product/searchProduct-1?ncpType=product" onmousedown="show('product')" target="_top">产 品</a></td>
		<td valign="top"  width="25">&nbsp;</td>	
		
	<td valign="top" class="<%=ncpSession.equals("supplier")?"t02":"t01"%>" width="84" id="ncp_supplier"><a href="<%=topMenuUrl%>/front/mall/supplier/searchSupplier?ncpType=supplier" onmousedown="show('supplier')" target="_top">企 业</a></td>
		<td valign="top"  width="25">&nbsp;</td>
		
	<td valign="top" class="<%=ncpSession.equals("hq")?"t02":"t01"%>" width="84" id="ncp_hq"><a href="<%=topMenuUrl%>/front/mall/quotation/QuotationList?ncpType=hq" onmousedown="show('hq')" target="_top">行 情</a></td>
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

<table width="980" border="0" cellspacing="0" cellpadding="0" height="35" align="center">
  <tr>
    <td width="34"><img src="<%=cp%>/image/platform/search_l.jpg" width="34" height="35" /></td>
    <td width="912" class="search_bg"><table width="100%" height="35" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="69" class="huib">商品搜索：</td>
        <td width="275"><label>
          <input name="searchkey" id="searchkey" type="text" value="请输入搜索关键字" onfocus="if(this.value=='请输入搜索关键字')this.value='',this.style.color='#000000'" size="35" class="saerch"/>
        </label></td>
        <td width="69" align="center"><img src="<%=cp%>/image/platform/search.jpg" width="52" height="22" onclick="searchSub(this)" style="cursor:pointer;"/></td>
        <td width="66" align="left"><!-- 高级搜索 --></td>
        <td width="433" align="left" nowrap><span class="huib">热门关键词：</span>
        <a href="#" onclick="searchSubText('苹果', 'sp');"  class="gjc">苹果</a>&nbsp;&nbsp;
        <a href="#" onclick="searchSubText('蜂蜜', 'sp');"  class="gjc">蜂蜜</a>&nbsp;&nbsp;
        <a href="#" onclick="searchSubText('牛肉干', 'sp');"  class="gjc">牛肉干</a>&nbsp;&nbsp;
        <a href="#" onclick="searchSubText('米', 'sp');"  class="gjc">米</a>&nbsp;&nbsp;
        <a href="#" onclick="searchSubText('枣', 'sp');"  class="gjc">枣</a>&nbsp;&nbsp;
        <a href="#" onclick="searchSubText('牛奶', 'sp');"  class="gjc">牛奶</a>&nbsp;&nbsp;
        <a href="#" onclick="searchSubText('腊肉', 'sp');"  class="gjc">腊肉</a>&nbsp;&nbsp;
        <a href="#" onclick="searchSubText('茶', 'sp');"  class="gjc">茶</a>&nbsp;&nbsp;
        <a href="#" onclick="searchSubText('酒', 'sp');"  class="gjc">酒</a>&nbsp;&nbsp;
        </td>
        </tr>
    </table></td>
    <td width="34"><img src="<%=cp%>/image/platform/search_r.jpg" width="34" height="35" /></td>
  </tr>
</table>

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



