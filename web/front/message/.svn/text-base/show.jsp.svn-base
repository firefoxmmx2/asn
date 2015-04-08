<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.bornsoft.asn.bean.common.MessagePage, com.bornsoft.asn.bean.common.HttpLink, java.util.List"
    pageEncoding="UTF-8"%>
<%
	String cp=request.getContextPath();
	MessagePage mp=(MessagePage)request.getAttribute("messagePage");
%>
<SCRIPT type=text/javascript src="<%=cp%>/js/jquery-1.4.2.min.js"></SCRIPT>
<SCRIPT type=text/javascript src="<%=cp%>/js/jquery-timer.js"></SCRIPT>
<style type="text/css">
	<!--普通信息-->
	.messageNormal{ color: black;}
	<!--警告信息-->
	.messageWarn{ color: yellow;}
	<!--错误信息-->
	.messageError{ color: red;}
</style>
<script type="text/javascript">
	function goUrl(linkNumber){
		var link=$("#link"+linkNumber);
		var url=link.attr("href");
		var target=link.attr("target");
		var win=null;
		if(target=="_top"){
			win=top;
			win.location=url;
		}else if(target=="_self"){
			win=window;
			win.location=url;
		} else {
			win=window[target];
			if(!win) win=window.open(url, target);
		}
		win.focus();
	}
	
	function autoGo(linkNumber, timeSeconds){
		var link=$("#link"+linkNumber);
		link.everyTime("1s", "link"+linkNumber, function(){
			var span=$("#sencondsCount");
			var seconds=parseInt(span.attr("seconds"));
			seconds--;
			if(seconds<=0){
				goUrl(linkNumber);
			}else{
				span.attr("seconds", seconds);
				span.html(seconds);
			}
		});
			
	}
</script>
<div style="height: 200px; overflow: visible">
	<div class="message<%=mp.getType()%>"><span class="message"><%=mp.getMessage()%></span></div>
	<ul style="margin-left: 30px;">
		<%
			List<HttpLink> links=mp.getLinks();
			for(int i=0; i<links.size(); i++) {
				HttpLink link=links.get(i);
		%>
		<li>
		<a id="link<%=i%>" href="<%=link.getHref()%>" target="<%=link.getTarget()%>"><%=link.getText()%></a>
		<%
			int ts=link.getTimeSeconds();
		if(ts>0){
			%>
		<script type="text/javascript">autoGo(<%=i%>, <%=ts%>)</script>
			（<span id="sencondsCount" seconds="<%=ts%>"><%=ts%></span>秒后自动执行...）
			<%
			}
			%>
			</li>
			<%
		}
		%>
	</ul>
</div>