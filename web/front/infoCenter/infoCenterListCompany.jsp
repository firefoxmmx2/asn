<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String cp=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>信息列表</title>
<link rel="stylesheet" rev="stylesheet" href="../../css/supplierhuzx.css" type="text/css" />
<style type="text/css">
#huzxPageDiv{float:right; height:35px; padding-top:15px; text-align:right; color:#666; font-size:12px;padding-right:200px;}
#huzxPageDiv a{padding:2px 7px;border:1px #1d6e00 solid;font-size:12px;margin:0 2px; }	
#huzxPageDiv a:link { color:#666666; text-decoration: none; font-size:12px;} 
#huzxPageDiv a:visited { color:#666666; text-decoration: none;font-size:12px;} 
#huzxPageDiv a:hover { color: #000000;  background:#ebf9df;font-size:12px;} 
#huzxPageDiv a:active { color: #FF5151; text-decoration: underline;font-size:12px;}	
#huzxPageDiv span{padding:2px 7px;border:1px #1d6e00 solid;font-size:12px;margin:0 2px; background:#ebf9df;}


#pagelist {border:1px solid #ccc; padding:10px; width:700px; font-size:12px; list-style-type:none; }
#pagelist li {width:700px; height:30px;}
#pagelist li a .lbt {display:block; width:610px; float:left; text-indent:20px; text-decoration:none; white-space:nowrap; text-overflow:ellipsis; overflow: hidden; display:inline;}
#pagelist li a .ldt {display:block; width:90px; float:right; text-align:center; color:#069; text-decoration:none; display:inline;}
#pagelist li a {width:700px; height:30px; display:block; line-height:30px; color:#666; text-decoration:none; cursor:hand; background:url(../../image/hzx/infoCenterList_bg.png) no-repeat 0 0;}
#pagelist li a:hover{ color:#03c; text-decoration:none; background:url(../../image/hzx/infoCenterList_bg.png) no-repeat 0 -30px;}
#pagelist li a:hover .ldt {color:#000;}


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

	</script>
</head>

<body style="background-color: #FFFFFF">
	 <div style="float: left;width:790px;text-align:left;padding-left:12px;background-color: #FFFFFF;">
		<ul id="pagelist">
			<s:iterator id="item" value="infoList" status="list">      
			<li>
				<a href="showInfoCenterCompany?id=<s:property value="#item.id"/>" target="_blank">
					<span class="lbt"><s:property value="#item.title"/></span>
					<span class="ldt"><s:date name="#item.createTime" format="yyyy-MM-dd"></s:date></span>
				</a>
			</li>
			</s:iterator>
		</ul>
		<form action="${pageContext.request.contextPath}/front/mall/infoc/showInfoCenterList" method="post" name="pageform" id="pageform">		
			<s:property value="#request.pageBar" escape="false"/>
			<input type="hidden" name="id" value="${id}"/>
		</form>
	 </div>
</body>
</html>