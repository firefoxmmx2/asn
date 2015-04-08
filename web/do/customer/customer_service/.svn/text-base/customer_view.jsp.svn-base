<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript"
	src="../../../js/jquery-ui-1.8rc3.custom.min.js"></script>
<link type="text/css" rel="stylesheet"
	href="../../../js/jquilib/themes/base/jquery.ui.all.css" />
<script type="text/javascript">
	$(function()
	{
		$('.accordion').accordion({
		icons : {
		header : "ui-icon-circle-arrow-e",
		headerSelected : "ui-icon-circle-arrow-s"
		},
		autoHeight : false,
		navigation : true
		});
	});
</script>
<style>
.hidden {
	display: none;
}

#view_title {
	width: 98%;
}

#view_title span {
	font-size: 22px;
	color: blue;
}

#view_body {
	width: 98%;
}

.distr_view {
	min-height: 300px;
	margin: 1px;
}

.finance_view {
	width: 49%;
	min-height: 300px;
	margin: 2px;
}

.fl {
	float: left;
}

.fr {
	float: right;
}

.cb {
	clear: both;
}
</style>
</head>
<body>
<div id="view_title"><span>客户视图</span>
<hr />
</div>
<div id="view_body" class="accordion">
<h3><a href="#">客户分布视图</a></h3>
<div style="display: block;"><!--<div class="distr_view fl">&nbsp;
<dl>
	<dt>过滤省级:</dt>
	<dd>测试测试<img src="<s:property value="distProvImage"/>" alt="分布省级"/></dd>
</dl>
</div>-->
<div class="distr_view"><s:if
	test="distCtryImage == null && distCityImage == null">
	暂时没有客户信息
</s:if> <s:else>
	<ul>
		<li><s:if test="distCtryImage != null">
			<img src="<s:property value="distCtryImage"/>" alt="分布县级" />
		</s:if></li>
		<li><s:if test="distCityImage != null">
			<img src="<s:property value="distCtryImage"/>" alt="分布城级" />
		</s:if></li>
	</ul>
</s:else></div>
<i class="cb"></i></div>
<h3><a href="#">客户财务视图</a></h3>
<div>&nbsp;</div>
<h3><a href="#">客户销售视图</a></h3>
<div>&nbsp;</div>
<h3><a href="#">客户活跃度视图</a></h3>
<div>&nbsp;</div>
</div>