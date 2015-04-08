<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test-time-block-bcart</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
	function time_block(block_obj, block_toggle, callbackFunc, timems1,
			timems2, nowms) {
		var nowTime;
		var time1;
		var time2;
		var blockClass="block_time";
		var unblockClass="unblock_time";
		var interval_time=1000;
		time1 = new Date(timems1);
		time2 = new Date(timems2);
		nowTime = new Date(nowms);
		
		var interval_obj = window.setInterval(process_interval, interval_time);
		
		function process_interval() {
			/*
			$.get('<%=cp%>/front/activity/getSystemTime.action',null,function(ret){
				nowTime=new Date(parseInt(ret));
				
			});
			*/
			nowTime.setTime(nowTime.getTime()+interval_time);
			process();
		}
		
		function process(){
			if (nowTime < time1) {
				var $block_obj = $(block_obj);
				for (i in $block_obj) {
					if ($block_obj.eq(i).hasClass(unblockClass)) {
						$block_obj.eq(i).removeClass(unblockClass);
						$block_obj.eq(i).addClass(blockClass);
						$block_obj.eq(i).unbind('click');

						if (block_toggle)
							$block_obj.eq(i).html(block_toggle.block);
					}
				}
			} else if (nowTime >= time1 && nowTime <= time2 ) {
				var $block_obj = $(block_obj);
				for (i in $block_obj) {
					var data = eval("("+$block_obj.eq(i).attr('data')+")");
					if ($block_obj.eq(i).hasClass(blockClass) && data['wavecount'] > 0) {
						$block_obj.eq(i).removeClass(blockClass);
						$block_obj.eq(i).addClass(unblockClass);
						$block_obj.eq(i).click(function() {
							callbackFunc(this);
						});
						if (block_toggle)
							$block_obj.eq(i).html(block_toggle.unblock);
					}
				}
			} else {
				var $block_obj = $(block_obj);
				for (i in $block_obj) {
					if ($block_obj.eq(i).hasClass(unblockClass)) {
						$block_obj.eq(i).removeClass(unblockClass);
						$block_obj.eq(i).addClass(blockClass);
						$block_obj.eq(i).unbind('click');

						if (block_toggle)
							$block_obj.eq(i).html(block_toggle.block);
					}
				}

				window.clearInterval(interval_obj);
			}
		}
		
		var $block_obj = $(block_obj);
		for (i in $block_obj) {
			$block_obj.eq(i).removeClass(unblockClass);
			$block_obj.eq(i).addClass(blockClass);
			$block_obj.eq(i).unbind('click');

			if (block_toggle)
				$block_obj.eq(i).html(block_toggle.block);
		}
		
		process();
	}
	
	$(function(){
		var t1=new Date(2011,0,7,13,48);
		var t2=new Date(2011,0,7,18,38);
		var now=new Date();
		
		time_block($('.test'),{block:'<img src="<%=cp%>/image/alipay/alipay_bwrx.gif"/>',unblock:'<img src="<%=cp%>/image/alipay/alipay_1.gif"/>'
		}, function(obj) {
			alert('test_ok');
		}, t1.getTime(), t2.getTime(), <%=new java.util.Date().getTime()%>);
	});
</script>
</head>
<body>

<div><span class="test " data="{pdtId:11,wavecount:100}">测试测试。。</span></div>
<div><span class="test " data="{pdtId:11,wavecount:0}">测试测试。。</span></div>
<div><span class="test " data="{pdtId:11,wavecount:100}">测试测试。。</span></div>
<div><span class="test " data="{pdtId:11,wavecount:100}">测试测试。。</span></div>
<div><span class="test "  data="{pdtId:11,wavecount:0}">测试测试。。</span></div>
<div><span class="test "  data="{pdtId:11,wavecount:100}">测试测试。。</span></div>
<div><span class="test " data="{pdtId:11,wavecount:100}">测试测试。。</span></div>
<div><span class="test " data="{pdtId:11,wavecount:0}">测试测试。。</span></div>

</body>
</html>