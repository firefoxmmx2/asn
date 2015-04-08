<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@page import="com.bornsoft.asn.service.facade.FacadeService"%>
<%@page import="com.bornsoft.asn.bean.facade.ProductFacade"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>望龙门―农业综合服务网络平台&nbsp;|&nbsp;新农村现代经营服务网络平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
<meta name="Copyright" content="望龙门 CopyRight 2009"/>
<meta name="keywords" content="望龙门,旺龙门,农业综合服务,新农村现代经营服务,网络平台,C2B2B,F2C2B,农业电子商务平台,网上交易市场,农民,农产品,农副产品,供求,买
卖,行情,林下经济,循环经济,网上购物,网上拍卖,网上典当,网上支付,供销合作社,农业社会化服务,新农村现代流通网络,新网工程,农民专业合作社,企业信息化,协同办公,重庆农
业."/>
<meta name="description" content="望龙门是领先的农业综合服务及新农村现代经营服务网络平台,以互联网、多媒体技术和C2B2B/F2C2B复合电子商务为手段,为三农中小客户提
供全方位的综合服务."/>
<link rel="stylesheet" rev="stylesheet" href="<%=request.getContextPath()%>/front/css/product.css" type="text/css" />
<!-- facebox -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/facebox/facebox.js"></script>
<link href="${pageContext.request.contextPath}/js/facebox/facebox.css" media="screen" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/facebox/faceplant.css" media="screen" rel="stylesheet" type="text/css" />
<!-- picbox -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jqzoom_ev1.0.1/js/jqzoom.pack.1.0.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/jqzoom_ev1.0.1/css/jqzoom.css"
	type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jcarousel-0.2.4/lib/jquery.jcarousel.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/jcarousel-0.2.4/skins/tango/skin.css"
	type="text/css">
<!--<link rel="stylesheet" href="${pageContext.request.contextPath}/js/jcarousel-0.2.4/skins/jquery.jcarousel.w.css"
	type="text/css">-->
</head>
<SCRIPT src="<%=request.getContextPath()%>/front/js/cookie.js"></SCRIPT>
<script type="text/javascript">

//启用工具脚本的调试输出功能
butil.setDebug(true);


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
	bcart.addItem(product, quantity, supplierId);
}

function checkInfo(s,l,m){
	if(s==""){
          alert("请输入你要订购的数量");
          document.getElementById("orderCount").focus();
		}else{
			 if(s<l){
		          alert("对不起,不能低于最小起订量");
		          return false;
		        }else if(s>m){
		          alert("对不起,不能大于最大订购量");
		          return false;
		        }else{
                   return true;
			    }  	
			}
   }



function flipContent(tab_id) {
    if (tab_id == "miaosu") {
    	document.getElementById("miaosu").style.display = "block";
    	document.getElementById("pifa").style.display = "none";
    	document.getElementById("yfei").style.display = "none";
    	document.getElementById("jiaoyi").style.display = "none";
		
    	document.getElementById("xx1").style.display = "block";
		document.getElementById("xx2").style.display = "none";
		document.getElementById("xx3").style.display = "none";
    	document.getElementById("xx4").style.display = "none";
		
    }else if(tab_id == "pifa"){
    	document.getElementById("miaosu").style.display = "none";
    	document.getElementById("pifa").style.display = "block";
    	document.getElementById("yfei").style.display = "none";
    	document.getElementById("jiaoyi").style.display = "none";
		
		document.getElementById("xx1").style.display = "none";
    	document.getElementById("xx2").style.display = "block";
    	document.getElementById("xx3").style.display = "none";
    	document.getElementById("xx4").style.display = "none";
    }else if(tab_id == "yfei"){
    	document.getElementById("miaosu").style.display = "none";
    	document.getElementById("pifa").style.display = "none";
    	document.getElementById("yfei").style.display = "block";
    	document.getElementById("jiaoyi").style.display = "none";
		
		document.getElementById("xx1").style.display = "none";
    	document.getElementById("xx2").style.display = "none";
    	document.getElementById("xx3").style.display = "block";
    	document.getElementById("xx4").style.display = "none";
    }else if(tab_id == "jiaoyi"){
    	document.getElementById("miaosu").style.display = "none";
    	document.getElementById("pifa").style.display = "none";
    	document.getElementById("yfei").style.display = "none";
    	document.getElementById("jiaoyi").style.display = "block";
		
		document.getElementById("xx1").style.display = "none";
    	document.getElementById("xx2").style.display = "none";
    	document.getElementById("xx3").style.display = "none";
    	document.getElementById("xx4").style.display = "block";
    }
}
//+++ 点击商品小图，弹出商品大图 by hooxin
//
pic_list = new Array();

$(document).ready(function($){
	
	$('a[rel*=facebox]').facebox({
	      loading_image : '${pageContext.request.contextPath}/js/facebox/loading.gif',
	      close_image   : '${pageContext.request.contextPath}/js/facebox/closelabel.gif'
	});
	
	$("a[rel=jqzoom]").jqzoom({
		zoomWidth : 350,
		zoomHeight : 270,
		xOffset : 10,
		len: true,
		title:false,
		position : "right"
	});

	pic_list = getPicList();
	smaillpic = $(".jcarousel-skin-tango").jcarousel({
		size: pic_list.length,
        itemLoadCallback: {onBeforeAnimation: picbox_load}
	});
	$(".jcarousel-skin-tango").css("margin", "8px");
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
	return '<img src="' + it.sml + '" width="55" height="55" big="'+it.big+'" />';
}

</script>
<body>
<style> 
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
	width:200px;
}
.jcarousel-skin-tango .jcarousel-clip-horizontal {
	height:75px;
	width:200px;
}
</style>
<form action="" id="productInfo" >
<s:hidden  name="product.startOrder" id="lowestCount"></s:hidden>
<s:hidden  name="product.maxSupply" id="maxCount"></s:hidden>
<s:hidden name="product.productName" id="productName"></s:hidden>
<s:hidden name="product.bigPicPath"></s:hidden>
<s:hidden name="product.bigPicPath1"></s:hidden>
<s:hidden name="product.bigPicPath2"></s:hidden>
<s:hidden name="product.bigPicPath3"></s:hidden>
<s:hidden name="product.smallPicPath"></s:hidden>
<s:hidden name="product.smallPicPath1"></s:hidden>
<s:hidden name="product.smallPicPath2"></s:hidden>
<s:hidden name="product.smallPicPath3"></s:hidden>
<div id="dtt">
<div id="dt01">
     <div class="dt01_01">
     	 <%-- //+++修正bug：添加到收藏出错 - getElementById("productName")没有值。 3 by hooxin--%>
     	 <input type="hidden" id="productName" value="<s:property value="product.productName"/>"/>
	     <div class="dt01_01b1">【供应】<s:property value="product.productName"/> </div>
	     <%--“供销通会员 第 1 年”字样改为“供应商情况” by hooxin--%>
	     <%-- <div class="dt01_01b2">供销通会员 第 1 年</div> --%>
	     <div class="dt01_01b2">供应商情况</div>
	     <div class="clear"></div>
	 </div>
	
	 <div class="dt01_02">
	      <div class="dt01_02b1"> 
		       <ul>
		       		<%-- //+++ 点击商品小图，弹出商品大图 by hooxin --%>
			      <li ><a id="pdtzoom" href="<s:property value="product.bigPicPath"/>" rel="jqzoom" style=" height: 150px; width: 200px;"> <img style=" height: 150px; width: 200px;" src="<s:property value="product.bigPicPath"/>"></a>
			      	<div id="smaillpic"><ul class="jcarousel-skin-tango"></ul></div>
			      </li>
				  <li  class="sccxx">
				     <a href=javascript:addBookmark()>添加到收藏</a>
				  </li>
			   </ul>
		  </div>
		  <div class="dt01_02b2">
		       <ul>
		       	  <%-- //+++ 显示商品编号(PRODUCT_NUMBER，是供应商的自编号) 4 by hooxin --%>
		       	  <li>产品编号：<s:property value="product.productNumber"/></li>
			      <li>产品价格：<s:property value="product.price1"/>元/<s:property value="product.productUnit"/></li>
			      <%-- //+++ 显示价格区间（参考后台管理中修改商品的价格部分）6 by hooxin --%>
			      <s:if test="product.price1Range != null && product.price1Range != ''">
			      <li><s:property value="product.startOrderCount"/><s:property value="product.productUnit"/> ~ <s:property value="product.price1Range"/><s:property value="product.productUnit"/> : <s:property value="product.price1"/>元/<s:property value="product.productUnit"/></li>
			      </s:if>
			      <s:if test="product.price2Range != null && product.price2Range != ''">
			      <li>${product.price1Range + 1 }<s:property value="product.productUnit"/> ~ <s:property value="product.price2Range"/><s:property value="product.productUnit"/> : <s:property value="product.price2"/>元/<s:property value="product.productUnit"/></li>
			      </s:if>
			      <s:if test="product.price3Range != null && product.price3Range != ''">
			      <li>${product.price2Range + 1 }<s:property value="product.productUnit"/> ~ <s:property value="product.price3Range"/><s:property value="product.productUnit"/> : <s:property value="product.price3"/>元/<s:property value="product.productUnit"/></li>
			      </s:if>
			      <%-- //+++ 显示起订量（START_ORDER_COUNT）、已预订量（RESERVED_COUNT）、已售出（SALE_COUNT）4 by hooxin --%>
				  <li>起订量：<s:property value="product.startOrderCount"/><s:property value="product.productUnit"/></li>
				  <li>已预订量：<s:property value="product.reservedCount"/><s:property value="product.productUnit"/></li>
				  <li>已售出：<s:property value="product.saleCount"/><s:property value="product.productUnit"/></li>
				  <!-- 供货总量 改为  库存量  by hooxin-->
				  <%--<li>库存量：<s:property value="product.maxSupply"/><s:property value="product.maxSupplyUnit"/></li> --%>
				  <li>库存量：<s:property value="product.wareCount"/><s:property value="product.productUnit"/></li>
				  <li>所在地：<s:property value="member.area"/></li>
				  <li>联系人：<s:property value="member.contactor"/> </li>
				  <% String value=(String)request.getAttribute("product.facade"); %>
				   <%  if(value!=null){%>
		            <% List<ProductFacade> list=new FacadeService().parseFacade(value);%>
		            <%for(ProductFacade facade : list){%>
		                  <li>
		                    <%=facade.getName()%>:<%=facade.getValue()%>
		                  </li>
		                  <%}%>
					  
				            <%}%>
				 <%-- 添加点击数 by hooxin --%>
				  <li>点击数：<s:property value="product.viewCount"/> </li>          
			      <li style="width: 400px;">
		             <s:if test='product.webOrder=="Y"'>
		              <div class="dt03_02_01">
		                <table width="90%" border="0" cellspacing="0" cellpadding="0" height="70" align="center">
		                	<!-- comment by hooxin -->
                           <%--<tr>
                             <td colspan="3" height="50">我要订购
                             <label>
                                <input name="textfield" id="orderCount" type="text" value="<s:property value="product.startOrder"/>" size="8" onkeyup="this.value=this.value.replace(/[^\d,\.]/g,'')"/><s:property value="product.maxSupplyUnit"/>
                             </label>
                             </td>
                            </tr>--%>
                            
							<tr>
							   <td> 
							     <a href="javascript:" onClick="javascript:immIntoShopCart('<s:property value="product.productId"/>','<s:property value="product.startOrderCount"/>','<s:property value="product.productName"/>','<s:property value="product.smallPicPath"/>','<s:property value="product.price"/>','<s:property value="member.memberId"/>','<s:property value="member.fullName"/>')" >
							       <img src="<%=request.getContextPath()%>/front/images/ljdg.gif" width="128" height="49">
							     </a>
							   </td>
							</tr>
                        </table>
                      </div>
		             </s:if>
		             <s:else>
		              <div class="nopaywarp">
			              <ul>
				            <li class="nopaytip" style="width: 330px; color:ff0000;">该产品目前不支持网上订购，欢迎联系洽谈</li>
				            <li ></li>
			              </ul>
		             </div>
		            </s:else>
		          </li>

</ul>
		  </div>
		  <div class="dt01_02b3">
		       <ul>
			      <li><s:property value="member.fullName"/></li>
			      <%-- //+++ 供应商情况区域列出供应商的类型：个人或机构 by hooxin --%>
			      <li>供应商类型：<s:if test="member.memberType == 1">单位</s:if><s:elseif  test="member.memberType == 2">个人</s:elseif> </li>
			      <%-- //+++ 供应商情况区域列出供应商的证件图片 by hooxin 可能以后会添加点击显示大图的功能//### --%>
			      <li>证件图片：<a href="${pageContext.request.contextPath }/pic/member/big_member_<s:property value="member.memberId"/>.jpg" rel="facebox"><img src="${pageContext.request.contextPath }/pic/member/sml_member_<s:property value="member.memberId"/>.jpg"></img></a> </li>
			      <%-- //+++ 纠正“电话：null”之类的不友好显示 by hooxin --%>
				  <li>电话：<s:if test="member.fixedPhone == null || member.fixedPhone == 'null'">暂无</s:if><s:else><s:property value="member.fixedPhone"/></s:else> </li>
				  <li>地址：<s:if test="member.address == null || member.address == 'null'">暂无</s:if><s:else><s:property value="member.address"/></s:else></li>
				  <li>邮编：<s:if test="member.zip == null || member.zip == 'null'">暂无</s:if><s:else><s:property value="member.zip"/></s:else></li>
				  <li>邮箱：<s:if test="member.email == null || member.email == 'null'">暂无</s:if><s:else><s:property value="member.email"/></s:else></li>
				  <%-- //+++ “进入该企业网站”图片改为“该供应商所有商品”链接 by hooxin --%>
				  <%-- <li style="text-align:center;"><img src="<%=request.getContextPath()%>/front/images/shop.gif"></li> --%>
				  <li style="text-align:center;"><a href="${pageContext.request.contextPath }/front/supplier/searchSupplierInfo?supplierid=<s:property value="member.memberId"/>"><img src="<%=request.getContextPath()%>/front/images/shop.gif"></a></li>
			   </ul>
		  </div>
	 </div>
	
</div>

<div id="dt02">
     <div class="dt02_01" id="xx1">
	      <div class="dt02_01b1" onClick="flipContent('miaosu');return false;" style="cursor: hand"> 详细信息</div>
		  <div class="dt02_01b2" onClick="flipContent('pifa');return false;" style="cursor: hand">批发说明</div>
		  <div class="dt02_01b3" onClick="flipContent('yfei');return false;" style="cursor: hand">配送方式</div>
		  <div class="dt02_01b4" onClick="flipContent('jiaoyi');return false;" style="cursor: hand">交易方式</div>
		  <div class="dt02_01b5"></div>
		  <div class="dt02_01b6"></div>
	 </div>
	 <div class="dt02_02" id="miaosu" style="text-align: left;">
	    ${product.productDetail};
	 </div>
	 
	 
	 
	 
	 
	 
	<div class="dt02_01" style="display: none;" id="xx2">
	      <div class="dt02_01b7" onClick="flipContent('miaosu');return false;" style="cursor: hand"> 详细信息</div>
		  <div class="dt02_01b8" onClick="flipContent('pifa');return false;" style="cursor: hand">批发说明</div>
		  <div class="dt02_01b3" onClick="flipContent('yfei');return false;" style="cursor: hand">配送方式</div>
		  <div class="dt02_01b4" onClick="flipContent('jiaoyi');return false;" style="cursor: hand">交易方式</div>
		  <div class="dt02_01b5"></div>
		  <div class="dt02_01b6"></div>
	 </div> 
	 
	<div class="dt02_02" style="display: none;" id="pifa">
		<table cellpadding="0" cellspacing="0" >
			<tr>
			   <th>批发说明</th>
			</tr>
			<tr>
			  <td>
               <s:property value="product.wholeSaleDetail"/>			  
              </td>
			</tr>
		</table>
	</div>
	
	
	
	
	
	
	<div class="dt02_01" style="display: none;" id="xx3">
	      <div class="dt02_01b7" onClick="flipContent('miaosu');return false;" style="cursor: hand"> 详细信息</div>
		  <div class="dt02_01b2" onClick="flipContent('pifa');return false;" style="cursor: hand">批发说明</div>
		  <%-- //+++“配送方式”改为配送方式，列出商品支持的配送方式，下面再跟上商品本身的配送方式（TRANSPORT_DETAIL）。5 by hooxin --%>
		  <div class="dt02_01b8" onClick="flipContent('yfei');return false;"style="cursor: hand">配送方式</div>
		  <div class="dt02_01b4" onClick="flipContent('jiaoyi');return false;" style="cursor: hand">交易方式</div>
		  <div class="dt02_01b5"></div>
		  <div class="dt02_01b6"></div>
	 </div> 
	 
	 <div class="dt02_02" style="display: none;" id="yfei">
		<table cellpadding="0" cellspacing="0">
		<%-- //+++“配送方式”改为配送方式，列出商品支持的配送方式，下面再跟上商品本身的配送方式（TRANSPORT_DETAIL）。5 by hooxin --%>
			<tr><th>配送方式</th>
			</tr>
			<tr>
			  <td>
			     <s:property value="product.transportDetail"/>  
		      </td>
		    </tr>
		</table>
</div>







<div class="dt02_01" style="display: none;" id="xx4">
	      <div class="dt02_01b7" onClick="flipContent('miaosu');return false;" style="cursor: hand"> 详细信息</div>
		  <div class="dt02_01b2" onClick="flipContent('pifa');return false;" style="cursor: hand">批发说明</div>
		  <%-- //+++“配送方式”改为配送方式，列出商品支持的配送方式，下面再跟上商品本身的运费说明（TRANSPORT_DETAIL）。5 by hooxin --%>
		  <div class="dt02_01b3" onClick="flipContent('yfei');return false;" style="cursor: hand">配送方式</div>
		  <div class="dt02_01b8" onClick="flipContent('jiaoyi');return false;" style="cursor: hand">交易方式</div>
		  <div class="dt02_01b5"></div>
		  <div class="dt02_01b6"></div>
	 </div> 

<div class="dt02_02" style="display: none;" id="jiaoyi">
	        <table cellpadding="0" cellspacing="0">
	            <tr>
	            	<%-- 交易方式：取消支付宝有关图片，书写文字：本站支持网上银行支付，以下银行开户的顾客均可支付，列出原有图片中的各银行。5 by hooxin --%>
	                <%-- <th>交易方式<span>当前商品支持<em>支付宝担保交易</em></span></th> --%>
	            </tr>
	            <tr>
	                <td ><img alt="网银交易" src="${pageContext.request.contextPath }/front/images/alipay-flow.png" usemap="#subankmap" />
	                    <map name="subankmap" id="subankmap">
	                        <area shape="rect" coords="731,72,867,91" href="" target="_blank" />
	                    </map>
	                </td>
	            </tr>
	        </table>
</div>
	 
	 
	      
</div>
</div>



</form>
</body>
</html>
