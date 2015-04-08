<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>tooltip test</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.tools.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/productType/productTypeManage.js"></script>
</head>
<body>
<style>
#tooltip { 
    display:none; 
    font-size:12px;
    height:100px; 
    width:200px; 
    padding:25px; 

}
</style>
<br/>
<br/><br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<div id="tooltip">

</div>
<div id="content">
	<ul>
	<li>
		<a href="?type=0001">0001</a>
	</li>
	<li>
		<a href="?type=0002">0002</a>
	</li>
	</ul>
</div>
<script type="text/javascript">

	
	$("#content").find("a").each(function(i){
		var href = this.href;
		var para = null;
		if(href.split("?").length>1)
			para = href.split("?")[1];
		$(this).tooltip({
			onShow:function() {
				test(para);
			},
			position: "bottom right", 
			tip:"#tooltip"
		});
		});
	$("#dialog").showModel();
	function test(paras){
		var ret = $.ajax({
			type:'get',
			url:'${pageContext.request.contextPath}/do/productType/productTypeManage',
			data:paras,
			success:function(rt, ts){
				$("#tooltip").html(rt);
			}
		});
	}
	
</script>
</body>
</html>