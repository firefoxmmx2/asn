<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.bornsoft.asn.bean.productType.ProductType,java.util.Map" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page import="com.bornsoft.asn.bean.product.Product" %>
<%@page import="com.bornsoft.asn.bean.order.Order" %>
<%@page import="com.bornsoft.asn.service.order.OrderService" %>
<%@page import="com.bornsoft.asn.bean.order.OrderItem" %>
<LINK href="<%=request.getContextPath()%>/css/mall.css" type="text/css" rel="stylesheet">


<link rel=stylesheet type=text/css href="<%=request.getContextPath()%>/css/ptype/ptype.css">
<script type="text/javascript">
$(document).ready(function(){
	$("*[isTypeRow]").mouseover(function(){
		$(this).addClass("hover");
	});
	$("*[isTypeRow]").mouseout(function(){
		$(this).removeClass("hover");
	});

	var hpl=16;  // height Per Line (pixel)
	var cpl=18; //chars Per Line, include space between anchors
	var blockWidth=220; // block width (pixel)
	$("*[catelevel=2]").each(function(){
		var size=0;
		var list=$(this).find("li>a");
		for(var i=0; i<list.size(); i++){
			size+=$(list.get(i)).text().length+1;  // anchor char lenth plus space
		}
		if(size<=cpl*4){
			//$(this).css("height", (parseInt(size/cpl))*hpl+30+"px");
		}else{
			//$(this).css("height", (size/(cpl*2))*hpl+30+"px");
			$(this).css("width", blockWidth*2+"px");
			$(this).find("ul").css("width", blockWidth*2+"px");
			//document.title=size+" "+document.title;
		}
	});

	setTimeout(function(){
		$(".HackBox").each(function(){
			var objTitle=$(this).parents("*[isTypeRow]").find("H4");
			var baseLine=$(this).offset().top-objTitle.offset().top;
			var height=parseInt(objTitle.css("font-size"))*objTitle.text().length;
			var padding=baseLine-height;
			if(padding<0) padding=0;
			objTitle.css("padding-top", padding/2);
			objTitle.css("height", baseLine-(padding/2));
		});
	}, 100);
}); 
</script>

<TABLE width="975" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#FFFFFF">
  <!--top -->
  <TBODY>
  <!--//top -->
  <TR><TD height="10"></TR>
  <!--middle01 -->
  <TR>
    <TD>
		 <TABLE width="950" border="0" cellspacing="0" cellpadding="0" align="center" height="270">
			  <TBODY><TR>
			    <!--left -->
                  <TD width="220" valign="top">
				      <TABLE width="100%" border="0" cellspacing="0" cellpadding="0">
  <TBODY><TR>
    <TD width="175" height="25" background="<%=request.getContextPath()%>/front/productNavi/root_files/left_t1.gif" class="f12b huise">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 商城动态</TD>
    <TD width="45" background="<%=request.getContextPath()%>/front/productNavi/root_files/left_t2.gif">&nbsp;</TD>
  </TR>
  <TR>
    <TD height="63" colspan="2" valign="middle" background="<%=request.getContextPath()%>/front/productNavi/root_files/left_m220.gif">
	      <TABLE width="96%" border="0" cellspacing="0" cellpadding="0" height="63" align="center">
  <TBODY><TR>
    <TD class="point_y">世博十大名茶白沙溪黑茶在…</TD>
  </TR>
  <TR>
    <TD class="point_h">鼠标轻点绿色农产品送到家…</TD>
  </TR>
  <TR>
    <TD class="point_h">鼠标轻点绿色农产品送到家…</TD>
  </TR>
</TBODY></TABLE>

	 </TD>
    </TR>
  <TR>
    <TD height="18" colspan="2"><IMG src="<%=request.getContextPath()%>/front/productNavi/root_files/left_f220.gif" width="220" height="18"></TD>
    </TR>
  <TR>
   <TD width="175" height="25" background="<%=request.getContextPath()%>/front/productNavi/root_files/left_t1.gif" class="f12b huise">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;品牌推荐</TD>
    <TD width="45" background="<%=request.getContextPath()%>/front/productNavi/root_files/left_t2.gif">&nbsp;</TD>
  </TR>
  <TR>
    <TD height="123" colspan="2" background="<%=request.getContextPath()%>/front/productNavi/root_files/left_m220.gif" align="center"><IMG src="<%=request.getContextPath()%>/front/productNavi/root_files/main_imgs.gif" width="193" height="123"></TD>
  </TR>
  <TR>
    <TD colspan="2"><IMG src="<%=request.getContextPath()%>/front/productNavi/root_files/left_f220t.gif" width="220" height="16"></TD>
    </TR>
                    </TBODY></TABLE>
			    </TD>
				<!--//left --> 
				  <TD width="10">                                  
				  </TD><TD width="520" style="border:1px #000000 solid;">    
<script language="JavaScript"> 
var focus_width=520;
var focus_height=260;
var text_height=20;
var swf_height = focus_height+text_height;
var pics='<%=request.getContextPath()%>/front/productNavi/root_files/ad01.jpg|<%=request.getContextPath()%>/front/productNavi/root_files/ad02.jpg|<%=request.getContextPath()%>/front/productNavi/root_files/ad033.jpg|<%=request.getContextPath()%>/front/productNavi/root_files/ad04.jpg';
var links='<%=request.getContextPath()%>/front/productNavi/root_files/ad01.jpg|<%=request.getContextPath()%>/front/productNavi/root_files/ad02.jpg|<%=request.getContextPath()%>/front/productNavi/root_files/ad033.jpg|<%=request.getContextPath()%>/front/productNavi/root_files/ad04.jpg';
var texts='五哥黄金蛋 蛋清劲道越嚼越香|金佛山毛峰|酉阳县龙麻养鸭专业合作社|梁平县 袁驿豆干 ';
document.write('<object  classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ focus_width +'" height="'+ swf_height +'">');
document.write('<param name="allowScriptAccess" value="sameDomain"><param name="movie" value="<%=request.getContextPath()%>/front/productNavi/root_files/pixviewer.swf"><param name="quality" value="high"><param name="bgcolor" value="#F0EFEF">');
document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
document.write('<param name="FlashVars" value="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'">');
document.write('<embed src="<%=request.getContextPath()%>/front/productNavi/root_files/pixviewer.swf" wmode="opaque" FlashVars="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'" menu="false" bgcolor="#F0EFEF" quality="high" width="'+ focus_width +'" height="'+ focus_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />');
document.write('</object>');
					</script>
				  </TD>
				  <TD width="10">
				  </TD><TD width="190" valign="top">
				     <TABLE width="100%" border="0" cellspacing="0" cellpadding="0">
  <TBODY><TR>
  
  
 <!--  http://appsvr.aiecp.com:8080/ptnsso/reLogin1.sso
http://appsvr.aiecp.com:8080/ptnsso/registerAction1.sso-->
    <TD height="40" align="left">
      <a href="http://appsvr.aiecp.com:8080/ptnsso/registerAction1.sso" target="_blank" style="cursor: hand;" >
       <IMG src="<%=request.getContextPath()%>/front/productNavi/root_files/zc91.gif" border="0px;">
      </a> 
    </TD>
    <TD align="right">
      <a href="http://appsvr.aiecp.com:8080/ptnsso/reLogin1.sso" target="_blank" style="cursor: hand;">
        <IMG src="<%=request.getContextPath()%>/front/productNavi/root_files/dl91.gif" border="0px;">
      </a>
      </TD>
  </TR>

  <TR>
    <TD height="25" colspan="2" valign="middle" background="<%=request.getContextPath()%>/front/productNavi/root_files/left_title.gif" class="f12b huise">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 订货订单</TD>
    </TR>
  <TR>      
    <TD height="194" colspan="2" valign="top" background="<%=request.getContextPath()%>/front/productNavi/root_files/left_mid.gif">
	
	   <TABLE width="96%" border="0" cellspacing="0" cellpadding="0" align="center" style="padding-top:5px;">
  <TBODY>
  <%List<Order> orList=(List)request.getAttribute("sucOrderInfo"); %>
  <%System.out.println(orList.size()); %>
    <%for(int j=0;j<orList.size();j++){%>
      <%List<OrderItem> items= OrderService.findOrderItemByOrderId(orList.get(j).getId()); %>
	  <TR>
	    <TD class="point_y"> <a href="product/displayDetailProduct.action?productId=<%=items.get(0).getItemProductId() %>" target="_blank">****购买了<%=items.get(0).getItemProductName() %></a></TD>
	  </TR>
  <%} %>
</TBODY></TABLE>
	</TD>
    </TR>
  <TR>
    <TD height="10" colspan="2"><IMG src="<%=request.getContextPath()%>/front/productNavi/root_files/left_foot2.gif" width="190" height="10"></TD>
    </TR>
</TBODY></TABLE>

			    </TD>
              </TR>
			  
	  </TBODY></TABLE>
	</TD>
  </TR>
  <!--//middle01 --> 
  <TR><TD height="10"></TR>
   <!--middle02 -->
  <TR>
    <TD>
		 <TABLE width="950" border="0" cellspacing="0" cellpadding="0" align="center" height="937">
			  <TBODY><TR>
                  <TD width="750" valign="top">
				  
				  
				  <TABLE width="100%" height="180" border="0" cellpadding="0" cellspacing="0">
                    <TBODY><TR>
                      <TD height="30" valign="middle" class="spfb gray"><A href="#">查看所有商品类目</A></TD>
                    </TR>
                    <TR>
                      <TD height="907" valign="top">
                      
						<!-- 类目开始 -->
						<div style="clear: both; text-align: left;">
							<DIV id=CateContainer>
								<DIV id=J_CategoryList class=category-list>
								<%	 
								int i=0;
								List list = (List)((Map)request.getAttribute("ptL")).get("ptFirstL");
								String url0 = (String)request.getAttribute("url0");
									if(((Map)request.getAttribute("ptL")).get("ptFirstL") != null)
									for(ProductType item1 : (List<ProductType>)((Map)request.getAttribute("ptL")).get("ptFirstL")){
									
									i++;
								%>
								
								<!-- 一级类之二开始  -->
								<DIV class=typeRow isTypeRow="yes" catelevel="1">
									<H4><a href="<%=url0 %>&type=<%=item1.getPtcode() %>" target="_top"><%=item1.getPttypeName() %> </a></H4>
									<UL id=cat-other>
								  		<!-- 二级类之一开始  -->
								 		<% if(((Map)request.getAttribute("ptL")).get("ptSecL") != null) %>
										<% for(ProductType item2 : (List<ProductType>)((Map)request.getAttribute("ptL")).get("ptSecL")) {%>
										<% if(item2.getPtparentid() == item1.getPtid() ) { %>
								  		<LI catelevel="2">
								  		
								  			<A href="<%=url0 %>&type=<%=item2.getPtcode() %>"  target="_top"><%=item2.getPttypeName() %></A>   			
								  			<UL class=CategoryListInlineSepLevel1>
								    			<!-- 三级类之一开始  -->
								    			<% if(((Map)request.getAttribute("ptL")).get("ptThrL") != null) %>
												<% for(ProductType item3 : (List<ProductType>)((Map)request.getAttribute("ptL")).get("ptThrL")) { %>
												<% if(item3.getPtparentid() == item2.getPtid()) { %>
								    			<LI catelevel="3"><A href="<%=url0 %>&type=<%=item3.getPtcode() %>"  target="_top"><%=item3.getPttypeName() %></A> </LI>
										    	<% } //if item3 %>
												<% } //for item3 %>  
										    	<!-- 三级类之一结束  -->
								    		</UL>
								    		<% } // if item2 %>
											<% } // for item2 %>
											<DIV class="HackBox"></DIV>
											
										</LI>
									</UL>
								</DIV>
								<!-- 一级类之二结束  -->
								<% } //for item1%>
								
								</DIV>
							</DIV>
						</div>
						<!-- 类目表结束 -->   
						
					</TD>
				  </TR>
                  </TBODY></TABLE>
				  
				  
				  </TD>
				  <TD width="10">
				  </TD><TD width="190" valign="top">
				  
				  
				  <TABLE width="100%" border="0" cellpadding="0" cellspacing="0" align="left">
                    <TBODY><TR>
                      <TD valign="top">
					  <TABLE width="190" height="395" cellpadding="0" cellspacing="0" style=" margin-top:2px;">
						<TBODY><TR>
							<TD background="<%=request.getContextPath()%>/front/productNavi/root_files/left_title.gif" height="25" class="gys_title" align="left">热卖排行</TD>							
						</TR>
						<TR> 
							<TD class="hot_title"><TABLE width="170" height="352" align="center" cellpadding="0" cellspacing="0">
								
								<TBODY>
								<%List<Product> pList=(List)request.getAttribute("hotProduct"); %>
								  <%for(int k=0;k<pList.size();k++){%>
								      <%if(k==0) {%>
								<TR>
									<TD height="100" style="border-bottom:1px #e6e6e6 solid;">
										<TABLE width="100%" cellpadding="0" cellspacing="0">
											<TBODY>
											<TR>
												<TD>
												 <a href="product/displayDetailProduct.action?productId=<%=pList.get(k).getProductId() %>" target="_blank">
												  <IMG src="<%=request.getContextPath()%><%=pList.get(k).getSmallPicPath()%>" border="0" height="80" width="80" style="border:1px solid #DADADA; padding:2px;">
												 </a>
												</TD>
												<TD valign="top">
													<TABLE>
														<TBODY>
														   <TR>
														      <TD>
														         <IMG src="<%=request.getContextPath()%>/front/productNavi/root_files/top1.gif">
														      </TD>
														   </TR>
														   <TR>
														      <TD style="color:#000000;">
														      <strong>
       													         <a href="product/displayDetailProduct.action?productId=<%=pList.get(k).getProductId()%>" target="_blank">
													               <%=pList.get(k).getProductName() %>
													             </a>
													        </strong></TD>
														  </TR>
													    </TBODY>
												   </TABLE>
											   </TD>
											</TR>
									  </TBODY></TABLE>
									</TD>
								</TR>
								<%}%>
								 <%if(k!=0) {%>
								<TR>
									<TD class="hot_line" height="30" align="left"><SPAN><%=k+1 %></SPAN><a href="product/displayDetailProduct.action?productId=<%=pList.get(k).getProductId()%>" target="_blank"><%=pList.get(k).getProductName() %></a></TD>
								</TR>
								<%}%>
						
								  <%} %>
								
												
							</TBODY></TABLE>
							</TD>
						</TR>
						<TR><TD><IMG src="<%=request.getContextPath()%>/front/productNavi/root_files/left_foot2.gif" width="190" height="10"></TD></TR>						
					</TBODY></TABLE>
					  </TD>
                    </TR>
                   <TR>
                      <TD height="10">
                    </TD></TR>
					<TR>
                      <TD valign="top"><IMG src="<%=request.getContextPath()%>/front/productNavi/root_files/guanggao190.gif" height="154" width="190"></TD>
                    </TR>
					<TR>
                      <TD height="10">
                    </TD></TR>
                       <TR>
                      <TD valign="top">
					  <TABLE width="190" height="345" cellpadding="0" cellspacing="0" style=" margin-top:2px;">
						<TBODY><TR>
							<TD background="<%=request.getContextPath()%>/front/productNavi/root_files/left_title.gif" height="25" class="gys_title" align="left">特价商品</TD>							
						</TR>
						<TR> 
							<TD class="hot_title"><TABLE width="170" height="310" align="center" cellpadding="0" cellspacing="0">
								
								<TBODY><TR>
									<TD height="100" style="border-bottom:1px #e6e6e6 solid;">
										<TABLE width="100%" cellpadding="0" cellspacing="0">
											<TBODY><TR>
												<TD><IMG src="<%=request.getContextPath()%>/front/productNavi/root_files/cp03.gif" height="80" width="80" style="border:1px solid #DADADA; padding:2px;"></TD>
												<TD valign="top"><TABLE>
													<TBODY><TR><TD>&nbsp;</TD>
													</TR>
													<TR><TD style="color:#000000;"><STRONG>红富大苹果</STRONG></TD></TR>
												</TBODY></TABLE></TD>
											</TR>
										</TBODY></TABLE>									</TD>
								</TR>
								<TR>
									<TD height="100" style="border-bottom:1px #e6e6e6 solid;">
										<TABLE width="100%" cellpadding="0" cellspacing="0">
											<TBODY><TR>
												<TD><IMG src="<%=request.getContextPath()%>/front/productNavi/root_files/1.gif" height="80" width="80" style="border:1px solid #DADADA; padding:2px;"></TD>
												<TD valign="top"><TABLE>
													<TBODY><TR><TD>&nbsp;</TD>
													</TR>
													<TR><TD style="color:#000000;"><STRONG>綦江大饼</STRONG></TD></TR>
												</TBODY></TABLE></TD>
											</TR>
										</TBODY></TABLE>									</TD>
								</TR>
								<TR>
									<TD height="100">
										<TABLE width="100%" cellpadding="0" cellspacing="0">
											<TBODY><TR>
												<TD><IMG src="<%=request.getContextPath()%>/front/productNavi/root_files/2.gif" height="80" width="80" style="border:1px solid #DADADA; padding:2px;"></TD>
												<TD valign="top"><TABLE>
													<TBODY><TR><TD>&nbsp;</TD>
													</TR>
													<TR><TD style="color:#000000;"><STRONG>黔江西红柿</STRONG></TD></TR>
												</TBODY></TABLE></TD>
											</TR>
										</TBODY></TABLE>									</TD>
								</TR>
												
							</TBODY></TABLE>
							</TD>
						</TR>
						<TR><TD><IMG src="<%=request.getContextPath()%>/front/productNavi/root_files/left_foot2.gif" width="190" height="10"></TD></TR>						
					</TBODY></TABLE>
					  </TD>
                    </TR>
                  </TBODY></TABLE></TD>
              </TR>
			  
	  </TBODY></TABLE>
	</TD>
  </TR>
  <!--//middle02 -->
  <TR><TD height="10"></TR>
  <!--foot -->
  <!--//foot -->
</TBODY></TABLE>

