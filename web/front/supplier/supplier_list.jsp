<%@  page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags"  %>
<%@ page import="java.util.List"  %>
<%@ page import="java.util.Map"  %>
<%@ page import="com.bornsoft.asn.bean.product.*"  %>
<%
	String cp=request.getContextPath();
	String pubSvrUrl = "http://pubsvr.aiecp.com/asn";
	
	String template = (String)request.getAttribute("template");
	String addUrla = "";
	if(template!=null&&template.trim().length()>0)
		addUrla = "&template="+template;
	String addUrlb = "";
	if(template!=null&&template.trim().length()>0)
		addUrlb = "?template="+template;
%>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<link href="../../front/css/supplier.css"  rel="stylesheet" type="text/css" />
<link rel="stylesheet" rev="stylesheet" href="../../front/css/page.css" type="text/css" />


<script type="text/javascript">
			
function checkPage(){
	var totalPage = document.getElementById("totalPage").value;
	var inPage = document.getElementById("pageBox").value;
	if(isNaN(inPage)||inPage==""){
		alert("请输入数字");
		return false;
	}			
	if(parseInt(inPage) > parseInt(totalPage)){		
		document.getElementById("thePage").value=totalPage;
	}else{
		document.getElementById("thePage").value=parseInt(inPage);
	}
	return true;
}

		function submitArea(elem){			
			elem.form.method="GET";
			elem.form.submit();
		}
</script>
<div class="initALL">
<div class="initdiv">	

	<div class="search">
		<div class="sea_left">&nbsp;<!--<img src="../../../images/supplier/logo220.gif">--></div>
		<form action="/asn/front/mall/supplier/searchSupplier" method="post" name="myform"> 
		<input type="hidden" name="area" id="area" value="<s:property value="area"/>" />	
		<input type="hidden" name="template" id="template" value="<s:property value="template"/>" />
		<div class="sea_mid">
			<!--<div style="width:663px; float:left; height:54px;">&nbsp;</div>-->
			<div style="width:663px; float:left; height:55px; background:url(../../../images/supplier/sousuo_bg.gif) no-repeat;">			
				<table width="663" height="44" cellpadding="0" cellspacing="0">
					<tr>               
						<td width="78"><s:select list="#{'':'类型','1':'单位','2':'个人'}" name="suppliertype" value="%{suppliertype}"  cssStyle="height:22px;width:65px;margin-left:10px;" theme="simple" ></s:select></td>
						<td width="350"><s:textfield id="searchkey" name="searchkey" cssStyle="height:16px;width:345px;" theme="simple"></s:textfield></td>
						<td width="160"><s:select list="%{secondType}" name="productType" listKey="pttypeName" listValue="pttypeName" headerKey="-1" headerValue="所有分类"  cssStyle="width:155px;height:22px;" theme="simple"></s:select>	</td>
						<td width="70"><input type="image" src="../../../images/supplier/search.jpg"></td>
					</tr>           
				</table>    
			</div>			       
			               
		</div>           
		<div class="sea_right">
			<span style="height:55px; "><a href="#">搜索帮助</a></span>
		</div>
		</form>
	</div>

	<!-- <div id="menu">&nbsp;</div> -->
	
	
	<div id="site">&nbsp;首页&nbsp;>&nbsp;<!-- <a href="">供应商</a> > --><strong>所有供应商</strong></div>
	
	<div class="initdiv">		
		<div class="con_left">
			<div class="left_title">最近加入的供应商</div>
			<div class="left_zjgys toline">
				<% 
					List list = (List)request.getAttribute("nearlist");
					if(list.size() > 0){
						for(int i=0;i< list.size() ;i++){
						Map<String,Object> m = (Map<String,Object>)list.get(i);	
				%>
					<a href="<%=cp%>/front/shop/supplierShopSy?supplierid=<%=m.get("supplierId")%><%=addUrla%>" target="_blank"><span><%=m.get("fullName") %></span></a>								
				<%		
						}
					}
				%>         
			</div>
			<div class="ads">
				<a href="<%=cp%>/front/shop/supplierShopSy?supplierid=338<%=addUrla%>" target="_blank"><img src="<%=cp%>/front/images/supplier/Ads01.gif" border="0" /></a>
			</div>   
			<div class="left_title">热卖排行</div>     
			<div class="left_hot toline">     
				<% 	List hotlist = (List)request.getAttribute("productSupply"); 
					if(hotlist.size() >0){
					Product phot = (Product)hotlist.get(0); 
				%>
				<div class="hot1">
					<span style="width:72px; height:72px; float:left;"><a href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=phot.getProductId()%><%=addUrla%>" target=_blank"><img src="${pageContext.request.contextPath}<%=phot.getSmallPicPath() %>" height="70" width="70"style="border:1px solid #e4e4e4; padding:2px;" /></a></span>
					<span style="width:90px; height:80px; padding-left:10px; float:left;">
						<div style="width:90px; float:left; height:20px;"><img src="../../../images/supplier/top1.gif"></div>
						<div style="width:90px; float:left; font-weight:700;"><a href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=phot.getProductId()%><%=addUrla%>" target=_blank"><%=phot.getProductName() %></a></div>
					</span>
				</div>
				
				<div class="hot2">
				<% 	for(int i=1;i<hotlist.size(); i++){
					Product phot2 = (Product)hotlist.get(i);
					if(i == (hotlist.size()-1)){ 
				%>
						<div class="hot-con"><span><%=(i+1)%></span><a href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=phot2.getProductId() %><%=addUrla%>" target=_blank" class="hot-a"><%=phot2.getProductName() %></a></div>
					<%}else{ %>	
						<div class="hot-con hotline"><span><%=(i+1)%></span><a href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=phot2.getProductId() %><%=addUrla%>" target=_blank" class="hot-a"><%=phot2.getProductName() %></a></div>
					<%} 
					}	
				%>				
				</div>
				<% 	
					}else{
				%>
					<div class="hot1">
						<span style="width:150px; height:72px; float:left;">暂无热卖排行</span>						
					</div>
				<%		
					} 
				%>
			</div>
			<div class="ads">      
				<a href="<%=cp%>/front/shop/supplierShopSy?supplierid=7<%=addUrla%>" target="_blank"><img src="<%=cp%>/front/images/supplier/Ads02.gif" border="0" /> </a>       
			</div> 
		</div>
		
		<div class="con_box">
			<form action="/asn/front/mall/supplier/searchSupplier" method="get" name="myform3">
			<input type="hidden" name="template" id="template" value="<s:property value="template"/>" />		
			<ul class="spp-title">
				<li>所有供应商</li>
			</ul>
			<ul class="ultitle">
				<li class="li0" style=" padding-top:12px;">供应商信息</li>
				<li class="li1" style=" padding-top:12px; color:#000000; font-weight:100;">商品总数</li>
				<li class="li2" style=" padding-top:12px;">联系方式</li>
				<li class="li3" style=" padding-top:10px;">
				
					<%if(template!=null&&"xs".equals(template)){
					%>
					<input type="hidden" name="area" id="area" value="<s:property value="area"/>" />所有地区
					<%
					}else{%>
					<s:select list="#{'':'所在地',
			 				'110000':'北京市',
			 				'120000':'天津市',
			 				'130000':'河北省',
			 				'140000':'山西省',
			 				'150000':'内蒙古自治区',
			 				'210000':'辽宁省',
			 				'220000':'吉林省',
			 				'230000':'黑龙江省',
			 				'310000':'上海市',
			 				'320000':'江苏省',
			 				'330000':'浙江省',
			 				'340000':'安徽省',
			 				'350000':'福建省',
			 				'360000':'江西省',
			 				'370000':'山东省',
			 				'410000':'河南省',
			 				'420000':'湖北省',
			 				'430000':'湖南省',
			 				'440000':'广东省',
			 				'450000':'广西壮族自治区',
			 				'460000':'海南省',
			 				'500000':'重庆市',
			 				'510000':'四川省',
			 				'520000':'贵州省',
			 				'530000':'云南省',
			 				'540000':'西藏自治区',
			 				'610000':'陕西省',
			 				'620000':'甘肃省',
			 				'630000':'青海省',
			 				'640000':'宁夏回族自治区',
			 				'650000':'新疆维吾尔自治区',
			 				'710000':'台湾省',
			 				'810000':'香港特别行政区'
			 			}" name="area" onchange="myform3.submit();" cssStyle="width:90px;">
			 		</s:select>			 	
					<%} %>
					</li>
				<li class="li4" style=" padding-top:12px;">信用保证</li>
			</ul>
			</form>
			
			<s:iterator value="searchlist" id="list">
			<ul class="uls">
				<li class="li0">
					<span class="p1"><!--<a href="searchSupplierInfo?supplierid=<s:property value="supplierId" />" target="_blank"><s:property value="fullName" /></a>-->
					<a href="<%=cp%>/front/shop/supplierShopSy?supplierid=<s:property value="supplierId" /><%=addUrla%>" target="_blank"><s:property value="fullName" /></a>
					<s:if test='supplierType == "1"'>[企业]</s:if>
					<s:elseif test='supplierType == "2"'>[个人]</s:elseif>
					</span>
					<span class="p2">主要经营：<font color="#4d69a8">
										<%  Object bizDomain = request.getAttribute("bizDomain"); 
											if(bizDomain!=null){
												if(bizDomain.toString().length() < 38){
													out.print(bizDomain);
												}else{
													out.print(bizDomain.toString().substring(0,38)+"...");
												}	 
											}
										%></font></span>	 
				</li>                     
				<li class="li1 dq"><s:property value="amount" /></li> 
				<li class="li2">
					<span class="p1"><s:property value="contactor" /></span>
					<span class="p2" style="padding-top:3px;">
					<%if(request.getAttribute("qq") != null){ %>
					<a target=blank href=http://wpa.qq.com/msgrd?V=1&Uin=<%=request.getAttribute("qq")%>&Exe=QQ&Site=望龙门—农业综合服务网络平台&Menu=yes><img border="0" SRC=http://wpa.qq.com/pa?p=3:<%=request.getAttribute("qq")%>:3 alt="和我联系"></a>
					<% }else{
					%>
					<font color="blue">暂无在线联系</font>
					<%	} %>	
					</span>				
				</li>
				<li class="li3 dq"><s:property value="area" /></li>
				<li class="li4">
					<span class="p1">     
					<%  int sum  =0;
						String table="";
						String deji="";
						String str = request.getAttribute("reviewAverage").toString(); 
						if(str != null){
							sum= Integer.parseInt(str);
							switch(sum){
								case 1: deji = "一";break;
								case 2: deji = "二";break;
								case 3: deji = "三";break;
								case 4: deji = "四";break;
								case 5: deji = "五";break;
							}
						}
						for(int i=0; i< sum;i++){
							table +="<img src='"+cp+"/front/product/images/xinyong.gif' alt='"+deji+"钻石卖家' title='"+deji+"钻石卖家' style='cursor:pointer;'>";
						} 
						out.print(table);
					%>
					</span>
					<s:if test='promiseState == "promise"'>
						<span class="p2"><img src="<%=cp%>/front/images/supplier/16_4.gif" alt="诚信承诺" title="诚信承诺" style="cursor:pointer;" /></span>	
					</s:if>
					<s:else>
					<span class="p2">无</span>    
					</s:else>
					
				</li>
			</ul>
			</s:iterator>
			
			
		<form action="${pageContext.request.contextPath}/front/mall/supplier/searchSupplier" method="get" name="pageform" id="pageform">	
		<input type="hidden" name="suppliertype" id="suppliertype" value="<s:property value="suppliertype"/>" />	
		<input type="hidden" name="searchkey" id="searchkey" value="<s:property value="searchkey"/>" />	
		<input type="hidden" name="productType" id="productType" value="<s:property value="productType"/>" />	
		<input type="hidden" name="area" id="area" value="<s:property value="area"/>" />	
		<input type="hidden" name="template" id="template" value="<s:property value="template"/>" />
			<div id="pageDiv" style="width:680px;">
				<s:property value="#request.pageBar" escape="false"/>				
			</div>	
			</form>
		</div>		
	</div>
</div>
</div>
