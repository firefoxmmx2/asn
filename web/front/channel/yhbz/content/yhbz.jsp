<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
	$(document).ready(function()
	{
		$("#gyxx").mouseover(function()
		{
			$("#gyxx").css('cursor', 'pointer');
			$("#qglb").css('display', 'none');
			$("#gylb").css('display', 'table-row');
			$("#gyxx").removeClass("nav_b");
			$("#gyxx").addClass("nav_a");
			$("#qgxx").removeClass("nav_a");
			$("#qgxx").addClass("nav_b");
		});
		$("#qgxx").mouseover(function()
		{
			$("#qgxx").css('cursor', 'pointer');
			$("#gylb").css('display', 'none');
			$("#qglb").css('display', 'table-row');
			$("#qgxx").removeClass("nav_b");
			$("#qgxx").addClass("nav_a");
			$("#gyxx").removeClass("nav_a");
			$("#gyxx").addClass("nav_b");
		});
	});
</script>

<table width="980" border="0" cellspacing="0" cellpadding="0"
	align="center" height="455" class="mt10">
	<tr>
		<td width="226" valign="top"><!-- 行情 --> <%@ include
			file="quotation.jsp"%>
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
			<td class="dht_left" style="width:183px;padding-left: 5px;">
				<span class="wz_title">会员中心</span>
			</td>
			</tr>
			<tr>
				<td align="left" class="entry">
					<iframe src="http://appsvr.aiecp.com:8080/ptnsso/signon/indexLoginncp.sso" width="184" frameborder="0" scrolling="no" marginheight="0" align="center"></iframe>
				</td>
			</tr>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			height="145" class="mt10">
			<tr>
				<td><!--
					煙花爆竹左廣告
					--> <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
					codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0"
					width="226" height="145">
					<param name="movie"
						value="${pageContext.request.contextPath}/flash/channel/yhbz/left.swf" />
					<param name="quality" value="high" />
					<embed
						src="${pageContext.request.contextPath}/flash/channel/yhbz/left.swf"
						quality="high"
						pluginspage="http://www.macromedia.com/go/getflashplayer"
						type="application/x-shockwave-flash" width="226" height="145"></embed>
				</object></td>
			</tr>
		</table>
		<%@ include file="recentEnterprise.jsp"%></td>
		<td width="10"></td>
		<td valign="top">

		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="215" valign="top">

				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td valign="top" class="ztp" width="522" align="center">
						<script type="text/javascript">
						var focus_width=517;
						var focus_height=210;
						var text_height=0;
						var swf_height = focus_height+text_height;
						var pics='${pageContext.request.contextPath}/image/channel/flash/yhbz1.jpg|${pageContext.request.contextPath}/image/channel/flash/yhbz2.jpg|${pageContext.request.contextPath}/image/channel/flash/yhbz3.jpg';
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
						<td width="212" height="215" valign="top">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td class="dht_right">
								<table width="100%" height="100%" border="0" cellpadding="0"
									cellspacing="0">
									<tr>
										<td width="81%"><span class="wz_title">最新订单</span></td>
										<td width="19%">&nbsp;</td>
									</tr>
								</table>

								</td>
							</tr>
							<tr>
								<td height="185" class="line">
								<table width="96%" border="0" cellspacing="0" cellpadding="0"
									align="center">
									<s:iterator id="item" value="listItem">
										<tr>
											<td class="xbd3"><a style="white-space:nowrap;text-overflow:ellipsis;overflow:hidden;display:block;width:190px;"
								href="${pageContext.request.contextPath}/front/mall/product/displayDetailProduct?productId=<s:property value="#item.itemProductId"/>"
								target="_blank">***购买了<s:property value="#item.itemProductName" /></a></td>
										</tr>
									</s:iterator>
								</table>
								</td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
				<!--供求信息开始--></td>
			</tr>

		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="mt10">
			<tr>
				<td width="13"><img
					src="${pageContext.request.contextPath}/image/channel/zys/nav_d.jpg"
					width="13" height="33" /></td>
				<td width="90" class="nav_a" id="gyxx">供应信息</td>
				<td width="90" class="nav_b" id="qgxx">求购信息</td>
				<td width="518" class="nav2"></td>
				<td width="33"><img
					src="${pageContext.request.contextPath}/image/channel/zys/nav_c.jpg"
					width="33" height="33" /></td>
			</tr>

			<tr>
				<td colspan="5" class="line" height="190">
				<table width="100%" height="100%" border="0" cellpadding="0"
					cellspacing="0">
					<tr id="gylb">
						<td valign="top" width="33%" class="line_r">
						<table width="94%" border="0" cellspacing="0" cellpadding="0"
							align="center" class="mt10">
							<s:iterator id="item1" value="listS1">
								<tr>
									<td class="xbd3"><span class="green">[供]</span> <a
										target="_blank"
										href="${pageContext.request.contextPath}/front/mall/info/showSupplyInfo?infoId=<s:property value="#item1.infoId"/>&type=<s:property value="#item1.type"/>"><s:property
										value="#item1.title"></s:property></a></td>
								</tr>
							</s:iterator>
						</table>

						</td>
						<td valign="top" width="33%" class="line_r">
						<table width="94%" border="0" cellspacing="0" cellpadding="0"
							align="center" class="mt10">
							<s:iterator id="item2" value="listS2">
								<tr>
									<td class="xbd3"><span class="green">[供]</span> <a
										target="_blank"
										href="${pageContext.request.contextPath}/front/mall/info/showSupplyInfo?infoId=<s:property value="#item2.infoId"/>&type=<s:property value="#item2.type"/>"><s:property
										value="#item2.title"></s:property></a></td>
								</tr>
							</s:iterator>
						</table>
						</td>
						<td valign="top" width="33%">
						<table width="94%" border="0" cellspacing="0" cellpadding="0"
							align="center" class="mt10">
							<s:iterator id="item3" value="listS3">
								<tr>
									<td class="xbd3"><span class="green">[供]</span> <a
										target="_blank"
										href="${pageContext.request.contextPath}/front/mall/info/showSupplyInfo?infoId=<s:property value="#item3.infoId"/>&type=<s:property value="#item3.type"/>"><s:property
										value="#item3.title"></s:property></a></td>
								</tr>
							</s:iterator>
						</table>
						</td>
					</tr>

					<tr id="qglb" style="display: none;">
						<td valign="top" width="33%" class="line_r">
						<table width="94%" border="0" cellspacing="0" cellpadding="0"
							align="center" class="mt10">
							<s:iterator id="item1" value="listP1">
								<tr>
									<td class="xbd3"><span class="red">[求]</span> <a
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
									<td class="xbd3"><span class="red">[求]</span> <a
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
									<td class="xbd3"><span class="red">[求]</span> <a
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
				<td class="cpzs" align="right">
				<table width="100%" height="100%" border="0" cellpadding="0"
					cellspacing="0">
					<tr>
						<td width="93%" align="left"><span class="wz_title">产品展示</span></td>
						<td width="7%"><a target="_blank"
							href="${pageContext.request.contextPath}/front/mall/product/searchProduct-1?type=0006">更多&gt;&gt;</a></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td class="line" align="center"><s:iterator id="item"
					value="listProduct">
					<div style="width: 148px; float: left; height: 178px;">
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
							<s:if test="#item.price1!=null">
								<td align="center" class="wz_xsj" height="15">销售价：￥<s:property
									value="#item.price1" /></td>
							</s:if>
							<s:else>
								<td align="center" class="wz_xsj" height="15">销售价：待定</td>
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