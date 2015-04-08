<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.regex.Matcher" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="com.bornsoft.asn.bean.facade.ProductFacade" %>
<%@ page import="com.bornsoft.asn.dao.facade.FacadeDao" %>
<%
	String value="品牌-4bbb制茶工艺-7绿茶";
		Pattern p = Pattern.compile("(.*?)-(.*?)::([\\u0020-\\uFFFF]*)", 
				Pattern.CASE_INSENSITIVE | Pattern.DOTALL | Pattern.MULTILINE);
		List<ProductFacade> ret=new ArrayList<ProductFacade>();
		Matcher m=p.matcher(value);
		StringBuilder textResults=new StringBuilder();
		while(m.find()){
			out.print(" gc="+m.groupCount());
			out.print(" n="+m.group(1));
			out.print(" id="+m.group(2));
			out.print(" v="+m.group(3));
			ret.add(new ProductFacade(m.group(1), m.group(2), m.group(3))); 
		}
		
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>