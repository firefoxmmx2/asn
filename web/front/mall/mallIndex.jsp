<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.bornsoft.asn.bean.product.Product"%>
<%@page import="com.bornsoft.asn.bean.product.SpecialProduct"%>
<%@page import="java.util.*"%>
<%@page import="com.bornsoft.asn.utils.common.Calculator"%>
<%@page import="com.bornsoft.asn.service.order.*"%>
<%@page import="com.bornsoft.asn.bean.order.*"%>
<% 
	String cp = request.getContextPath(); 
	String pubSvrUrl = "http://pubsvr.aiecp.com/asn";
	String topMenuUrl = "http://www.cqncp.com/asn";
%>

<script type="text/javascript">
<!--

//$(document).ready(function(){
//	setTimeout(function(){
//		//$('#welcome').addClass('hidden');
//		$("#welcome").hide(2000);		
//	}, 30000);
//});
//-->
</script>

<!-- 
<table width="980" border="0" align="center" cellpadding="0" cellspacing="0" id="welcome" class="m10">
	<tr>
		<td>
			 <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase=" http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="980" height="150">
		      <param name="movie" value="<%=request.getContextPath() %>/flash/platform/welcome.swf" />
		      <param name="quality" value="high" />
		      <embed src="<%=request.getContextPath() %>/flash/platform/welcome.swf" quality="high" pluginspage=" http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="980" height="150"></embed>
		    </object>
		</td>
	</tr>
</table>        
 -->
<table width="980" border="0" align="center" cellpadding="0" cellspacing="0" class="m10">
	<tr>
		<!--左边开始-->
		<td width="187" valign="top">
		
		<!--产品分类开始-->
		<table width="187" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="29"><img
					src="${pageContext.request.contextPath }/image/platform/cpfl.jpg"
					width="187" height="29" /></td>
			</tr>
			<tr>
				<td>
					<%@include file="ptype.jsp"%> 
				</td>
			</tr>
		</table>
		<!--产品分类结束--> 
		
		<!--广告-->
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="m10">
			<tr>
				<td height="76"><img src="<%=cp%>/image/platform/guanggao1.jpg"
					width="187" height="76" /></td>
			</tr>
			
			<!-- ********广告位*****2010-12-02******** -->
			<tr>
				<td align="center" height="60" style="padding-top:5px;">
					<a href="http://top.aweb.com.cn/tpph.jsp?aw=13" target="_blank">
					<img src="<%=request.getContextPath()%>/image/ads/12860.gif" border="0">
					</a>
				</td>
			</tr>
			<!-- ********广告位*****2010-12-02******** -->
		</table>
		
		
		<!--供应商开始-->
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="m10">
			<tr>
				<td height="29"><img src="<%=cp%>/image/platform/wsdc.jpg"
					width="187" height="30" /></td>
			</tr>
			<tr>
				<td valign="top" class="border_bule">

				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<% 
							List list = (List)request.getAttribute("nearlist");
							if(list.size() > 0){
								for(int i=0;i< list.size() ;i++){
								Map<String,Object> m = (Map<String,Object>)list.get(i);	
						%>
					<tr>
						<td class="square"><a
							href="<%=cp %>/front/shop/supplierShopSy?supplierid=<%=m.get("supplierId") %>"
							target="_blank"><%=m.get("fullName").toString().length()>10?m.get("fullName").toString().substring(0,10)+" . . .":m.get("fullName") %></a>
						</td>
					</tr>
					<%		
								}
							}
						 %>
				</table>

				</td>
			</tr>
		</table>
		
		<!--最热评论开始-->
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="m10">
			<tr>
				<td height="29"><img src="<%=cp%>/image/platform/zrpl.jpg"
					width="187" height="30" /></td>
			</tr>
			<tr>
				<td valign="top" class="border_bule">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<% List<Product> viewProduct = (List<Product>)request.getAttribute("viewProduct");
			           for(int i =0; i< viewProduct.size(); i++){ 
					  	Product p = viewProduct.get(i);	  			
		  			%>
					<tr>
						<td class="square"><a target="_blank"
							href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=p.getProductId() %>"><%=p.getProductName().length()>10?p.getProductName().substring(0,10)+" . . .":p.getProductName() %></a></td>
					</tr>
					<% } %>


				</table>
				</td>
			</tr>
		</table>
		<!--最热评论结束--></td>
		<!--左边结束-->
		<td width="10">&nbsp;</td>
		<td width="783" valign="top">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="581" valign="top">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="qiehuan">

						<script language="JavaScript"> 
								var focus_width=578;
								var focus_height=223;
								var text_height=0;
								var swf_height = focus_height+text_height;
								//var pics='<%=cp%>/image/platform/577x223_01.jpg|<%=cp%>/image/platform/577x223_02.jpg|<%=cp%>/image/platform/577x223_03.jpg';
								//var links='<%=cp%>/image/platform/577x223_01.jpg|<%=cp%>/image/platform/577x223_02.jpg|<%=cp%>/image/platform/577x223_03.jpg';
								var pics ='<%=cp%>/image/platform/miaoshaActive.jpg';
								var links='http://www.cqncp.com/asn/front/activity/secKill';
								var texts='';
								document.write('<object  classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ focus_width +'" height="'+ swf_height +'">');
								document.write('<param name="allowScriptAccess" value="sameDomain"><param name="movie" value="<%=cp%>/front/productNavi/root_files/pixviewer.swf"><param name="quality" value="high"><param name="bgcolor" value="#F0EFEF">');
								document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
								document.write('<param name="FlashVars" value="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'">');
								document.write('<embed src="<%=cp%>/front/productNavi/root_files/pixviewer.swf" wmode="opaque" FlashVars="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'" menu="false" bgcolor="#F0EFEF" quality="high" width="'+ focus_width +'" height="'+ focus_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />');
								document.write('</object>');
							</script>
						
						</td>
					</tr>
				</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="m10">
					<tr>
						<td class="tui">
							<a href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=586" target="_blank">
							<img src="<%=cp%>/image/platform/chanpin1.jpg" border="0" /></a>
						</td>
						<td width="14"></td>
						<td class="tui">
							<a href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=623" target="_blank">
							<img src="<%=cp%>/image/platform/chanpin2.jpg" border="0" /></a>
						</td>
						<td width="14"></td>
						<td class="tui">
							<a href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=617" target="_blank">
							<img src="<%=cp%>/image/platform/chanpin3.jpg" border="0" /></a>
						</td>
					</tr>
					<tr>
						<td height="22" class="wzg"><a href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=452" target="_blank">怡留香原汁食醋 </a></td>
						<td></td>
						<td class="wzg"><a href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=627" target="_blank">武隆羊角豆干（麻辣）130g</a></td>
						<td></td>
						<td class="wzg"><a href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=447" target="_blank">毛哥老鸭汤350g</a></td>
					</tr>
					<tr>
						<td height="22" class="wzg"><a href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=583" target="_blank">江津米花糖（果味）280g</a></td>
						<td></td>
						<td class="wzg"><a href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=492" target="_blank">田园良品金银花饮料  </a></td>
						<td></td>
						<td class="wzg"><a href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=95" target="_blank">野生猕猴桃 </a></td>
					</tr>
					<tr>
						<td height="22" class="wzg"><a href="<%=cp%>/front/prodcut/displayDetailProduct.action?productId=497" target="_blank">妙泉金银花茶袋装  </a></td>
						<td></td>
						<td class="wzg"><a href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=79" target="_blank">玫瑰香葡萄</a></td>
						<td></td>
						<td class="wzg"><a href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=529" target="_blank">合川桃片（精制椒盐）70g*5</a></td>
					</tr>
				</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="26"><img src="<%=cp%>/image/platform/xpss.jpg"
							width="535" height="27" /></td>
						<td height="26"><a href="<%=topMenuUrl%>/front/mall/product/searchProduct-1?ncpType=product" target="_blank"><img src="<%=cp%>/image/platform/more.jpg" border="0" /></a> </td>
					</tr>
				</table>

				<!-- ****************新品上市******************** --> 
				<% List<SpecialProduct> newProduct = (List<SpecialProduct>)request.getAttribute("newProduct"); %>
				<table width="100%" height="350" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td width="100%" height="100%" valign="top">
						<%for(int i =0; i< newProduct.size(); i++){ 
							SpecialProduct newp = newProduct.get(i);	  			
	  				%>
						<div style="width: 145px; float: left;">
						<table cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td class="chanpin" align="center"><a target="_blank"
									href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=newp.getProductId() %>"><img
									border="0" src="<%=cp%><%=newp.getBigPicPath()%>.111x102" /></a></td>
							</tr>
							<tr>
								<td align="center" class="huib" height="20"><a
									target="_blank"
									href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=newp.getProductId() %>"><%=newp.getName().length()>7?newp.getName().substring(0,7)+"..":newp.getName()%></a></td>
							</tr>
							<tr>
								<td align="center" class="wz_scj" height="16">市场价：<span
									class="scj">￥<%=newp.getOriginalPrice()==null?"<font color=green>面议</font>":Calculator.keepTwoDecimal(newp.getOriginalPrice())%></span></td>
							</tr>
							<tr>
								<td align="center" class="wz_xsj" height="16"><a
									target="_blank"
									href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=newp.getProductId() %>">销售价：￥<%=newp.getOriginalPrice()==null?"<font color=green>面议</font>":Calculator.keepTwoDecimal(newp.getNewPrice())%></a></td>
							</tr>
						</table>
						</div>
						<% } %>
						</td>
					</tr>
				</table>
				<!-- ****************新品上市******************** --></td>
				<td width="10">&nbsp;</td>


				<td width="192" valign="top">
				<!-- ****************会员中心******************** -->
				
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="29" background="<%=request.getContextPath()%>/image/platform/welcome_bg.jpg" class="baib" align="center">会员中心</td>
					</tr>
					<tr>
					    <td valign="top" class="border_bule">
					    	<iframe src="http://appsvr.aiecp.com:8080/ptnsso/signon/indexLoginncp.sso" width="100%" height="100%" frameborder="0" scrolling="no" marginheight="0" align="center"></iframe>
					    
						</td>
					</tr>
				</table>
								
				<!-- ****************会员中心******************** loginOk.jsp-->
				

				<!--***************************最新订单开始*****************************-->
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="m10">
					<tr>
						<td height="29"><img src="<%=cp%>/image/platform/zxdd.jpg"
							width="192" height="30" /></td>
					</tr>
					<tr>
						<td valign="top" class="border_bule">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<%List<Order> orList=(List)request.getAttribute("sucOrderInfo"); %>
							<%for(int j=0;j<orList.size();j++){%>
							<%List<OrderItem> items= OrderService.findOrderItemByOrderId(orList.get(j).getId()); %>
							<tr>
								<td class="square"><a target="_blank"
									href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=items.get(0).getItemProductId() %>">****购买了<%=items.get(0).getItemProductName().length()>7?items.get(0).getItemProductName().substring(0,7)+"...":items.get(0).getItemProductName()%></a></td>
							</tr>
							<% } %>
						</table>
						</td>
					</tr>
				</table>
				<!--******************最新订单结束*****************--> <!--******************热卖排行榜开始***************-->
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="m10">
					<tr>
						<td height="29"><img src="<%=cp%>/image/platform/rmphb.jpg"
							width="192" height="30" /></td>
					</tr>
					<tr>
						<td valign="top" class="border_bule">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<% List<Product> hotProduct=(List)request.getAttribute("hotProduct"); 
			        		for(int i=0; i<hotProduct.size(); i++){
			        			Product phot = hotProduct.get(i);
			        			if(i==0){
			        	%>
							<tr>
								<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0"
									height="60" class="line">
									<tr>
										<td width="46%" rowspan="3" class="first"><img
											src="<%=cp%><%=phot.getBigPicPath()%>.52x52" width="52"
											height="52" /></td>
										<td width="54%" height="20" class="huib"><a
											href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=phot.getProductId() %>"
											target="_blank"><%=phot.getProductName()%></a></td>
									</tr>
									<!--   
                            <tr>
                              <td height="20"></td>
                            </tr>
                            -->
									<tr>
										<td height="20" class="wz_xsj">￥<%=phot.getPrice1()==null?"<font color=green>面议</font>":Calculator.keepTwoDecimal(phot.getPrice1()) %></td>
									</tr>
								</table>
								</td>
							</tr>
							<% }else if(i<8){ %>
							<tr>
								<td class="rmphb"><span class="wzph"><%=i+1%></span><a
									href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=phot.getProductId() %>"
									target="_blank"><%=phot.getProductName()%></a></td>
							</tr>
							<% 		} 
			        			} 
			        	%>
						</table>
						</td>
					</tr>
				</table>
				<!--********************热卖排行榜结束*****************--></td>
			</tr>
			<tr>
				<td colspan="3">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="m10">
					<tr>
						<td>
						
							<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase=" http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="782" height="90">
						      <param name="movie" value="<%=request.getContextPath() %>/flash/platform/flash_dzsw.swf" />
						      <param name="quality" value="high" />
						      <embed src="<%=request.getContextPath() %>/flash/platform/flash_dzsw.swf" quality="high" pluginspage=" http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="782" height="90"></embed>
						    </object>
							
						
						</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td>
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="m10">
					<tr>
						<td height="26"><img src="<%=cp%>/image/platform/tuijcp.jpg"
							width="535" height="27" /></td>
						<td height="26"><a href="<%=topMenuUrl%>/front/mall/product/searchProduct-1?ncpType=product" target="_blank"><img src="<%=cp%>/image/platform/more.jpg" border="0" /></a></td>
					</tr>
				</table>

				<% List<SpecialProduct> specialProduct = (List<SpecialProduct>)request.getAttribute("specialProduct"); %>
				<table width="100%" height="350" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td width="100%" height="100%" valign="top">
						<%for(int i =0; i< specialProduct.size(); i++){ 
	  				SpecialProduct sp = specialProduct.get(i);	  			
	  			%>
						<div style="width: 145px; float: left;">
						<table cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td class="chanpin" align="center"><a target="_blank"
									href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=sp.getProductId() %>"><img
									border="0" src="<%=cp%><%=sp.getBigPicPath()%>.111x102" /></a></td>
							</tr>
							<tr>
								<td align="center" class="huib" height="20"><a
									target="_blank"
									href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=sp.getProductId() %>"><%=sp.getName().length()>7?sp.getName().substring(0,7)+"..":sp.getName()%></a></td>
							</tr>
							<tr>
								<td align="center" class="wz_scj" height="16">市场价：<span
									class="scj">￥<%=sp.getOriginalPrice()==null?"<font color=green>面议</font>":Calculator.keepTwoDecimal(sp.getOriginalPrice())%></span></td>
							</tr>
							<tr>
								<td align="center" class="wz_xsj" height="16"><a
									target="_blank"
									href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=sp.getProductId() %>">销售价：￥<%=sp.getOriginalPrice()==null?"<font color=green>面议</font>":Calculator.keepTwoDecimal(sp.getNewPrice())%></a></td>
							</tr>
						</table>
						</div>
						<% } %>
						</td>
					</tr>
				</table>

				</td>
				<td>&nbsp;</td>
				<td valign="top"><!--特价产品开始-->
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="m10">
					<tr>
						<td height="29"><img src="<%=cp%>/image/platform/tjcp.jpg"
							width="192" height="30" /></td>
					</tr>
					<tr>
						<td valign="top" class="border_bule">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<% List<SpecialProduct> specialPriceProduct = (List<SpecialProduct>)request.getAttribute("specialPriceProduct"); %>
							<%for(int i =0; i< specialPriceProduct.size(); i++){ 
			  				SpecialProduct pp = specialPriceProduct.get(i);	  			
			  			%>
							<tr>
								<td class="square"><a target="_blank"
									href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=pp.getProductId() %>"><%=pp.getName() %></a></td>
							</tr>
							<% } %>
							<%if(specialPriceProduct.size()<12){
						   for(int i=specialPriceProduct.size();i<12;i++){
					   %>
							<tr>
								<td height="30">&nbsp;</td>
							</tr>
							<% 	} 
						  } 
					   %>
						</table>
						</td>
					</tr>
				</table>
				<!--特价产品结束--></td>
			</tr>
		</table>
		</td>


	</tr>
</table>
<br>


<!-- ***************下面为对联添加代码******************* -->
<script type="text/javascript"> 
window.onload = function(){ 
/* 
//参数说明： 
// No1:控件的名称，需要不一样，爱加多少个随你喜欢 
// No2:控件初始时的top值。 
// No3:控件初始时的left值，正值为相对左的left，负数为相对右边的值 
*/ 
new couplet("maple1",10,8); 
new couplet("maple2",10,-8); 
} 
function couplet(){ 
if(arguments.length>=1) this.objID = document.getElementById(arguments[0]); 
if(arguments.length>=2) this.divTop = arguments[1]; 
if(arguments.length>=3) this.divPlane = arguments[2]; 
if(arguments.length>=4) this.scrollDelay = arguments[4]; 
if(arguments.length>=5) this.waitTime = arguments[5]; 
if(!this.objID){ 
alert("对象名【"+ arguments[0] +"】无效，对联无法初始化，请检查对象名称是否正确！"); 
this.objID = null; return; 
}else{ 
this.objID.style.position="absolute"; 
this.objID.style.display="block"; 
this.objID.style.zIndex=9999; 
} 
if("" == this.objID.style.top){ 
if(isNaN(this.divTop)){ 
alert("对象垂直位置(top)参数必须为数字。"); return; 
}else{ 
this.objID.style.top = this.divTop+"px"; 
} 
} 
if("" == this.objID.style.left && "" == this.objID.style.right){ 
if(isNaN(this.divPlane)){ 
alert("对象水平位置(left||right)参数必须为数字。"); return; 
} 
if(this.divPlane>0) this.objID.style.left = this.divPlane+"px"; 
if(this.divPlane<0) this.objID.style.right = Math.abs(this.divPlane)+"px"; 
} 
if(this.scrollDelay<15 || isNaN(this.scrollDelay)) this.scrollDelay = 15; 
if(this.waitTime<500 || isNaN(this.waitTime)) this.waitTime = 500; 
if(arguments.length>=1) this.start(); 
} 
couplet.prototype.start = function(){ 
if(null == this.objID) return; 
var objCouplet = this; 
timer = this.scrollDelay; 
objCouplet.lastScrollY = 0; 
objCouplet.timerID = null; 
objCouplet.startID = function(){ 
if("block" == objCouplet.objID.style.display){ 
objCouplet.run(); 
}else{ 
clearInterval(objCouplet.timerID); 
} 
} 
objCouplet.Begin = function(){ 
objCouplet.timerID = setInterval(objCouplet.startID,timer); 
} 

setTimeout(objCouplet.Begin,this.waitTime); 
} 
couplet.prototype.run = function(){ 
if(document.documentElement && document.documentElement.scrollTop){ 
uu_scrY = parseFloat(document.documentElement.scrollTop); 
}else if(document.body){ 
uu_scrY = parseFloat(document.body.scrollTop); 
} 
uu_divX = parseFloat(this.objID.style.top.replace("px","")); 
uu_curTop = .1 * (uu_scrY - this.lastScrollY); 
uu_curTop = uu_curTop>0?Math.ceil(uu_curTop):Math.floor(uu_curTop); 
this.objID.style.top = parseFloat(uu_divX + uu_curTop) + "px"; 
this.lastScrollY += uu_curTop; 
}
function none(){
document.getElementById("maple1").style.display="none";
}
function noneleft(){
document.getElementById("maple2").style.display="none";
}
</script> 



<div id="maple1" style="width:100px;height:50px;font-size:12px;"> <!--
	<div><b style="background-color:#fff; font-size:12px;" onClick="none()" >点击关闭</b><a href="http://www.cqapg.com" target="_blank"><img src="<%=request.getContextPath()%>/image/platform/zhgp.jpg" border="0" /></a></div> 
	-->
</div> 

<div id="maple2" style="width:100px;height:50px;font-size:12px;"> <!--
	<div><b style="background-color:#fff; font-size:12px;" onClick="noneleft()" >点击关闭</b><a href="http://www.cqncp.com" target="_blank"><img src="<%=request.getContextPath()%>/image/platform/zhkt.jpg" border="0" /></a></div> -->
</div> 

