<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@page import="com.bornsoft.asn.service.facade.FacadeService"%>
<%@page import="com.bornsoft.asn.bean.facade.ProductFacade"%>
<%@page import="java.util.List"%>
<%@page import="com.bornsoft.asn.bean.product.Product" %>

<%@page import="com.bornsoft.asn.service.product.ProductCustomPropertyService" %>
<%@page import="com.bornsoft.asn.bean.product.ProductCustomProperty" %>

<% 
	String cp = request.getContextPath(); 
	String pubSvrUrl = "http://pubsvr.aiecp.com/asn";

	String template = (String)request.getAttribute("template");
	String addUrla = "";
	if(template!=null&&template.trim().length()>0)
		addUrla = "&template="+template;
	String addUrlb = "";
	if(template!=null&&template.trim().length()>0)
		addUrlb = "?template="+template;
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>产品详细页面1</title>
<link href="/asn/front/product/css/productInfo.css" type="text/css" rel="stylesheet" />
<!-- facebox -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/facebox/facebox.js"></script>
<link href="${pageContext.request.contextPath}/js/facebox/facebox.css" media="screen" rel="stylesheet" type="text/css" />
<!-- picbox -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jqzoom_ev1.0.1/js/jqzoom.pack.1.0.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/jqzoom_ev1.0.1/css/jqzoom.css"
	type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jcarousel-0.2.4/lib/jquery.jcarousel.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/jcarousel-0.2.4/skins/tango/skin.css"
	type="text/css">
	


</head>

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
             bcart.addItem(product, v, supplierId,'<%=template%>');
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

// 此方法我立即订购用的，多为活动按钮，不走购物车步骤
function  buyNow(productId,supplierId){
	var url = "~/front/mall/shoppingCart/toShoppingCart"; 
	var pro_count = document.getElementById("pro_count").value;
	var param = { productId:productId, count:pro_count, supplierId:supplierId};
	if(butil.getUrl(url,param,"","post") != null){
		window.location.href=butil.fullPath("~/front/mall/toConfirmInfoPage.action");
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


<body>
<style type="text/css"> 
.jcarousel-skin-tango .jcarousel-next-horizontal:hover{background-position:-12px -189px;}
.jcarousel-skin-tango .jcarousel-next-horizontal:active{background-position:-12px -126px;}
.jcarousel-skin-tango .jcarousel-next-disabled-horizontal,
.jcarousel-skin-tango .jcarousel-next-disabled-horizontal:hover,
.jcarousel-skin-tango .jcarousel-next-disabled-horizontal:active{cursor:default;background-position:-12px -63px;}
.jcarousel-skin-tango .jcarousel-next-horizontal{position:absolute;top:0px;right:0px;width:11px;height:62px;cursor:pointer;background:transparent url(/asn/image/movebar.jpg) no-repeat -12px 0px;}
.jcarousel-skin-tango .jcarousel-prev-horizontal{position:absolute;top:0px;left:0px;width:11px;height:62px;cursor:pointer;background:transparent url(/asn/image/movebar.jpg) no-repeat 0 0px;}
.jcarousel-skin-tango .jcarousel-prev-horizontal:hover{background-position:0 -189px;}
.jcarousel-skin-tango .jcarousel-prev-horizontal:active{background-position:0 -126px;}
.jcarousel-skin-tango .jcarousel-prev-disabled-horizontal,
.jcarousel-skin-tango .jcarousel-prev-disabled-horizontal:hover,
.jcarousel-skin-tango .jcarousel-prev-disabled-horizontal:active{cursor:default;background-position:0 -63px;}
.jcarousel-skin-tango .jcarousel-container-horizontal {
	margin-left: 4px;
	margin-right:4px;
	padding:2px 10px;
	width:310px;
}
.jcarousel-skin-tango .jcarousel-clip-horizontal {
	height:60px;
	width:320px;
}
.jcarousel-skin-tango .jcarousel-item {
	height:60px;
	width:60px;
}
</style>

<form action="">
<s:hidden name="product.productName" id="productName"></s:hidden>
<%-- 多图缩放 --%>
<s:hidden name="product.bigPicPath"></s:hidden>
<s:hidden name="product.bigPicPath1"></s:hidden>
<s:hidden name="product.bigPicPath2"></s:hidden>
<s:hidden name="product.bigPicPath3"></s:hidden>
<s:hidden name="product.smallPicPath"></s:hidden>
<s:hidden name="product.smallPicPath1"></s:hidden>
<s:hidden name="product.smallPicPath2"></s:hidden>
<s:hidden name="product.smallPicPath3"></s:hidden>
<input type="hidden" name="supplier.reviewAverage" title="综合评价" value="<s:property value="supplier.reviewAverage" /> "/>
<input type="hidden" name="supplier.reviewProduct" title="货网相符" value="<s:property value="supplier.reviewProduct" /> "/>
<input type="hidden" name="supplier.reviewDelivery" title="发货速度" value="<s:property value="supplier.reviewDelivery" /> "/>
<input type="hidden" name="supplier.reviewCommunication" title="服务态度" value="<s:property value="supplier.reviewCommunication" /> "/>
<s:hidden name="product.startOrderCount" id="s_count"></s:hidden>


<table width="980" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="padding-top:8px;">
	<tr>
		<td><table width="980" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="190" valign="top"><table width="190" height="350" cellpadding="0" cellspacing="0">
						<tr>
							<td background="<%=cp %>/front/product/images/left_title.gif" height="25" class="gys_title">供应商信息</td>							
						</tr>
						<tr> 
							<td><table height="291" width="100%" class="gys_info">
								<tr>
									<td align="center" class="gys_name" height="40"><s:if test="member.shortName==null"><s:property value="member.fullName"/></s:if><s:else> <s:property value="member.shortName"/></s:else></td>
								</tr>
								
								<!--<tr>
									<td style="padding-left:5px;" height="25">供应商等级：
									<img src="/asn/front/product/images/dengji01.gif">
									<img src="/asn/front/product/images/dengji01.gif">
									<img src="/asn/front/product/images/dengji01.gif">
									<img src="/asn/front/product/images/dengji01.gif">
									<img src="/asn/front/product/images/dengji02.gif">
									</td>
								</tr>-->
								<tr>
									<td class="gys_left" height="25">供应商信用：<div id="tReview"></div></td>
								</tr>
								<tr>
									<td class="gys_left" height="25">供应商类型：<s:if test="member.memberType == 1">单位</s:if><s:elseif  test="member.memberType == 2">个人</s:elseif></td>
								</tr>
								<tr>
									<td class="gys_left" height="25">证件图片：<a href="${pageContext.request.contextPath }/pic/member/big_member_<s:property value="member.memberId"/>.jpg" rel="facebox"><img src="${pageContext.request.contextPath }/pic/member/sml_member_<s:property value="member.memberId"/>.jpg"></img></a></td>
								</tr>
								<tr>
									<td class="gys_left" height="25">电话：<s:if test="member.fixedPhone == null || member.fixedPhone == 'null'">暂无</s:if><s:else><s:property value="member.fixedPhone"/></s:else></td>
								</tr>
								<tr>
									<td class="gys_left" height="25">地址：<s:if test="member.address == null || member.address == 'null'">暂无</s:if><s:else><s:property value="member.address"/></s:else></td>
								</tr>
								<%if(request.getAttribute("member.qq") != null){ %>
								<tr>
									<td class="gys_left" height="25"><a target=blank href=http://wpa.qq.com/msgrd?V=1&Uin=<%=request.getAttribute("member.qq")%>&Exe=QQ&Site=望龙门—农业综合服务网络平台&Menu=yes><img border="0" SRC=http://wpa.qq.com/pa?p=3:<%=request.getAttribute("member.qq")%>:3></a></td>
								</tr>
								
								<% } %>								
								
								<tr>
									<td class="gys_left" height="25">邮编：<s:if test="member.zip == null || member.zip == 'null'">暂无</s:if><s:else><s:property value="member.zip"/></s:else></td>
								</tr>
								<tr>
									<td class="gys_left" height="25">邮箱：<s:if test="member.email == null || member.email == 'null'">暂无</s:if><s:else><s:property value="member.email"/></s:else></td>
								</tr>
								<tr>
									<td class="gys_left" height="35" align="center" valign="bottom">
									   <a href="${pageContext.request.contextPath }/front/shop/supplierShopSy?supplierid=<s:property value="member.memberId"/>" target="_blank">
									      <img src="/asn/front/product/images/jrqywz.gif" border="0">
									   </a>
									</td>
								</tr>								
							</table>
							</td>
						</tr>
						<tr>
							<td height="18" background="/asn/front/product/images/left_foot.gif">&nbsp;</td>
						</tr>
					</table>	
					
					<%
						List<Product> pList=(List<Product>)request.getAttribute("supOtherProduct"); 						
						if(pList.size() > 0){
					%>
					<table width="190" cellpadding="0" cellspacing="0" style=" margin-top:10px;">
						<tr>  
							<td background="/asn/front/product/images/left_title.gif" height="25" class="gys_title">该商家其它商品</td>							
						</tr>
						<tr> 
							<td class="hot_title">
							   <table width="170" align="center">
								
								  <%for(int i=0;i<pList.size();i++){%>
								      <%if(i==0) {%>
								           <tr>
									<td height="100" style="border-bottom:1px #e6e6e6 solid;" valign="top">
										<table width="100%">
											<tr>
												<td>
												  <a href="product/displayDetailProduct.action?productId=<%=pList.get(i).getProductId() %><%=addUrla %>">
												    <img src="<%=request.getContextPath()%><%=pList.get(i).getBigPicPath()%>" height="80" width="80"style="border:1px solid #DADADA; padding:2px;">
												  </a>
												</td>
												<td  valign="top">
												   <table>
													<tr>
													   <td>
													      <img src="/asn/front/product/images/top1.gif" >
													   </td>
													</tr>
													<tr>
													    <td style="color:#000000;">
													        <strong>
       													         <a href="product/displayDetailProduct.action?productId=<%=pList.get(i).getProductId()%><%=addUrla %>">
													               <%=pList.get(i).getProductName() %>
													             </a>
													        </strong>
													    </td>
													</tr>
												   </table>
												</td>
											</tr>
										</table>
									</td>
								    </tr>
								      <%} %>
								       <%if(i!=0) {%>
								        <tr>
									       <td  class="hot_line" height="30"><span><%=i+1 %></span><a href="product/displayDetailProduct.action?productId=<%=pList.get(i).getProductId()%><%=addUrla %>"><%=pList.get(i).getProductName() %></a></td>
								        </tr>
								     <%}%>
						
								  <%} %>
								 
								 
							</table>
							</td>
						</tr>	
						<tr><td><img src="/asn/front/product/images/left_foot2.gif" width="190" height="10" /></td></tr>					
					</table>
					<% } %>
					
					
					<table width="100%" cellpadding="0" cellspacing="0" style=" margin-top:10px;">
						<tr>
							<td height="80" align="center"><img src="/asn/front/product/images/left_img02.gif"></td>
						</tr>
						<tr>
							<td height="80" align="center"><img src="/asn/front/product/images/left_img03.gif"></td>
						</tr>
						<tr>
							<td height="80" align="center"><img src="/asn/front/product/images/left_img04.gif"></td>
						</tr>
					</table>		
			  </td>
				
				<!--- 右边-->
				<td width="780" valign="top"><table width="780" cellpadding="0" cellspacing="0"  style="margin-left:10px;" >
					<tr>
						<td class="pro_name" height="20" valign="top" style="border-bottom:1px #DBDBDB solid;"><s:property value="product.productName"/>&nbsp;&nbsp;&nbsp;(商品编号：<s:property value="product.productNumber" />)</td>
					</tr>
					
					<tr>
						<td><table width="100%" cellpadding="0" cellspacing="0" style="margin-top:2px;">
							<tr>
								<td width="350" valign="top"><table width="100%" cellpadding="0" cellspacing="0">
									<tr>
										<td class="pro_img" width="350" align="center" height="320">
											<a id="pdtzoom" href="<s:property value="product.bigPicPath"/>" rel="jqzoom"> 
												<img src="<s:property value="product.bigPicPath"/>" border="0" width="300" height="300">
											</a>
										</td>
									</tr>									
									</table>
									
									<table width="100%" cellpadding="0" cellspacing="0" style="padding-top:5px;">
										<tr>
											<td> <div id="smaillpic"><ul class="jcarousel-skin-tango"></ul></div> </td>
										</tr>																		
									</table>
									
									<table width="100%" cellpadding="0" cellspacing="0">
										<tr>
											<td width="60">&nbsp;</td>
											<td height="20" align="center"><img src="/asn/front/product/images/fdj.gif">&nbsp;点击看大图</td>
											<td align="center"><img src="/asn/front/product/images/sc.gif">&nbsp;<font color="#3f83b8"><a href=javascript:addBookmark()>收藏该产品</a></font></td>
											<td width="60">&nbsp;</td>
										</tr>									
									</table>
								</td>
								
								<td width="418" class="pro_xx" valign="top">
									<table width="418" class="pro_info1" border="0">
										<tr>
											<td nowrap height="23" width="66" >商 城 价：</td>
											<td style="font-size:18px" colspan="3">
												<s:if test="product.price1 ==null">
													<font color="green"><strong>价格面议</strong></font>
												</s:if>
												<s:else>
													<font color="#FF0000"><strong><s:property value="product.price1"/>元/<s:property value="product.productUnit"/></strong></font>
												</s:else> 
											</td>
										</tr>
										<tr>
											<td height="23" width="60">市 场 价：</td>
											<td style="text-decoration: line-through" colspan="2" width="100">
												<s:if test="product.marketPrice ==null">
													&nbsp;
												</s:if>
												<s:else>
													<s:property value="product.marketPrice"/>元/<s:property value="product.productUnit"/>
												</s:else>
											</td>
											<td>
												<s:if test="product.marketPrice ==null">
													&nbsp;
												</s:if>
												<s:else>
													（为您节省：<s:property value="Calculator.keepTwoDecimal(product.marketPrice - product.price1)"/>元）
												</s:else>
											</td>
										</tr>
										<tr>
											<td height="23" width="60">运输费用：</td>
											<td colspan="3">
												<s:if test='product.postType=="2"'>
													平邮：<strong><s:property value="dalivery.post"/></strong>&nbsp;元 &nbsp;&nbsp;
													快递：<strong><s:property value="dalivery.express"/></strong>&nbsp;元&nbsp;&nbsp;
													EMS：<strong><s:property value="dalivery.ems"/></strong>&nbsp;元
												</s:if>
												<s:elseif test='product.postType=="0"'>卖家承担</s:elseif>
												<s:elseif test='product.postType=="1"'>联系卖家商定</s:elseif>											
											</td>
										</tr>
										<tr>
											<td height="23" width="60">起 订 量：</td>
											<td><s:property value="product.startOrderCount"/> <s:property value="product.productUnit"/></td>
											<td height="23" width="60">已预订量：</td>
											<td><s:property value="product.reservedCount"/> <s:property value="product.productUnit"/></td>
										</tr>
										<tr>
											<td height="23" width="60">累计出售：</td>
											<td><s:property value="product.saleCount"/> <s:property value="product.productUnit"/></td>
											<td height="23" width="60">库 存 量：</td>
											<td><s:property value="product.wareCount-product.saleCount"/> <s:property value="product.productUnit"/></td>
										</tr>									
									</table>
									
									
									<table width="418" class="pro_info2">
										<tr>
											<td width="60" height="20">服务保障：</td>
											<td><img src="/asn/front/product/images/cx16_1.gif" width="16" height="16" hspace="0" vspace="0"/></td>
										</tr><!--
										<tr>
											<td width="60" height="38">买家承诺：</td>
											<td><font color="#003366">如是描述,如未履行，</font>我们将按规则支持买家申请先行赔付.</td>
										</tr>-->
									</table>
									
									<table width="418" class="pro_info2">
										<tr>
											<td width="60" align="center"><img src="/asn/front/product/images/cx16_5.gif" width="23" height="24" /></td>
											<td>卖家已提交保证金，加入<span class="top_fla"><a href="#">消费者保障服务</a></span>。
											<br/>
											卖家承诺： <img src="/asn/front/product/images/cx16_3.gif" width="16" height="16" />如实描述 <br/>
											如未履行，我们将按规则支持买家申请先行赔付
											</td>
										</tr>
									</table>
									
									<table width="418" class="pro_info3" border="0">
									<tr><td height="2"></td></tr>
										<tr>											
											<td height="20" width="66">付款方式：</td>
											<td width="60"><a href=javascript:flipContent("jiaoyi")>银行转账</a></td>
											<td style="valign:middle" width="22" align="right"><img src="/asn/front/product/images/yhcard.png" width="24" height="20"></td><td width="60" align="left"><a href=javascript:flipContent("jiaoyi")>网上银行</a></td>
											<td width="60" align="left"><a href=javascript:flipContent("jiaoyi")>支付宝</a></td><!--
											<td width="60" align="left"><a href=javascript:flipContent("jiaoyi")>快钱</a></td>-->
											<td>&nbsp;</td>
										</tr>										
								  </table>
									 <table width="418" class="pro_info2">
										<tr>											
											<td height="30" width="70">商品评分：</td>	
											<td><img src="/asn/front/product/images/dengji01.gif">
												<img src="/asn/front/product/images/dengji01.gif">
												<img src="/asn/front/product/images/dengji01.gif">
												<img src="/asn/front/product/images/dengji01.gif">
												<img src="/asn/front/product/images/dengji02.gif">
												<font color="#003366"><a href=javascript:flipContent("plxq")>（已经有275人评分）</a></font>	
											</td>											
										</tr>										
									 </table>
									
									
									  <table width="418" height="100" class="pro_info4">
									    <s:if test='product.webOrder=="Y"'>
											<tr>											
												<td>我要买											
												<s:if test="%{product.wareCount <= 3}">
												<input type="text" size="6" id="pro_count" readonly="readonly" onkeyup="this.value=this.value.replace(/[^\d,\.]/g,'')"  value="<s:property value="product.startOrderCount"/>" style="border:#e9d162 1px solid;"><s:property value="product.productUnit"/>
												</s:if>
												<s:else>
													<input type="text" onblur="if(this.value > <s:property value="product.wareCount"/>){this.value=<s:property value="product.startOrderCount"/>}" size="6" id="pro_count" onkeyup="this.value=this.value.replace(/[^\d,\.]/g,'')"  value="<s:property value="product.startOrderCount"/>" style="border:#e9d162 1px solid;"><s:property value="product.productUnit"/>
												</s:else>													
												</td>
												
											</tr>	
											<tr>								    
												
											    <td width="55%">
											    
											    	<s:if test="product.price1 ==null">
														<img  src="/asn/front/product/images/gwc.gif" border="0" >
													</s:if>
													<!--  ****立即订购，活动用*** -->
													<s:elseif test="%{product.wareCount <= 3}">														
														<img src="/asn/front/product/images/ljdg.gif" border="0" onclick="buyNow('<s:property value="product.productId"/>','<s:property value="member.memberId"/>')" style="cursor: pointer;">
													</s:elseif> 
													
													<!--  ****普通订购*** -->
													<s:else>
														<a href="javascript:"  onClick="javascript:immIntoShopCart('<s:property value="product.productId"/>','<s:property value="product.startOrderCount"/>','<s:property value="product.productName"/>','<s:property value="product.smallPicPath"/>','<s:property value="product.price"/>','<s:property value="member.memberId"/>','<s:property value="member.fullName"/>')">
												         <img  src="/asn/front/product/images/gwc.gif" border="0" >
												       </a>
													</s:else>											       
											    </td>
											</tr>
										</s:if>
										<s:else>
						                   <tr>
						                      <td>
						                                                                   该产品目前不支持网上订购，欢迎联系洽谈
						                      </td>
						                   </tr>
		                                </s:else>				
								     </table>
								     
								     <table width="418">
										<tr>
											<td height="23" width="60">所 在 地：</td>
											<td colspan="3"><s:property value="member.area"/></td>
										</tr>	
										<tr>
											<td height="23" width="60">浏览次数：</td>
											<td><s:property value="product.viewCount"/> 次</td>										
											<td height="23" width="60">联 系 人：</td>
											<td><s:if test='member.contactor==null'>暂无</s:if>
												<s:else><s:property value="member.contactor"/></s:else></td>
										</tr>																	
									</table>
								 
								  
								</td>
							</tr>
							</table>
						</td>						
					</tr>
					
					<tr>
						<td>
						  <table  width="780" cellpadding="0" cellspacing="0" class="pro_other" >
								<tr>
									<td height="27" align="center" class="other_selected" id="promiaosu" onmousedown="flipContent('miaosu')" style="cursor:pointer;">商品描述</td>
									<td align="center" class="other_noselected" id="propifa" onmousedown="flipContent('pifa')" style="cursor:pointer;">批发说明</td>
									<td align="center" class="other_noselected" id="proyfei" onmousedown="flipContent('yfei')" style="cursor:pointer;">配送方式</td>
									<td align="center" class="other_noselected" id="projiaoyi" onmousedown="flipContent('jiaoyi')" style="cursor:pointer;">付款方式</td>
									<td align="center" class="other_noselected" id="proplxq" onmousedown="flipContent('plxq')" style="cursor:pointer;">评价详情</td>
									<td width="250" >&nbsp;</td>
								</tr>								
							</table>
							
							<table  id="miaosu" width="775" cellpadding="0" cellspacing="0" class="other_con">
								<tr><td height="10"></td></tr>
					            <%
					            String value=(String)request.getAttribute("product.facade");
				                if(value!=null)
				                {
				                %>
								<tr>
									<td class="other_con_title" height="30">商品参数</td>
   								</tr>
						        <% 
						        	List<ProductFacade> list=new FacadeService().parseFacade(value);
						            for(ProductFacade facade : list)
						            {
						        %>
			                  	<tr>
									<td height="25">【<%=facade.getName()%>】：<%=facade.getValue()%></td>
							  	</tr>
						        <%
						        	}
						       	}
						       	%>
															
								<%
								try{
								Integer pid = ((Long)request.getAttribute("productId")).intValue();
								List<ProductCustomProperty> listProperty= ProductCustomPropertyService.getProductCustomPropertyList(pid);
								if(listProperty!=null&&listProperty.size()>0)
								{
									for(ProductCustomProperty pcp : listProperty)
									{
								%>
								<tr>
									 <td height="25">【<%=pcp.getPropertyName()%>】：<%=pcp.getPropertyDetail()%></td>
								</tr>
								<%
									}
								}}catch(Exception e){
									out.println(e);
								}
								%>
								
								<tr>
									<td width="775" class="other_con_title2" height="30">商品描述</td>
								</tr>	
								
								<tr>
									<td width="775" style="line-height:180%;">${product.productDetail}</td>
								</tr>	
								
								<tr>
									<td align="center" width="745">
										<img src="<s:property value="product.bigPicPath"/>" width="300" height="300"><br>
									</td>
								</tr>	
							 </table>
							 
							 
							 
							 <table id="pifa" width="775" style="display: none;" cellpadding="0" cellspacing="0" class="other_con">
					                <tr>
					                    <td class="other_con_title" height="30">批发说明</td>
					                </tr>
					                <tr>
										<td  style="line-height:180%;">
										  <s:if test="product.wholesaleDetail==null || product.wholesaleDetail=='null' || product.wholesaleDetail==''">
										                 暂无信息
										  </s:if>
										  <s:else>
										    <s:property value="product.wholesaleDetail"/>
										  </s:else>
										</td>
								    </tr>
							 </table>
							 
							 <table id="yfei" style="display: none;" width="745" cellpadding="0" cellspacing="0" class="other_con">
					                <tr>
					                    <td class="other_con_title" height="30">配送方式</td>
					                </tr>
					                <tr>
										<td  style="line-height:180%;">
										    <s:if test="product.transportDetail==null || product.transportDetail=='null' || product.transportDetail==''">
										                     暂无信息
										    </s:if>
										    <s:else>
										       <s:property value="product.transportDetail"/>
										    </s:else>
										</td>
									</tr>
							 </table>
							 
							 <table id="jiaoyi" style="display: none;" width="745" cellpadding="0" cellspacing="0" class="other_con" style="display: none;">
					                <!-- 
					                <tr>
					                    <td class="other_con_title" height="30">交易方式</td>
					                </tr>
					                 -->
					                <tr>
					                	<td height="5" >&nbsp;</td>
					                </tr>
					                <tr>
					                	<td height="30" style="font-size:14px;">电子商务平台提供以下付款方式:</td>
					                </tr>
					                <tr>
					                	<td height="30" style="font-size:14px;"><b>1、在线支付已开通</b>，目前平台的交易主要是通过支付宝方式完成交易。</td>
					                </tr>
					                <tr>
					                	<td height="30" style="font-size:14px;"><b>2、不在线支付</b>：</td>
					                </tr>
					                <tr>
					                	<td>
					                		<table border="0" style="font-size:14px;">
					                		<tr>
					                			<td height="30" >&nbsp;&nbsp;由重庆市农产品集团做信誉担保，可以保障您的交易过程安全，让您购物没有后顾之忧！</td>
					                		</tr>
					                		<tr>
					                			<td height="30" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>开户名称：</b>重庆市农产品（集团）有限公司</td>
					                		</tr>
					                		<tr>
					                			<td height="30" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>开户银行：</b>重庆农村商业银行营业部</td>
					                		</tr>
					                		<tr>
					                			<td height="30" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>银行账号：</b>500 101 012 001 000 4809</td>
					                		</tr>
					                		<tr>
					                			<td height="30" >&nbsp;&nbsp;<b>提醒您</b>，为识别汇款人，汇款时请多汇或者少汇几分钱，比如可以汇500.01、500.02 。 汇款后请在第一时间内电话联系我们，电话：+86 23 86312316；或汇款后把底单传真到：+86 23 63824458。</td>					                			
					                		</tr>
					                		</table>
					                	</td>
					                </tr><!--
					                <tr>
					                	<td height="10" >&nbsp;</td>
					                </tr>
					                <tr>
					                	<td height="30" style="font-size:14px;"><b>2、在线支付</b>，电子商务平台的网上支付平台正在整合、测试阶段，暂时未开通。</td>
					                </tr>
					                <tr>
					                    <td>
										  	<img alt="网银交易" src="${pageContext.request.contextPath }/front/images/alipay-flow.png" usemap="#subankmap" border="0" />
		                                     <map name="subankmap" id="subankmap">
		                                      <area shape="rect" coords="731,72,867,91" href="" target="_blank" />
		                                     </map>
	                                     </td>
								    			</tr>-->
							 </table>
							 
							 <table id="plxq" style="display: none;" width="775" cellpadding="0" cellspacing="0" class="other_con">
					                <tr>
					                    <td class="other_con_title" height="30">评价详情</td>
					                </tr>
					                <tr>
										<td  style="line-height:180%;">暂无信息</td>
									</tr>
							 </table>
							 
						</td>
					</tr>
						<tr>
							<td>
							   <table  width="780" cellpadding="0" cellspacing="0" class="related_bg" >
									<tr>
										<td height="27" align="center" class="related_title">相关产品</td>
										<td width="654" >&nbsp;</td>
							        </tr>
								</table>
								
								<table width="780" height="180" cellpadding="0" cellspacing="0" class="related_con_bg">
									<tr>
										<% 
											List<Product> list = (List<Product>)request.getAttribute("otherTypeProduct");  
											if(list.size() >5){
												for(int i=0; i<5; i++){	
												Product p = list.get(i);
										%>									 
												<td align="center" class="related_con">
												<a href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=p.getProductId() %><%=addUrla %>">
												   <img src="<%=request.getContextPath()%><%=p.getBigPicPath() %>" width="90" height="90" border="0">
												</a>
												<br>
												 <a href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=p.getProductId() %><%=addUrla %>">
												 	<%=p.getProductName().length()>5?p.getProductName().substring(0,5)+"...":p.getProductName() %>
												 </a>
												 <br>
												 <%=p.getPrice1()==null?"<font color=red>面议</font>":"<font color='#FF0000'>￥"+p.getPrice1()+"</font>元/"+p.getProductUnit() %>
												 </td>		 								
										<% 		
												}											
											}else{	
												for(int i=0; i<list.size(); i++){	
													Product p = list.get(i);
										%>
												<td align="center" class="related_con">
												<a href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=p.getProductId() %><%=addUrla %>">
												   <img src="<%=request.getContextPath()%><%=p.getBigPicPath() %>" width="90" height="90" border="0">
												</a>
												<br>
												  <a href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=p.getProductId() %><%=addUrla %>">
												  	<%=p.getProductName().length()>5?p.getProductName().substring(0,5)+"...":p.getProductName() %>
												  </a>
												 <br>
												 <%=p.getPrice1()==null?"<font color=green>价格面议</font>":"<font color='#FF0000'>￥"+p.getPrice1()+"</font>元/"+p.getProductUnit() %>
												</td>	
										<% 
												}
												for(int i=list.size(); i<5; i++){
										%>              
												<td align="center" class="related_con" width="150">	&nbsp;</td>
										<%
												}           
											} 
										%>
									</tr>
								</table>
							</td>
						</tr>
					
					
				</table>
			  </td>
			</tr>
		</table>	
	</td>	
	</tr>
</table>
</form>
</body>
</html>
