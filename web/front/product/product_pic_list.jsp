<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@page import = "java.util.*" %>
<%@page import = "com.bornsoft.asn.vo.ProductBean" %>
<%@page import="com.bornsoft.asn.utils.common.Calculator"%>
<%@page import="com.bornsoft.asn.bean.product.SpecialProduct"%>
<%@page import="com.bornsoft.asn.bean.product.Product"%>
<%@page import="com.bornsoft.asn.utils.common.AsnConstLib"%>
<%
	String pubSvrUrl = "http://pubsvr.aiecp.com/asn";

	String template = (String)request.getAttribute("template");
	String addUrla = "";
	if(template!=null&&template.trim().length()>0)
		addUrla = "&template="+template;
	String addUrlb = "";
	if(template!=null&&template.trim().length()>0)
		addUrlb = "?template="+template;
	String cp = request.getContextPath();
	
	String areaCode = (String)request.getAttribute("areaCode");
	
	String addUrlxa = "";
	String addUrlxb = "";
	if(template!=null&&template.trim().length()>0)
		addUrlxa = "&template=" + template;
	if(areaCode!=null&&areaCode.trim().length()>0)
		addUrlxb = "&areaCode=" + areaCode;
	
%>
<LINK href="../../css/product/product_list.css" type=text/css rel=stylesheet>
<link rel="stylesheet" rev="stylesheet" href="../../front/css/page.css" type="text/css" /> 
<link href="<%=cp%>/css/channel/ncpIndex.css"  rel="stylesheet" type="text/css" />


<link href="<%=cp%>/css/platform/mallIndex.css" type="text/css" rel="stylesheet" />  
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui-1.8rc3.custom.min.js"></script>
<script type="text/javascript" src="<%=cp%>/front/js/bcart/bcart.js"></script>
<link rel="stylesheet" href="<%=cp%>/js/bcart/bcart.css" type="text/css" /> 

<script type="text/javascript"><!--

	function MM_swapImgRestore() { //v3.0
	  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
	}

	function MM_preloadImages() { //v3.0
	  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
	    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
	    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
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
	
function checkInfo(){
    var _startPrice=document.getElementById("price-start").value;
    var _endPrice=document.getElementById("price-end").value;
    var parren = /^[0-9]*$/;

    //var _area= document.getElementById("area").value;
    if(_startPrice != ""){
    	if(!_startPrice.match(parren)){
    		return false;	
         }
     }
    if(_endPrice != ""){
    	if(!_endPrice.match(parren)){
        	alert("输入的价格有误");
    		return false;	
         }
     }q
}
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

//--> 
</script>
    
    <!--主体部分开始-->    
<table width="980" border="0" align="center" cellpadding="0" cellspacing="0" class="m10">
  <tr>
    <!--左边开始-->
    <td width="187" valign="top">
	     <!--产品分类开始-->
	     <table width="100%" border="0" cellspacing="0" cellpadding="0" class="border_left">
		   <tr>
		      <td>
			        <!--推荐产品开始-->
		             <table width="100%" border="0" cellspacing="0" cellpadding="0">
                         <tr>
                            <td height="29" valign="top" class="list_left">推荐产品</td>
                         </tr>
                         <tr>
                             <td valign="top"> <!-- height="608" -->
                             <% List<SpecialProduct> specialProduct = (List<SpecialProduct>)request.getAttribute("specialProduct"); %>
                             
                             <%for(int i =0; i< specialProduct.size(); i++){ 
				  				SpecialProduct sp = specialProduct.get(i);	  			
				  			%>
			                 <div style=" width:180px; float:left;"> 
						      <table width="100%" border="0" cellspacing="0" cellpadding="0">
			                      <tr>
			                        <td class="pordoct_listl" align="center">
										<a href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=sp.getProductId() %><%=addUrla %>"	target="_blank">
										<img border="0" src="<%=request.getContextPath()%><%=sp.getBigPicPath()%>.160x160" /></a>
									</td>
			                      </tr>
								   <tr>
			                        <td height="20" class="cpmc">
			                        <a href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=sp.getProductId() %><%=addUrla %>"	target="_blank">
			                        <%=sp.getName().length()>14?sp.getName().substring(0,14)+"..":sp.getName()%></a></td>
			                      </tr>
								   <tr>
			                        <td height="20" class="price">￥<%=sp.getOriginalPrice()==null?"<font color=green>面议</font>":Calculator.keepTwoDecimal(sp.getNewPrice())%>/<%=sp.getProductUnit() %></td>
			                      </tr>			  
			                  </table>			
						   </div>
			   			   <% } %>
			         
			                 </td>
                         </tr>
			         </table>
					 <!--推荐产品结束-->
		     </td>
		   </tr>
			<tr>
		      <td>
					<!--热卖产品开始-->
					 <table width="100%" border="0" cellspacing="0" cellpadding="0"  style="margin-top:10px;">
						<tr>
			                 <td height="29" valign="top" class="list_left" >热卖产品</td>
			             </tr>
						 <tr>
			                 <td valign="top">
							 <table width="100%" border="0" cellspacing="0" cellpadding="0">
							 	<% List<Product> hotProduct=(List)request.getAttribute("hotProduct"); 
						        		for(int i=0; i<hotProduct.size(); i++){
						        			Product phot = hotProduct.get(i);
						        			if(i==0){
						        %>
			                        <tr>
			                          <td >
									   <table width="100%" border="0" cellspacing="0" cellpadding="0" height="60" class="line">
			                            <tr>
			                              <td width="46%" rowspan="3" class="first">
			                              		<a href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=phot.getProductId() %><%=addUrla %>"	target="_blank">
			                              		<img src="<%=request.getContextPath()%><%=phot.getBigPicPath()%>.52x52" width="52" height="52" border="0" />
			                              		</a>
			                              </td>
			                               
			                              <td width="54%" height="30" class="huib">
			                              		<a href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=phot.getProductId() %><%=addUrla %>"	target="_blank">
			                              		<%=phot.getProductName().length()>7?phot.getProductName().substring(0,7)+"..":phot.getProductName()%></a>
			                              </td>
			                            </tr>
			                            
			                            <tr>
			                              <td height="20" class="wz_xsj">￥<%=phot.getPrice1()==null?"<font color=green>面议</font>":Calculator.keepTwoDecimal(phot.getPrice1()) %>/<%=phot.getProductUnit() %></td>
			                            </tr>
			                          </table>						  </td>
			                       </tr>
			                       <% }else{ %> 
									   <tr>
				                          <td class="rmphb"><span class="wzph"><%=i+1%></span>
				                          	<a href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=phot.getProductId() %><%=addUrla %>"	target="_blank"><%=phot.getProductName()%></a></td>
				                       </tr>
			                       <% 	
			                       			}
						        		}
						        	%>    	
								  
			                   </table>
							   
							   
							   
					        </td>
                         </tr>
			         </table>
					 <!--热卖产品结束-->
			  </td>
           </tr> 
      </table>
    </td>
    <!--左边结束-->
    <td width="10">&nbsp;</td>
	
	
	 <% List<Object> searchList = (List<Object>)request.getAttribute("list");   %>
	 
	<!--主体部分右边开始-->
	<td width="783" valign="top">
	
	  <form action="${pageContext.request.contextPath}/front/mall/product/searchProduct-1" method="post" onsubmit="return checkInfo();" name="myform" id="productInfoList" style="margin: 0px;">
	  <s:hidden  name="type"/>
	  <input type="hidden" name="template" id="template" value="<s:property value="template"/>" />
	  
	  
      <table width="100%" height="30" border="0" cellpadding="0" cellspacing="0" class="szwz">
		  <tr>
		    <td align="left" >		    
				<jsp:include page="../productNavi/typeNavigator.jsp">
					<jsp:param value="<%=template%>" name="template"/>
					<jsp:param value="<%=areaCode%>" name="areaCode"/>
				</jsp:include>
		    
		    </td>
		    <td align="right">共找到 <span class="redb"><%=request.getSession().getAttribute("productCount")%></span> 个商品  </td>
		  </tr>
	   </table>
       <table width="100%" height="43" border="0" cellpadding="0" cellspacing="0" class="border_fenlei">
           <tr>
             <td class="wz_fenlei" style="padding-left:10px;">
             
             
             	<% String typen = (String)request.getAttribute("typen");   
				if(typen.equals(AsnConstLib.NavigatorLevel0_only1)){
				%>
				<jsp:include page="../productNavi/productTypeRoot_only1.jsp">
					<jsp:param value="<%=template%>" name="template"/>
					<jsp:param value="<%=areaCode%>" name="areaCode"/>
				</jsp:include>
					
				<%
				}
				if(typen.equals(AsnConstLib.NavigatorLevel1)) {
				%>
				<jsp:include page="../productNavi/productTypeFirst.jsp">
					<jsp:param value="<%=template%>" name="template"/>
					<jsp:param value="<%=areaCode%>" name="areaCode"/>
				</jsp:include>
				<%
				}
				else if(typen.equals(AsnConstLib.NavigatorLevel2)){
				%>
				<jsp:include page="../productNavi/productTypeSec.jsp">
					<jsp:param value="<%=template%>" name="template"/>
					<jsp:param value="<%=areaCode%>" name="areaCode"/>
				</jsp:include>
				<%
				}
				//add by hooxin
				else if(typen.equals(AsnConstLib.NavigatorLevel3)){
				%>
				<jsp:include page="../productNavi/productTypeFac.jsp">
					<jsp:param value="<%=template%>" name="template"/>
					<jsp:param value="<%=areaCode%>" name="areaCode"/>
				</jsp:include>
				<%
					}
				%>
             
             </td>
         </tr>
      </table>
	     	 
	  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="bg42"> 
           <tr>
             <td width="170" height="42" class="gjz" nowrap>搜索关键字：<s:textfield name="searchkey" cssStyle="width: 100px;"></s:textfield></td>
			 <td width="180" height="42">价格：
			   <s:textfield id="price-start" cssStyle="width: 40px;" name="startPrice" />-
			   <s:textfield id="price-end" cssStyle="width: 40px;" name="endPrice"  />元</td>
			
			 <td width="185" height="42">起订量：
		     <s:textfield id="quantity-begin" name="quantityBegin" cssStyle="width: 60px;"  />&nbsp;以上</td>
			  <td width="20"><img src="../../image/product/fgx20.jpg" /></td>
			  <td width="228"><input id="sx_ctrl_btn" value=" " type="submit" style="background: url('../../image/product/queding59.jpg') no-repeat; width: 59px; height:23px; border: 0;cursor: pointer;" ></td>
         </tr>
      </table>
      
	  <table width="100%" height="34" border="0" cellpadding="0" cellspacing="0"  class="plys">
           <tr>
             <td width="26" align="center"><a href="#" onclick="myform.action='searchProduct-2';myform.submit();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image14','','../../image/product/lb2.jpg',1)"><img src="../../image/product/lb1.gif" name="Image14" width="16" height="16" border="0" id="Image14" /></a></td>
			 <td width="26">列表</td>
			 <td width="26" align="center"><img src="../../image/product/dt2.jpg" width="16" height="16" /></td>
			 <td width="26">大图</td>
			 <td  width="220" align="right">排序：
				<s:select list="#{'':'默认排序','asc':'价格从低到高','desc':'价格从高到低'}" name="priceOrder" onchange="myform.action='searchProduct-1';myform.submit();"></s:select>
			 </td>
			 <td  width="15"></td>
			 <td width="19"><img src="../../image/product/jiage.jpg" /></td>
			 <td width="19"><img src="../../image/product/xiaoliang.jpg" /></td>
			 <td width="19"><img src="../../image/product/renqi.jpg" /></td>
			 <td align="right">
			 
			 	<%if(template!=null&&"xs".equals(template)){
					%>
					<input type="hidden" name="areaCode" id="areaCode" value="<s:property value="areaCode"/>" />所有地区：秀山
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
			 			}" name="areaCode" onchange="myform.action='searchProduct-1';myform.submit();">
			 	</s:select>
			 	<%} %>
			 </td>
			 <td width="40"></td>
           </tr>
      </table>
      
      </form>
      
	  
	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <tr>
		    <td>
		    	<%if(searchList == null || searchList.size()<=0){%>
				  	<div style="width: 100%;">
				  		<table cellpadding="0" cellspacing="0">
			  				<tr>
			  					<td width="30%" align="right"><img src="../../image/product/warning_48.png" /></td>
			  					<td width="70%" style="font-size:18px;font-weight: 700;color: #000000;">
			  						很抱歉，没有找到与" <font color="red"><s:property value="searchkey"/></font> "相关的产品</td>
			  			</table>				  	
				  	</div>
				  <%
				  	}else{
				  		for(int i = 0; i<searchList.size(); i++){
				    		ProductBean  pb = (ProductBean)searchList.get(i);		    		
				  %>
			   <div style=" width:195px; float:left;">
					      <table width="100%" border="0" cellspacing="0" cellpadding="0">
		                      <tr>
		                        <td class="w168" align="center">
		                        	<a href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=pb.getProduct().getProductId() %><%=addUrla %>" target="_blank">
		                        	<img src="<%=request.getContextPath()%><%=pb.getProduct().getBigPicPath() %>.168x168" width="168" height="168" border="0" />
		                        	</a>
		                        </td>
		                      </tr>
							   <tr>
		                        <td height="20" class="cpmc"><a href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=pb.getProduct().getProductId() %><%=addUrla %>" target="_blank"><%=pb.getProduct().getProductName() %></a></td>
		                      </tr>
							 
							   <tr>
		                        <td height="20" class="price_scj">市场价：￥<%=pb.getProduct().getMarketPrice()==null?(pb.getProduct().getPrice1()==null?"<font color=green>面议</font>":Calculator.keepTwoDecimal(pb.getProduct().getPrice1()*1.1)):Calculator.keepTwoDecimal(pb.getProduct().getMarketPrice()) %>/<%=pb.getProductUnit() %></td>
		                      </tr>
							   <tr>
		                        <td height="20" class="price">销售价：<%=pb.getProduct().getPrice1()==null?"<font color=green>面议</font>":"￥"+Calculator.keepTwoDecimal(pb.getProduct().getPrice1()) %>/<%=pb.getProductUnit() %></td>
		                      </tr>
							    <tr>
		                        <td height="45" align="center">
		                        	<a href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=pb.getProduct().getProductId() %><%=addUrla %>" target="_blank">
		                        		<img src="../../image/product/ljgm.jpg" border="0" width="115" height="33" />
		                        	</a>
		                        </td>
		                      </tr>
		  
		                  </table>
		
			 </div>
			    
			 <% 	} 
				 }
			 %>  			  
			  
					   
			</td>
		  </tr>
  		  <tr><td height="50">
  		  	
  		  	<form action="${pageContext.request.contextPath}/front/mall/product/searchProduct-1" method="get" name="pageform" id="pageform">	
				<input type="hidden" name="type" id="type" value="<s:property value="type"/>" />
				<input type="hidden" name="startPrice" id="startPrice" value="<s:property value="startPrice"/>" />
				<input type="hidden" name="endPrice" id="endPrice" value="<s:property value="endPrice"/>" />
				<input type="hidden" name="quantityBegin" id="quantityBegin" value="<s:property value="quantityBegin"/>" />
				<input type="hidden" name="postTime" id="postTime" value="<s:property value="postTime"/>" />
				<input type="hidden" name="priceOrder" id="priceOrder" value="<s:property value="priceOrder"/>" />
				<input type="hidden" name="areaCode" id="areaCode" value="<s:property value="areaCode"/>" />
				<input type="hidden" name="searchkey" id="searchkey" value="<s:property value="searchkey"/>" />
				<input type="hidden" name="template" id="template" value="<s:property value="template"/>" />
				<div id="pageDiv" style="width:700px;padding-right:40px;">
					<s:property value="#request.pageBar0" escape="false"/> 
			</div>	
			</form>
  		  	
  		  </td></tr>
	</table>


	</td>
	
  </tr>
</table>

<!--主体部分右边结束-->