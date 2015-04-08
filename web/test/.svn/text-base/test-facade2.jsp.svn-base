<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.bornsoft.asn.service.facade.FacadeService, com.bornsoft.asn.bean.facade.ProductFacade,java.util.List"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp=request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jspath.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-timer.js"></script>
<script type="text/javascript" src="<%=cp%>/js/born-util.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<div>
<%
	// 假设来自于数据库字段
	String value=request.getParameter("productSupply.facade2");
value="品牌-16迪丝兰制作工艺-18印花洗涤方式-17水洗/机洗/干洗";
	// 解析立面数据
	List<ProductFacade> list=new FacadeService().parseFacade(value);
%>
<table width="100" border="0" cellspacing="0" cellpadding="2">
	<%for(ProductFacade facade : list){%>
    <tr>
      <td nowrap="nowrap" style="color: navy; font-weight: 600"><%=facade.getName()%></td>
      <td nowrap="nowrap"><%=facade.getValue()%></td>
    </tr>
    <%}%>
  </table>
  </div>
</body>
</html>
