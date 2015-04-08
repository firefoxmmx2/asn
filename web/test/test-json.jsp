<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.bornsoft.asn.utils.json.Json,java.util.List, java.util.ArrayList, com.bornsoft.asn.bean.member.Member"
    pageEncoding="UTF-8"%>
<%
	List<Member> list=new ArrayList<Member>();
	Member m=new Member();
	m.setMemberId(1L);
	m.setFullName("刘昆云");
	list.add(m);
	String strList=Json.getString(list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var list=<%=strList%>;
	alert(list[0].memberId);
	alert(list[0].fullName);
</script>
</head>
<body>

</body>
</html>