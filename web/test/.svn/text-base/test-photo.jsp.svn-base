<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
// 检查是否替补图片
function isAltPhoto(src){
	var ret=false;
	var exp=new RegExp("//.*?(/.*)");
	var m = exp.exec(src);
	if (m != null){
		ret=document.cookie.indexOf("404-"+m[1]+"=1")>-1;;
	}
	return ret;
}
function test(img){
	alert(isAltPhoto(img.src));
}
</script>
</head>
<body>
<img onclick="test(this)" src="/asn/pic/product/s1271388363743.jpg">
<img onclick="test(this)" src="/asn/pic/product/b1268641973396.jpg">
<button onclick="test()">test</button>
</body>
</html>
