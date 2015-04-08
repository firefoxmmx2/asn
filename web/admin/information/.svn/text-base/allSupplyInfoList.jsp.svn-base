<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path=request.getContextPath();
%>
<html>
	<head>
	<script type="text/javascript" src="<%=path%>/js/yav/yav.js"></script>
	<script type="text/javascript" src="<%=path%>/js/yav/yav-config.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery-ui-1.8rc3.custom.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/opendiv.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery-timer.js"></script>
	<link rel="stylesheet" rev="stylesheet" href="<%=path%>/css/comdo.css" type="text/css" />
		<style type="text/css">
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
		</style>
		
		<script type="text/javascript">
		function info(para)
		{
			document.location="<%=path%>/admin/info/toAllSupplyInfoList?censor="+para;
		}
		function checkAll(){
			var total=document.getElementById("total").value;
			var box=document.getElementById("allSelect");
			for(i=1;i<=total;i++){
				var idCheckBox = document.getElementById("checkBox"+i);
				if(box.checked){
		            if (!idCheckBox.checked) {              
		                idCheckBox.checked = true;
		            }
		        } else {
		            if (idCheckBox.checked) {               
		                idCheckBox.checked = false;
		            }
		        }
			}
		}

		function submitSelectBox(url,censor){
			var total=document.getElementById("total").value;
			var ids="";
			for(i=1;i<=total;i++){
				var idCheckBox = document.getElementById("checkBox"+i);
				if(idCheckBox.checked){
					ids+=idCheckBox.value+",";
				}
			}
			if(ids==""){
				alert("请选择要操作的商品");
				return;
			}
			var curCensor=document.getElementById("curCensor").value;
			
				window.location.href=url+ids+"&"+censor+"&censor="+curCensor;
		}

		function submitInfo(url,censor){
			var id=	document.getElementById("info").innerHTML;
			var curCensor=document.getElementById("curCensor").value;		
			window.location.href=url+id+"&"+censor+"&censor="+curCensor;
		}

		$(document).ready(function(){
			// 定义规则，规则表参见 http://yav.sourceforge.net/en/validationrules.html
			var rules=new Array(
				"sid:|mask|count_mask",
				"iid:|mask|count_mask"
			);
			// 遮罩规则的详细定义
			yav.addMask('count_mask', '      ', '1234567890');
			yav.init('form1', rules);
		});

		function doRedirect(url){
			window.location.href=url;
		}

		function openSelectDiv(id){
			document.getElementById("info").innerHTML=id;
			var ret=butil.getUrl("<%=path%>/admin/info/checkSupplyInfo?infoId="+id);
			var s=ret.split("}@");
			for(var i=0;i<s.length;i++){
					document.getElementById("pd"+i).innerHTML=s[i];			
			}
			openCarSelectDiv();
		}
		
		</script>
	</head>
	<body>
		<table align="center" width="790" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
			<tr>
				<td width="55" align="center"><img src="../../image/comdo/pen.png"></td>
				<td width="737">
				供应信息管理
				</td>
			</tr>
		</table>
		<s:form action="toAllSupplyInfoList" id="form1">
		<input id="curCensor" type="hidden" value="<s:property value="#request.censor"></s:property>" name="censor"/>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 5px;">
		<tr>
			<td nowrap width="75px" align="right">供应商ID号：</td>
			<td width="30"><input id="sid" type="text" name="supplierId" size="20" value="<s:property value="#request.supplierId"></s:property>"></td>
			<td nowrap width="80px" align="right">供应商名称：</td>
			<td width="30"><input type="text" name="supplierName" size="20" value="<s:property value="#request.supplierName"></s:property>"></td>
			<td align="left">&nbsp;</td>
		</tr>
		<tr>
			<td nowrap width="75px" align="right">信息ID号：</td>
			<td width="30"><input id="iid" type="text" name="searchId" size="20" value="<s:property value="#request.searchId"></s:property>"></td>
			<td nowrap width="80px" align="right">信息标题：</td>
			<td width="30"><input type="text" name="searchTitle" size="20" value="<s:property value="#request.searchTitle"></s:property>"></td>
			<td align="left"><input type="submit" value=" 查 询 "></td>
		</tr>
		</table>
		</s:form>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
                  <tr>
                      <td  height="33" width="20" background="../../image/hzx/change_bg.gif"></td>
                      <s:if test='#request.censor=="3"'>
                      	 <td width="103"  align="center" valign="middle" background="../../image/hzx/nav2.gif" class="color_g"><a style="color: #36C;" href="#" onclick="javascript:info(3);">限时审查</a></td>
                      </s:if>
					  <s:else>
					  	 <td width="103"  align="center" valign="middle" background="../../image/hzx/nav1.gif" class="color_g"><a href="#" onclick="javascript:info(3);">限时审查</a></td>		
					  </s:else>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>
                      
                      <s:if test='#request.censor=="11"'>
                      	<td width="103" align="center" valign="middle" background="../../image/hzx/nav2.gif" class="color_g2"><a style="color: #36C;" href="#" onclick="javascript:info(11);">待查(敏感词)</a></td>
                      </s:if>
                      <s:else>
                      	<td width="103" align="center" valign="middle" background="../../image/hzx/nav1.gif" class="color_g2"><a href="#" onclick="javascript:info(11);">待查(敏感词)</a></td>
                      </s:else>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>
					  
					  <s:if test='#request.censor=="19"'>
					  	<td width="103" align="center" valign="middle" background="../../image/hzx/nav2.gif" class="color_g2"><a style="color: #36C;" href="#" onclick="javascript:info(19);">待查(其他问题)</a></td>
					  </s:if>
					  <s:else>
					  	<td width="103" align="center" valign="middle" background="../../image/hzx/nav1.gif" class="color_g2"><a href="#" onclick="javascript:info(19);">待查(其他问题)</a></td>
					  </s:else>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>
					  
					  <s:if test='#request.censor=="21"'>
					  	<td width="103" align="center" valign="middle" background="../../image/hzx/nav2.gif" class="color_g2"><a style="color: #36C;" href="#" onclick="javascript:info(21);">屏蔽(敏感词)</a></td>
					  </s:if>
					  <s:else>
					  	<td width="103" align="center" valign="middle" background="../../image/hzx/nav1.gif" class="color_g2"><a href="#" onclick="javascript:info(21);">屏蔽(敏感词)</a></td>
					  </s:else>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>
					  
					  <s:if test='#request.censor=="29"'>
					  	<td width="103" align="center" valign="middle" background="../../image/hzx/nav2.gif" class="color_g2"><a style="color: #36C;" href="#" onclick="javascript:info(29);">屏蔽(其他问题)</a></td>
					  </s:if>
					  <s:else>
					  	<td width="103" align="center" valign="middle" background="../../image/hzx/nav1.gif" class="color_g2"><a href="#" onclick="javascript:info(29);">屏蔽(其他问题)</a></td>
					  </s:else>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>
                      
                      <s:if test='#request.censor=="2"'>
                      	<td width="103" align="center" valign="middle" background="../../image/hzx/nav2.gif" class="color_g2"><a style="color: #36C;" href="#" onclick="javascript:info(2);">审查通过(人工)</a></td>
                      </s:if>
                      <s:else>
                      	<td width="103" align="center" valign="middle" background="../../image/hzx/nav1.gif" class="color_g2"><a href="#" onclick="javascript:info(2);">审查通过(人工)</a></td>
                      </s:else>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>
					  
					  <s:if test='#request.censor=="1"'>
					  	<td width="103" align="center" valign="middle" background="../../image/hzx/nav2.gif" class="color_g2"><a style="color: #36C;" href="#" onclick="javascript:info(1);">审查通过(默认)</a></td>
					  </s:if>
					  <s:else>
					  	<td width="103" align="center" valign="middle" background="../../image/hzx/nav1.gif" class="color_g2"><a href="#" onclick="javascript:info(1);">审查通过(默认)</a></td>
					  </s:else>
					  <td width="15" background="../../image/hzx/change_bg.gif"></td>
                  </tr>
                  <s:if test="listS.size()<1">
                  <tr>
				    <td colspan="7" height="100" class="wz-18b"><img src="../../image/hzx/tous1.gif" /><span>没有信息</span></td>
				  </tr>
                  </s:if>
		</table>
		<div><input id="total" type="text" value='<s:property value="listS.size()"/>' style="display: none;"></input></div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center" class="list" >
				<tr class="head">
					<td class="libiaobg" nowrap width="25">&nbsp;</td> 
					<td class="libiaobg" nowrap width="60">信息ID号</td>
					<td class="libiaobg" nowrap width="150">信息标题</td>
					<td class="libiaobg" nowrap width="370">详细说明</td>
					<td class="libiaobg" nowrap width="24">操作</td>
				</tr>
				<%
				int looprow = 0;
				%>
				<s:iterator id="item" value="listS" status="list"> 
					<tr class='<%=(looprow%2==0)?"row":"altRow"%>'>
						<td width="4" class="zuo"><input type="checkbox" class="frmrd" id="checkBox<s:property value="#list.count"/>" value="<s:property value="#item.infoId"/>"></input></td>
						<td class="zuo"><a href="#" onclick="openSelectDiv('<s:property value="#item.infoId"></s:property>')"><s:property value="#item.infoId"></s:property></a></td>
						<td class="zuo"><a href="#" onclick="openSelectDiv('<s:property value="#item.infoId"></s:property>')"><s:property value="#item.title"></s:property></a></td>
						<td class="zuo"><s:property value="#item.detail"></s:property></td>
						<td class="zuo"><input type="button" value="预览" class="button2" onclick="window.open('${pageContext.request.contextPath}/front/info/showSupplyInfo?infoId=<s:property value="#item.infoId"/>&type=<s:property value="#item.type"/>')"></input></td>
					</tr>
				<%
				looprow ++;
				%>
				</s:iterator>
				<tr>
					<td colspan="6">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="6">
					<input type="checkbox" id="allSelect" class="frmrd" value="selectAll" onclick="checkAll()">全选</input>
					&nbsp;&nbsp;
					<s:if test='#request.censor=="3"||#request.censor=="1"||#request.censor=="11" '>
						<input type="button" value="审查通过" class="button5" onclick="submitSelectBox('setSupplyInfoCensor?infoIds=','doCensor=2')"></input>
						<input type="button" value="屏蔽（敏感词）" class="button5" onclick="submitSelectBox('setSupplyInfoCensor?infoIds=','doCensor=21')"></input>
						<input type="button" value="屏蔽（其他问题）" class="button5" onclick="submitSelectBox('setSupplyInfoCensor?infoIds=','doCensor=29')"></input>
						<input type="button" value="待查（其他问题）" class="button5" onclick="submitSelectBox('setSupplyInfoCensor?infoIds=','doCensor=19')"></input>
					</s:if>
					<s:elseif test='#request.censor=="19"'>
						<input type="button" value="审查通过" class="button5" onclick="submitSelectBox('setSupplyInfoCensor?infoIds=','doCensor=2')"></input>
						<input type="button" value="屏蔽（敏感词）" class="button5" onclick="submitSelectBox('setSupplyInfoCensor?infoIds=','doCensor=21')"></input>
						<input type="button" value="屏蔽（其他问题）" class="button5" onclick="submitSelectBox('setSupplyInfoCensor?infoIds=','doCensor=29')"></input>
					</s:elseif>
					<s:elseif test='#request.censor=="21"'>
						<input type="button" value="审查通过" class="button5" onclick="submitSelectBox('setSupplyInfoCensor?infoIds=','doCensor=2')"></input>
						<input type="button" value="屏蔽（其他问题）" class="button5" onclick="submitSelectBox('setSupplyInfoCensor?infoIds=','doCensor=29')"></input>
						<input type="button" value="待查（其他问题）" class="button5" onclick="submitSelectBox('setSupplyInfoCensor?infoIds=','doCensor=19')"></input>
					</s:elseif>
					<s:elseif test='#request.censor=="29"'>
						<input type="button" value="审查通过" class="button5" onclick="submitSelectBox('setSupplyInfoCensor?infoIds=','doCensor=2')"></input>
						<input type="button" value="屏蔽（敏感词）" class="button5" onclick="submitSelectBox('setSupplyInfoCensor?infoIds=','doCensor=21')"></input>
						<input type="button" value="待查（其他问题）" class="button5" onclick="submitSelectBox('setSupplyInfoCensor?infoIds=','doCensor=19')"></input>
					</s:elseif>
					<s:elseif test='#request.censor=="2"'>
						<input type="button" value="屏蔽（敏感词）" class="button5" onclick="submitSelectBox('setSupplyInfoCensor?infoIds=','doCensor=21')"></input>
						<input type="button" value="屏蔽（其他问题）" class="button5" onclick="submitSelectBox('setSupplyInfoCensor?infoIds=','doCensor=29')"></input>
						<input type="button" value="待查（其他问题）" class="button5" onclick="submitSelectBox('setSupplyInfoCensor?infoIds=','doCensor=19')"></input>
					</s:elseif>
					</td>
				</tr>
		</table>
		<div align="right" style="height: 50px; width: 792px; margin-top: 5px;" >
			<s:form action="toAllSupplyInfoList">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<s:property value="#request.pageBar" escape="false"/>  
					</table>
			<input type="hidden" value="<s:property value="#request.censor"></s:property>" name="censor"/>
			<input type="hidden" value="<s:property value="#request.searchName"></s:property>" name="searchName"/>
			<input type="hidden" value="<s:property value="#request.searchId"></s:property>" name="searchId"/>
			<input type="hidden" value="<s:property value="#request.supplierId"></s:property>" name="supplierId"/>	
			<input type="hidden" value="<s:property value="#request.supplierName"></s:property>" name="supplierName"/>
			</s:form>&nbsp;&nbsp;
   		</div>
   		<br>
   		
   		 <!-- *************************************
			弹出层
		 *************************************  -->	
   		<div id="bgdiv" class="bgdiv"></div>
		<div id="toopendiv" style="display:none;position:absolute;overflow:hidden;z-index:6553; ">		
		
		<table width="553" height="32" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
		    <td background="<%=path%>/image/comdo/tit_bg.gif"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
		      <tr>		        
		        <td height="32"width="90%" style="text-align:center; font-size:14px; font-weight:bold; color:#ffffff;"><div class="move">供应信息审核</div></td>
		        <td align="center" width="10%"><img src="<%=path%>/image/comdo/point_x.gif" width="11" height="12" onclick="closeCarSelectDiv();" style="cursor:pointer;" alt="关闭" title="关闭" /></td>
		      </tr>
		    </table></td>                
		  </tr>         
		</table>
		<table width="553" border="0" align="center" background="#ffffff" cellpadding="0" cellspacing="0" height="260" style="border:2px solid #28aedd; border-top:none;background:white;">
		  <tr>
		    <td width="553" valign="top">        
		    <table width="90%" height="40" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
		    <td height="40" width="16%" style="font-size:12px; color:#0075c4; font-weight:bold; text-align:left;">信息标题：</td>
		    <td  style="color:#cc3300; font-size:12px; text-align:left;" id="pd0"></td>
		  </tr>
		</table>
		    <table width="90%" height="40" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
		    <td height="40" width="16%" style="font-size:12px; color:#0075c4; font-weight:bold; text-align:left;">关键词：</td>
		    <td  style="color:#cc3300; font-size:12px; text-align:left;" id="pd1"></td>
		  </tr>
		</table>
		<table width="90%" height="40" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
		    <td height="60" width="16%" style="font-size:12px; color:#0075c4; font-weight:bold; text-align:left;">信息详情：</td>
		    <td  style="color:#333333; font-size:12px; text-align:left; width:420px;height:100px;overflow-y:scroll;float:left;border:1px solid red;" id="pd2"></td>
		  </tr>
		</table>

		<table>
  				<tr>
					<td colspan="3">
					<s:if test='#request.censor=="3"||#request.censor=="1"||#request.censor=="11" '>
						<input type="button" value="审查通过" class="sm-submit4" onclick="submitInfo('setSupplyInfoCensor?infoIds=','doCensor=2')"></input>
						<input type="button" value="屏蔽（敏感词）" class="sm-submit7" onclick="submitInfo('setSupplyInfoCensor?infoIds=','doCensor=21')"></input>
						<input type="button" value="屏蔽（其他问题）" class="sm-submit8" onclick="submitInfo('setSupplyInfoCensor?infoIds=','doCensor=29')"></input>
						<input type="button" value="待查（其他问题）" class="sm-submit8" onclick="submitInfo('setSupplyInfoCensor?infoIds=','doCensor=19')"></input>
					</s:if>
					<s:elseif test='#request.censor=="19"'>
						<input type="button" value="审查通过" class="sm-submit4" onclick="submitInfo('setSupplyInfoCensor?infoIds=','doCensor=2')"></input>
						<input type="button" value="屏蔽（敏感词）" class="sm-submit7" onclick="submitInfo('setSupplyInfoCensor?infoIds=','doCensor=21')"></input>
						<input type="button" value="屏蔽（其他问题）" class="sm-submit8" onclick="submitInfo('setSupplyInfoCensor?infoIds=','doCensor=29')"></input>
					</s:elseif>
					<s:elseif test='#request.censor=="21"'>
						<input type="button" value="审查通过" class="sm-submit4" onclick="submitInfo('setSupplyInfoCensor?infoIds=','doCensor=2')"></input>
						<input type="button" value="屏蔽（其他问题）" class="sm-submit8" onclick="submitInfo('setSupplyInfoCensor?infoIds=','doCensor=29')"></input>
						<input type="button" value="待查（其他问题）" class="sm-submit8" onclick="submitInfo('setSupplyInfoCensor?infoIds=','doCensor=19')"></input>
					</s:elseif>
					<s:elseif test='#request.censor=="29"'>
						<input type="button" value="审查通过" class="sm-submit4" onclick="submitInfo('setSupplyInfoCensor?infoIds=','doCensor=2')"></input>
						<input type="button" value="屏蔽（敏感词）" class="sm-submit7" onclick="submitInfo('setSupplyInfoCensor?infoIds=','doCensor=21')"></input>
						<input type="button" value="待查（其他问题）" class="sm-submit8" onclick="submitInfo('setSupplyInfoCensor?infoIds=','doCensor=19')"></input>
					</s:elseif>
					<s:elseif test='#request.censor=="2"'>
						<input type="button" value="屏蔽（敏感词）" class="sm-submit7" onclick="submitInfo('setSupplyInfoCensor?infoIds=','doCensor=21')"></input>
						<input type="button" value="屏蔽（其他问题）" class="sm-submit8" onclick="submitInfo('setSupplyInfoCensor?infoIds=','doCensor=29')"></input>
						<input type="button" value="待查（其他问题）" class="sm-submit8" onclick="submitInfo('setSupplyInfoCensor?infoIds=','doCensor=19')"></input>
					</s:elseif>
					</td>
				</tr>
		</table>
			</td>
		  </tr>
		  
		</table>	
			<div id="info" style="display: none;"></div>  
		</div>
	</body>
</html>