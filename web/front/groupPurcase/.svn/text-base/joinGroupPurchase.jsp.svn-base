<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bornsoft.asn.utils.common.PropertyFactory" %>
<%@ page import="com.bornsoft.asn.bean.groupPurchase.GroupPurchaseDetail" %>
<%@ page import="com.bornsoft.asn.bean.groupPurchase.GroupPurchaseInfo" %>
<%@ page import="com.bornsoft.asn.bean.groupPurchase.GroupPurchaseMember" %>
<%@ page import="com.bornsoft.asn.bean.member.Member" %>
<%@ page import="com.bornsoft.asn.service.member.MemberService" %>
<%@ page import="com.bornsoft.asn.utils.common.AsnConstLib" %>
<%@ page import="com.bornsoft.asn.utils.common.Str"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>

<%@ taglib prefix="s" uri="/struts-tags" %>


<%

String cp=request.getContextPath();
int tid=Integer.parseInt(String.valueOf(request.getAttribute("id")));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加购买信息|重庆农产品网|重庆市农产品电子商务平台</title>
<link href="<%=cp%>/css/groupPurchase/base.css" rel="stylesheet" type="text/css">
<link href="<%=cp%>/css/groupPurchase/tg.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<LINK href="<%=cp%>/js/yav/yav-style.css" type=text/css rel=stylesheet>
<SCRIPT src="<%=cp%>/js/yav/yav.js"></SCRIPT>
<SCRIPT src="<%=cp%>/js/yav/yav-config.js"></SCRIPT>
<script type="text/javascript">

//设置表单验证
$(document).ready(function(){
	// 定义规则，规则表参见 http://yav.sourceforge.net/en/validationrules.html
	var rules=new Array(
		"groupPurchaseMember.name:用户名称|required",
		"groupPurchaseMember.mobile:手机号码|required",
		"groupPurchaseMember.mobile:手机号码|numeric",
		"groupPurchaseMember.mobile|mask|groupPurchaseMember.mobile_mask",
		"groupPurchaseMember.mobile:手机号码|minlength|11",
		"groupPurchaseMember.takeGoodsType:提货方式|required",
		"groupPurchaseMember.address:配送地址|required",
		"groupPurchaseMember.cardId:身份证号|required"			
	);

	yav.addMask('groupPurchaseMember.mobile_mask', '           ', '1234567890');
	yav.addHelp("groupPurchaseMember.mobile", "移动电话请输入11位数字，如13883803467");
	
	// 输入时验证
	yav.init('form1', rules);
	// 提交前验证
	$("#form1").submit(function () {	
		return yav.performCheck("form1", rules, "inline");  // classic 或者 inline
	});
});

function chooseDetail()
{
	alert("111");
	//document.getElementById("detailId").value=id;
	//alert(document.getElementById("detailId").value);
}

</script>
</head>
<body>
	<% 
		GroupPurchaseInfo groupPurchaseInfo = (GroupPurchaseInfo)request.getAttribute("groupPurchaseInfo"); 	
		Object loginMemberId = request.getSession().getAttribute("loginMemberId");
		Member member = null;      
		if(loginMemberId != null){
			member = MemberService.getMember(session);
		}		
		if(member == null) member = new Member();
	%>
	<form id="form1" name="form1" method="post" action="<%=cp%>/front/groupPurchase/addGroupPurchaseMember"> 
	<input type="hidden" name="groupPurchaseMember.tblGroupId" id="tblGroupId" value="<%=request.getAttribute("id")%>">
	<!--  
	<table width="100%" align="center" cellpadding="0" cellspacing="0" border="0" height="25" background="<%=cp%>/image/groupPurchase/tgimg01.gif">
		<tr>
		<td width="49%">&nbsp;</td>
		<td width="2%"><img src="<%=cp%>/image/groupPurchase/tgimg02.gif"></td>
		    <td class="font12" width="6%"><a href="#">会员登录</a></td>
			<td width="2%"><img src="<%=cp%>/image/groupPurchase/tgimg03.gif" width="20" height="20"></td>
		    <td class="font12" width="6%"><a href="#">新用户注册</a></td>
			<td width="2%"><img src="<%=cp%>/image/groupPurchase/tgimg04.gif" width="20" height="20"></td>
		    <td class="font12" width="10%"><a href="#">购物车有(0)件商品</a></td>
			<td width="2%"><img src="<%=cp%>/image/groupPurchase/tgimg05.gif" width="10" height="10"></td>
		    <td class="font12" width="3%"><a href="#">结算</a></td>
			<td width="2%"><img src="<%=cp%>/image/groupPurchase/tgimg06.gif" width="20" height="20"></td>
		    <td class="font12" width="6%"><a href="#">我的订单</a></td>
			<td width="10%">&nbsp;</td>
		</tr>
		</table>
		 -->
		<table width="990" align="center" cellpadding="0" cellspacing="0" border="0">
		<tr>
		<td><img src="<%=cp%>/image/groupPurchase/logo.jpg"></td>
		<td width="536"><img src="<%=cp%>/image/groupPurchase/banner01.jpg"></td>
		</tr>
		</table>
		<table width="990" align="center" cellpadding="0" cellspacing="0" border="0">
		<tr>
		<td width="10"><img src="<%=cp%>/image/groupPurchase/tgimg07.gif"></td>
		<td width="805" background="<%=cp%>/image/groupPurchase/tgimg08.gif"><table width="100%" align="center" cellpadding="0" cellspacing="0" border="0">
		<tr>
		          <td width="110" align="center" class="picbox"><a href="#">今日团购</a></td>
<td width="10"><img src="<%=cp%>/image/groupPurchase/tgimg10.gif"></td>
          <td width="110" align="center" class="picbox"><a href="<%=cp%>/plain/guide/groupPurchase-step.jsp" target="_blank">团购步骤</a></td>
<td width="10"><img src="<%=cp%>/image/groupPurchase/tgimg10.gif"></td>
          <td width="110" align="center" class="picbox"><a href="<%=cp%>/plain/guide/groupPurchase-guide.jsp" target="_blank">新手指引</a></td>
<td width="10"><img src="<%=cp%>/image/groupPurchase/tgimg10.gif"></td>
		<td width="445">&nbsp;</td>
		</tr>
		</table></td>
		<td width="175"><img src="<%=cp%>/image/groupPurchase/tgimg09.gif"></td>
		
		</tr>
		</table>
		<table width="50%" align="center" cellpadding="0" cellspacing="0" border="0" height="5">
		<tr>
		<td></td></tr>
		</table>
		<table width="990" align="center" cellpadding="0" cellspacing="0" border="0" class="mall_linebox1">
		<tr>
		    <td height="40" style="padding-left:10px;"><img src="<%=cp%>/image/groupPurchase/tg_mall01.gif" width="79" height="22"></td>
		  </tr>
		  <tr>
		  <td>
		  	<table width="96%" align="center" cellpadding="0" cellspacing="0" border="0" class="mall_linebox2">
		    <tr>
		          <td align="center" valign="middle" class="font14"><%=groupPurchaseInfo.getTitle() %></td>
		  	</tr>
		  	</table>
		  	<table width="96%" align="center" cellpadding="0" cellspacing="0" border="0" class="mall_linebox3" height="80">
		    <tr>
		    	<td align="left" valign="middle" class="f14" ><%=groupPurchaseInfo.getContent() %></td>
		  	</tr>
		  	</table>
		  <table width="50%" align="center" cellpadding="0" cellspacing="0" border="0" height="30">
		        <tr>
		<td></td>  </tr>
		  </table>
		  <table width="96%" align="center" cellpadding="0" cellspacing="0" border="0" class="mall_linebox2">
		        <tr>
		          <td align="center" valign="middle" class="font14">团友信息</td>
		  </tr>
		  </table>
		  <table width="96%" align="center" cellpadding="0" cellspacing="0" border="0" class="mall_linebox3">
		  <tr>
		  <td colspan="2" height="10"></td>
		  </tr>
		        <tr>
		          <td align="right" valign="middle" class="f14" width="20%" height="26">用户姓名：</td>
				  <td><input name="groupPurchaseMember.name" id="name" type="text" size="30" value="<%=Str.get(member.getFullName()) %>"><span id="errorsDiv_groupPurchaseMember.name"></span></td>
		  </tr>
		  <tr>
		          <td align="right" valign="middle" class="f14" width="20%" height="26">手机号码：</td>
				  <td><input name="groupPurchaseMember.mobile" id="mobile" type="text" size="20" value="<%=Str.get(member.getMobilePhone()) %>"><span id="errorsDiv_groupPurchaseMember.mobile"></span></td>
		  </tr>
		  
		   <tr>
		          <td align="right" valign="middle" class="f14" width="20%" height="26">身份证号：</td>
				  <td><input name="groupPurchaseMember.cardId" id="cardId" type="text" size="30" value="<%if(member.getCertType() != null &&member.getCertId().equals("4")){out.print(member.getCertId());} %>">
				  <span id="errorsDiv_groupPurchaseMember.cardId"></span></td>
		  </tr>
		 
		  <tr>
		          <td align="right" valign="middle" class="f14" width="20%" height="26">提货方式：</td>
				  <td>
				  		<select name="groupPurchaseMember.takeGoodsType" id="takeGoodsType">
				  			<option value="">--请选择--</option>
						  	<option value="1">自提</option>                
							<option value="2">送货上门</option>							
					    </select><span id="errorsDiv_groupPurchaseMember.takeGoodsType"></span>
				  </td>
		  </tr>		 
		   <tr>   
		          <td align="right" valign="middle" class="f14" width="20%" height="26">配送地址：</td>
				  <td><input name="groupPurchaseMember.address" id="address" type="text" size="50" value="<%=Str.get(member.getAddress()) %>"><span id="errorsDiv_groupPurchaseMember.address"></span></td>
		  </tr>
		  
		  <tr>   
		  		  <td align="right" valign="middle" class="f14" width="20%" height="26"> </td>
		          <td>
		          	<font color="green">（温馨提示：自提点：1、解放碑五一路新合作联佳超市旁。2、江北区建新北路74号 ）</font>
		          </td>
		  </tr>
		  <tr> 
		  <td colspan="2" height="10"></td>
		  </tr>
		  </table>
		  <table width="50%" align="center" cellpadding="0" cellspacing="0" border="0" height="30">
		        <tr>
		<td></td>  </tr>
		  </table>
		  <table width="96%" align="center" cellpadding="0" cellspacing="0" border="0" class="mall_linebox2">
		        <tr>
		          <td align="center" valign="middle" class="font14">产品信息</td>
		  </tr>
		  </table>
		      <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#666666" class="mall_linebox3">
		        <tr>
		  <td colspan="2" height="10"></td>
		  </tr>
		<tr>
		          <td> <table width="100%" border="1" bordercolor="#666666" style="border-collapse:collapse;" cellspacing="1">
		              <tr bgcolor="fff9e7"> 
		                <td align="center" height="26">规格</td>
		                <td align="center">包装（斤/箱）</td>
		                <!-- <td align="center">计价单位</td> -->
		                <td align="center">市场价（元/箱）</td>
		                <td align="center">团购价（元/箱）</td>
		                <td align="center">运费（元/箱）</td>
		                <td align="center">购买数量</td>
		                <td>&nbsp; </td>
		              </tr>
		              <% 
								
						List<GroupPurchaseDetail> list=(List<GroupPurchaseDetail>)request.getAttribute("groupPurchaseDetailList");
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							for(int i=0; i<list.size(); i++){
								GroupPurchaseDetail gpd=list.get(i);
					   %>
		              
		              <input type="hidden" id="sepcId" name="groupPurchaseMemDetail[<%=i%>].sepcId" value="<%=gpd.getId()%>" />
		              <tr bgcolor="fff9e7"> 		              
		                <td align="center" height="28"><%=gpd.getSpecs() %></td>
						<td align="center"><%=gpd.getWeight() %></td>
						<!-- <td align="center"><%=gpd.getUnit() %></td> -->  
						<td align="center"><%=gpd.getMarketPrice() %></td> 
						<td align="center"><%=gpd.getGroupPrice()%><input type="hidden" name="groupPurchaseMemDetail[<%=i%>].groupPurchasePrice" id="groupPurchasePrice" value="<%=gpd.getGroupPrice()%>"></td>
						<td align="center"><%=gpd.getFee() %><input type="hidden" name="groupPurchaseMemDetail[<%=i%>].fee" id="fee" value="<%=gpd.getFee()%>"></td>
						<td align="center"><input type="text" readonly name="groupPurchaseMemDetail[<%=i%>].buySum" id="buySum<%=gpd.getId()%>"  size="10" onblur="chk(this);"></td>
		                <td align="center"> 
		                  <input type="checkbox" name="groupPurchaseBox" id="groupPurchaseBox" value="<%=gpd.getId()%>" onclick="ckbx(this, <%=gpd.getId()%>);"></td>
		              </tr>
		              <%} %>       
		            </table></td>
		</tr>   <tr>
		  <td colspan="2" height="10"></td>         
		  </tr>
		  </table>
		  <table width="50%" align="center" cellpadding="0" cellspacing="0" border="0" height="30">
		        <tr>
		<td></td>  </tr>
		  </table>
		<script type="text/javascript">
		function ckbx(obj, id)
		{
			if(obj.checked)
			{
				document.getElementById("buySum"+id).value="1";
				document.getElementById("buySum"+id).readOnly=false;
				document.getElementById("buySum"+id).focus(); 
			}
			else
			{
				document.getElementById("buySum"+id).value="";
				document.getElementById("buySum"+id).readOnly=true;
			}
		}
		function chk(obj)
		{
			if(!obj.readOnly){
			var patrn=/^\s*[+-]?[0-9]+\s*$/;
			var tmpval = obj.value;
				if(tmpval==null || tmpval.trim().length<=0 || !patrn.test(tmpval))
				{
					obj.value="1";				
					obj.focus();
					return false;
				}
			}
		}
		</script>
		
		<!--
		  <table width="96%" align="center" cellpadding="0" cellspacing="0" border="0" class="mall_linebox2">
		        <tr>
		          <td align="center" valign="middle" class="font14r">总付金额：</td>
		  </tr>
		  </table>
		 -->
		 <!--
		     <table width="50%" align="center" cellpadding="0" cellspacing="0" border="0" height="30">
		     <tr>
						<td></td>
				</tr>
		  	</table>-->
		      <table width="50%" align="center" cellpadding="0" cellspacing="0" border="0" height="30">
		        <tr>
		          <td align="center">
		           <input type="image" src="<%=cp%>/image/groupPurchase/tg_mall03.gif"/>
		          </td>  
		        </tr>
		  </table>
		  <table width="50%" align="center" cellpadding="0" cellspacing="0" border="0" height="30">
		        <tr>
		<td></td>  </tr>
		  </table>
		  </td>
		  </tr>
		</table>
		<table width="50%" align="center" cellpadding="0" cellspacing="0" border="0" height="10">
		<tr>
		<td></td></tr>
		</table>
		<table width="980" border="0" cellspacing="0" cellpadding="0" align="center">
		  <tr>
		  	<td align="center" height="24"> <a href="http://www.cqapg.com" target="_blank">重庆农产品（集团）有限公司</a> 
		      | <a href="http://mall.cqapg.com" target="_blank">绿色农产品网上商城 </a>| <a href="http://xs.cqncp.com" target="_blank">秀山农产品网</a> 
		      | <a href="http://www.aiecp.com" target="_blank">望龙门—农业综合服务网络平台</a> | <a href="http://www.aweb.com.cn" target="_blank">农博网</a> 
		      | <a href="http://shop.cqcb.com" target="_blank">晨网商城 </a> | <a href="http://www.b2cf.cn" target="_blank">中国农民合作社信息网</a></td>
		  </tr>
		   <tr>
		    <td height="60" align="center" valign="top" style="line-height:24px;">@ 2010 版权所有 重庆市农产品(集团)有限公司<br >
		      地址：中国重庆市渝中区新华路216号 电话：+86 23 86312316 </td> 
		  </tr>
		</table>
	
	</form>
</body>
</html>



