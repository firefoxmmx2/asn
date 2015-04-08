<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List,com.bornsoft.asn.bean.productType.ProductType" %> 
<% String cp=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>供应信息</title>
<link rel="stylesheet" rev="stylesheet" href="../../css/supplierhuzx.css" type="text/css" />
<link rel="stylesheet" rev="stylesheet" href="../../css/huzx.css" type="text/css" />
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<script type="text/javascript" src="<%=cp%>/js/geoloc/geoloc.js"></script>

<style type="text/css">
#huzxPageDiv{float:right; height:35px; padding-top:15px; text-align:right; color:#666; font-size:12px;padding-right:200px;}
#huzxPageDiv a{padding:2px 7px;border:1px #1d6e00 solid;font-size:12px;margin:0 2px; }	
#huzxPageDiv a:link { color:#666666; text-decoration: none; font-size:12px;} 
#huzxPageDiv a:visited { color:#666666; text-decoration: none;font-size:12px;} 
#huzxPageDiv a:hover { color: #000000;  background:#ebf9df;font-size:12px;} 
#huzxPageDiv a:active { color: #FF5151; text-decoration: underline;font-size:12px;}	
#huzxPageDiv span{padding:2px 7px;border:1px #1d6e00 solid;font-size:12px;margin:0 2px; background:#ebf9df;}
</style>
	<script type="text/javascript">

	function checkPage(){
		var totalPage = document.getElementById("totalPage").value;
		var inPage = document.getElementById("pageBox").value;
		if(isNaN(inPage)||inPage==""){
			alert("请输入数字");
			return false;
		}			
		if(parseInt(inPage) > parseInt(totalPage)){		
			document.getElementById("thePage").value=totalPage;
		}else{
			document.getElementById("thePage").value=parseInt(inPage);
		}
		return true;
	}

	// 初始化地区组件
	geoloc.debugOn();
	$(document).ready(function(){
		geoloc.init("divArea", "- 不限省市 -", "- 不限地州市 -", "- 不限区县 -", "area","${requestScope.area }".substring(0,6));
	});

	// 取地区选择结果，如果没有选择，结果为null；如果选择，数据形式为：310101|黄浦区
	function showSelection(){
		var sel=geoloc.getSelection("divArea");
		if(sel==null){
			alert("没有选择");
		} else {
			alert(sel);
		}
	}


		</script>
</head>

<body>
	<div style="height:25px; font-size: 16px; text-align: left;font-weight: 700;color: #FF7300; background-color: #FFFFFF;padding-left: 12px;">供应信息</div>
	 <div style="height:25px; width:962px;text-align:left;padding-left:12px;background-color: #FFFFFF;"><img src="<%=request.getContextPath()%>/front/images/point4h.gif">
	 <a href="${pageContext.request.contextPath}/front/mall/info/showSupplyInfoList">所有分类</a>
	 <s:if test="#request.lastOneType!=null"><img src="<%=request.getContextPath()%>/front/images/point4h.gif">
	 <a href="${pageContext.request.contextPath}/front/mall/info/showSupplyInfoList1?typeId=<s:property value="#request.lastOneType.ptid"/>"><s:property value="#request.lastOneType.pttypeName"/></a>
	 </s:if>
	 <s:if test="#request.lastTwoType!=null"><img src="<%=request.getContextPath()%>/front/images/point4h.gif">
	 <a href="${pageContext.request.contextPath}/front/mall/info/showSupplyInfoList1?typeId=<s:property value="#request.lastTwoType.ptid"/>"><s:property value="#request.lastTwoType.pttypeName"/></a>
	 </s:if>
	 <img src="<%=request.getContextPath()%>/front/images/point4h.gif">
	 <a style="color: red;" href="${pageContext.request.contextPath}/front/mall/info/showSupplyInfoList1?typeId=<s:property value="#request.mainType.ptid"/>"><s:property value="#request.mainType.pttypeName"/></a>
	 </div>
	 <div style="width:962px;text-align:left;padding-left:12px;background-color: #FFFFFF;height: 25px;">
	 	<ul><s:iterator id="item" value="secondType">
			<li style="float: left; margin-right: 10px; display:inline;"><a style="color: green;font-size: 12px; font-weight: 700;" href="${pageContext.request.contextPath}/front/mall/info/showSupplyInfoList1?typeId=<s:property value="#item.ptid"></s:property>"><s:property value="#item.pttypeName"/></a></li>
			</s:iterator>
		</ul>
	 </div>
	 <s:form action="/front/mall/info/showSupplyInfoList1" theme="simple">
	 <input type="hidden" name="typeId" value="<s:property value="#request.mainType.ptid"/>"></input>
	 <div style="height:30px; float: left;width:962px;text-align:left;padding-left:12px;background-color: #FFFFFF;">
	 	关键字：<input name="searchWord" type="text" size="40" value="<s:property value="#request.searchWord"/>">	
	 	<input type="submit" value="搜 索">						
	 </div>
	 <div style="height:25px; float: left;width:962px;text-align:left;padding-left:12px;background-color: #FFFFFF;">
	 	所属地区：<input type="hidden" name="area" id="area" style="display: none;"><span id="divArea"></span>					
	 </div>
	 </s:form>
	 <div style="float: left;width:962px;text-align:left;padding-left:12px;background-color: #FFFFFF;">
		<s:iterator id="item" value="listS" status="list">      
				<TABLE cellpadding="0" cellspacing="0" width="770" align="center" style="border-top:1px dotted #666666;padding:10px 0; float: left; margin-top: 5px;">
				<tr>
				<td width="50%" align="left"><a target="_blank" href="${pageContext.request.contextPath}/front/mall/info/showSupplyInfo?infoId=<s:property value="#item.infoId"/>&type=<s:property value="#item.type"/>" style="font-size: 16px; font-weight: 700;"><s:property value="#item.title"></s:property></a></td>
				<td align="center">信息类别：<s:property value="#item.typeName"/></td>
				</tr>
				<tr>									
				<td colspan="2" style="text-align: left;">
				<p style="text-indent: 2em"><s:property value="#item.detail"/></p>
				</td>
				</tr>     
				<tr>
				<td width="50%" align="left">关键字：<font style="color: red;"><s:property value="#item.keyWord"/></font></td>
				<td align="center"> 信息有效期：<s:date name="#item.endDate" format="yyyy-MM-dd"></s:date> </td>
				</tr>
				</TABLE>
		</s:iterator>
		<form action="${pageContext.request.contextPath}/front/mall/info/showSupplyInfoList1" method="post" name="pageform" id="pageform">		
		<s:property value="#request.pageBar" escape="false"/>
		<input name="searchWord" type="hidden" value="<s:property value="#request.searchWord"/>">
		<input name="area" type="hidden" value="<s:property value="#request.area"/>">
		 <input type="hidden" name="typeId" value="<s:property value="#request.mainType.ptid"/>"></input>
		</form>
	 </div><!--
	<div style="float: left;width: 170px; height: 300px;background-image: url('../../image/hzx/advPic2.jpg')">
		
	</div>

--></body>
</html>