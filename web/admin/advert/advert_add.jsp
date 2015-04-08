<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<link type="text/css" href="<%=cp%>/css/jquilib/themes/base/jquery.ui.all.css" rel="stylesheet" />
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui-1.8rc3.custom.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<script type="text/javascript" src="<%=cp%>/js/geoloc/geoloc.js"></script>

<LINK href="<%=cp%>/js/yav/yav-style.css" type=text/css rel=stylesheet>
<SCRIPT src="<%=cp%>/js/yav/yav.js"></SCRIPT>
<SCRIPT src="<%=cp%>/js/yav/yav-config.js"></SCRIPT>
<SCRIPT src="<%=request.getContextPath()%>/js/datetime2.js"></SCRIPT>
<script type="text/javascript">
//设置表单验证
$(document).ready(function(){
	// 定义规则，规则表参见 http://yav.sourceforge.net/en/validationrules.html
	var rules=new Array(		
		"advert.advName:广告名称|required",	
		"advert.advType:广告类型|required",	
		"advert.advAddress:广告地址|required",	
		"advert.advSpec:广告规格|required",	
		"advert.quote:所需价格|required",	
		"advert.quote:移动电话|numeric",
		"advert.quote|mask|advert.quote_mask",
		"advert.startTime:开始时间|required",	
		"advert.endTime:结束时间|required"
		//"advert.startTime|mask|advert.startTime_mask",
		//"advert.endTime|mask|advert.endTime_mask"
		
	);
	// 遮罩规则的详细定义
	yav.addMask('advert.quote_mask', '          ', '1234567890');
	//yav.addMask('advert.startTime_mask', '    -  -  ', '1234567890');
	//yav.addMask('advert.endTime_mask', '    -  -  ', '1234567890');
	// 输入提示
	yav.addHelp("advert.quote", "请输入0-9之间的数字");
	//yav.addHelp("advert.startTime", "例如：2010年8月18日输入20100818");
	//yav.addHelp("advert.endTime", "例如：2010年8月18日输入201005818");
	// 输入时验证
	yav.init('form1', rules);
	// 提交前验证
	$("#form1").submit(function () {
		  return yav.performCheck("form1", rules, "inline");  // classic 或者 inline
	});
});


</script>



    <table align="center" width="790" cellpadding="0" cellspacing="0">
		<tr>
			<td height="39" class="title">新增广告位</td>			
		</tr>
		</table>
		
		<form action="<%=cp%>/admin/advert/insertAdvert" method="post" name="form1" id="form1" enctype="multipart/form-data">
          <table align="center" width="790"cellpadding="0" cellspacing="0" border="1" bordercolor="#CCCCCC" style="padding-top:10px; border-collapse:collapse;">			
			<tr>
				<td height="40" width="90" align="right"><font color="red">*</font>广告名称：</td>
	            <td>&nbsp;<input name="advert.advName" type="text" id="advName" size="50" /><span id="errorsDiv_advert.advName"></span></td>          	
			</tr>
			
			<tr>
				<td height="40" width="90" align="right"><font color="red">*</font>广告类型：</td>
	            <td>&nbsp;<input name="advert.advType" type="text" id="advType" size="20" /><span id="errorsDiv_advert.advType"></span></td>          	
			</tr>
			
			<tr>
				<td height="40" width="90" align="right"><font color="red">*</font>广告地址：</td>
	            <td>&nbsp;<input name="advert.advAddress" type="text" id="advAddress" size="50" /><span id="errorsDiv_advert.advAddress"></span></td>          	
			</tr>
			
			<tr>
				<td height="40" width="90" align="right"><font color="red">*</font>广告规格：</td>
	            <td>&nbsp;<input name="advert.advSpec" type="text" id="advSpec" size="20" /><span id="errorsDiv_advert.advSpec"></span></td>          	
			</tr>
			
			<tr>
				<td height="40" width="90" align="right"><font color="red">*</font>所需价格：</td>
	            <td>&nbsp;<input name="advert.quote" type="text" id="quote" size="12" maxlength="10" /><span id="errorsDiv_advert.quote"></span></td>          	
			</tr>
			
			<tr>
				<td height="40" width="90" align="right">效果图：</td>
	            <td>&nbsp;<input type="file" name="advertPic" size="50" id="advertPic"/></td>          	
			</tr>
			
			<tr>
				<td height="40" width="90" align="right"><font color="red">*</font>开始时间：</td>
	            <td>&nbsp;<input name="advert.startTime" type="text" id="startTime" size="20" readonly="readonly" onclick="SelectDate(this,'yyyy-MM-dd');" /><span id="errorsDiv_advert.startTime"></span></td>          	
			</tr>
			
			<tr>
				<td height="40" width="90" align="right"><font color="red">*</font>结束时间：</td>
	            <td>&nbsp;<input name="advert.endTime" type="text" id="endTime" size="20" readonly="readonly" onclick="SelectDate(this,'yyyy-MM-dd');" /><span id="errorsDiv_advert.endTime"></span></td>          	
			</tr>
			   
			<tr>
				<td height="40" width="90" align="right">描述：</td>
	            <td height="150">&nbsp;
	            	<textarea cols="60" rows="6" name="advert.description" id="description"></textarea>
	            </td>          	
			</tr>
                             
           </table>
           
           <table align="center" width="790"cellpadding="0" cellspacing="0" >		
			<tr>			
	            <td height="50" align="center"><input type="submit" class="sm-submit8" value="填写OK了，请提交">
	            <input type="button" value="返回" class="sm-submit2"  onclick="javascript:history.back();" />&nbsp;
		        <font color="red"><strong><%= request.getAttribute("advert_msg") == null?"":request.getAttribute("advert_msg") %></strong></font>
	            </td>          	
			</tr>		
			</table>
           
          </form>
    