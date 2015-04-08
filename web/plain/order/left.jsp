<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订单左页面</title>
<link href="/asn/front/css/other.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table>
  <tr>
    <td valign="top">
        <DIV id=pageleft>
<DIV id=pageleft_01><IMG height=53 alt=我的账户管理 src="/asn/front/images/pageleft_top.gif" width=195></DIV>
<DIV id=pageleft_02>
<UL>
  <LI>·<A href="frontQueryOrder.action?orderStatus=WFK" target=main>处理中的订单</A> 
  <LI>·<A href="#" target=_self>历史定单</A> 
  <LI>·<A href="frontQueryOrder.action?orderStatus=YQX" target=main>已取消的订单</A> 
</UL>
</DIV></DIV>
    </td>
  </tr>
</table>
</body>
</html>