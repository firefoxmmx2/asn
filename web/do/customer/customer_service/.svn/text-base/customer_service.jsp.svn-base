<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

	<link type="text/css" rel="stylesheet" href="../../../css/huzx.css"></link>
	<LINK href="../../../js/yav/yav-style.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="../../../js/hxtool.js"></script>
	<SCRIPT src="../../../js/yav/yav.js"></SCRIPT>
	<SCRIPT src="../../../js/yav/yav-config.js"></SCRIPT>
	<SCRIPT src="../../../js/datetime2.js"></SCRIPT>
	<style type="text/css">
		.sl{
			width:120px;
			white-space:nowrap;
			text-overflow:ellipsis; 
			overflow: hidden;
		}
		.color_g{ color:#0f6ce5; text-align:center; font-size:12px;}
		.color_g2{ color:#0048a3;  text-align:center; font-size:12px;}
		.wz-18b{ color:#112482; font-size:18px; text-align:center; padding-left:15px;}
			

		table.list tr.head{
		  background-color:#e8f5fb;
		}
		table.list td.head{
		  background-color:#000000;
		}
		table.list tr.row td{
		  background-color:#ffffff;
		}
		table.list tr.altRow td{background-color: #f3f8fb;}
		libiaobg{background:#e8f5fb; border-top:1px solid #cee2ec; height:20px; border-right:1px solid #e7e7e7; color:#112482; text-align:center;}
		.textArea_content{
			width: 450px;
			height: 160px;
		}
		.hidden
		{
			display: none;
		}
	</style>
		
	<table align="center" width="790" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
		<tr>
			<td width="55" align="center"><img src="../../../image/comdo/pen.png"></td>
			<td width="737">
				<s:if test="formAction.contains('Add')">新增</s:if><s:else>更新</s:else> 客户服务排程
			</td>
		</tr>
	</table>
	
		<%-- 新增或者修改部分 --%>
		<form action='<s:property value="formAction"/>' method="post" id="crmserForm">
		<s:hidden name="planCustomerIds"></s:hidden>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 5px;">
		<tr>
			<td nowrap width="70px" align="right">服务ID：</td>
			<td width="30"><s:textfield name="crmServPlan.id" readonly="true"/><span id="errorsDiv_crmServPlan.id"></td>
		</tr>
		<tr>
			<td nowrap width="70px" align="right">服务名称：</td>
			<td width="30"><s:textfield name="crmServPlan.title" cssClass="update"/><span id="errorsDiv_crmServPlan.title"></span></td>
		</tr>
		<tr>
			<td nowrap width="70px" align="right">类型：</td>
			<td width="30"><s:select name="crmServPlan.type" list="#attr.type" listKey="key" listValue="value" cssClass="update"/></td>
		</tr>
		
		<tr>
			<td nowrap width="70px" align="right">发送类型：</td>
			<td width="30"><s:select name="crmServPlan.sendType" list="#attr.sendType" listKey="key" listValue="value" cssClass="update"/></td>
		</tr>
		<tr>
			<td nowrap width="70px" align="right">执行类型：</td>
			<td width="30"><s:select name="crmServPlan.excuteType" list="#attr.excuteType" listKey="key" listValue="value" cssClass="update"/></td>
		</tr>
		<tr  id="timing">
			<td nowrap width="70px" align="right">启动时间：</td>
			<td width="30"><s:textfield name="crmServPlan.timing" readonly="true" onclick="SelectDate(this,'yyyy-MM-dd hh:mm');"/></td>
		</tr>
		<tr>
			<td nowrap width="70px" align="right">状态：</td>
			<td width="30"><s:select name="crmServPlan.status" list="#attr.status" listKey="key" listValue="value" cssClass="update"/></td>
		</tr>
		<tr>
			<td nowrap width="70px" align="right">内容：</td>
			<td width="30"><s:textarea name="crmServPlan.content" cssClass="textArea_content"/><span id="errorsDiv_crmServPlan.content" cssClass="update"></td>
		</tr>
		
		</table>
		</form>
		<br />
		
	<s:if test="pageCustomers.size()>=1">
			<div id="customerList">
			<table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center" class="list" >
				<tr class="head">
					<td class="libiaobg" nowrap><label><input type="checkbox" id="selectPage"/>全选</label> </td>
					<td class="libiaobg" nowrap>客户ID</td>
					<td class="libiaobg" nowrap>名称</td>
					<td class="libiaobg" nowrap>联系电话</td>
					<td class="libiaobg" nowrap>电子邮箱</td>
				</tr>
				
				<%
				int looprow = 0;
				%>
				<s:iterator value="pageCustomers" status="s"> 
					<tr class='<%=(looprow%2==0)?"row":"altRow"%>' height="50">
						<td class="zuo"><label><input type="checkbox" value="<s:property value="memberId"/>" name="planCustomers"/></label> </td>
						<td class="zuo"><div id="spic"><s:property value="memberId"/> </div> </td>
						<td class="zuo"><s:property value="shortName"></s:property></td>
						<td class="zuo"><s:if test="mobilePhone != null"><s:property value="mobilePhone"/></s:if><s:else>暂无</s:else> </td>
						<td class="zuo"><s:if test="email"><s:property value="email"/></s:if><s:else>暂无</s:else> </td>
					</tr>
				<%
				looprow ++;
				%>
				</s:iterator>
			</table>
			<div align="right" style="height: 50px; width: 792px;" >
				<s:form action="morePage">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<s:property value="pageBar" escape="false"/>  
						</table>
				</s:form>
	   		</div>
		</div>
		
	</s:if>
	<s:else>
		<table>
		    <tr align="center">
			<td colspan="7" height="100" class="wz-18b" align="center"><img src="../../../image/hzx/tous1.gif" /><span>暂时没有相关客戶！</span></td>
			</tr>
		</table>
	</s:else>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 5px;">
		<tr>
			<td nowrap colspan="2" align="center">
				<input type="button" value="确定" id="enterBtn" class="update">
			</td>
			<td><input type="button" value="返回" onclick="javascript:history.back();"/></td>
		</tr>
	</table>

	<script type="text/javascript">
			var crmser = null;
			// yav 验证框架配置规则
			var rules = null;
			$(function(){
				//是否出現定時
				if($("select[name*=excuteType]").val() == 'N')
					$("#timing").addClass("hidden");
				else
					$("#timing").removeClass("hidden");
				//初始化類crmserplan
				crmser = new CrmServPlan();
				values = $('input:hidden[name=planCustomerIds]').val() == null || $('input:hidden[name=planCustomerIds]').val().length == 0 ? [] :eval($('input:hidden[name=planCustomerIds]').val());
				crmser.selectedMembers = values;
				crmser.pageHandler();
				//提交綁定
				$('#enterBtn').click(function()
				{
					$(crmser.selectedMembers!=null && crmser.selectedMembers.length > 0)
						$('input:hidden[name=planCustomerIds]').val(crmser.selectedMembers);
					
					$('#crmserForm').submit();	
				});
				//yav 驗證框架
				rules = ["crmServPlan.id:服务编号|numeric", 
				         "crmServPlan.title:服务标题|required",
				         "crmServPlan.content:服务内容|required"];
				$('#crmserForm').submit(function(){
					return yav.performCheck("crmserForm", rules, "inline");
				});
				yav.init('crmserForm', rules);
				//定时按钮监听
				$('select[name=crmServPlan.excuteType]').change(function(){
					//是否出現定時
					if($("select[name*=excuteType]").val() == 'N')
						$("#timing").addClass("hidden");
					else
						$("#timing").removeClass("hidden");
				});
				//修改模式，在已執行狀態下只讀
				if($('#crmserForm').attr('action').indexOf('Modify') != -1)
				{
					updateMode();
				}
				
			});
			function updateMode()
			{
				if($('select[name=crmServPlan.status]').val() == 'Y')
					$('.update').attr('disabled',true);
			}
			function CrmServPlan()
			{
				var _self = this;
				this.selectedMembers = [];
				this.selectedMembersHandler = function(caller)
				{
					self  = this;
					isContain = false;
					var i = 0;
					for(i in _self.selectedMembers)
					{
						if($(caller).val() == _self.selectedMembers[i])
						{
							isContain = true;
							break;
						}
					}
					
					if($(caller).attr('checked') == true)
					{
						if(!isContain)
							_self.selectedMembers.push($(caller).val());
					}
					else
					{
						if(isContain)
							_self.selectedMembers.splice(i,1);
					}
				};
				
				this.pageHandler = function(data)
				{
					if(data != null)
					{
						$('#customerList').html($('#customerList',data).html());
					}
					
					$('input:checkbox[name=planCustomers]').change(function(){ 
						_self.selectedMembersHandler(this); });
					
					$('a','#customerList').each(function(){
						var setPage = $(this).attr('onclick');
						$(this).unbind('click');
						$(this).unbind('onclick');
						$(this).click(function()
						{
							setPage();
							_self.morePage('./morePage');
						});
					});
					//初始化複選框
					$('input:checkbox').each(function(){
						self = this;
						for(i in _self.selectedMembers)
						{
							if($(self).val() == _self.selectedMembers[i] )
							{
								$(self).attr('checked',true);
								break;
							}	
						}
					});
					
					//當頁全選
					if($('#selectPage').length > 0)
						$('#selectPage').selectAll($('input[name=planCustomers]'),function(){
							$('input[name=planCustomers]').each(function(){
								_self.selectedMembersHandler(this);
							});
						});
				};
				
				this.morePage = function(submitPath)
				{
					var postAction = submitPath;
					$.post(postAction, {
						'page' : $('#thePage').val()
					}, _self.pageHandler);
				};
				
			}
			
		</script>