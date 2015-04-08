<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bornsoft.asn.bean.member.Member" %> 
<%@ page import="com.bornsoft.asn.service.member.MemberService" %>    
<%@ page import="com.bornsoft.sso.util.Validate" %> 
<%@ page import="java.util.*" %>
<%@ page import="com.bornsoft.asn.utils.common.Str"%>
<%@ page import="com.bornsoft.asn.utils.common.AsnConstLib" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String cp=request.getContextPath();
 	String area=MemberService.getMember(session).getArea();
 	if(area==null) area="000000|无名";
 	area.substring(0,6);
	Member member = MemberService.getMember(session);
 	String certType=member.getCertType();
 	if(certType==null) certType="";
 	String cardId=member.getCertId();
 	if(cardId==null) cardId="";
 
 //Map propertyMap = (Map)request.getAttribute("propertyMap");
 //out.println(Validate.isCompany(propertyMap)+"|"+propertyMap.get("userType"));
 //out.println(Validate.hasPermission(request,"bn.online.cpfb"));
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改会员资料</title>
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<script type="text/javascript" src="<%=cp%>/js/geoloc/geoloc.js"></script>

<LINK href="<%=cp%>/js/yav/yav-style.css" type=text/css rel=stylesheet>
<SCRIPT src="<%=cp%>/js/yav/yav.js"></SCRIPT>
<SCRIPT src="<%=cp%>/js/yav/yav-config.js"></SCRIPT>
<style type="text/css">
a{font-weight:100;}
</style>
<script type="text/javascript">

	// 初始化地区组件
	geoloc.debugOn();
	$(document).ready(function(){
		geoloc.init("divArea", "- 不限省市 -", "- 不限地州市 -", "- 不限区县 -", "area","<%=area%>");
	});

	// 取地区选择结果，如果没有选择，结果为null；如果选择，数据形式为：310101|黄浦区
	function showSelection(){
		var sel=geoloc.getSelection("divArea");
		if(sel==null){
			alert("没有选择");
		} else {
			alert(sel);
		}
	}

	// 设置表单验证
	$(document).ready(function(){
		// 定义规则，规则表参见 http://yav.sourceforge.net/en/validationrules.html
		var rules=new Array(
			"member.area:地区|required",
			"member.zip:邮政编码|numeric",
			"member.zip|mask|member.zip_mask",	
			"member.fixedPhone:固定电话|numeric",
			"member.fixedPhone|mask|member.fixedPhone_mask",
			"member.mobilePhone:移动电话|numeric",
			"member.mobilePhone|mask|member.mobilePhone_mask",				
			"member.certType:证件类型|required",
			"member.certId:证件编号|required",
			"member.fullName:全称|required",
			"member.checkcode:验证码|required"
			
		);
		// 遮罩规则的详细定义
		yav.addMask('member.zip_mask', '      ', '1234567890');
		yav.addMask('member.fixedPhone_mask', '             ', '1234567890');
		yav.addMask('member.mobilePhone_mask', '             ', '1234567890');
		// 输入提示
		yav.addHelp("member.zip", "邮政编码固定为6位数字");
		yav.addHelp("member.fixedPhone", "固定电话应为数字，如02368680466");
		yav.addHelp("member.mobilePhone", "移动电话应为数字，如13883803467");
		// 输入时验证
		yav.init('form1', rules);
		// 提交前验证
		$("#form1").submit(function () {
			  return yav.performCheck("form1", rules, "inline");  // classic 或者 inline
		});
	});
function changeValidateCode(obj) {  
	  // 获取当前的时间作为参数，无具体意义  
	  var timenow = new Date().getTime();  
	  // 每次请求需要一个不同的参数，否则可能会返回同样的验证码  
	  //这和浏览器的缓存机制有关系，也可以把页面设置为不缓存，这样就不用这个参数了。  
	  obj.src="checkcode.action?d="+timenow;  
} 
	
</script>
<link rel="stylesheet" rev="stylesheet" href="../../css/comdo.css" type="text/css" />

</head>
<body>
		<%
		 	String notice=null;
		//out.print(member.getApproveState().toString());
		//out.print("]]]]]]]");
			
			if(member.getCertId() == null && member.getApproveState() == AsnConstLib.MemberApproveState.ManualVerify){
				notice="你的会员资料不全，需补充完整后并经过审核后才能以会员身份进行操作。";
			}else{
		 	switch(member.getApproveState()){
		 	//case None:
		 	//	notice="你的会员资料不全，需补充完整后并经过审核后才能以会员身份进行操作。";
		 	//	break;
		 	case ManualVerify:
		 		notice="你的会员资料正在等待审核，在审核结果出来之前你还可以修改。";
		 		break;
		 	case Completed:
		 		notice="你的会员资料已经审核通过。在修改一些重要信息后，需要重新审核。";
		 		break;
		 	case Rejected:
		 		notice="你的会员资料已经被驳回，必须重新修改提交。";
		 		break;
		 	}
			}
		%>
   		<table align="center" width="790" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
		<tr>
			<td width="55" align="center"><img src="../../image/comdo/pen.png"></td>
			<td width="737">
			<%
         	if(notice!=null){
          	out.print(notice);
         	}
         	%>
			</td>
		</tr>
		</table>
	
          <!--<p class="blue24"><strong>会员资料</strong></p>-->
          <form action="/asn/do/member/updateMember" method="post" enctype="multipart/form-data" name="form1" id="form1">
          <input type="hidden" name="member.memberId" id="memberId" value="<%=member.getMemberId() %>">
          
          <table align="center" width="790"cellpadding="0" cellspacing="0" >		
			<tr>			
				<td height="40" width="90" align="right">会员类型：</td>
            	<td>&nbsp;
            		<label><input type="radio" class="frmrd" name="member.memberType" value="1" id="memberType_0" disabled="disabled" <%=member.getMemberType()==1?"checked":"" %> /> 单位</label>
                    <label><input type="radio" class="frmrd" name="member.memberType" value="2" id="memberType_1" disabled="disabled" <%=member.getMemberType()==2?"checked":"" %>/> 个人</label>
            	</td>
		  </table>
          
          <table align="center" width="790" height="40" cellpadding="0" cellspacing="0" style="padding-top:10px;">
			<tr>
				<td width="5">&nbsp;</td>
				<td width="785" class="sm-title">证件信息</td>			
			</tr>
		  </table>
		  <table align="center" width="790"cellpadding="0" cellspacing="0" border="1" bordercolor="#CCCCCC" style="padding-top:10px; border-collapse:collapse;">			
			<tr>
				<td width="90" height="90">
					<table width="100%" cellspacing="0" cellpadding="0">
						<tr>
							<td height="45" align="right" width="90" style="border-bottom:1px #cccccc solid;"><font color="red">*</font>证件类型：</td>
						</tr>
						<tr>
							<td height="45" align="right"><font color="red">*</font>证件编号：</td>
						</tr>
					</table>				
				</td>
				<td width="600" height="90">
					<table width="100%" height="100%" cellspacing="0" cellpadding="0">       
						<tr>  
						<!-- <%if(cardId.length()>0 ){%>disabled="disabled" <% } %> 
						<%if(cardId.length()>0 ){%>readonly="readonly"<%}%> 
						-->
							<td height="45" width="600" style="border-bottom:1px #cccccc solid;">&nbsp;<select name="member.certType" id="certType" style="width:150px;">
			                        <option value="">--选择证件--</option>
			                        <%if(member.getMemberType() == 1){ %>
			                        <option value="1" <%if(certType.equals("1"))out.println("selected"); %>>营业执照</option>
			                        <option value="2" <%if(certType.equals("2"))out.println("selected"); %>>组织机构代码证</option>
			                        <option value="3" <%if(certType.equals("3"))out.println("selected"); %>>社团证</option>
			                        <% }else if(member.getMemberType() ==2){ %>
			                        <option value="4" <%if(certType.equals("4"))out.println("selected"); %>>个人身份证</option>
			                        <option value="5" <%if(certType.equals("5"))out.println("selected"); %>>护照</option>
			                        <option value="6" <%if(certType.equals("6"))out.println("selected"); %>>军官证</option>
			                        <% } %>
			                        </select>
			                        <span id="errorsDiv_member.certType"></span></td>
						</tr>
						<tr>
							<td height="45" >&nbsp;<input name="member.certId" type="text" id="certId" size="30" value="<%=cardId%>" /><span id="errorsDiv_member.certId"></span></td>
						</tr>
					</table>
				</td>
				<td align="center">
		            <a href="/asn/pic/member/member_<%=member.getMemberId() %>.jpg" target="_blank">
		            <img width="80" src="/asn/pic/member/sml_member_<%=member.getMemberId() %>.jpg" border="0" /></a>
		        </td>       	
			</tr>	
				
			<tr <%if(cardId.length()>0 ){%>	style="display:none" <%}%>>
				<td height="40" align="right">证件照片：</td>
	            <td colspan="2">&nbsp;<input type="file" name="certPhoto" size="40" id="certPhoto"/></td>          	
			</tr>
				
			<tr <%if(cardId.length()>0 ){%>	style="display:none" <%}%>>
				<td height="40" align="right">&nbsp;</td>
	            <td colspan="2">&nbsp;如果需要修改图片，直接上传新的图片</td>          	
			</tr>		
		  </table>
		  
		  
		  <table align="center" width="790" height="40" cellpadding="0" cellspacing="0" style="padding-top:10px;">
			<tr>
				<td width="5">&nbsp;</td>
				<td width="785" class="sm-title">基本信息</td>			
			</tr>
		  </table>
		
		
		  <table align="center" width="790"cellpadding="0" cellspacing="0" border="1" bordercolor="#CCCCCC" style="padding-top:10px; border-collapse:collapse;">			
			<tr>
				<td height="40" width="90" align="right"><font color="red">*</font>全　　称：</td>
	            <td>&nbsp;<input name="member.fullName" type="text" id="fullName" size="45" readonly="readonly" value="<%=Str.get(member.getFullName()) %>" /><span id="errorsDiv_member.fullName"></span>  </td>          	
			</tr>
			<%if(member.getMemberType() == 1){ %>
			<tr>
				<td height="40" align="right">简　　称：</td>
	            <td>&nbsp;<input name="member.shortName" type="text" id="shortName" maxlength="30"  value="<%=Str.get(member.getShortName()) %>" /></td>          	
			</tr>
			<% } %>
			<tr>
				<td height="40" align="right"><font color="red">*</font>所属地区：</td>
	            <td>&nbsp;<input type="hidden" name="member.area" id="area"><span id="divArea"></span><span id="errorsDiv_member.area"></span></td>          	
			</tr>	
			<tr>
				<td height="40" align="right">商务邮箱：</td>
	            <td>&nbsp;<input name="member.email" type="text" id="email" maxlength="30" size="45" value="<%=Str.get(member.getEmail()) %>" /></td>          	
			</tr>	
			<tr>
				<td height="40" align="right">固定电话：</td>
	            <td>&nbsp;<input name="member.fixedPhone" type="text" id="fixedPhone" maxlength="30" size="30"  value="<%=Str.get(member.getFixedPhone()) %>" /><span id="errorsDiv_member.fixedPhone"></span></td>          	
			</tr>
			<tr>
				<td height="40" align="right">移动电话：</td> 
	            <td>&nbsp;<input name="member.mobilePhone" type="text" id="mobilePhone" maxlength="30" size="30" value="<%=Str.get(member.getMobilePhone()) %>" /><span id="errorsDiv_member.mobilePhone"></span></td>          	
			</tr>
			<tr>
				<td height="40" align="right">邮政编码：</td>
	            <td>&nbsp;<input name="member.zip" type="text" id="zip" maxlength="6"  value="<%=Str.get(member.getZip()) %>" /><span id="errorsDiv_member.zip"></span></td>          	
			</tr>
			<tr>
				<td height="40" align="right">通信地址：</td>
	            <td>&nbsp;<input name="member.address" type="text" id="address" size="45" maxlength="100"  value="<%=Str.get(member.getAddress()) %>" /></td>          	
			</tr>
			
			<%if(member.getMemberType() == 1){ %>
			<tr>
				<td height="40" align="right">联 系 人：</td>
	            <td>&nbsp;<input name="member.contactor" type="text" id="contactor" maxlength="30"  value="<%=Str.get(member.getContactor()) %>" /></td>          	
			</tr>	
			<% } %>
			
			<tr>
				<td height="40" align="right">Q  Q：</td>
	            <td>&nbsp;<input name="member.qq" type="text" id="qq" size="20" maxlength="15"  value="<%=Str.get(member.getQq()) %>" />
	          	<font color="#999999">填写你的真实qq，以便可以同客户慢慢交流。</font>
	            </td>          	
			</tr>
			
			<tr>
				<td height="40" align="right"><font color="red">*</font>验 证 码：</td>
	            <td height="40">
					<table height="100%" cellpadding="0" cellspacing="0" height="40">
					<tr>
                  		<td height="40">&nbsp;<input name="member.checkcode" type="text" id="checkcode" maxlength="4" /></td>
                  		<td height="40">&nbsp;<img src="checkcode.action" style="cursor: pointer;" onclick="changeValidateCode(this)" />
                  		</td>
                  		<td height="40"><span id="errorsDiv_member.checkcode"></span><font color="red"><s:actionmessage/></font></td>
                  	</tr>
                  	</table>            
	            </td>          	
			</tr>	
		  </table>
          
      <table align="center" width="790"cellpadding="0" cellspacing="0" >		
		<tr>			
            <td height="50" align="center"><input type="submit" class="sm-submit8" value="填写ok了,我要修改"></td>          	
		</tr>		
	  </table>
          
          </form>
       <br>

</body>
</html>
