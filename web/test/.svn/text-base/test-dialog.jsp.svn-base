<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-ui-1.8rc3.custom.min.js"></script>
<link href="${pageContext.request.contextPath}/css/jquilib/themes/base/jquery.ui.all.css"  rel="stylesheet" type="text/css"/>

</head>
<body>
	 <div class="ui-widget ui-widget-content ui-corner-all" style="width: 700px; padding: 5px;">
        <h3>
            Demo. 共享同一个静态弹出层, 弹出层内容固定:
        </h3>
        <div>
            <span id="spanShowTip1">显示提示</span>&nbsp;&nbsp; <span id="spanShowTip2">显示提示</span>&nbsp;&nbsp;
            <span id="spanShowTip3">显示提示</span>&nbsp;&nbsp; <span id="spanShowTip4">显示提示</span>&nbsp;&nbsp;
        </div>
    </div>
    <br />
    <br />
    <div class="ui-widget ui-widget-content ui-corner-all" style="width: 700px; padding: 5px;">
        <h3>
            Demo. 每个弹出层内容不同, 弹出层内容存储在事件源的元素属性中:
        </h3>
        <div>
            <span id="spanShowDataTip1" data="颜色是红色">红色</span>&nbsp;&nbsp; <span id="spanShowDataTip2"
                data="颜色是绿色">绿色</span>&nbsp;&nbsp;
        </div>
    </div>
    <br />
    <br />
    <div class="ui-widget ui-widget-content ui-corner-all" style="width: 700px; padding: 5px;">
        <h3>
            Demo. 弹出IFrame
        </h3>
        <div>
            <input type="button" id="btnShowIframe" name="btnShowIframe" value="显示弹出层" />
        </div>
    </div>
    <div id="divTip" title="自定义标题">
        <p>
            弹出层</p>
    </div>
    <div id="divIframe" title="iFrame弹出层" style="text-align: center;">
        <iframe src="http://www.elong.com" width="450px" height="230px"></iframe>
    </div>
<script type="text/javascript">
        /*==========用户自定义方法==========*/


        /*==========事件绑定==========*/
        $(function()
        {
            //静态提示类弹出层
            $("span[id^=spanShowTip]").css("cursor", "pointer").click(function(event)
            {
                $("*").stop();
                event.stopPropagation();
                var top = $(event.target).offset().top + 20;
                var left = $(event.target).offset().left;
                $("#divTip").dialog("option", "position", [left, top]);
                $("#divTip").dialog("open");
            });
            //动态提出类弹出层
            $("span[id^=spanShowDataTip]").css("cursor", "pointer").click(function(event)
            {
                //$("*").stop();
                $("#divTip").dialog("close");
                event.stopPropagation();
                var top = $(event.target).offset().top + 20;
                var left = $(event.target).offset().left;
                $("#divTip").dialog("option", "position", [left, top]);
                $("#divTip").dialog({open:function(){$.ajax({
                	type:'get',
            		url:'${pageContext.request.contextPath}/do/productType/productTypeManage',
            		success:function(rt,ts){
						$("#divTip").html(rt);
                    }
                })}});
                $("#divTip").dialog("open");
            });
            //遮罩类弹出层
            $("#btnShowIframe").click(function(event)
            {
                event.preventDefault();
                event.stopPropagation();
                $("#divIframe").dialog("open");
            });

            //单击自身取消冒泡
            $("#divTip, #divIframe").bind("click", function(event)
            {
                event.stopPropagation();
            });

            //document对象单击隐藏所有弹出层
            $(document).bind("click", function(event)
            {
                $("#divTip").dialog("close");
                $("#divIframe").dialog("close");
            });
        });

        /*==========加载时执行的语句==========*/
        $(function()
        {
       
            //初始化提示类弹出层
            $("#divTip").dialog({
                show: null,
                bgiframe: false,
                autoOpen: false
            });

            //初始化遮罩类弹出层
            $("#divIframe").dialog({
                show: null,
                bgiframe: false,
                autoOpen: false,
                width: 500,
                height: 300,
                draggable: true,               
                resizable: false,
                modal: true
            });           
        });
    </script>
</body>
</html>