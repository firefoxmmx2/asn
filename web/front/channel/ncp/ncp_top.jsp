<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bornsoft.asn.bean.member.Member" %>
<%@ page import="com.bornsoft.asn.service.member.MemberService" %>
<%@ page import="com.bornsoft.asn.bean.shoppingCart.Cart" %>
<%@ page import="java.util.*" %>
<%@ page import="com.bornsoft.asn.bean.shoppingCart.CartItem" %>
<% 
	String cp = request.getContextPath(); 
	String topMenuUrl = "http://mall.cqapg.com/asn";
%>

<% 
	Object loginMemberId = request.getSession().getAttribute("loginMemberId");
	Member member = null;
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

<link href="<%=cp%>/css/channel/ncpIndex.css" type="text/css" rel="stylesheet" /> 
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui-1.8rc3.custom.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>

<script type="text/javascript" src="<%=cp%>/front/js/bcart/bcart.js"></script>
<link rel="stylesheet" href="<%=cp%>/js/bcart/bcart.css" type="text/css" /> 

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

<table width="980" border="0" cellspacing="0" cellpadding="0" align="center" height="85">
  <tr>
    <td rowspan="2" class="logo" width="310"></td>
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
        <td width="54" class="litter4"><a href="<%=cp%>/front/toConfirmInfoPage.action" target="_blank">结算</a></td>
        <td width="91" class="litter5"><a href="<%=cp%>/do/queryBuyOrder.action" style="padding-left:15px;">我的订单</a></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="47">
	 <table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
      <tr>
        <td width="236">&nbsp;&nbsp;
        	<% if(member == null){ %>
        		尊敬的用户，请登录绿色农产品网上商城！
        	<% }else{ %>
        		<span class="redb">尊敬的<%=member.getSsoAccount() %></span>用户，欢迎登录绿色农产品网上商城！
        	<% } %>	
        	</td><!--class="qq" class="msn" class="skype"-->
        <td width="70" ><A href="tencent://message/?uin=1637918889&amp;Site=绿色农产品网上商城 mall.cqapg.com&amp;Menu=yes" style="cursor:hand"><img src="<%=cp%>/image/channel/ncp/qq.jpg" style="border:none"></A></td>
        <td width="43" ><a href="msnim:chat?contact=ied@cqapg.com" ><img src="<%=cp%>/image/channel/ncp/msn.jpg" style="border:none"></a></td>
        <td width="44" ><a href="callto://cp-apg/"><img src="<%=cp%>/image/channel/ncp/skype.jpg" style="border:none"></a></td>
        <td width="260" class="phone" >&nbsp;</td>
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
	
    <td valign="top" class="t02" width="84" id="ncp_male"><a href="<%=topMenuUrl%>/front/channel/ncp/ncpIndex?type=male" onmousedown="show('male')" target="_top">商城首页</a></td>
	<td valign="top"  width="52">&nbsp;</td>

    <td valign="top" class="t01" width="84" id="ncp_hot"><a href="<%=topMenuUrl%>/front/channel/ncp/hotNcp?type=hot"  onmousedown="show('hot')" target="_top">热卖产品</a></td>
	<td valign="top" width="52">&nbsp;</td>
	

    <td valign="top" class="t01" width="84" id="ncp_ncp"><a href="<%=topMenuUrl%>/front/channel/ncp/listNcp?type=ncp"  onmousedown="show('ncp')" target="_top">农副产品</a></td>
	<td valign="top" width="52">&nbsp;</td>
	

    <td valign="top" class="t01" width="84" id="ncp_bjp"><a href="<%=topMenuUrl%>/front/channel/ncp/listNcp?type=bjp"  onmousedown="show('bjp')" target="_top">保健品</a></td>
	<td valign="top"  width="52">&nbsp;</td>
	
	<td valign="top" class="t01" width="84" id="ncp_wmcp"><a href="#"  onmousedown="show('wmcp')" target="_top">外贸产品</a></td>
	<td valign="top"  width="52">&nbsp;</td>
	
    
	<td valign="top" class="t01" width="84" id="ncp_syfw"><a href="<%=cp%>/front/channel/ncp/listNcp?type=syfw"  onmousedown="show('syfw')" target="_top">商业服务</a></td>
    <td width="40"><img src="<%=cp%>/image/channel/ncp/dnav2.jpg" width="40" height="36" /></td>
  </tr>
</table>

<input type="hidden" name="searchTypeID" id="searchTypeID" value="sp">

<% String searchkey = ""; 
	if(request.getSession().getAttribute("searchkey") == null){
		searchkey = "请输入搜索关键字";
	}else{
		searchkey = request.getSession().getAttribute("searchkey").toString();
	}
%>

<table width="980" border="0" cellspacing="0" cellpadding="0" height="35" align="center">
  <tr>
    <td width="34"><img src="<%=cp%>/image/platform/search_l.jpg" width="34" height="35" /></td>
    <td width="912" class="search_bg"><table width="100%" height="35" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="69" class="huib">商品搜索：</td>
        <td width="275"><label>
          <input name="searchkey" id="searchkey" type="text" value="<%=searchkey %>"  onfocus="if(this.value=='请输入搜索关键字')this.value='',this.style.color='#000000'" size="35" class="saerch"/>
        </label></td>
        <td width="69" align="center"><img src="<%=cp%>/image/platform/search.jpg" width="52" height="22" onclick="searchSub(this)" style="cursor:pointer;"/></td>
        <td width="66" align="left"><!-- 高级搜索 --></td>
        <td width="433" align="left"><span class="huib">热门关键词：</span>
        <a href="#" onclick="searchSubText('蜂蜜', 'sp');"  class="gjc">蜂蜜</a>&nbsp;&nbsp;
        <a href="#" onclick="searchSubText('老鸭汤 ', 'sp');"  class="gjc">老鸭汤</a>&nbsp;&nbsp;
        <a href="#" onclick="searchSubText('怡留香', 'sp');"  class="gjc">怡留香</a>&nbsp;&nbsp;
        <a href="#" onclick="searchSubText('巧克力', 'sp');"  class="gjc">巧克力</a>&nbsp;&nbsp;
        <a href="#" onclick="searchSubText('红酒 ', 'sp');"  class="gjc">红酒</a>&nbsp;&nbsp;
        <a href="#" onclick="searchSubText('豆浆粉', 'sp');"  class="gjc">豆浆粉</a>&nbsp;&nbsp;        
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
			url=encodeURI("http://mall.cqapg.com/asn/front/channel/ncp/listNcp?searchTypeId=sp&searchkey="+stext+"");
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
			url=encodeURI("http://mall.cqapg.com/asn/front/channel/ncp/listNcp?searchTypeId=sp&searchkey="+searchkey+"");
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
