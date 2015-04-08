<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
String.prototype.replace = function(pattern, replacement) {
	  return this.split(pattern).join(replacement);
	}
var text="<input type='text' name='{name}' id='{name}' />";
alert(text.replace("{name}", "lky"));
</script>

</body>
</html>