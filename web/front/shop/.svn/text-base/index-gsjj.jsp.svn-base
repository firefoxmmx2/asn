<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="s" uri="/struts-tags" %>  
<%@ page import="java.util.List"  %>
<%@ page import="java.util.Map"  %>  
<%@ page import="com.bornsoft.asn.bean.product.Product"  %>  
<%@ page import="com.bornsoft.asn.bean.license.*"  %>  

<%
	String appCp=request.getContextPath();
	String shopId = request.getParameter("supplierid");
	if(shopId==null || shopId.trim().length()<=0)
		shopId="";
		
		List list = (List)request.getAttribute("productSupply");
		
	String colorName = "orange";//orange,blue,red,green
	if(colorName==null || colorName.trim().length()<=0)
		colorName="green";
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><s:property value="member.fullName" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link href="<%=appCp%>/front/shop/css/<%=colorName%>.css" rel="stylesheet" type="text/css" />

<script language="JavaScript" type="text/JavaScript">
<!--
function AddFavorite(sURL, sTitle)
{
    try
    {
        window.external.addFavorite(sURL, sTitle);
    }
    catch (e)
    {
        try
        {
            window.sidebar.addPanel(sTitle, sURL, "");
        }
        catch (e)
        {
            alert("加入收藏失败，请使用Ctrl+D进行添加");
        }
    }
}
function SetHome(obj,vrl){
        try{
                obj.style.behavior='url(#default#homepage)';obj.setHomePage(vrl);
        }
        catch(e){
                if(window.netscape) {
                        try {
                                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
                        }
                        catch (e) {
                                alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。");
                        }
                        var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
                        prefs.setCharPref('browser.startup.homepage',vrl);
                 }
        }
}
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>


<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/butil.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/facebox/facebox.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jcarousel-0.2.4/lib/jquery.jcarousel.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jqzoom_ev1.0.1/js/jqzoom.pack.1.0.1.js"></script>

</head>

<body>
<!--头部开始-->
<table width="959" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="495" height="25">&nbsp;</td>
    <td><img src="<%=appCp%>/front/shop/images/fhsy.jpg" width="14" height="25" /></td>
    <td nowrap width="63" valign="middle"><a href="http://www.aiecp.com/aiecp/72057594037927936/index.html" target="_top">返回平台首页</a></td>
    <td><img src="<%=appCp%>/front/shop/images/cpzx.jpg" width="16" height="25" /></td>
    <td width="61" valign="middle"><a href="http://pubsvr.aiecp.com/asn/front/cate0" target="_top">产品中心</a></td>
    <td><img src="<%=appCp%>/front/shop/images/gys.jpg" width="15" height="25" /></td>
    <td width="62" valign="middle"><a href="http://pubsvr.aiecp.com/asn/front/supplier/searchSupplier" target="_top">供应商</a></td>
    <td><img src="<%=appCp%>/front/shop/images/gqxx.jpg" width="16" height="25" /></td>
    <td width="61" valign="middle"><a href="http://pubsvr.aiecp.com/asn/front/info/showInfoMain" target="_top">供求信息</a></td>
    <td ><img src="<%=appCp%>/front/shop/images/jrsc.jpg" width="14" height="25" /></td>
    <td width="63" valign="middle"><a href="#" onclick="AddFavorite('http://pubsvr.aiecp.com/asn/index.jsp?id=xxx','某某企业')">加入收藏</a></td>
    <td><img src="<%=appCp%>/front/shop/images/swsy.jpg" width="12" height="25" /></td>
    <td valign="middle"><a href="#" onclick="SetHome(this,'http://pubsvr.aiecp.com/asn/index.jsp?id=xxx')">设为首页</a></td>
  </tr>
</table>
<!--头部结束-->
<!--banner开始-->
<table width="959" height="195" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top" class="banner"><span><s:property value="member.fullName" /></span></td>
  </tr>
</table>
<!--banner结束-->
<!--导航开始-->
<table border="0" align="center" cellpadding="0" cellspacing="0" width="959">
  <tr>
    <td width="40" class="nav_bg">&nbsp;</td>
    <td class="nav_bg"><a href="./supplierShopSy?supplierid=<%=shopId%>">首页</a></td>
    <td width="110" class="nav_bg"><a href="./supplierShopGycp?supplierid=<%=shopId%>">供应产品</a></td>
    <td width="110" class="nav_01"><a href="./supplierShopGsjj?supplierid=<%=shopId%>">公司简介</a></td>
    <td width="110" class="nav_bg"><a href="./supplierShopQydt?supplierid=<%=shopId%>">企业动态</a></td>
    <td width="110" class="nav_bg"><a href="./supplierShopZzry?supplierid=<%=shopId%>">资质荣誉</a></td>
    <td width="110" class="nav_bg"><a href="./supplierShopRczp?supplierid=<%=shopId%>">人才招聘</a></td>
    <td width="110" class="nav_bg"><a href="./supplierShopLxfs?supplierid=<%=shopId%>">联系方式</a></td>
    <td width="110" class="nav_bg"></td>
	<td width="39" class="nav_bg">&nbsp;</td>
  </tr>
</table>
<!--导航结束-->


<!--主题部分开始-->
<table width="959" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:8px;">
  <tr>
  <!--左边部分begin-->
    <td width="201" valign="top">
    	
	    <table width="201" height="285" border="0" cellpadding="0" cellspacing="0" align="top">
      <tr>
      	<td height="27" class="left_title"><span>相关信息</span></td>
      </tr>
      <tr>
      	<td height="260" valign="top" class="line_orange">
	        <input type="hidden" name="supplier.reviewAverage" title="综合评价" value="<s:property value="supplier.reviewAverage" /> "/>
					<input type="hidden" name="supplier.reviewProduct" title="货网相符" value="<s:property value="supplier.reviewProduct" /> "/>
					<input type="hidden" name="supplier.reviewDelivery" title="发货速度" value="<s:property value="supplier.reviewDelivery" /> "/>
					<input type="hidden" name="supplier.reviewCommunication" title="服务态度" value="<s:property value="supplier.reviewCommunication" /> "/>
          <table height="291" width="100%" class="gys_info">
					<tr>
						<td align="center" class="gys_name" height="40"><s:property value="member.shortName"/></td>
					</tr>
					<tr>
						<td class="gys_left" height="25"><b>供应商信用：</b><div id="tReview"></div></td>
					</tr>
					<tr>
						<td class="gys_left" height="25"><b>供应商类型：</b><s:if test="member.memberType == 1">单位</s:if><s:elseif  test="member.memberType == 2">个人</s:elseif></td>
					</tr><!--
					<tr>
						<td class="gys_left" height="25"><b>证件图片：</b><a href="${pageContext.request.contextPath }/pic/member/big_member_<s:property value="member.memberId"/>.jpg" rel="facebox"><img src="${pageContext.request.contextPath }/pic/member/sml_member_<s:property value="member.memberId"/>.jpg"></img></a></td>
					</tr>-->
					<tr>
						<td class="gys_left" height="25"><b>电话：</b><s:if test="member.fixedPhone == null || member.fixedPhone == 'null'">暂无</s:if><s:else><s:property value="member.fixedPhone"/></s:else></td>
					</tr>
					<tr>
						<td class="gys_left" height="25"><b>地址：</b><s:if test="member.address == null || member.address == 'null'">暂无</s:if><s:else><s:property value="member.address"/></s:else></td>
					</tr>
					<%if(request.getAttribute("member.qq") != null){ %>
					<tr>
						<td class="gys_left" height="25"><a target=blank href=http://wpa.qq.com/msgrd?V=1&Uin=<%=request.getAttribute("member.qq")%>&Exe=QQ&Site=望龙门—农业综合服务网络平台&Menu=yes><img border="0" SRC=http://wpa.qq.com/pa?p=3:<%=request.getAttribute("member.qq")%>:3></a></td>
					</tr>
					
					<% } %>								
					
					<tr>
						<td class="gys_left" height="25"><b>邮编：</b><s:if test="member.zip == null || member.zip == 'null'">暂无</s:if><s:else><s:property value="member.zip"/></s:else></td>
					</tr>
					<tr>
						<td class="gys_left" height="25"><b>邮箱：</b><s:if test="member.email == null || member.email == 'null'">暂无</s:if><s:else><s:property value="member.email"/></s:else></td>
					</tr>					
				</table>
                  	
                  	
     	</td>
      </tr>
      </table>
    
	</td>
    <!--左边部分 end-->
    
    
    <td>&nbsp;</td>
    
	<!--右边部分-->
    <td width="750" valign="top">
			<table width="750" height="412" border="0" cellpadding="0" cellspacing="0">
	  	<tr>
    		<td height="27" class="right_title">
	    	<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="35"></td>
                <td width="650">公司简介</td>
                <td width="65" align="center" class="more"></td>
            </tr>
        </table>
				</td>
  		</tr>
  		<tr>
    		<td height="385" valign="top" class="line_orange">
					  			
    			<br>
    			<!-- begin -->
    			<%
    			Object introduction = request.getAttribute("supplier.introduction");
    			%>
    			<%=(introduction==null)?"暂无内容":introduction.toString() %>
					<!--end -->
									
    		</td>
  </tr>
</table>
    
    
	</td>
  </tr>
</table>
<!--主题部分结束-->


<!--foot开始-->
<br><br><br>
<table width="959" border="0" align="center" cellpadding="0" cellspacing="0" class="wz-12" bgcolor="#ffffff" height="107">
<tr>
</tr>
<tr>
  <td align="center" height="20"> @ 2009 版权所有 <a href="http://www.cqxh.com.cn/" target="_blank">新合集团</a></td>
</tr>
<tr>         
  <td align="center" height="20">地址：中国重庆市渝中区新华路216号 电话：+86 23 63824458</td>
</tr>
<tr>
  <td align="center" height="20">国际中文域名:<a href="http://www.aiecp.com/" target="_blank">www.望龙门.com</a> 
    　　<a href="http://www.aiecp.com" target="_blank">www.旺龙门.com</a></td>
</tr>
<tr>
  <td align="center" height="20">呼叫中心热线：+86 23 86312316</td>
</tr>
<tr>
	<td align="center" height="20">渝ICP备05009208号 </td>
</tr>
<tr>
	<td height="15"></td>
</tr>
</table>
<!--foot结束-->



<script type="text/javascript">
function addBookmark() {
	   
	var url=window.location.href;
	var _name=document.getElementById("productName").value;
	var title="望龙门--"+_name;
   if (window.sidebar) { 
    window.sidebar.addPanel(title, url,""); 
  } else if( document.all ) {
   window.external.AddFavorite( url, title);
  } else if( window.opera && window.print ) {
    return true;
   }
}

/**立即加入购物车*/
function immIntoShopCart(product,quantity,proname,imgurl,_price,supplierId){
    var v= document.getElementById("pro_count").value;
   if(parseFloat(v)<parseFloat($('#s_count').val())){
         alert("对不起,购买量不能小于起订量");
         return false;
        }else{
             bcart.addItem(product, v, supplierId);
          }
}

function flipContent(tab_id) {	
	var arry = new Array('miaosu','pifa','yfei','jiaoyi','plxq');
	for(var i =0;i<arry.length ;i++){
		if(arry[i] == tab_id){
			document.getElementById("pro"+arry[i]).className = "other_selected";
			document.getElementById(arry[i]).style.display = "block";
		}else{
			document.getElementById("pro"+arry[i]).className = "other_noselected";
			document.getElementById(arry[i]).style.display = "none";
		}
	}   
}

//++++++++++++多图缩放 BY HOOXIN
pic_list = [];

$(document).ready(function($){
	
	$('a[rel=jqzoom]').facebox({
		loadingImage:'/asn/js/facebox/loading.gif',
		closeImage:"/asn/js/facebox/closelabel.gif"
	});
	$('a[rel=facebox]').facebox({
		loadingImage:'/asn/js/facebox/loading.gif',
		closeImage:"/asn/js/facebox/closelabel.gif"
	});
	//初始化评价信息
	showReView($("#tReview").get(0));
	
	$("#facebox").click(function() { $('.close',this).click(); });
	

	$a = $("a[rel=jqzoom]").jqzoom({
		zoomWidth : 300,
		zoomHeight : 300,
		lens: true,
		title:false,
		position : "right"
	});

	
	pic_list = getPicList();
	var smaillpic = $(".jcarousel-skin-tango").jcarousel({
		size: pic_list.length,
        itemLoadCallback: {onBeforeAnimation: picbox_load}
	});
	$(".jcarousel-skin-tango").css("margin", "2px");
	$(".jcarousel-container").css("border","0px").css("background","none");
	smaillpic.find("img").mouseover(function(){
		sml_src = $(this).attr("src");
		big_src = $(this).attr("big");
		$("#pdtzoom").attr("href",big_src);
		$("#pdtzoom").find("img").attr("src",big_src);
		//鼠标效果
		$(this).css("border","2px solid #82ACD5");
	});
	smaillpic.find("img").mouseout(function(){
		//鼠标移开效果
		$(this).css("border","0px");
	});
});

//得到图片列表
function getPicList(){
	smallList = [];
	smallList.push($("input:hidden[name=product.smallPicPath]").val());
	bigList = [];
	bigList.push($("input:hidden[name=product.bigPicPath]").val());
	for(i=1;i<=3;i++){
		tmp = $("input:hidden[name=product.smallPicPath"+i+"]").val();
		if(tmp != null && tmp != "")
			smallList.push(tmp);
		tmp = $("input:hidden[name=product.bigPicPath"+i+"]").val();
		if(tmp != null && tmp != "")
			bigList.push(tmp);
	}
	picList = [];
	for(i=0 ; i < smallList.length; i++){
		pic = {sml:smallList[i],big:bigList[i]};
		picList.push(pic);
	}
	return picList;
}

function picbox_load(picbox,state) {
	 for (var i = picbox.first; i <= picbox.last; i++) {
	        if (picbox.has(i)) {
	            continue;
	        }
	        if (i > pic_list) {
	            break;
	        }

	        picbox.add(i, picbox_getItem(pic_list[i-1]));
			if(state == "next" || state =="prev"){
				$(picbox.list).find("img").unbind("mouseover");
				$(picbox.list).find("img").unbind("mouseout");
				$(picbox.list).find("img").mouseover(function(){
	        		sml_src = $(this).attr("src");
	        		big_src = $(this).attr("big");
	        		$("#pdtzoom").attr("href",big_src);
	        		$("#pdtzoom").find("img").attr("src",big_src);
	        		//鼠标效果
	        		$(this).css("border","2px solid #82ACD5");
	        	});
				$(picbox.list).find("img").mouseout(function(){
	        		//鼠标移开效果
	        		$(this).css("border","0px");
	        	});
			}	        
	 }
	 
}

function picbox_getItem(it) {
	return '<img src="' + it.sml + '" big="'+it.big+'" style="width:55px;height:55px" />';
}

function showReView(reViewObj){
	table = "<table>";
	reviews = $("input:hidden[name=supplier.reviewAverage],"+
			"input[name=supplier.reviewProduct]," +
			"input[name=supplier.reviewDelivery]," +
			"input[name=supplier.reviewCommunication]");
	for(i=0;i<reviews.length;i++)
	{
		table += "<tr>";
		table += "<td>";
		table += reviews[i].title +": ";
		for(j = 0; j<reviews[i].value; j++)
			{
				table += "<img src='/asn/front/product/images/xinyong.gif'>";
			}
		
		table += "</td>";
		table += "</tr>";
	}
	table += "</table>";
	
	$(reViewObj).html(table);
}
</script>

</body>
</html>
