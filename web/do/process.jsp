<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>成为会员及供应商介绍</title>
<style type="text/css">
.title{ color:#FF7500; font-size:16px; font-weight:bold;}
.content{ color:#818181; font-size:12px; line-height:18px; padding:0 5px;}
</style>
</head>
<body>

<table align="center" width="792" height="51" cellpadding="0" cellspacing="0">
   <tr>
         <td height="50" class="title">会员及供应商入门</td>
   </tr>
	<tr>
	    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="168" height="143"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="45"><img src="<%=cp%>/image/process/1.gif" width="168" height="45" /></td>
              </tr>
              <tr>
                <td height="60" background="<%=cp%>/image/process/bg168_mid.gif" class="content">免费注册，成为网站的普通会员.</td>
              </tr>
              <tr>
                <td height="38" background="<%=cp%>/image/process/bg168_foot.gif" align="center">
                	<img src="<%=cp%>/image/process/djjr.gif" width="67" height="24" onclick="location.href='http://appsvr.aiecp.com:8080/ptnsso/registerAction1.sso'" style="cursor:pointer;" />
                </td>
              </tr>
            </table></td>
            <td width="40" align="center"><img src="<%=cp%>/image/process/jiantou1.gif" width="24" height="46" /></td>
            <td width="168"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="45"><img src="<%=cp%>/image/process/2.gif" width="168" height="45" /></td>
              </tr>
              <tr>
                <td height="60" background="<%=cp%>/image/process/bg168_mid.gif" class="content">完善资料后，你只能发布求购信息.</td>
              </tr>
              <tr>
                <td height="38" background="<%=cp%>/image/process/bg168_foot.gif" align="center">
                	<img src="<%=cp%>/image/process/djjr.gif" width="67" height="24" onclick="location.href='<%=cp%>/do/member/member_update.jsp'" style="cursor:pointer;" />
                </td>
              </tr>
            </table></td>
            <td width="40" align="center"><img src="<%=cp%>/image/process/jiantou1.gif" width="24" height="46" /></td>
            <td width="168"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="45"><img src="<%=cp%>/image/process/3.gif" width="168" height="45" /></td>
              </tr>
              <tr>
                <td height="60" background="<%=cp%>/image/process/bg168_mid.gif" class="content">等待系统中心审核你的资料，资料合格后才能成为会员.</td>
              </tr>
              <tr>
                <td height="38" background="<%=cp%>/image/process/bg168_foot.gif" align="center">&nbsp;</td>
              </tr>
            </table></td>
            <td width="40" align="center"><img src="<%=cp%>/image/process/jiantou1.gif" width="24" height="46" /></td>
            <td width="168"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="45"><img src="<%=cp%>/image/process/4.gif" width="168" height="45" /></td>
              </tr>
              <tr>
                <td height="60" background="<%=cp%>/image/process/bg168_mid.gif" class="content">正式成为电子商务系统会员,要销售你的产品，进一步成为供应商.</td>
              </tr>
              <tr>
                <td height="38" background="<%=cp%>/image/process/bg168_foot.gif" align="center">&nbsp;</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="40">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td align="center"><img src="<%=cp%>/image/process/jiantou3.gif" width="46" height="24" /></td>
          </tr>
          <tr>
            <td width="168" height="143" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="45"><img src="<%=cp%>/image/process/8.gif" width="168" height="45" /></td>
              </tr>
              <tr>
                <td height="60" background="<%=cp%>/image/process/bg168_mid.gif" class="content">快发布你的产品吧！还等什么呢!</td>
              </tr>
              <tr>
                <td height="38" background="<%=cp%>/image/process/bg168_foot.gif" align="center"><img src="<%=cp%>/image/process/djjr.gif" width="67" height="24" onclick="location.href='<%=cp%>/do/product/toCreateProduct'" style="cursor:pointer;" /></td>
              </tr>
            </table></td>
            <td width="40" align="center"><img src="<%=cp%>/image/process/jiantou2.gif" width="24" height="46" /></td>
            <td width="168"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="45"><img src="<%=cp%>/image/process/7.gif" width="168" height="45" /></td>
              </tr>
              <tr>
                <td height="60" background="<%=cp%>/image/process/bg168_mid.gif" class="content">你已经成为供应商了，你可以发布你农产品.</td>
              </tr>
              <tr>
                <td height="38" background="<%=cp%>/image/process/bg168_foot.gif" align="center"><img src="<%=cp%>/image/process/djjr.gif" width="67" height="24" onclick="location.href='<%=cp%>/do/product/toCreateProduct'" style="cursor:pointer;" /></td>
              </tr>
            </table></td>
            <td width="40" align="center"><img src="<%=cp%>/image/process/jiantou2.gif" width="24" height="46" /></td>
            <td width="168"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="45"><img src="<%=cp%>/image/process/6.gif" width="168" height="45" /></td>
              </tr>
              <tr>
                <td height="60" background="<%=cp%>/image/process/bg168_mid.gif" class="content">系统中心还是需要审核你的资料，合格后才能成为正在的供应商.</td>
              </tr>  
              <tr>
                <td height="38" background="<%=cp%>/image/process/bg168_foot.gif" align="center">&nbsp;</td>
              </tr>
            </table></td>
            <td width="40" align="center"><img src="<%=cp %>/image/process/jiantou2.gif" width="24" height="46" /></td>
            <td width="168"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="45"><img src="<%=cp %>/image/process/5.gif" width="168" height="45" /></td>
              </tr>
              <tr>
                <td height="60" background="<%=cp%>/image/process/bg168_mid.gif" class="content">填写正确的资料信息，才能销售你的产品哦！</td>
              </tr>
              <tr>
                <td height="38" background="<%=cp %>/image/process/bg168_foot.gif" align="center"><img src="<%=cp %>/image/process/djjr.gif" width="67" height="24" onclick="location.href='<%=cp%>/do/supplier/updateSupplier'" style="cursor:pointer;" /></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
	</tr>
</table>


</body>
</html>