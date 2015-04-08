<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
	String pubSvrUrl = "http://pubsvr.aiecp.com/asn";
%>

<%@ taglib prefix="s" uri="/struts-tags"  %>
<%@page import="java.util.*" %>  
<%@page import="com.bornsoft.asn.vo.ProductBean" %>   
<%@page import="com.bornsoft.asn.utils.common.Calculator" %>  
<%@page import="com.bornsoft.asn.bean.product.Product" %>
<%@page import="com.bornsoft.asn.bean.product.SpecialProduct" %>
<%@page import="com.bornsoft.asn.service.facade.FacadeService"%>
<%@page import="com.bornsoft.asn.bean.facade.ProductFacade"%>

<link rel="stylesheet" rev="stylesheet" href="<%=cp%>/front/css/page.css" type="text/css" /> 
<link href="<%=cp%>/front/product/css/productInfo.css" type="text/css" rel="stylesheet" />
<!-- facebox -->
<script type="text/javascript" src="<%=cp%>/js/facebox/facebox.js"></script>
<link href="<%=cp%>/js/facebox/facebox.css" media="screen" rel="stylesheet" type="text/css" />
<!-- picbox -->
<script type="text/javascript"	src="<%=cp%>/js/jqzoom_ev1.0.1/js/jqzoom.pack.1.0.1.js"></script>
<link rel="stylesheet" href="<%=cp%>/js/jqzoom_ev1.0.1/css/jqzoom.css"	type="text/css">
<script type="text/javascript"	src="<%=cp%>/js/jcarousel-0.2.4/lib/jquery.jcarousel.js"></script>
<link rel="stylesheet" href="<%=cp%>/js/jcarousel-0.2.4/skins/tango/skin.css"	type="text/css" /> 

<script type="text/javascript" src="<%=cp%>/js/jquery-ui-1.8rc3.custom.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>

<!--
<script type="text/javascript" src="<%=cp%>/js/bcart/bcart.js"></script>
<link rel="stylesheet" href="<%=cp%>/js/bcart/bcart.css" type="text/css" /> 
-->
<script type="text/javascript" src="<%=cp%>front/platform/js/bcart/bcart.js"></script>
<link rel="stylesheet" href="<%=cp%>/js/bcart/bcart.css" type="text/css" /> 

<style type="text/css">
<!--
body {
	margin: 0px;
}

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

.related_con{font-size:12px; font-weight:100;}
.related_con_bg a{font-size:12px;font-weight:100;}
-->
</style>   

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
<s:hidden name="product.startOrderCount" id="s_count"></s:hidden>


<table width="980" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td width="199" valign="top">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="m10">
  <tr>
    <td height="29"><img src="<%=cp%>/image/channel/ncp/spfl.jpg" width="199" height="29" /></td>
  </tr>
  <tr>
    <td height="264" valign="top" class="border_hui">
	
	<table width="94%" border="0" cellspacing="0" cellpadding="0" align="center">
      <tr>
      	<td><%@include file="ncp_ptype.jsp" %> </td>
      </tr>
    </table></td>
  </tr>
</table>	
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="m10">
  <tr>
    <td height="26" class="nva_red"><span class="p10">热卖产品</span></td>
  </tr>
  <tr>
    <td height="264" valign="top" class="border_hui">
	
	<table width="96%" border="0" cellspacing="0" cellpadding="0" align="center">
		<% 	List<Product> hotNcpProduct = (List<Product>) request.getAttribute("hotNcpProduct"); 
			for(int i=0; i<hotNcpProduct.size(); i++){
				Product sp = hotNcpProduct.get(i);
		%>
            <tr>
            <td colspan="2" class="xbd"><a href="<%=pubSvrUrl%>/front/channel/ncp/detailInfo.action?productId=<%=sp.getProductId()%>" target="_blank"><%=sp.getProductName()%></a></td>
			</tr>
		<% } %>	
		
    </table></td>
  </tr>
</table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="m10">
  <tr>
    <td height="26" class="nva_red"><span class="p10">特价产品</span></td>
  </tr>
  <tr>
    <td height="264" valign="top" class="border_hui">
	
	<table width="96%" border="0" cellspacing="0" cellpadding="0" align="center">
        <% 	List<SpecialProduct> specialPriceProduct = (List<SpecialProduct>) request.getAttribute("specialPriceProduct"); 
			for(int i=0; i<specialPriceProduct.size(); i++){
				SpecialProduct sp = specialPriceProduct.get(i);
		%>
            <tr>
            <td colspan="2" class="xbd"><a href="<%=pubSvrUrl%>/front/channel/ncp/detailInfo.action?productId=<%=sp.getProductId()%>" target="_blank"><%=sp.getName()%></a></td>
			</tr>
		<% } %>	
		
    </table></td>
  </tr>             
</table>

   </td>
    <td width="10">&nbsp;</td>
    <td valign="top">
	
	

		<!-- ***********右边开始*************** -->
		<input type="hidden" name="type" id="type" value="<%=request.getSession().getAttribute("ncpMenuType") %>" />	
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				
				<td width="770" valign="top"><table width="770" cellpadding="0" cellspacing="0">
					<tr>
						<td class="pro_name" height="30" style="border-bottom:1px #DBDBDB solid;"><s:property value="product.productName"/>(<s:property value="product.productNumber" />)</td>
					</tr>
					
					<tr>
						<td><table width="100%" cellpadding="0" cellspacing="0" style="margin-top:2px;" >
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
									<table width="418" class="pro_info1">
										<tr>
											<td height="23" width="60">商 城 价：</td>
											<td style="font-size:18px" colspan="3">
												<s:if test="product.price1 ==null">
													<font color="green"><strong>价格面议</strong></font>
												</s:if>
												<s:else>
													<font color="#FF0000"><strong><s:property value="product.price1"/>元</strong></font>
												</s:else> 
											</td>
										</tr>
										<tr>
											<td height="23" width="60">运输费用：</td>
											<td colspan="3">
												<s:if test='product.postType=="0"'>
													平邮：<s:property value="dalivery.post"/>元 &nbsp;&nbsp;
													快递：<s:property value="dalivery.express"/>元&nbsp;&nbsp;
													EMS：<s:property value="dalivery.ems"/>元
												</s:if>
												<s:elseif test='product.postType=="1"'>卖家承担</s:elseif>
												<s:elseif test='product.postType=="2"'>联系卖家商定</s:elseif>											
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
									
									
									<table width="388" class="pro_info2">
										<tr>
											<td width="60" height="20">服务保障：</td>
											<td><img src="/asn/front/product/images/cx16_1.gif" width="16" height="16" hspace="0" vspace="0"/></td>
										</tr><!--
										<tr>
											<td width="60" height="38">买家承诺：</td>
											<td><font color="#003366">如是描述,如未履行，</font>我们将按规则支持买家申请先行赔付.</td>
										</tr>-->
									</table>
									
									<table width="388" class="pro_info2">
										<tr>
											<td width="60" align="center"><img src="/asn/front/product/images/cx16_5.gif" width="23" height="24" /></td>
											<td>卖家已提交保证金，加入<span class="top_fla"><a href="#">消费者保障服务</a></span>。
											<br/>
											卖家承诺： <img src="/asn/front/product/images/cx16_3.gif" width="16" height="16" />如实描述 <br/>
											如未履行，我们将按规则支持买家申请先行赔付
											</td>
										</tr>
									</table>
									
									<table width="388" class="pro_info3" border="0">
									<tr><td height="2"></td></tr>
										<tr>											
											<td height="20" width="66">付款方式：</td>
											<td style="valign:middle" width="22" align="right"><img src="/asn/front/product/images/yhcard.png" width="24" height="20"></td><td width="60" align="left">网上银行</td>
											<td width="60" align="left">支付宝</td>
											<td width="60" align="left">快钱</td>
											<td>&nbsp;</td>
										</tr>										
								  </table>
									 <table width="388" class="pro_info2">
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
									
									
									  <table width="388" height="100" class="pro_info4">
									    <s:if test='product.webOrder=="Y"'>
											<tr>											
												<td>我要买<input type="text" size="6" id="pro_count" onkeyup="this.value=this.value.replace(/[^\d,\.]/g,'')"  value="<s:property value="product.startOrderCount"/>" style="border:#e9d162 1px solid;"><s:property value="product.productUnit"/></td>
											</tr>	
											<tr>
											    <!-- 
												<td width="45%" height="50">
												    <a href="javascript:"  >
								                       <img src="/asn/front/product/images/ljdg.gif" border="0">
								                    </a>
											    </td>
											     -->
											    <td width="55%">
											    	<s:if test="product.price1 ==null">
														<img  src="/asn/front/product/images/gwc.gif" border="0" >
													</s:if>
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
								     
								     <table width="388">
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
						  <table  width="750" cellpadding="0" cellspacing="0" class="pro_other" >
								<tr>
									<td height="27" align="center" class="other_selected" id="promiaosu" onmousedown="flipContent('miaosu')" style="cursor:pointer;">商品描述</td>
									<td align="center" class="other_noselected" id="propifa" onmousedown="flipContent('pifa')" style="cursor:pointer;">批发说明</td>
									<td align="center" class="other_noselected" id="proyfei" onmousedown="flipContent('yfei')" style="cursor:pointer;">配送方式</td>
									<td align="center" class="other_noselected" id="projiaoyi" onmousedown="flipContent('jiaoyi')" style="cursor:pointer;">交易方式</td>
									<td align="center" class="other_noselected" id="proplxq" onmousedown="flipContent('plxq')" style="cursor:pointer;">评价详情</td>
									<td width="250" >&nbsp;</td>
								</tr>								
							</table>
							
							<table  id="miaosu" width="745" cellpadding="0" cellspacing="0" class="other_con">
					            <% String value=(String)request.getAttribute("product.facade"); %>
				                <% if(value!=null){%>
							       <tr>
									  <td class="other_con_title" height="30">商品参数</td>
							       </tr>
						            <% List<ProductFacade> list=new FacadeService().parseFacade(value);%>
						            <%for(ProductFacade facade : list){%>
						                  <tr>
											 <td height="25">【<%=facade.getName()%>】：<%=facade.getValue()%></td>
										  </tr>
						                  <%}%>
									  
								            <%}%>
												
												<tr>
													<td width="745" class="other_con_title2" height="30">商品描述</td>
												</tr>	
												
												<tr>
													<td width="745" style="line-height:180%;">${product.productDetail}</td>
												</tr>	
												
												<tr>
													<td align="center" width="745">
														<img src="<s:property value="product.bigPicPath"/>" width="300" height="300"><br>
													</td>
												</tr>	
							 </table>
							 
							 
							 
							 <table id="pifa" width="745" style="display: none;" cellpadding="0" cellspacing="0" class="other_con">
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
					                <tr>
					                    <td class="other_con_title" height="30">交易方式</td>
					                </tr>
					                <tr>
					                    <td>
										  	<img alt="网银交易" src="${pageContext.request.contextPath }/front/images/alipay-flow.png" usemap="#subankmap" border="0" />
		                                     <map name="subankmap" id="subankmap">
		                                      <area shape="rect" coords="731,72,867,91" href="" target="_blank" />
		                                     </map>
	                                     </td>
								    </tr>
							 </table>
							 
							 <table id="plxq" style="display: none;" width="745" cellpadding="0" cellspacing="0" class="other_con">
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
							   <table  width="750" cellpadding="0" cellspacing="0" class="related_bg" >
									<tr>
										<td height="27" align="center" class="related_title">相关产品</td>
										<td width="654" >&nbsp;</td>
							        </tr>
								</table>
								
								<table width="750" height="180" cellpadding="0" cellspacing="0" class="related_con_bg">
									<tr>
										<% 
											List<Product> list = (List<Product>)request.getAttribute("otherTypeProduct");  
											if(list.size() >5){
												for(int i=0; i<5; i++){	
												Product p = list.get(i);
										%>									 
										<td align="center" class="related_con">
											<a href="detailInfo?productId=<%=p.getProductId() %>">
											   <img src="<%=request.getContextPath()%><%=p.getSmallPicPath() %>">
											</a>
											<br>
											  <a href="detailInfo?productId=<%=p.getProductId() %>"><%=p.getProductName() %></a>
											 <br>
											 <font color="#FF0000">￥<%=p.getPrice1() %></font>元/<%=p.getProductUnit() %>
										</td>										
										<% 		
												}											
											}else{	
												for(int i=0; i<list.size(); i++){	
													Product p = list.get(i);
										%>
										<td align="center" class="related_con">
											<a href="detailInfo?productId=<%=p.getProductId() %>">
											   <img src="<%=request.getContextPath()%><%=p.getSmallPicPath() %>">
											</a>
											<br>
											  <a href="detailInfo?productId=<%=p.getProductId() %>"><%=p.getProductName() %></a>
											 <br>
											 <font color="#FF0000">￥<%=p.getPrice1() %></font>元/<%=p.getProductUnit() %>
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