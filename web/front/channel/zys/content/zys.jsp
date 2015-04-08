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
			$("#gylb").css('display', 'table');
			$("#gyxx").removeClass("nav_b");
			$("#gyxx").addClass("nav_a");
			$("#qgxx").removeClass("nav_a");
			$("#qgxx").addClass("nav_b");
		});
		$("#qgxx").mouseover(function()
		{
			$("#qgxx").css('cursor', 'pointer');
			$("#gylb").css('display', 'none');
			$("#qglb").css('display', 'table');
			$("#qgxx").removeClass("nav_b");
			$("#qgxx").addClass("nav_a");
			$("#gyxx").removeClass("nav_a");
			$("#gyxx").addClass("nav_b");
		});
		$("#xptj").mouseover(function()
		{
			$("#xptj").css('cursor', 'pointer');
			$("#rmcplb").css('display', 'none');
			$("#xptjlb").css('display', 'table-row');
			$("#xptj").removeClass("nav_b");
			$("#xptj").addClass("nav_a");
			$("#rmcp").removeClass("nav_a");
			$("#rmcp").addClass("nav_b");
		});
		$("#rmcp").mouseover(function()
		{
			$("#rmcp").css('cursor', 'pointer');
			$("#xptjlb").css('display', 'none');
			$("#rmcplb").css('display', 'table-row');
			$("#rmcp").removeClass("nav_b");
			$("#rmcp").addClass("nav_a");
			$("#xptj").removeClass("nav_a");
			$("#xptj").addClass("nav_b");
		});
	});
</script>
<table width="980" border="0" cellspacing="1" cellpadding="0"
	align="center" height="455" class="mt10">
	<tr>
		<td width="184" valign="top"><%@ include file="ptype.jsp"%>
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
			<td class="dht_right" style="padding-left: 5px;">
				<span class="wz_title">会员中心</span>
			</td>
			</tr>
			<tr>
				<td align="left" class="entry">
					<iframe src="http://appsvr.aiecp.com:8080/ptnsso/signon/indexLoginncp.sso" width="184" frameborder="0" scrolling="no" marginheight="0" align="center"></iframe>
				</td>
			</tr>
		</table>
			
		</td>
		<td width="10"></td>
		<td valign="top" width="550" align="center">

		<table width="100%" border="0" class="ztp" cellspacing="0"
			cellpadding="0">
			<tr>
				<td>
				<script type="text/javascript">
					var focus_width=545;
					var focus_height=210;
					var text_height=0;
					var swf_height = focus_height+text_height;
					var pics='${pageContext.request.contextPath}/image/channel/flash/zys1.jpg|${pageContext.request.contextPath}/image/channel/flash/zys2.jpg|${pageContext.request.contextPath}/image/channel/flash/zys3.jpg';
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
			</tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="mt10">
			<tr>
				<td width="13"><img
					src="${pageContext.request.contextPath}/image/channel/zys/nav_d.jpg"
					width="13" height="33" /></td>
				<td width="90" class="nav_a" id="xptj">新品推荐</td>
				<td width="90" class="nav_b" id="rmcp">热卖产品</td>
				<td width="324" class="nav2"></td>
				<td width="33"><img
					src="${pageContext.request.contextPath}/image/channel/zys/nav_c.jpg"
					width="33" height="33" /></td>
			</tr>

			<tr id="xptjlb">
				<td colspan="5" align="center" class="line2"><s:iterator
					id="item" value="listProduct">
					<div style="width: 135px; float: left; height: 178px;">
					<table class="chanpin" cellpadding="0" cellspacing="0">
						<tr>
							<td align="center"><a
								href="${pageContext.request.contextPath}/front/mall/product/displayDetailProduct?productId=<s:property value="#item.productId"/>"
								target="_blank"> <img
								src="${pageContext.request.contextPath}<s:property value="#item.smallPicPath"/>"
								width="108" height="96" /> </a></td>
						</tr>
						<tr>
							<td align="center" class="huib" height="20"><a
								href="${pageContext.request.contextPath}/front/mall/product/displayDetailProduct?productId=<s:property value="#item.productId"/>"
								target="_blank"> <s:property value="#item.productName" /> </a></td>

						</tr>
						<tr>
							<td align="center" class="wz_xsj" height="15"><s:if
								test="#item.price1==null">
						销售价：待定
						</s:if> <s:else>
						销售价：<s:property value="#item.price1"></s:property>
							</s:else></td>
						</tr>
					</table>
					</div>
				</s:iterator></td>
			</tr>
			<tr id="rmcplb" style="display: none;">
				<td colspan="5" align="center" class="line2"><s:iterator
					id="item" value="listHotProduct">
					<div style="width: 135px; float: left; height: 178px;">
					<table class="chanpin" cellpadding="0" cellspacing="0">
						<tr>
							<td align="center"><a
								href="${pageContext.request.contextPath}/front/mall/product/displayDetailProduct?productId=<s:property value="#item.productId"/>"
								target="_blank"> <img
								src="${pageContext.request.contextPath}<s:property value="#item.smallPicPath"/>"
								width="108" height="96" /> </a></td>

						</tr>
						<tr>
							<td align="center" class="huib" height="20"><a
								href="${pageContext.request.contextPath}/front/mall/product/displayDetailProduct?productId=<s:property value="#item.productId"/>"
								target="_blank"> <s:property value="#item.productName" /> </a></td>

						</tr>
						<tr>
							<td align="center" class="wz_xsj" height="15"><s:if
								test="#item.price1==null">
						销售价：待定
						</s:if> <s:else>
						销售价：￥<s:property value="#item.price1"></s:property>
							</s:else></td>
						</tr>
					</table>
					</div>
				</s:iterator></td>
			</tr>
			<tr>
				<td colspan="5" height="107" class="zxjrqy"><!-- 最近企業1 -->
				<style>
.str_hidden_1 {
	width: 158px;
	overflow: hidden;
	white-space: nowrap;
	-o-text-overflow: ellipsis;
	text-overflow: ellipsis;
}
</style>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<s:iterator value="recentEnterprises" status="s">
						<s:if test="(#s.index+1) % 3 == 1">
							<tr>
								<td width="10%">&nbsp;</td>
						</s:if>
						<td width="30%" align="left">
						<div class="str_hidden_1"><a target="_blank"
							href="${pageContext.request.contextPath }/front/shop/supplierShopSy?supplierid=<s:property value="supplierId"/>"
							title="<s:property value="fullName"/>"> <span><s:property
							value="fullName" /></span></a></div>
						</td>
						<s:if test="(#s.index+1) % 3 == 0">
							</tr>
						</s:if>
					</s:iterator>
				</table>
				<script type="text/javascript">
	$(function()
	{
		$('.str_hidden_1').ellipsis();
	});
</script></td>
			</tr>
		</table>


		</td>
		<td width="10"></td>
		<td valign="top" width="226"><!-- 行情 --> <%@ include
			file="quotation.jsp"%>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="mt10">
			<tr>
				<td width="13"><img
					src="${pageContext.request.contextPath}/image/channel/zys/nav_d.jpg"
					width="13" height="33" /></td>
				<td width="90" class="nav_a" id="gyxx">供应信息</td>
				<td width="90" class="nav_b" id="qgxx">求购信息</td>
				<td width="33"><img
					src="${pageContext.request.contextPath}/image/channel/zys/nav_c.jpg"
					width="33" height="33" /></td>
			</tr>
			<tr>
				<td height="280" colspan="4" valign="top" class="line">
				<table width="94%" border="0" cellspacing="0" cellpadding="0"
					align="center" class="mt10" id="gylb">
					<s:iterator id="item1" value="listS">
						<tr>
							<td class="xbd3"><span class="green">[供]</span> <a
								target="_blank"
								href="${pageContext.request.contextPath}/front/mall/info/showSupplyInfo?infoId=<s:property value="#item1.infoId"/>&type=<s:property value="#item1.type"/>"><s:property
								value="#item1.title" /></a></td>
						</tr>
					</s:iterator>
				</table>
				<table width="94%" border="0" cellspacing="0" cellpadding="0"
					align="center" class="mt10" id="qglb" style="display: none;">
					<s:iterator id="item2" value="listP">
						<tr>
							<td class="xbd3"><span class="red">[求]</span> <a
								target="_blank"
								href="${pageContext.request.contextPath}/front/mall/info/showPurchaseInfo?infoId=<s:property value="#item2.infoId"/>&type=<s:property value="#item2.type"/>"><s:property
								value="#item2.title" /></a></td>
						</tr>
					</s:iterator>
				</table>
				</td>
			</tr>
		</table>

		</td>
	</tr>
</table>

<table width="980" border="0" cellspacing="0" cellpadding="0"
	align="center" class="mt10">
	<tr>
		<td>
	<table width=100% border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="20" height="30" class="dh1"></td>
		<td width="910" class="dh2">新合作联佳连锁产品</td>
		<td width="50" class="dh3"><a target="_blank"
			href="${pageContext.request.contextPath}/front/mall/mallIndex">更多&gt;&gt;</a></td>
			</tr>
	</table>
	</td>
	</tr>
	<tr>
		<td align="center" class="line"><s:iterator id="item"
			value="listLianjia">
			<div style="width: 162px; float: left; height: 190px;">
			<table class="chanpin" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center"><a
						href="${pageContext.request.contextPath}/front/mall/product/displayDetailProduct?productId=<s:property value="#item.productId"/>"
						target="_blank"> <img
						src="${pageContext.request.contextPath}<s:property value="#item.smallPicPath"/>"
						width="108" height="96" /> </a></td>

				</tr>
				<tr>
					<td align="center" class="huib" height="20"><a
						href="${pageContext.request.contextPath}/front/mall/product/displayDetailProduct?productId=<s:property value="#item.productId"/>"
						target="_blank"> <s:property value="#item.productName" /> </a></td>

				</tr>
				<tr>
					<td align="center" class="wz_xsj" height="15"><a href="#">销售价：￥<s:property
						value="#item.price1" /></a></td>
				</tr>
			</table>
			</div>
		</s:iterator></td>
	</tr>
</table>

<table width="980" border="0" cellspacing="0" cellpadding="0"
	class="mt10" align="center">
	<tr>
		<td><!--
		FLASH廣告
		--> <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
			codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0"
			width="980" height="100">
			<param name="movie" value="${pageContext.request.contextPath }/flash/channel/zys/flash_zys.swf" />
			<param name="quality" value="high" />
			<embed src="${pageContext.request.contextPath }/flash/channel/zys/flash_zys.swf" quality="high"
				pluginspage="http://www.macromedia.com/go/getflashplayer"
				type="application/x-shockwave-flash" width="980" height="100"></embed>
		</object></td>
	</tr>
</table>

<!-- 最近企業 或者 合作联佳连锁超市 -->
<%@include file="recentEnterprise.jsp"%>