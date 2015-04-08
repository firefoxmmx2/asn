<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test-checkboxtest.jsp</title>
<script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
<link type="text/css" rel="stylesheet" href="../css/huzx.css"></link>
<script type="text/javascript">
var test = null;
	$(function(){
		$('input:button').click(submit_test);
		test = new  testCheckbox();
		test.valueList = eval($('input[name=valueList]').val());
		pagehandler();
	});
	function testCheckbox()
	{
		this.valueList = null;
		this.handler = function(caller){
			_self  = true;
			isContain = false;
			var i = 0;
			for(i in this.valueList)
			{
				if($(caller).val() == this.valueList[i])
				{
					isContain = true;
					break;
				}
			}
			
			if($(caller).attr('checked') == true)
			{
				if(!isContain)
					this.valueList.push($(caller).val());
			}
			else
			{
				if(isContain)
					this.valueList.splice(i,1);
			}
			$('input[name=valueList]').val(this.valueList);
		};
		
	}
	function submit_test()
	{
		$('#form').submit();
	}
	function pagehandler(data)
	{
		if(data != null)
		{
			$('#page').html($('#page',data).html());
		}
		
		$('input:checkbox').click(function(){ 
			_self = this;
			test.handler(_self); });
		
		$('a','#page').each(function(){
			var setPage = $(this).attr('onclick');
			$(this).unbind('click');
			$(this).unbind('onclick');
			$(this).click(function()
			{
				setPage();
				pager();
			});
		});
		
	}
	function pager(){
		var postAction = $('#form').attr('action');
		$.post(postAction, {
			'page' : $('#thePage').val()
		}, pagehandler);
	}
</script>
</head>
<body>
	<form id="form" action="testCheckBoxList" method="post">
		<s:textfield name="valueList"></s:textfield>
	<div id="page">
		<s:iterator status="s" value="customers"  begin="start - 1" end="end - 1">
			<input type="checkbox"  name="selectedCust" value='<s:property value="memberId"/>' /><s:property value="memberId"/> <br/>
		</s:iterator>
		<form action="testCheckBoxList" method="post">
			<s:property value="pageBar" escape="false"/>
		</form>
	</div>
	<input type="button" value="submit"/>
	</form>
	
</body>
</html>