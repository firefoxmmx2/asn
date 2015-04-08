<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@page import="com.bornsoft.asn.utils.common.AsnConstLib"%>
	<link rel="stylesheet" rev="stylesheet" href="<%=request.getContextPath()%>/front/css/page.css" type="text/css" />
	<link rel="stylesheet" rev="stylesheet" href="<%=request.getContextPath()%>/front/css/product.css" type="text/css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jspath.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/geoloc/geoloc.js"></script>
	<LINK href="<%=request.getContextPath()%>/js/yav/yav-style.css" type=text/css rel=stylesheet>
	<SCRIPT src="<%=request.getContextPath()%>/js/yav/yav.js"></SCRIPT>
	<SCRIPT src="<%=request.getContextPath()%>/js/yav/yav-config.js"></SCRIPT>
<SCRIPT type="text/javascript">

function checkPage(){
	var totalPage = document.getElementById("totalPage").value;
	var inPage = document.getElementById("page").value;
	if(isNaN(inPage)||inPage==""){
		alert("请输入数字");
		return false;
	}			
	if(parseInt(inPage) > parseInt(totalPage)){		
		document.getElementById("page").value = totalPage;
	}else{
		document.getElementById("page").value = parseInt(inPage);
	}
	return true;
}

//初始化地区组件
geoloc.debugOn();
$(document).ready(function(){
	geoloc.init("divArea", "- 不限省市 -", null,null, "area",$("#area").val().substring(0,6));
});

// 取地区选择结果，如果没有选择，结果为null；如果选择，数据形式为：310101|黄浦区
function showSelection(){
	var sel=geoloc.getSelection("divArea");
	if(sel==null){
		alert("没有选择");
	} else {
		alert(sel);
	}
}

function checkInfo(){
    var _startPice=document.getElementById("price-start").value;
    var _endPrice=document.getElementById("price-end").value;
    var _area= document.getElementById("area").value;
    if(_startPice==null || _endPrice==null){
        alert('请填写价格');
         return false;
     }
    return true;
}

//+++ 大图小图 by hooxin

</SCRIPT>
<div style="width:974px; height:auto; background:#FFFFFF;">
    <div style="text-align:left;">  
	  <a href='http://www.aiecp.com/'>&nbsp;&nbsp;首页</a>&nbsp;&gt;&nbsp;
	  <a href='/asn/front/cate0'>所有分类</a>
    </div>
	<div class="Searchbody">		
		<div class="Searchleft" style="padding-left:12px;">   
			
		<!--产品搜索开始-->
		<!-- onkeyup="this.value=this.value.replace(/[^\d,\.]/g,'')" -->
	<form action="searchProduct.action" method="post" id="productInfoList" onsubmit="return checkInfo();" style="margin: 0px;">
    <s:hidden  name="type"/>   
		<div class="Searchleft02">
			<div id="QuickFilter">
				<div id="filter-pannel">    
					<div id="filter-pannel-wrap">
						<div id="sub-filter">
							<div class="price-interval">
							     <b>单价：</b> 
							     <s:textfield id="price-start" cssStyle="width: 40px;" name="startPrice" />
							     <span>至</span>
							     <s:textfield id="price-end" cssStyle="width: 40px;" name="endPrice"  />
								 <span>元</span>
								 <span class="split-line"></span>
						    </div>
							<div class="quantity-begin">
							    <span>起订量：</span>
							    <s:textfield id="quantity-begin" name="quantityBegin" cssStyle="width: 60px;"  />以上
							</div>
							<!-- comment by hooxin  -->
							<!--<div class="post-time">
							      
							      <s:select list="#{'':'所有发布时间','0':'1天内新信息','2':'3天内新信息','6':'7天内新信息'}" 
							                id="postTime" name="postTime" cssStyle="width: 100px;">
							      </s:select>
							      <span></span>
							</div>-->
							<div style="float:left;height:18px;margin-top:12px;position:relative;">
							   <span>产品名称:</span>
							   <s:textfield name="searchkey" cssStyle="width: 100px;"></s:textfield>
							</div>
							
						</div>
						<div id="main-filter">
								<div class="province-city">
								     &nbsp;<s:hidden id="area" name="areaCode"/><span id="divArea"></span>
								</div>
								<!--<div class="biztype-select">
								   <select id="biztype" name="biztype"  title="所有经营模式"   style="width: 97px;">
											<option value="">所有经营模式</option>
											<option value="1">生产加工</option>
											<option value="2">经销批发</option>
											<option value="4">招商代理</option>
											<option value="8">商业服务</option>
								    </select>
								    <span></span>
								</div>-->
								<div class="order">
								     <span class="order-t">按价格排序：</span>
								     <s:select list="#{'asc':'从低到高','desc':'从高到低'}" name="priceOrder"></s:select>
								</div>
								<div style="float:left;width:100px;text-align:right;margin-top:5px; ">
							      <input id="sx_ctrl_btn" value=" 确 定 " type="submit"  >
					            </div>
						</div>
						
					</div>
				</div>
			 </div>
			</div>
		</form>
			
		<!--产品搜索结束--> <!--产品列表开始-->
		<div id="SearchList">
		<div>
			<div id="list_fun_head1"></div>
			 <s:if test='flag=="Y"'>
			     <%int i=1; %>
			     <s:iterator value="list" status="rs">
				<div class="offer">
						<div class="offerbackground">
						<div class="comparecheck">
						    &nbsp;
					    </div>
						<div class="picture">
						   <a href="product/displayDetailProduct.action?productId=<s:property value="product.productId"/>" target="_blank">
						      <img src="<%=request.getContextPath()%><s:property value="product.smallPicPath"/>"
							       width="100" height="80" border="0"> 
						   </a>
						</div>
						<div class="content">
								<div class="info">
								    <span class="undline"> 
								       <a href='displayDetailProduct.action?productId=<s:property value="product.productId"/>' class="l" target="_blank">
				                          <s:property value="product.productName"/>
				                       </a> 
								    </span>&nbsp;&nbsp; 
								    <span class="nobr int_gray">[<s:date name="product.productStartDate" format="yyyy-MM-dd"/>]</span>
								    <br>
								    <%-- 商家名称点击转到商家页面 3 by hooxin --%>
								    <%--单位/个人图标移动到供应商名称前面，中间隔一个空格（&nbsp;) by hooxin--%>
								    <span class="gray s">
								    	 <s:if test='customerType=="1"'>
									       <a href="#" class="list_block_e list_cxt_e" title="单位商家" ></a>
									      </s:if>
									      <s:else>
									         <a href="#" class="list_block_e list_cxt_c" title="个人商家" ></a>
									      </s:else> &nbsp;
								      <a href="${pageContext.request.contextPath }/front/supplier/searchSupplierInfo?supplierid=<s:property value="supId"/>"> <s:property value="supName"/></a> </span> <br>
								    <p class="company-choose">
								    	<!--<a href="#" class="cl"><s:property value="product.productName"/></a>-->
								    <div  class="feedbackdiv">
								      <div class="feedback_address gray">[<s:property value="area"/>]</div>
								    </div>
								</div>
						 </div>
						<div class="listmyt">
							<!-- comment by hooxin -->
							<!--<table width="100%" cellpadding="0" cellspacing="0">
								<tr height="23" style="font-size: 12px;">
									<td><a href="javascript:" onmousedown="alert('请与商家联系');" target="_blank" class="syscat">联系方式</a></td>
								</tr>
							</table>-->
						</div>
						<div class="athena">
						      <%-- --- --%>
						     <%--
						     	 <s:if test='customerType=="1"'>
						       <a href="#" class="list_block_e list_cxt_e" title="单位商家"></a>
						      </s:if>
						      <s:else>
						         <a href="#" class="list_block_e list_cxt_c" title="个人商家"></a>
						      </s:else>
						      --%>
						</div>
						<div class="offer-price">
							<table style="font-size: 12px;">
								<tbody>
									<tr>
										<%-- //+++显示：计量单位(元/？)、起订量 by hooxin--%>
										<td class="gray">￥<em><s:property value="product.price1"/></em> / <s:property value="product.productUnit"/></td>
									</tr>
									<tr>
										<%-- //+++ 显示：计量单位、起订量 4 by hooxin --%>
										<%-- <!--<td class="gray"><s:property value="product.startOrder"/><s:property value="product.startOrderUnit"/>起</td>--> --%>
										<td class="gray"><s:property value="product.startOrderCount"/><s:property value="product.productUnit"/>起</td>
									</tr>
								</tbody>
								<tbody>
								</tbody>
							</table>
						</div>
					<div class="hackbox"></div>
				   </div>
				</div>
				
			 </s:iterator>
			 </s:if>
			 <s:else>
			   <div style="width: 350px; height:50px;font-size:16px;line-height:50px;vertical-align:middle; font-weight:700;color:#FF0000;">

			               对不起没有查询到你想要的产品信息          
			   </div>
			 </s:else>		
			
			<div class="hackbox"></div>
			
			<!--分页开始
			<div id="SearchListPage">
				<div>
				   ${request.pageBar}
				</div>
			</div>
			分页结束-->
			
			<form action="${pageContext.request.contextPath}/front/searchProduct.action" method="get" name="pageform" id="pageform">	
				<input type="hidden" name="type" id="type" value="0" />
				<input type="hidden" name="startPrice" id="startPrice" value="<s:property value="startPrice"/>" />
				<input type="hidden" name="endPrice" id="endPrice" value="<s:property value="endPrice"/>" />
				<input type="hidden" name="quantityBegin" id="quantityBegin" value="<s:property value="quantityBegin"/>" />
				<input type="hidden" name="postTime" id="postTime" value="<s:property value="postTime"/>" />
				<input type="hidden" name="priceOrder" id="priceOrder" value="<s:property value="priceOrder"/>" />
				<input type="hidden" name="areaCode" id="areaCode" value="<s:property value="areaCode"/>" />
				<input type="hidden" name="searchkey" id="searchkey" value="<s:property value="searchkey"/>" />
				<div id="pageDiv" style="width:700px;padding-right:40px;">
					<s:property value="#request.pageBar0" escape="false"/> 
					<!--第&nbsp;<input type="text" name="page" id="page" style="width:30px;" value="">&nbsp;页 
					<input type="submit" value="确定" onclick="return checkPage();">  -->
			</div>	
			</form>
			
		</div>
		</div>
		<!--产品列表结束--> 
		
		<!--热门推荐开始  -->
		<div id="p4poffer">
			<div class="p4p-search-img" id="p4p:search-window">
				<div class="p4p-header-1">热门推荐</div>
					<ul class="p4p-content">
						
						
						<s:iterator value="productSupplies">
						   <li class="">
							<div class="p4p-pic">
							   <a href="product/displayDetailProduct.action?productId=<s:property value="productId"/>">
							      <img src="<%=request.getContextPath()%><s:property value="smallPicPath"/>">
							   </a>
							</div>
							<h3>
							   <a href="product/displayDetailProduct.action?productId=<s:property value="productId"/>"><s:property value="productName"/></a>
							</h3>
							<p><em>￥<s:property value="price1"/></em></p>
						</li>
						
						</s:iterator>
					
					</ul>
			</div>
		</div>
		
		<!--相关搜索开始-->
		<div id="MutualSearchList">		
		<!--相关搜索结束-->		
		</div>
		
		<div style="clear:both;"></div>
        </div>
		
		 <div class="prolist-right">
        	<img alt="" src="/asn/front/product/images/guanggao1.jpg">
        	<img alt="" src="/asn/front/product/images/guanggao2.jpg">
        </div>
	</div>
<div style="clear: both"></div>

</div>

