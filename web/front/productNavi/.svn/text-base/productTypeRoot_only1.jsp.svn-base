<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s"  uri="/struts-tags"%>

<%@page import="com.bornsoft.asn.bean.productType.ProductType, java.util.*"%>
<style>
body{font:12px/1.5 Tahoma,Helvetica,Arial,'宋体',sans-serif;}
ul { list-style: none; margin: 0px; padding: 0px; }
li{list-style:none;}
a{text-decoration:none;}
a:hover{text-decoration:underline;}
.FindByHint{font-weight:bold; text-align:left; background:url(../image/point4h.gif) no-repeat;background-position:center left; line-height:26px; vertical-align:middle; padding-left:10px; }
UL.CategoryListTableLevel1 a{color:#666;}
UL.CategoryListTableLevel1 a:hover{color:#f60;}
UL.CategoryListTableLevel1 {PADDING-RIGHT: 0px; DISPLAY: block; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; LIST-STYLE-TYPE: none;}
UL.CategoryListTableLevel1 LI {FLOAT: left; MARGIN: 4px 0px; WIDTH: 105px; LINE-HEIGHT: 16px; WHITE-SPACE: nowrap}
.HackBox {CLEAR: both}
.HackBox {BORDER-TOP: transparent 0px solid; MARGIN-TOP: -1px! important; VISIBILITY: hidden}
</style>
 <!--<div class="FindByHint"><s:property value="#attr.ptf1.pttypeName"/> (<span><s:property value="#attr.ptf1.productCount"/> </span>)</div>-->
<s:if test="#attr.ptfL1.size > 0">
<ul class="CategoryListTableLevel1 hesper:expander">
	<div id="propDisp2">
	<s:iterator value="#attr.ptfL1" status="s" id="ptt">
	<li><a
		href="<s:property value="#attr.url1"/>&type=<s:property value="#ptt.ptcode"/>"
		 target=""><s:property value="#ptt.pttypeName"/> </a>(<span><s:property value="#ptt.productCount"/></span>)
	</li>
	</s:iterator>
	</div>
</ul>

<div class="HackBox"></div>
</s:if> 
<s:else>
	<div style="margin:auto;">
		暂无子类
	</div>
</s:else>