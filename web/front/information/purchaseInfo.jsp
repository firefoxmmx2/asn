<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>望龙门—农业综合服务网络平台&nbsp;|&nbsp;新农村现代经营服务网络平台</title>
</head>

<body>
	<div style="font-size: 16px; text-align: left;font-weight: 700;background-image: url('../../image/hzx/nav96_01.gif');background-repeat:no-repeat; padding-left: 5px; height: 30px; width: 950px; margin-left: 12px;"><a style="color: #FFFFFF;" href="${pageContext.request.contextPath}/front/mall/info/showPurchaseInfoList">求购信息</a></div>
	<div style="background-color: #EEE;position: relative;float: left;width: 950px;margin-left: 12px;">
		<div style="text-align: center; color: black; font-size: 16px;font-weight: 700"><s:property value="purchaseInfo.title"/></div>
		<div style="position: relative; float: left; width:948px;">
		<div style="position: relative;width:600px; float: left; margin-left: 10px;">
		关键字：<font style="color: red;"><s:property value="purchaseInfo.keyWord"/></font>
		</div>
		<div style="position: relative; float: left; width:300px; text-align: right;">
			<div style="position: relative;float: right;">类别：<s:property value="purchaseInfo.typeName"/></div>
		</div>
		</div>
		<div style="position: relative; float: left; width:938px;margin-left: 10px;">所属地域：<s:property value="purchaseInfo.area"/></div>
		<div style="position: relative; float: left; width:948px;">
			<p style="text-indent: 2em;font-size: 14px; ">
				<s:property value="purchaseInfo.detail"/>
			</p>
		</div>
		<div style="position: relative; float: right; width:935px; text-align: right; margin-right: 10px;">信息有效期：<s:date name="purchaseInfo.endDate" format="yyyy-MM-dd"></s:date></div>
	</div>
	<div style="position: relative; float: left; width:950px; margin-left: 12px;">
		<ul>
		    <li>联系人:<s:property value="#request.member.contactor"/></li>
			<li>电话：<s:if test="#request.member.fixedPhone==null||#request.member.fixedPhone=='null'||#request.member.fixedPhone==''">暂无</s:if>
			<s:else><s:property value="#request.member.fixedPhone"/></s:else>
			</li>
			<li>邮编：<s:property value="#request.member.zip"/></li>
			<li>地址：<s:property value="#request.member.address"/></li>
		</ul>
	</div>
	<div style="position:relative;float:left; font-size: 16px; text-align: left;font-weight: 700;background-image: url('../../image/hzx/nav96_01.gif');background-repeat:no-repeat; padding-left: 5px; height: 30px; width: 950px; margin-left: 12px;">
	<a style="color: #FFFFFF;" target="_blank" href="${pageContext.request.contextPath}/front/mall/info/showPurchaseInfoList1?type=<s:property value="purchaseInfo.type"></s:property>">相关信息</a>
	</div>
	<div style="position: relative; float: left; width:950px;background-color: #ECF9E0; margin-left: 12px;">
		<s:if test="listP.size>0">
		<table style="font-size: 12px;" border="0" cellpadding="0" cellspacing="0">
			<tbody>
				<s:iterator id="item" value="listP" status="list">
						<s:if test="%{(#list.index)%5==0}">
						<tr>
						</s:if>
						<td valign="middle" height="24" width="20%" align="left">
						<a target="_blank" href="${pageContext.request.contextPath}/front/mall/info/showPurchaseInfoList1?type=<s:property value="#item.type"></s:property>">【<s:property value="#item.typeName"></s:property>】</a><a target="_blank" href="${pageContext.request.contextPath}/front/mall/info/showPurchaseInfo?infoId=<s:property value="#item.infoId"/>&type=<s:property value="#item.type"/>"><s:property value="#item.title"></s:property></a>
						</td>
						<s:if test="%{(#list.index+1)%5==0}">
						</tr>
						</s:if>
				</s:iterator>
			</tbody>
		</table>
		</s:if>
		<s:else>
			暂无相关信息
		</s:else>
	</div>
</body>
</html>