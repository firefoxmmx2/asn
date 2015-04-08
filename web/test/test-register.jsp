<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bornsoft.asn.service.member.MemberService" %>
<%
	String cp=request.getContextPath();
	long memberId=MemberService.getMemberId(session);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.UUID"%>
<%@page import="com.bornsoft.asn.utils.common.WebContext"%>
<%@page import="com.bornsoft.asn.service.idmaker.IdMakerService"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui-1.8rc3.custom.min.js"></script>

<script type="text/javascript">
	var memberId=<%=memberId%>;
	var loginUrl="<%=cp%>/plain/member/login.jsp";

	// 检查是否登录过，如果没有，打开登录框
	function checkLogin(){
		var ret=true;
		if(memberId<1){
			var dlg=$("#dlgRegister");
			if(dlg.size()<1) {
				butil.loadCss("~/css/jquilib/themes/base/jquery.ui.all.css");
				dlg=$("<div id='dlgRegister' style='width:500px; height:200px;'><iframe src='"+loginUrl+"' width=100% height=200 /></div>");
				$("body").append(dlg);
				
			}
			dlg.dialog({ 
				title: "为了记录您的订单，需要您进行登录", 
				width: 500,
				height: 250,
				buttons: {}  
			});
			ret=false;
		}
		return ret;
	}

	// 登录回调
	function loginCallback(loginMemberId){
		$("#dlgRegister").dialog("close");
		memberId=loginMemberId;
		saveOrder();
	}

	function saveOrder(){
		if(!checkLogin()) return;
		alert("现在转到xxx网址，会员"+memberId+"的订单。");		
	}
	
</script>
</head>
<body>
大米，58<br>
酱油，3.5<br>
合计：38.5
<button onclick="saveOrder()">保存订单</button>

</body>
</html>