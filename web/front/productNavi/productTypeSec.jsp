<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags" %>
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
<s:if test="#attr.pttL2.size > 0">
 <!--<div class="FindByHint"><s:property value="#attr.pts2.pttypeName"/> (<span><s:property value="#attr.pts2.productCount"/></span>) </div>--> 
<ul class="CategoryListTableLevel1 hesper:expander">
	<div id="propDisp2">
	<s:iterator value="#attr.pttL2" status="s" id="ptt">
	<s:if test="#ptt.ptparentid == #attr.pts2.ptid">
	<li><a
		href="<s:property value="#attr.url2"/>&type=<s:property value="#ptt.ptcode"/>"
		 target=""><s:property value="#ptt.pttypeName"/> </a>(<span><s:property value="#ptt.productCount"/></span>)
	</li>
	</s:if>
	</s:iterator>
	</div>
</ul>
<div id="moreProp2" style="clear: both; padding-top: 10px;"><a
	href="javascript:;"
	style="border: 1px solid rgb(204, 204, 204); margin: 0pt auto; padding: 5px; display: block; width: 150px; text-align: center;"><span>显示全部品牌</span></a></div>
<div class="HackBox"></div>
</s:if>
<s:else>
	<div style="margin:auto;">
		暂无子类
	</div>
</s:else>