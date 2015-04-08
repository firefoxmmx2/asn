<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags"%>
    <script type="text/javascript">
	$(document).ready(function(){	
		$("#gyxx").mouseover(
				function(){
					$("#showqg").css('display','none');
					$("#showgy").css('display','inline');
					$("#qgxx").attr("src","${pageContext.request.contextPath}/image/channel/zszy/nav130a1.jpg");	
					$("#gyxx").attr("src","${pageContext.request.contextPath}/image/channel/zszy/nav130b2.jpg");	
					$("#qglb").css('display','none');
					$("#gylb").css('display','table-row');	
				}
			);
			$("#qgxx").mouseover(
				function(){
					$("#showgy").css('display','none');
					$("#showqg").css('display','inline');
					$("#gyxx").attr("src","${pageContext.request.contextPath}/image/channel/zszy/nav130b1.jpg");	
					$("#qgxx").attr("src","${pageContext.request.contextPath}/image/channel/zszy/nav130a2.jpg");		
					$("#gylb").css('display','none');	
					$("#qglb").css('display','table-row');
				}
			);
	});	
	</script>
<table width="980" border="0" cellspacing="0" cellpadding="0" align="center" height="455" class="mt10">
  <tr>
    <td width="183" valign="top">
		<!-- 分类 -->
		<%@ include file="ptype.jsp" %>
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
			<td class="dht_left">
				<span class="pl30">会员中心</span>
			</td>
			</tr>
			<tr>
				<td align="left" class="entry">
					<iframe src="http://appsvr.aiecp.com:8080/ptnsso/signon/indexLoginncp.sso" width="100%" frameborder="0" scrolling="no" marginheight="0" align="center"></iframe>
				</td>
			</tr>
		</table>
	</td>
	<td width="11"></td>
	<td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="215" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="ztp">
            <script type="text/javascript">
			var focus_width=545;
			var focus_height=210;
			var text_height=0;
			var swf_height = focus_height+text_height;
			var pics='${pageContext.request.contextPath}/image/channel/flash/zszy1.jpg|${pageContext.request.contextPath}/image/channel/flash/zszy2.jpg|${pageContext.request.contextPath}/image/channel/flash/zszy3.jpg';
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
            <td width="225" height="215" valign="top">
            	<!-- 行情 -->
            	<%@ include file="quotation.jsp" %>
            </td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mt10">
  <tr>
    <td class="gqxx" height="35"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="18">&nbsp;</td>
        <td width="134" valign="bottom" align="center"><img id="gyxx"  src="${pageContext.request.contextPath}/image/channel/zszy/nav130b2.jpg" width="130" height="26" /></td>
        <td width="134" valign="bottom" align="center"><img id="qgxx" src="${pageContext.request.contextPath}/image/channel/zszy/nav130a1.jpg" width="130" height="26" /></td>
        <td>&nbsp;</td>
        <td width="50" align="left"><a target="_blank" id="showgy" href="${pageContext.request.contextPath}/front/mall/info/showSupplyInfoList1?typeId=5">更多&gt;&gt;</a><a target="_blank" id="showqg" style="display: none;" href="${pageContext.request.contextPath}/front/mall/info/showPurchaseInfoList1?typeId=5">更多&gt;&gt;</a></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td  height="217" valign="top" class="gqxx_bg line"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
      <tr id="gylb">
        <td valign="top" width="33%" class="line_r">
		<table width="94%" border="0" cellspacing="0" cellpadding="0" align="center" class="mt10" >
		   <s:iterator id="item1" value="listS1">
		  <tr>
		    <td class="xbd3"><span class="green">[供]</span>
		    <a target="_blank" href="${pageContext.request.contextPath}/front/mall/info/showSupplyInfo?infoId=<s:property value="#item1.infoId"/>&type=<s:property value="#item1.type"/>"><s:property value="#item1.title"></s:property></a>
		    </td>
		  </tr>
		   </s:iterator>
	</table>
		
		</td>
        <td valign="top" width="33%" class="line_r">
		<table width="94%" border="0" cellspacing="0" cellpadding="0" align="center" class="mt10">
		   <s:iterator id="item2" value="listS2">
		  <tr>
		    <td class="xbd3"><span class="green">[供]</span>
		    <a target="_blank" href="${pageContext.request.contextPath}/front/mall/info/showSupplyInfo?infoId=<s:property value="#item2.infoId"/>&type=<s:property value="#item2.type"/>"><s:property value="#item2.title"></s:property></a>
		    </td>
		  </tr>
		   </s:iterator>
		</table>
		</td>
        <td valign="top" width="33%">
		<table width="94%" border="0" cellspacing="0" cellpadding="0" align="center" class="mt10">
  		<s:iterator id="item3" value="listS3">
		  <tr>
		    <td class="xbd3"><span class="green">[供]</span>
		    <a target="_blank" href="${pageContext.request.contextPath}/front/mall/info/showSupplyInfo?infoId=<s:property value="#item3.infoId"/>&type=<s:property value="#item3.type"/>"><s:property value="#item3.title"></s:property></a>
		    </td>
		  </tr>
		   </s:iterator>
		</table>
		</td>
      </tr>
      
        <tr id="qglb" style="display: none;">
        <td valign="top" width="33%" class="line_r">
		<table width="94%" border="0" cellspacing="0" cellpadding="0" align="center" class="mt10" >
		 <s:iterator id="item1" value="listP1">
		  <tr>
		    <td class="xbd3"><span class="red">[求]</span>
		    <a target="_blank" href="${pageContext.request.contextPath}/front/mall/info/showPurchaseInfo?infoId=<s:property value="#item1.infoId"/>&type=<s:property value="#item1.type"/>"><s:property value="#item1.title"></s:property></a> 
		    </td>
		  </tr>
		 </s:iterator>
		</table>
		
		</td>
        <td valign="top" width="33%" class="line_r">
		<table width="94%" border="0" cellspacing="0" cellpadding="0" align="center" class="mt10">
		 <s:iterator id="item2" value="listP2">
		  <tr>
		    <td class="xbd3"><span class="red">[求]</span>
		    <a target="_blank" href="${pageContext.request.contextPath}/front/mall/info/showPurchaseInfo?infoId=<s:property value="#item2.infoId"/>&type=<s:property value="#item2.type"/>"><s:property value="#item2.title"></s:property></a> 
		    </td>
		  </tr>
		 </s:iterator>
		</table>
		</td>
        <td valign="top" width="33%">
		<table width="94%" border="0" cellspacing="0" cellpadding="0" align="center" class="mt10">  
  		<s:iterator id="item3" value="listP3">
		  <tr>
		    <td class="xbd3"><span class="red">[求]</span>
		    <a target="_blank" href="${pageContext.request.contextPath}/front/mall/info/showPurchaseInfo?infoId=<s:property value="#item3.infoId"/>&type=<s:property value="#item3.type"/>"><s:property value="#item3.title"></s:property></a> 
		    </td>
		  </tr>
		 </s:iterator>
		</table>
		</td>
      </tr>
      
    </table></td>
  </tr>
</table>

		
		</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="980" border="0" cellspacing="0" cellpadding="0" class="mt10" align="center">
  <tr>
    <td width="155"><img src="${pageContext.request.contextPath}/image/channel/zszy/gg02.jpg" width="155" height="65" /></td>
    <td width="10">&nbsp;</td>
     <td width="155"><img src="${pageContext.request.contextPath}/image/channel/zszy/gg01.jpg" width="155" height="65" /></td>
    <td width="10">&nbsp;</td>
     <td width="155"><img src="${pageContext.request.contextPath}/image/channel/zszy/gg04.jpg" width="155" height="65" /></td>
    <td width="10">&nbsp;</td>
     <td width="155"><img src="${pageContext.request.contextPath}/image/channel/zszy/gg03.jpg" width="155" height="65" /></td>
    <td width="10">&nbsp;</td>
    <td width="155"><img src="${pageContext.request.contextPath}/image/channel/zszy/gg05.jpg" width="155" height="65" /></td>
    <td width="10">&nbsp;</td>
     <td width="155"><img src="${pageContext.request.contextPath}/image/channel/zszy/gg06.jpg" width="155" height="65" /></td>
  </tr>
</table>


<table width="980" border="0" cellspacing="0" cellpadding="0" class="mt10" align="center">
  <tr>
    <td width="183" valign="top">
    <%@ include file="recentEnterprise.jsp" %>
	
	</td>
    <td width="11"></td>
	<td width="786" valign="top">
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" class="cpzs"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="100" class="title_cpzs">产品展示</td>
        <td width="715">&nbsp;</td>
		<td width="50"><a target="_blank" href="${pageContext.request.contextPath}/front/mall/product/searchProduct-1?type=0005">更多&gt;&gt;</a></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td class="line" align="center">
	 <s:iterator id="item" value="listProduct">
	 <div style="width:155px; float:left;">
	 	<table class="chanpin" cellpadding="0" cellspacing="0">
		<tr>
          <td align="center"><a href="${pageContext.request.contextPath}/front/mall/product/displayDetailProduct?productId=<s:property value="#item.productId"/>" target="_blank"><img src="${pageContext.request.contextPath}<s:property value="#item.smallPicPath"/>" width="108" height="96" /></a></td>
        </tr>
		<tr>
          <td align="center" class="huib" height="20"><a href="${pageContext.request.contextPath}/front/mall/product/displayDetailProduct?productId=<s:property value="#item.productId"/>" target="_blank"><s:property value="#item.productName"/></a></td>	      
        </tr>
		<tr>
          <td align="center" class="wz_xsj" height="15">销售价：￥<s:property value="#item.price1"/></td>     
        </tr>
		</table>
	 </div>
	 </s:iterator>
	</td>
  </tr>
</table>

	</td>
  </tr>
</table>