<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s"  uri="/struts-tags"%>

<%@page import="com.bornsoft.asn.bean.productType.ProductType, java.util.*"%><div class="col-main">
<style>
body{font:12px/1.5 Tahoma,Helvetica,Arial,'宋体',sans-serif;}
html,legend{color:#404040;background:#fff;}
body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,input,button,textarea,p,blockquote,th,td{margin:0;padding:0;}
table{border-collapse:collapse;border-spacing:0;}
fieldset,img{border:none;}
address,caption,cite,code,dfn,em,strong,th,var{font-style:normal;font-weight:normal;}
li{list-style:none;}
caption,th{text-align:left;}
h1,h2,h3,h4,h5,h6{font-size:100%;}
h1{font-size:18px;}
h2{font-size:16px;}
h3{font-size:14px;}
table{font-size:inherit;font:100%;}
pre,code,kbd,samp,tt{font-family:'Courier New',Courier,monospace;}
small{font-size:100%;}a{color:#36c;text-decoration:none;}
a:hover{color:#f60;text-decoration:underline;}
ins{text-decoration:none;}
del{text-decoration:line-through;}
hr{color:#D1D7DC;background-color:#D1D7DC;border:none;height:1px;}
html{overflow-y:scroll;}
.main-wrap{margin:0 240px 0 200px;}
.box .rc-tp,.box .rc-bt{position:relative;display:block;height:4px;}
.box .rc-tp span,.box .rc-bt span{float:right;width:4px;height:4px;}
.box .rc-tp{margin-bottom:-4px;background-position:-3px 0;}
.box .rc-bt{margin-top:-4px;background-position:-3px -3px;}
.box .rc-bt span{background-position:0 -3px;}
.box{position:relative;margin-bottom:10px;}
.box .hd{height:21px;border:1px solid #ccc;border-bottom:none;background-color:#fbfbfb;background-position:0 -7px;background-repeat:repeat-x;}/*标题头部背景边框色*/
.box .hd h3{font-size:12px;line-height:21px;color:#404040;padding-left:10px;}
.box .bd{padding:10px;border:1px solid #ccc;background-color:#f7f7f7;}/*body边框色*/
.box .ft .act{position:absolute;top:1px;right:1px;_right:240px;_top:12px;line-height:21px;padding-right:5px;}/*更多的位置颜色*/
.box .ft .act li{float:left;padding-left:10px;}
.box .ft .act li a{color:#404040;}/*更多的颜色*/
.box .hd{background-repeat:repeat-x;}
.box .rc-tp{background-position:-3px 0;}
.box .rc-tp span{background-position:0 0;}
.box .rc-bt{background-position:-3px -4px;}
.box .rc-bt span{background-position:0 -4px;}
.box .hd{height:28px;background-position:0 -8px;}
.box .hd h3{line-height:28px;padding-left:23px;background-position:7px -36px;}
.box .bd{background:#fff;}
.box .ft .act{line-height:28px;}
.box a{color:#666;}
.box a:hover{color:#f60;}
.cat-list-s2 .bd{padding:0 10px;overflow:hidden;zoom:1;}
.cat-list-s2 .category{float:left;overflow:hidden;zoom:1;border-bottom:1px dashed #D8D8D8;margin-top:10px;margin-bottom:-1px;padding-bottom:10px;padding-bottom:10px;width:50%; height:120px;}/*虚线样式*/
.category h5{ color:#006600;margin:0 0 7px 90px;font-size:14px;}/*一级分类文字样式*/
.category h5 a{color:#006600;}
.cat-list-s2 .category ul{margin:5px 0;overflow:hidden;zoom:1;}
.cat-list-s2 .category li{float:left;margin-left:-5px;white-space:nowrap;}
.cat-list-s2 .category li a{border-left:1px solid #ccc;display:block;float:left;margin:2px;padding:0 10px;_padding:0 7px;}
.cat-list-s2 .category .pic{float:left;margin-top:-20px;padding:0 5px 5px;}/*产品图片样式*/
.more{background:url(../image/more_bg.png) no-repeat 100% 4px;padding-right:12px;}
</style>
<div class="main-wrap">

<div class="box cat-list-s2 module"><span class="rc-tp"><span></span></span>

<div class="hd">
<h3><s:property value="#attr.ptf1.pttypeName"/> </h3>
</div>
<div class="bd">
<s:iterator value="#attr.ptsL1" status="s" id="pts">
<s:if test="#pts.ptparentid == #attr.ptf1.ptid">
<div class="category">
<h5><a
	href="<s:property value="#attr.url1"/>&type=<s:property value="#pts.ptcode"/>"
	target="_blank"><s:property value="#pts.pttypeName"/></a>
</h5>

<div class="pic"><a
	href="<s:property value="#attr.url1"/>&type=<s:property value="#pts.ptcode"/> "
	target="_blank"><img
	src="http://img04.taobaocdn.com/tps/i4/T1ZwNoXlxXXXXXXXXX-80-80.jpg"></a></div>

<ul>
	<s:iterator id="ptt" status="ss" value="#attr.pttL1">
	<s:if test="#ptt.ptparentid == #pts.ptid">
	<li><a
		href="<s:property value="#attr.url1"/>&type=<s:property value="#ptt.ptcode"/>"
		target="_blank"><s:property value="#ptt.pttypeName"/></a></li>
	</s:if>
	</s:iterator>
</ul>
</div>
</s:if>
</s:iterator>

<div class="ft">
<ul class="act">
	<li><a
		href=""
		class="more" target="_blank">更多</a></li>
</ul>
</div>

<span class="rc-bt"><span></span></span></div>

</div>
</div>
