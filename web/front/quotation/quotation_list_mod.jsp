<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>价格行情</title>
<link rel="stylesheet" href="../../css/websen.css" />
<link rel="stylesheet" href="../../css/news.css" />
<!--<script src="http://www.coop168.com/js/Page.js" type="text/javascript"></script>-->
<script type="text/javascript" src="../../js/jquery-1.4.2.min.js"></script>
</head>
<body>

<!--<script language=javascript src=js/js.js></script>-->
<!--<div id="top">
  <div id="top_nav">
  </div>
</div>-->
<!-- end top -->

<!--  begin head -->
<div id=head>
  <t:insertAttribute name="head"/>
</div>
<!-- end head -->
<div class="clr"></div>
<!-- begin search-->
  <div id="search" style="display: none">
   <div id="sea_left"></div>
   <div id="sous">
		<t:insertAttribute name="search"/>   
   </div>
  <div id="sea_right"></div>
  <script type="text/javascript">
	
  </script>
  </div>

<!-- end search -->
<!--<div id="news_nav">
</div>-->

<div id="main">
  <div id="news_list">
  <div id="position"> <t:insertAttribute name="position" /> </div>
    <div id="list_title">
		<t:insertAttribute name="list_title" />
	</div>
	<div id="list_content">
	  <div class="classifies">
      		<div class=content style='min-height:500px'>
				<t:insertAttribute name="content" />		  
	 		</div>
  	 <div class='page_tion' style='float:left; width:100%;'>
  	 	<t:insertAttribute name="page_tion" />
  	 </div>
	  </div>
	</div>
  </div>
  <!-- 边框 -->
  <div id="side_right">
  	<div id="rel_ad"><img src="../images/gg200.gif" />
	</div>
	<div class="rel_title"><h3>热点新闻</h3></div>
    <div class="rel_cont">
      <table border="0" cellpadding="0" cellspacing="0" width="100%"> 
 <tbody><tr>
 <td class="news_last Mark2" valign="top" height="220" align="left"><iframe 
            align=left marginHeight=0 
            src="http://www.aiecp.com/aiecp/76562293176926208/index.html" frameBorder=0 width=270
            scrolling=no height=220></iframe></td></tr>
 </tbody></table>
	</div>
	<div class="rel_title2"><t:insertAttribute name="rel_title2" /></div>
    <div class="rel_cont2"> 
    	<t:insertAttribute name="rel_cont2" />
    </div>
  </div>
</div>
<div class="clr"></div>
<!-- begin foot -->
<div id="foot">
	<t:insertAttribute name="foot" />
</div>
<!-- end foot -->
</body>
</html>