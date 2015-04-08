<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.bornsoft.asn.bean.member.*" %>
<%@ page import="com.bornsoft.asn.utils.common.AsnConstLib" %>
<%@ page import="com.bornsoft.asn.utils.common.Str"%>
<% String cp=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>会员详细信息</title>
</head>
<body>

		<%
		Member member = (Member)request.getAttribute("member");
		%>
          
          <table align="center" width="790" height="24" cellpadding="0" cellspacing="0" style="background:url(<%=cp %>/image/comdo/dht_bg.gif) no-repeat;">
			<tr>
				<td width="5">&nbsp;</td>
				<td width="735"><strong>会员状态信息</strong></td>	
				<td width="50">[<a href="javascript:history.go(-1);">返 回</a>]</td>	
			</tr>
		  </table>
		  <table align="center" width="790"cellpadding="0" cellspacing="0" border="1" bordercolor="#CCCCCC" style="margin:10px 0; border-collapse:collapse;">			
			<tr>
				<td height="40" width="90" align="right">审核状态：</td>
	            <td style="color: #FF0000;">&nbsp;<strong><%=member.getApproveState()==AsnConstLib.MemberApproveState.Rejected?"审核未通过":member.getApproveState()==AsnConstLib.MemberApproveState.Completed?"审核完成":member.getApproveState()==AsnConstLib.MemberApproveState.ManualVerify?"相关人员审核":"未知" %></strong></td>
	            <td height="40" width="90" align="right">锁定状态：</td>
	            <td style="color: #FF0000;">&nbsp;<strong><%=member.getLockState()==AsnConstLib.MemberLockState.Locked?"冻结":member.getLockState() ==AsnConstLib.MemberLockState.Unlocked?"自由":"未知" %></strong></td>          	
			</tr>
		  </table>
          
          <table align="center" width="790" height="24" cellpadding="0" cellspacing="0" style="margin-bottom:10px; background:url(<%=cp %>/image/comdo/dht_bg.gif) no-repeat;">
			<tr>
				<td width="5">&nbsp;</td>
				<td width="735"><strong>证件信息</strong></td>
			</tr>
		  </table>
		  
		  <table align="center" width="790"cellpadding="0" cellspacing="0" border="1" bordercolor="#CCCCCC" style="padding-top:10px; border-collapse:collapse;">			
			<tr>					
				<td height="45" align="right">会员类型：</td>				
				<td height="45" >&nbsp;<%=member.getMemberType()==null?"—":member.getMemberType().equals("1")?"企业":"个人" %></td>
			</tr>
			<tr>
				<td height="45" align="right" width="90" style="border-bottom:1px #cccccc solid;">证件类型：</td>
				<td height="45" width="600">&nbsp;<%=member.getCertType()==null?"—":member.getCertType().equals("1")?"营业执照":member.getCertType().equals("2")?"组织机构代码证":member.getCertType().equals("3")?"社团证":member.getCertType().equals("4")?"个人身份证":member.getCertType().equals("5")?"护照":"军官证" %>
                </td>
				<td align="center" rowspan="2">
		            <a href="/asn/pic/member/member_<%=member.getMemberId() %>.jpg" target="_blank">
		            <img width="80" src="/asn/pic/member/sml_member_<%=member.getMemberId() %>.jpg" border="0" /></a>
		        </td>
		    </tr>
		    <tr>					
				<td height="45" align="right">证件编号：</td>				
				<td height="45" >&nbsp;<%=Str.get2(member.getCertId()) %></td>
			</tr>		
		  </table>
		  
		  
		  <table align="center" width="790" height="24" cellpadding="0" cellspacing="0" style="margin:10px 0; background:url(<%=cp %>/image/comdo/dht_bg.gif) no-repeat;">
			<tr>
				<td width="5">&nbsp;</td>
				<td width="785"><strong>基本信息</strong></td>			
			</tr>
		  </table>
		
		
		  <table align="center" width="790"cellpadding="0" cellspacing="0" border="1" bordercolor="#CCCCCC" style="margin-bottom:10px; border-collapse:collapse;">			
			<tr>
				<td height="40" width="90" align="right">全　　称：</td>
	            <td>&nbsp;<%=Str.get(member.getFullName()) %></td>          	
			</tr>
			<%if(member.getMemberType() != null && member.getMemberType()==1){ %>
			<tr>
				<td height="40" align="right">简　　称：</td>
	            <td>&nbsp;<%=Str.get(member.getShortName()) %></td>          	
			</tr>
			<% } %>
			<tr>
				<td height="40" align="right">所属地区：</td>
	            <td>&nbsp;<%=member.getArea()==null?"—":member.getArea().substring(member.getArea().indexOf("|")+1) %></td>          	
			</tr>	
			<tr>
				<td height="40" align="right">商务邮箱：</td>
	            <td>&nbsp;<%=Str.get2(member.getEmail()) %></td>          	
			</tr>	
			<tr>
				<td height="40" align="right">固定电话：</td>
	            <td>&nbsp;<%=Str.get2(member.getFixedPhone()) %></td>          	
			</tr>
			<tr>
				<td height="40" align="right">移动电话：</td>
	            <td>&nbsp;<%=Str.get2(member.getMobilePhone()) %></td>          	
			</tr>
			<tr>
				<td height="40" align="right">邮政编码：</td>
	            <td>&nbsp;<%=Str.get2(member.getZip()) %></td>          	
			</tr>
			<tr>
				<td height="40" align="right">通信地址：</td>
	            <td>&nbsp;<%=Str.get2(member.getAddress()) %></td>          	
			</tr>
			<%if(member.getMemberType() != null && member.getMemberType()==1){ %>
			<tr>
				<td height="40" align="right">联 系 人：</td>
	            <td>&nbsp;<%=Str.get2(member.getContactor()) %></td>          	
			</tr>
			<% } %>	
			<tr>
				<td height="40" align="right">Q  Q：</td>
	            <td>&nbsp;<%=Str.get2(member.getQq()) %></td>          	
			</tr>
		  </table>

</body>
</html>