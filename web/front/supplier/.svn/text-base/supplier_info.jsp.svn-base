<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>  
<%@ page import="java.util.List"  %>
<%@ page import="java.util.Map"  %>  
<%@ page import="com.bornsoft.asn.bean.product.Product"  %>  
<%@ page import="com.bornsoft.asn.bean.license.*"  %>  
<link rel="stylesheet" rev="stylesheet" href="../../front/css/supplier_info.css" type="text/css" />    

<%List list = (List)request.getAttribute("productSupply"); %>

<table width="974" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"  style="padding-top:5px;">
	<tr>
		<td><table width="950" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="190" valign="top"><table width="190" cellpadding="0" cellspacing="0">
						<tr>
							<td background="../images/supplier/left_title.gif" height="25" class="gys_title">该商家其他商品</td>							
						</tr>
						<tr> 
							<td class="hot_title"><table width="170" align="center">
								<%if(list.size() >10){ 
									Product p = (Product)list.get(10);
								%>
								<tr>
									<td height="100" style="border-bottom:1px #e6e6e6 solid;">
										<table width="100%">
											<tr>
												<td><a href="${pageContext.request.contextPath}/front/displayDetailProduct.action?productId=<%=p.getProductId() %>" target=_blank"><img src="${pageContext.request.contextPath}<%=p.getSmallPicPath() %>" height="80" width="80"style="border:1px solid #DADADA; padding:2px;" /></a></td>
												<td  valign="top"><table>
													<tr><td><img src="../images/supplier/top1.gif" ></td></tr>
													<tr><td style="color:#000000;"><a href="${pageContext.request.contextPath}/front/displayDetailProduct.action?productId=<%=p.getProductId() %>" target=_blank"><strong><%=p.getProductName() %></strong></a></td></tr>
												</table></td>
											</tr>
										</table>
									</td>
								</tr>
								<%
									for(int i = 11; i < list.size();i++){
										Product p2 = (Product)list.get(i);
								%>
								<tr>
									<td  class="hot_line" height="30"><span><%=(i-9) %></span><a href="${pageContext.request.contextPath}/front/displayDetailProduct.action?productId=<%=p2.getProductId() %>" target=_blank"><%=p2.getProductName() %></a></td>
								</tr>								
								<%	} 
								}else if(list.size() >0){ 
									Product p2 = (Product)list.get(0);
								%>
								<tr>
									<td height="100" style="border-bottom:1px #e6e6e6 solid;">
										<table width="100%">
											<tr>
												<td><a href="${pageContext.request.contextPath}/front/displayDetailProduct.action?productId=<%=p2.getProductId() %>" target=_blank"><img src="${pageContext.request.contextPath}<%=p2.getSmallPicPath() %>" height="80" width="80"style="border:1px solid #DADADA; padding:2px;" /></a></td>
												<td  valign="top"><table>
													<tr><td><img src="../images/supplier/top1.gif" ></td></tr>
													<tr><td style="color:#000000;"><a href="${pageContext.request.contextPath}/front/displayDetailProduct.action?productId=<%=p2.getProductId() %>" target=_blank"><strong><%=p2.getProductName() %></strong></a></td></tr>
												</table></td>
											</tr>
										</table>
									</td>
								</tr>
								<%	
									
									for(int i = 1; i < list.size();i++){
										Product p = (Product)list.get(i);
								%>
								<tr>
									<td  class="hot_line" height="30"><span><%=i+1 %></span><a href="${pageContext.request.contextPath}/front/displayDetailProduct.action?productId=<%=p.getProductId() %>" target=_blank"><%=p.getProductName() %></a></td>
								</tr>								
								<% }  
								}else{%>
									<tr>
										<td height="100" style="border-bottom:1px #e6e6e6 solid;">
											<table width="100%">
												<tr>
													<td>该供应商暂无商品</td>													
												</tr>
											</table>
										</td>
									</tr>
								<%} %>				
							</table>
							</td>
						</tr>						
					</table>
					
					<table width="100%" cellpadding="0" cellspacing="0" style=" margin-top:10px;">
						<tr>
							<td height="80" align="center"><img src="../images/supplier/Ads01.gif"></td>
						</tr>
						<tr>
							<td height="80" align="center"><img src="../images/supplier/Ads02.gif"></td>
						</tr>
						<tr>
							<td height="80" align="center"><img src="../images/supplier/Ads03.gif"></td>
						</tr>
					</table>		
			  </td>
				
				<!--- 右边-->
				<td width="750" valign="top"><table width="750" cellpadding="0" cellspacing="0"  style="margin-left:10px;" >
					
					<tr>
						<td valign="top"><table  width="750" cellpadding="0" cellspacing="0" class="pro_other" >
								<tr>
									<td height="27" align="center" class="other_selected">供应商信息</td>
									<td align="center"></td>
								</tr>
							</table>
							
							<table  width="100%" cellpadding="0" cellspacing="0" class="other_con" style="border:1px solid #d3d2d2; border-top:none; background:#f7f7f7;">
								<tr>
									<td width="272" height="30" >全称：<font color="#0045df"><strong><s:property value="member.fullName" /></strong></font></td>
									<td width="255" height="30">供应商类型：
										<s:if test='supplier.supplierType == "1"'>单位</s:if>
										<s:elseif test='supplier.supplierType == "2"'>个人</s:elseif> 
									</td>
									<td width="221" height="30" class="other_con_title"></td>
								</tr>
								<tr>
									<td height="25">简称：<s:if test="member.shortName == 'null'">暂无</s:if><s:else><s:property value="member.shortName" /></s:else></td>
									<td  height="30">证件名称：
										<s:if test='member.certType == "1"'>营业执照</s:if>
										<s:elseif test='member.certType == "2"'>组织机构代码证</s:elseif>
										<s:elseif test='member.certType == "3"'>社团证</s:elseif>
										<s:elseif test='member.certType == "4"'>个人身份证</s:elseif>
										<s:elseif test='member.certType == "5"'>护照</s:elseif>
										<s:elseif test='member.certType == "6"'>军官证</s:elseif>
									</td>
									<td  height="30"></td>
								</tr>	
								<tr>
									<td height="25">联系电话：<s:if test="member.fixedPhone == 'null'">暂无</s:if><s:else> <s:property value="member.fixedPhone" /></s:else></td>
									<td>证件编号：
										<s:if test='member.certType == "4"'>
									  	<%
									  		String certID = request.getAttribute("member.certId").toString();
									  		if(certID != null){
									  			if(certID.length() ==15){
									  				certID = certID.substring(0,6)+"******"+certID.substring(12,15);
									  			}else if(certID.length() ==18){
									  				certID = certID.substring(0,6)+"********"+certID.substring(14,18);
									  			}else{
									  				certID = "<font color='red'>此身份证编号有误</font>";
									  			}
									  			
									  		}else{
									  			certID = "<font color='blue'>暂无</font>";
									  		}
									  		out.print(certID); 
									  	%>				  	
									  	</s:if>
									 	<s:else> <s:property value="member.certId" /></s:else>
									</td>
									<td height="30"></td>
								</tr>	
								<tr>
									<td height="25">联系人： 
										<s:if test='supplier.supplierType == "1"'>
											<s:if test="member.contactor == 'null'">暂无</s:if><s:else> 	<s:property value="member.contactor" />	</s:else>
										</s:if>
										<s:else>
											<s:property value="member.fullName" />
										</s:else>
									
									</td>
									<td  height="30">收款银行名称：<s:property value="bankinfo.bankName" /></td>
									<td  height="30"></td>
								</tr>	
								<tr>
									<td height="25">联系地址： <s:if test="member.address == 'null'">暂无</s:if><s:else> <s:property value="member.address" /></s:else></td>
									<td height="30">帐户名：<s:property value="bankinfo.account" /> </td>
									<td  height="30"></td>
								</tr>	
								<tr>
									<td height="25">邮政编码： <s:if test="member.fixedPhone == 'null'">暂无</s:if><s:else> <s:property value="member.zip" /></s:else></td>
									<td  height="30">开户人名称：<s:property value="bankinfo.ownerName" /></td>
									<td  height="30"><img src="../images/supplier/jrqywz.gif" width="142" height="31" /></td>
								</tr>
								<%if(request.getAttribute("member.qq") != null){ %>
								<tr>
									<td height="30" colspan="3"><a target=blank href=http://wpa.qq.com/msgrd?V=1&Uin=<%=request.getAttribute("member.qq")%>&Exe=QQ&Site=望龙门—农业综合服务网络平台&Menu=yes><img border="0" SRC=http://wpa.qq.com/pa?p=3:<%=request.getAttribute("member.qq")%>:3 alt="给我发消息"></a></td>
								</tr>
								<%	} %>	
								<tr>
									<td height="30" colspan="3"></td>
								</tr>	
					  </table>						</td>
					</tr>
					
					<tr>
						<td><table  width="750" cellpadding="0" cellspacing="0" class="related_bg" >
								<tr>
									<td height="27" align="center" class="related_title">经营范围</td>
									<td width="654" >&nbsp;</td>
						  		</tr>
							</table >
							<table width="100%" style="border:1px solid #d3d2d2; border-top:none; background:#f7f7f7; line-height:24px" class="other_con">
								<tr>
									<td colspan="2"> <s:property value="supplier.bizDomain" /> </td>
								</tr>
							</table>
					  </td>
					</tr>
					
					<% 
						Object introduction = request.getAttribute("supplier.introduction");
						if(introduction != null){ %>
					<tr>
						<td><table  width="750" cellpadding="0" cellspacing="0" class="related_bg" >
								<tr>
									<td height="27" align="center" class="related_title">企业简介</td>
									<td width="654" >&nbsp;</td>
						 	 	</tr>
							</table >
							
							<table width="100%" style="border:1px solid #d3d2d2; border-top:none; background:#f7f7f7; line-height:24px" class="other_con">
								<tr>
									<td colspan="2"> <%=introduction.toString() %> </td>
								</tr>
							</table>
					  </td>
					</tr>
					<% } %>
					
					
					<tr>
						<td><table  width="750" cellpadding="0" cellspacing="0" class="related_bg" >
								<tr>
									<td height="27" align="center" class="related_title">证件名称</td>
									<td width="654" >&nbsp;</td>
						  		</tr>
							</table >
							
							<table  width="750" cellpadding="0" cellspacing="0"  height="38">
								    <tr>
									<td width="5%" background="../images/supplier/sygys_bg02.gif"></td>
									<td width="25%" background="../images/supplier/sygys_bg02.gif">证件名称</td>
									<td width="25%" background="../images/supplier/sygys_bg02.gif">许可单位</td>
									<td width="20%" background="../images/supplier/sygys_bg02.gif">编号</td>
									<td width="25%" background="../images/supplier/sygys_bg02.gif">扫描件</td>
									</tr>
							</table >
									<%List<License> licenselist = (List<License>)request.getAttribute("querylist"); 
										if(licenselist.size() == 0){
									%>
									
										<table width="100%" cellpadding="0" cellspacing="0" class="other_con" style="border-bottom:1px dashed #cccccc;" height="98">
										<tr><td height="10" colspan="4"></td></tr>
										<tr>
										<td colspan="4">暂无证件信息</td>										
										</tr>
										
										<tr><td height="10" colspan="4"></td></tr>
						 			</table>
									<% }else{ %>
									<s:iterator value="querylist" id="list">
									<table width="100%" cellpadding="0" cellspacing="0" class="other_con" style="border-bottom:1px dashed #cccccc;" height="98">
										<tr><td height="10" colspan="4"></td></tr>
										<tr>
										<td width="5%"></td>
										<td width="25%"><s:property value="#list.title"/></td>
										<td width="25%" class="greed_b"><s:property value="#list.authority"/></td>
										<td width="20%" class="red_b"><s:property value="#list.serial"/></td>
										<td width="25%"><a href="../../pic/member/big_supplier_<s:property value="#list.licenseid"/>.jpg" target="_blank"><img src="../../pic/member/sml_supplier_<s:property value="#list.licenseid"/>.jpg" border="0" ></a></td>
										</tr>
										
										<tr><td height="10" colspan="4"></td></tr>
						 			</table>
						 			</s:iterator>
									<%} %>
					  </td>
					</tr>
					
					
					
					
					<tr>
						<td valign="top">        <table  width="750" cellpadding="0" cellspacing="0" class="greed_title">
								<tr>
									<td height="35"  align="left">&nbsp;&nbsp;最新供应</td>
						  </tr>
									</table >
									<table  width="748" cellpadding="0" cellspacing="0" style="border:1px solid #d3d2d2; border-top:none; line-height:24px">
								     <tr>
								     	<% 
											if(list.size() >5){
												for(int i=0;i<	5 ;i++){
													Product p = (Product)list.get(i);	
										%>
									     <td width="20%" class="product" align="center"><table cellpadding="0" cellspacing="0" width="100%">
													<tr>
														<td class="product" align="center" height="120"><a href="${pageContext.request.contextPath}/front/displayDetailProduct.action?productId=<%=p.getProductId() %>" target=_blank"><img src="${pageContext.request.contextPath}<%=p.getSmallPicPath() %>" width="85" height="90" /></a></td>
													</tr>
													<tr>
														<td class="greed_b" align="center"><a href="${pageContext.request.contextPath}/front/displayDetailProduct.action?productId=<%=p.getProductId() %>" target=_blank"><%=p.getProductName() %></a></td>
													</tr>
													<tr>
														<td class="greed_b" align="center" height="20"><font color="red"><%=p.getPrice1() %></font>/<%=p.getProductUnit() %></td>
													</tr>
												</table>
											</td>
											<%		
												}
											}else{
												for(int i = 0; i < list.size();i++){
													Product p = (Product)list.get(i);
											%>
											<td width="20%" class="product" align="center"><table cellpadding="0" cellspacing="0" width="100%">
													<tr>
														<td class="product" align="center" height="120"><a href="${pageContext.request.contextPath}/front/displayDetailProduct.action?productId=<%=p.getProductId() %>" target=_blank"><img src="${pageContext.request.contextPath}<%=p.getSmallPicPath() %>" width="85" height="90" /></a></td>
													</tr>
													<tr>
														<td class="greed_b" align="center"><a href="${pageContext.request.contextPath}/front/displayDetailProduct.action?productId=<%=p.getProductId() %>" target=_blank"><%=p.getProductName() %></a></td>
													</tr>
													<tr>
														<td class="greed_b" align="center" height="20"><font color="red"><%=p.getPrice1() %></font>/<%=p.getProductUnit() %></td>
													</tr>
												</table>
											</td>			
											<%
												}
												for(int i = list.size(); i < 5; i++){
											%>
											<td width="20%" class="product" align="center"><table cellpadding="0" cellspacing="0" width="100%">
													<tr>
														<td class="product" align="center" height="120">&nbsp;</td>
													</tr>
													<tr>
														<td class="greed_b" align="center">&nbsp;</td>
													</tr>
													<tr>
														<td class="greed_b" align="center" height="20">&nbsp;</td>
													</tr>
												</table>
											</td>			
											<%
												}
											}
											%>
										</tr>									
									</table >
									
		              </td>
					</tr>
					
					
					<tr>
						<td valign="top">        <table  width="750" cellpadding="0" cellspacing="0" class="greed_title">
								<tr>
									<td height="35"  align="left">&nbsp;&nbsp;推荐产品</td>
						  </tr>
									</table >
									<table  width="748" cellpadding="0" cellspacing="0" style="border:1px solid #d3d2d2; border-top:none; line-height:24px">
								    
								    <tr>
								     	<% 
											//List list2 = (List)request.getAttribute("productSupply");
											if(list.size() >10){
												for(int i=5; i < 10 ;i++){
													Product p = (Product)list.get(i);	
										%>
									     <td width="20%" class="product" align="center"><table cellpadding="0" cellspacing="0" width="100%">
													<tr>
														<td class="product" align="center" height="120"><a href="${pageContext.request.contextPath}/front/displayDetailProduct.action?productId=<%=p.getProductId() %>" target=_blank"><img src="${pageContext.request.contextPath}<%=p.getSmallPicPath() %>" width="85" height="90" /></a></td>
													</tr>
													<tr>
														<td class="greed_b" align="center"><a href="${pageContext.request.contextPath}/front/displayDetailProduct.action?productId=<%=p.getProductId() %>" target=_blank"><%=p.getProductName() %></a></td>
													</tr>
													<tr>
														<td class="greed_b" align="center" height="20"><font color="red"><%=p.getPrice1() %></font>/<%=p.getProductUnit() %></td>
													</tr>
												</table>
											</td>
											<%		
												}
											}else if(list.size() > 5 && list.size() < 10){
												for(int i = 5; i < list.size();i++){
													Product p = (Product)list.get(i);
											%>
											<td width="20%" class="product" align="center"><table cellpadding="0" cellspacing="0" width="100%">
													<tr>
														<td class="product" align="center" height="120"><a href="${pageContext.request.contextPath}/front/displayDetailProduct.action?productId=<%=p.getProductId() %>" target=_blank"><img src="${pageContext.request.contextPath}<%=p.getSmallPicPath() %>" width="85" height="90" /></a></td>
													</tr>
													<tr>
														<td class="greed_b" align="center"><a href="${pageContext.request.contextPath}/front/displayDetailProduct.action?productId=<%=p.getProductId() %>" target=_blank"><%=p.getProductName() %></a></td>
													</tr>
													<tr>
														<td class="greed_b" align="center" height="20"><font color="red"><%=p.getPrice1() %></font>/<%=p.getProductUnit() %></td>
													</tr>
												</table>
											</td>			
											<%
												}
												for(int i = list.size(); i < 10; i++){
											%>
											<td width="20%" class="product" align="center"><table cellpadding="0" cellspacing="0" width="100%">
													<tr>
														<td class="product" align="center" height="120">&nbsp;</td>
													</tr>
													<tr>
														<td class="greed_b" align="center">&nbsp;</td>
													</tr>
													<tr>
														<td class="greed_b" align="center" height="20">&nbsp;</td>
													</tr>
												</table>
											</td>			
											<%
												}
											}
											%>
										</tr>								    
								   
									</table >
									
		              </td>
					</tr>
					
					
				</table>
			  </td>
			</tr>
		</table>	
	</td>	
	</tr>
</table>

