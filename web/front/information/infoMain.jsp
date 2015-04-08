<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>供求信息</title>
<style type="text/css">

</style>
</head>

<body>
<table width="950" height="30" border="0" cellpadding="0" cellspacing="0" background="images/bg.gif" align="center">
  <tr>
    <td width="20">&nbsp;</td>
	<td width="10" valign="middle"><img src="<%=request.getContextPath()%>/image/hzx/arrow2.gif" width="6" height="7" /></td>
    <td width="120" valign="middle" style="font-size:14px; font-weight:bold; color:#057f33;"><a style="color:#057f33; font-size: 16px;font-weight: 700;" href="${pageContext.request.contextPath}/front/mall/info/showSupplyInfoList" target="_blank">供应信息</a></td>
	<td width="10" valign="middle"><img src="<%=request.getContextPath()%>/image/hzx/arrow2.gif" width="6" height="7" /></td>
    <td width="120" valign="middle" style="font-size:14px; font-weight:bold; color:#057f33;"><a style="color:#057f33;  font-size: 16px;font-weight: 700;" href="${pageContext.request.contextPath}/front/mall/info/showPurchaseInfoList" target="_blank">求购信息</a></td>
    <td>&nbsp;</td>
  </tr>
</table>


<table width="950" border="0" cellspacing="0" cellpadding="0" align="center" style="margin-top:20px;">
  <tr>
    <td width="687">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="575" height="26" valign="middle" background="<%=request.getContextPath()%>/image/hzx/zxgy.gif" style="font-size:14px; font-weight:bold; color:#FFFFFF; padding-left:15px;">最新供应 </td>
    <td width="112" background="<%=request.getContextPath()%>/image/hzx/gbgyxx.png" style="color:#047904; font-size:12px; text-align:right; padding-right:5px;"><a href="${pageContext.request.contextPath}/do" color:green;>发布供应信息</a></td>
  </tr>
</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #cfcfcf; border-top:none; font-size:12px" height="304">
			<tbody>
				<s:iterator id="item" value="listS1" status="list">
						<s:if test="%{(#list.index+1)%3==1}">
						<tr>
						</s:if>		
						<td valign="middle" height="24" width="33%" align="left">
						<a target="_blank" href="${pageContext.request.contextPath}/front/mall/info/showSupplyInfoList1?type=<s:property value="#item.type"></s:property>">【<s:property value="#item.typeName"></s:property>】</a><a target="_blank" href="${pageContext.request.contextPath}/front/mall/info/showSupplyInfo?infoId=<s:property value="#item.infoId"/>&type=<s:property value="#item.type"/>"><s:property value="#item.title"></s:property></a>
						</td>
						<s:if test="%{(#list.index+2)%2==2}">
						</tr>
						</s:if>
				</s:iterator>
			</tbody>
		</table>

    </td>
    <td>&nbsp;</td>
    <td width="256" valign="top">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td height="28" background="<%=request.getContextPath()%>/image/hzx/cqgy.gif" style="font-size:14px; font-weight:bold; color:#047904; padding-left:15px;">长期供应</td>
  </tr>
  <tr>
    <td>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #94d27f; font-size:12px; border-top:none;" height="302">
		  <s:iterator id="item" value="listS">
		  <tr>
		    <td height="24" valign="middle"><a target="_blank" href="${pageContext.request.contextPath}/front/mall/info/showSupplyInfoList1?type=<s:property value="#item.type"></s:property>">【<s:property value="#item.typeName"></s:property>】</a><a target="_blank" href="${pageContext.request.contextPath}/front/mall/info/showSupplyInfo?infoId=<s:property value="#item.infoId"/>&type=<s:property value="#item.type"/>"><s:property value="#item.title"></s:property></a></td>
		  </tr>
		  </s:iterator>
</table>

	</td>
  </tr>
</table>

	
	</td>
  </tr>
</table>

<table width="950" border="0" cellspacing="0" cellpadding="0" align="center" style="margin-top:10px;">
  <tr>
    <td width="687">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="575" height="26" valign="middle" background="<%=request.getContextPath()%>/image/hzx/zxgy.gif" style="font-size:14px; font-weight:bold; color:#FFFFFF; padding-left:15px;">最新求购 </td>
    <td width="112" background="<%=request.getContextPath()%>/image/hzx/fbgqxx.png" style="color:#047904; font-size:12px; text-align:right; padding-right:5px;"><a href="${pageContext.request.contextPath}/do" color:green;>发布求购信息</a></td>
  </tr>
</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #cfcfcf; border-top:none; font-size:12px" height="304">
			<tbody>
				<s:iterator id="item" value="listP1" status="list">
						<s:if test="%{(#list.index+1)%3==1}">
						<tr>
						</s:if>		
						<td valign="middle" height="24" width="33%" align="left">
						<a target="_blank" href="${pageContext.request.contextPath}/front/mall/info/showPurchaseInfoList1?type=<s:property value="#item.type"></s:property>">【<s:property value="#item.typeName"></s:property>】</a><a target="_blank" href="${pageContext.request.contextPath}/front/mall/info/showPurchaseInfo?infoId=<s:property value="#item.infoId"/>&type=<s:property value="#item.type"/>"><s:property value="#item.title"></s:property></a>
						</td>
						<s:if test="%{(#list.index+2)%2==2}">
						</tr>
						</s:if>
				</s:iterator>
			</tbody>
		</table>

    </td>
    <td>&nbsp;</td>
    <td width="256" valign="top">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td height="28" background="<%=request.getContextPath()%>/image/hzx/cqgy.gif" style="font-size:14px; font-weight:bold; color:#047904; padding-left:15px;">长期求购</td>
  </tr>
  <tr>
    <td>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #94d27f; font-size:12px; border-top:none;" height="302">
		  <s:iterator id="item" value="listP">
		  <tr>
		    <td height="24" valign="middle"><a target="_blank" href="${pageContext.request.contextPath}/front/mall/info/showPurchaseInfoList1?type=<s:property value="#item.type"></s:property>">【<s:property value="#item.typeName"></s:property>】</a><a target="_blank" href="${pageContext.request.contextPath}/front/mall/info/showPurchaseInfo?infoId=<s:property value="#item.infoId"/>&type=<s:property value="#item.type"/>"><s:property value="#item.title"></s:property></a></td>
		  </tr>
		  </s:iterator> 
	</table>

	</td>
  </tr>
</table>

	
	</td>
  </tr>
</table>




</body>
</html>