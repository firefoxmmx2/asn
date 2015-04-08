<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function()
	{
		$("#gyxx").mouseover(function()
		{
			$("#showqg").css('display', 'none');
			$("#showgy").css('display', 'inline');
			$("#gyxx").css('cursor', 'pointer');
			$("#qglb").css('display', 'none');
			$("#gylb").css('display', 'table-row');
			$("#gyxx").removeClass("nav2");
			$("#gyxx").addClass("nav1");
			$("#qgxx").removeClass("nav1");
			$("#qgxx").addClass("nav2");
		});
		$("#qgxx").mouseover(function()
		{
			$("#showgy").css('display', 'none');
			$("#showqg").css('display', 'inline');
			$("#qgxx").css('cursor', 'pointer');
			$("#gylb").css('display', 'none');
			$("#qglb").css('display', 'table-row');
			$("#qgxx").removeClass("nav2");
			$("#qgxx").addClass("nav1");
			$("#gyxx").removeClass("nav1");
			$("#gyxx").addClass("nav2");
		});
	});
</script>
<table width="980" border="0" cellspacing="0" cellpadding="0"
	align="center" height="455" class="mt10">
	<tr>
		<td width="211" valign="top">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="29" class="dht_left">&nbsp;</td>
			</tr>
			<tr>
				<td valign="top" class="line"><%@ include
					file="../../../platform/mall/ptype.jsp"%>
				<link
					href="${pageContext.request.contextPath }/css/channel/nz/newPtype.css"
					type="text/css" rel="stylesheet" />
				</td>
			</tr>
		</table>
		<!-- 最新加入企業 --> <%@ include file="recentEnterprise.jsp"%>
		</td>
		<td width="10"></td>
		<td valign="top">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="215" valign="top">

				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td valign="top" class="ztp">
						<script type="text/javascript">
						var focus_width=545;
						var focus_height=210;
						var text_height=0;
						var swf_height = focus_height+text_height;
						var pics='${pageContext.request.contextPath}/image/channel/flash/nz1.jpg|${pageContext.request.contextPath}/image/channel/flash/nz2.jpg|${pageContext.request.contextPath}/image/channel/flash/nz3.jpg';
						var links='${pageContext.request.contextPath}/image/platform/577x223_01.jpg|${pageContext.request.contextPath}/image/platform/577x223_02.jpg|${pageContext.request.contextPath}/image/platform/577x223_03.jpg';
						var texts='';
						document.write('<object  classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase=" http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ focus_width +'" height="'+ swf_height +'">');
						document.write('<param name="allowScriptAccess" value="sameDomain"><param name="movie" value="${pageContext.request.contextPath}/front/productNavi/root_files/pixviewer.swf"><param name="quality" value="high"><param name="bgcolor" value="#F0EFEF">');
						document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
						document.write('<param name="FlashVars" value="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'">');
						document.write('<embed src="${pageContext.request.contextPath}/front/productNavi/root_files/pixviewer.swf" wmode="opaque" FlashVars="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'" menu="false" bgcolor="#F0EFEF" quality="high" width="'+ focus_width +'" height="'+ focus_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage=" http://www.macromedia.com/go/getflashplayer" />');
						document.write('</object>');
						</script>
						</td>
						<td width="10">&nbsp;</td>
						<td width="202" height="215" valign="top"><%@ include
							file="quotation.jsp"%></td>
					</tr>
				</table>
				<!--供求信息开始-->
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="mt10">
					<tr>
						<td width="100" height="25" class="nav1" id="gyxx">供应信息</td>
						<td width="100" class="nav2" id="qgxx">求购信息</td>
						<td width="559" align="right"><span class="more"><a
							target="_blank" id="showgy"
							href="${pageContext.request.contextPath}/front/mall/info/showSupplyInfoList1?typeId=2">更多&gt;&gt;</a><a
							target="_blank" id="showqg" style="display: none;"
							href="${pageContext.request.contextPath}/front/mall/info/showPurchaseInfoList1?typeId=2">更多&gt;&gt;</a></span></td>
					</tr>
					<tr id="gylb">
						<td colspan="3" class="linegq">
						<table width="100%" height="100%" border="0" cellpadding="0"
							cellspacing="0">
							<tr>
								<!--供求信息1-->
								<td valign="top" width="33%" class="line_r">
								<table width="94%" border="0" cellspacing="0" cellpadding="0"
									align="center" class="mt10">
									<s:iterator id="item1" value="listS1">
										<tr>
											<td class="xbd3"><span class="green">[供]</span><a
												target="_blank"
												href="${pageContext.request.contextPath}/front/mall/info/showSupplyInfo?infoId=<s:property value="#item1.infoId"/>&type=<s:property value="#item1.type"/>"><s:property
												value="#item1.title"></s:property></a></td>
										</tr>
									</s:iterator>
								</table>
								</td>
								<!--供求信息2-->
								<td valign="top" width="33%" class="line_r">
								<table width="94%" border="0" cellspacing="0" cellpadding="0"
									align="center" class="mt10">
									<s:iterator id="item2" value="listS2">
										<tr>
											<td class="xbd3"><span class="green">[供]</span><a
												target="_blank"
												href="${pageContext.request.contextPath}/front/mall/info/showSupplyInfo?infoId=<s:property value="#item2.infoId"/>&type=<s:property value="#item2.type"/>"><s:property
												value="#item2.title"></s:property></a></td>
										</tr>
									</s:iterator>
								</table>
								</td>
								<!--供求信息3-->
								<td valign="top" width="33%">
								<table width="94%" border="0" cellspacing="0" cellpadding="0"
									align="center" class="mt10">
									<s:iterator id="item3" value="listS3">
										<tr>
											<td class="xbd3"><span class="green">[供]</span><a
												target="_blank"
												href="${pageContext.request.contextPath}/front/mall/info/showSupplyInfo?infoId=<s:property value="#item3.infoId"/>&type=<s:property value="#item3.type"/>"><s:property
												value="#item3.title"></s:property></a></td>
										</tr>
									</s:iterator>
								</table>
								</td>

							</tr>
						</table>
						</td>
					</tr>

					<tr id="qglb" style="display: none;">
						<td colspan="3" class="linegq">
						<table width="100%" height="100%" border="0" cellpadding="0"
							cellspacing="0">
							<tr>
								<td valign="top" width="33%" class="line_r">
								<table width="94%" border="0" cellspacing="0" cellpadding="0"
									align="center" class="mt10">
									<s:iterator id="item1" value="listP1">
										<tr>
											<td class="xbd3"><span class="red">[求]</span><a
												target="_blank"
												href="${pageContext.request.contextPath}/front/mall/info/showPurchaseInfo?infoId=<s:property value="#item1.infoId"/>&type=<s:property value="#item1.type"/>"><s:property
												value="#item1.title"></s:property></a></td>
										</tr>
									</s:iterator>
								</table>
								</td>

								<td valign="top" width="33%" class="line_r">
								<table width="94%" border="0" cellspacing="0" cellpadding="0"
									align="center" class="mt10">
									<s:iterator id="item2" value="listP2">
										<tr>
											<td class="xbd3"><span class="red">[求]</span><a
												target="_blank"
												href="${pageContext.request.contextPath}/front/mall/info/showPurchaseInfo?infoId=<s:property value="#item2.infoId"/>&type=<s:property value="#item2.type"/>"><s:property
												value="#item2.title"></s:property></a></td>
										</tr>
									</s:iterator>
								</table>
								</td>
								<td valign="top" width="33%">
								<table width="94%" border="0" cellspacing="0" cellpadding="0"
									align="center" class="mt10">
									<s:iterator id="item3" value="listP3">
										<tr>
											<td class="xbd3"><span class="red">[求]</span><a
												target="_blank"
												href="${pageContext.request.contextPath}/front/mall/info/showPurchaseInfo?infoId=<s:property value="#item3.infoId"/>&type=<s:property value="#item3.type"/>"><s:property
												value="#item3.title"></s:property></a></td>
										</tr>
									</s:iterator>
								</table>
								</td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="mt10">
					<tr>
						<td><!--
    FLASH廣告
    --> <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
							codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0"
							width="759" height="84">
							<param name="movie"
								value="${pageContext.request.contextPath}/flash/channel/nz/flash759.swf" />
							<param name="quality" value="high" />
							<embed
								src="${pageContext.request.contextPath}/flash/channel/nzflash759.swf"
								quality="high"
								pluginspage="http://www.macromedia.com/go/getflashplayer"
								type="application/x-shockwave-flash" width="759" height="84"></embed>
						</object></td>
					</tr>
				</table>


				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="mt10">
					<tr>
						<td class="cpzs" align="right"><span class="more"><a
							target="_blank"
							href="${pageContext.request.contextPath}/front/mall/product/searchProduct-1?type=0002">更多&gt;&gt;</a></span></td>
					</tr>
					<tr>
						<td class="line" align="center"><!-- 1 --> <s:iterator
							id="item" value="listProduct">
							<div style="width: 150px; float: left; height: 190px;">
							<table class="chanpin" cellpadding="0" cellspacing="0">
								<tr>
									<td align="center"><a
										href="${pageContext.request.contextPath}/front/mall/product/displayDetailProduct?productId=<s:property value="#item.productId"/>"
										target="_blank"><img
										src="${pageContext.request.contextPath}<s:property value="#item.smallPicPath"/>"
										width="108" height="96" /></a></td>

								</tr>
								<tr>
									<td align="center" class="huib" height="20"><a
										href="${pageContext.request.contextPath}/front/mall/product/displayDetailProduct?productId=<s:property value="#item.productId"/>"
										target="_blank"><s:property value="#item.productName" /></a></td>

								</tr>
								<tr>
									<s:if test="#item.price1==null">
										<td align="center" class="wz_xsj" height="15">销售价：待定</td>
									</s:if>
									<s:else>
										<td align="center" class="wz_xsj" height="15">销售价：￥<s:property
											value="#item.price1" /></td>
									</s:else>
								</tr>
							</table>
							</div>
						</s:iterator></td>
					</tr>
				</table>



				</td>
			</tr>

		</table>
		</td>
	</tr>
</table>