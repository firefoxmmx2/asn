<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.bornsoft.asn.service.member.MemberService" %>  
<%@ page import="com.bornsoft.asn.bean.member.Member" %>  
<LINK href="../../css/regProcess.css" type=text/css rel=stylesheet> 

<style type="text/css">
#form1 {
	text-align: center;
}
.section_title {
	font-size: 18px;
	width:80%;
	margin: 0 auto; 
}
.tblcon{margin-top:10px;border:1px #CCCCCC solid;font-size:16px;padding:10px 0;}
</style>
	<%
			Member member = (Member)request.getAttribute("member");			
			if(member == null) member = new Member();
	%>
	
    
    <form action="" method="post" enctype="multipart/form-data" name="form1" id="form2">      	
      	
      	<%if(String.valueOf(MemberService.getApproveState(session)) == "ManualVerify" || String.valueOf(member.getApproveState()) == "ManualVerify"){ %>
			
            <table width="790" border="0" class="tblcon" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td align="center">
                	<img src="../../image/wait.gif" />　<br>
                	<strong>你刚刚提交了新的会员资料，这些资料需要由管理中心进行审核。</strong><br>
                	<strong>管理中心现在还没有审核通过您的申请，请稍后再来看看。</strong><br>
                	<font color="red" style="font-size:12px;"><strong>如果你想尽快通过审核，请和管理员联系。</strong></font><br/>
                	<span>管理员审核通过后，请<a target="_top" href="../../logout?retry=yes">重新登录</a>。</span>
                </td>
              </tr>
            </table>
            <%}else if(String.valueOf(MemberService.getApproveState(session)) == "Rejected"){ %>
            
            <table width="790" border="0" class="tblcon"  align="center" cellpadding="0" cellspacing="0">
              <tr>	
                <td align="center">
                	<img src="../../image/sorry.gif" />　<br>
                	<strong>电子商务网络管理中心拒绝了你的开通申请，请与管理中心联系。</strong>
                </td>
              </tr>
            </table>            
         	<%}else if(String.valueOf(MemberService.getApproveState(session)) == "Completed"){ %>   
			
<br><br>
            <table width="790" border="0" class="tblcon" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td align="center">
                	[祝贺！]　<br>
                	<strong>祝贺您，您申请的电子商务服务已经开通！</strong><br>
                	 【<a href="../../do">现在进入商务会员中心</a>】
                  </td>
              </tr>
            </table>
            <%} %>
      </form>
