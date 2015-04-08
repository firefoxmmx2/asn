<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="FindByHint"><s:property value="#attr.pts2.pttypeName"/> </div>
<ul class="CategoryListTableLevel1 hesper:expander">
	<div id="propDisp2">
	<s:iterator value="#attr.pttL2" status="s" id="ptt">
	<s:if test="#ptt.ptparentid == #attr.pts2.ptid">
	<li><a
		href="<s:property value="#attr.url2"/>&type=<s:property value="#ptt.ptcode"/>"
		style="color: rgb(255, 85, 0) ! important;" target=""><s:property value="#ptt.pttypeName"/> </a><i></i>
	</li>
	</s:if>
	</s:iterator>
	</div>
</ul>
<div id="moreProp2" style="clear: both; padding-top: 10px;"><a
	href="javascript:;"
	style="border: 1px solid rgb(204, 204, 204); margin: 0pt auto; padding: 5px; display: block; width: 150px; text-align: center;"><span>显示全部品牌</span></a></div>
<div class="HackBox"></div>
