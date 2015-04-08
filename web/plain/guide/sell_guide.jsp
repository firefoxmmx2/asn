<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>买家入门</title>
<style type="text/css">
.hsbx-1{border:1px solid #DDDDDD; margin-top:10px;}
.wz-12  {
	color:#313131;
	font-family:"宋体",Verdana,Arial,Helvetica,sans-serif;
	font-size:12px;
	line-height:24px;
	padding-left:15px;
}
a:link {
	color: #313131;
	text-decoration: none;
}
a:visited {
	color: #313131;
	text-decoration: none;
}
a:hover {
	color: #ff0000;
	text-decoration: none;
}
a:active {
	color: #1d6e00;
	text-decoration: none;
}
body{ 
	font-size:12px; font-family:"宋体"; margin:0; padding:0; 
}

.title{ color:#112482; font-size:16px; font-weight:bold;}
.content{ color:#818181; font-size:12px; line-height:18px; padding:0 8px;}
.imgcss{border:0;}
</style>
</head>
<body>
<table align="center" width="950" height="51" cellpadding="0" cellspacing="0">
<tr><td align="left" height="85"><a href="http://www.aiecp.com"><img src="<%=cp%>/image/newguide/logo_sxsl.gif" class="imgcss" /></a></td></tr>
   <tr>
         <td height="47" class="title"><table width="100%" height="47" border="0" cellpadding="0" cellspacing="0">
           <tr> 
             <td width="180" align="left" background="<%=cp%>/image/newguide/buy_04.gif"><a href="buy_guide.jsp"><img src="<%=cp%>/image/newguide/sell_01.gif" width="168" height="47" class="imgcss"/></a></td>
             <td width="168"><img src="<%=cp%>/image/newguide/sell_02.gif" width="168" height="47" /></td>
             <td background="<%=cp%>/image/newguide/buy_04.gif">&nbsp;</td> 
             <td background="<%=cp%>/image/newguide/buy_04.gif" align="right" style="padding-bottom:15px;"><a href="http://appsvr.aiecp.com:8080/ptnsso/registerAction1.sso"><img src="<%=cp%>/image/newguide/mfzc88.gif" width="88" height="31" class="imgcss"/></a></td>
           </tr>
         </table></td>   
   </tr>
	<tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" height="434" background="<%=cp%>/image/newguide/bg.gif">
        <tr>
          <td width="277" rowspan="4" ><img src="<%=cp%>/image/newguide/left01.gif" width="277" height="434" /></td>
        </tr>
        <tr>
          <td width="168" height="170" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="45"><img src="<%=cp%>/image/newguide/1.gif" width="168" height="45" /></td>
              </tr>
              <tr>
                <td height="60" background="<%=cp%>/image/newguide/bg168_mid.gif" class="content">免费注册，成为网站的普通会员,就能够享受普通会员服务。</td>
              </tr>
              <tr>         
                <td height="38" background="<%=cp%>/image/newguide/bg168_foot.gif" align="center"><a href="http://appsvr.aiecp.com:8080/ptnsso/registerAction1.sso"><img src="<%=cp%>/image/newguide/djjr.gif" width="67" height="24" class="imgcss" /></a></td>
              </tr>
          </table></td>   
          <td width="60" align="center"><img src="<%=cp%>/image/newguide/jiantou1.gif" width="48" height="47" /></td>
          <td width="168" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="45"><img src="<%=cp%>/image/newguide/2.gif" width="168" height="45" /></td>            
              </tr>      
              <tr>      
                <td height="60" background="<%=cp%>/image/newguide/bg168_mid.gif" class="content">完善你的会员资料，系统中心审核通过后，你可以享受发布求购信息。</td>
              </tr>
              <tr>
                <td height="38" background="<%=cp%>/image/newguide/bg168_foot.gif" align="center"><a href="<%=cp%>/do/member/member_update.jsp"><img src="<%=cp%>/image/newguide/djjr.gif" width="67" height="24" class="imgcss" /></a></td>
              </tr>
          </table></td>   
          <td width="60" align="center"><img src="<%=cp%>/image/newguide/jiantou1.gif" width="48" height="47" /></td>
          <td width="168" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="45"><img src="<%=cp%>/image/newguide/5.gif" width="168" height="45" /></td>
              </tr>
              <tr>              
                <td height="60" background="<%=cp%>/image/newguide/bg168_mid.gif" class="content">完善你的供应商资料，系统中心审核通过后，你可以享受发布产品信息。</td>
              </tr>        
              <tr>
                <td height="38" background="<%=cp%>/image/newguide/bg168_foot.gif" align="center"><a href="<%=cp%>/do/supplier/updateSupplier"><img src="<%=cp%>/image/newguide/djjr.gif" width="67" height="24" class="imgcss" /></a></td>
              </tr>
          </table></td>
		  <td width="49"></td>
        </tr>
        <tr>
          <td height="58" colspan="4">&nbsp;</td>
          <td align="center" height="58"><img src="<%=cp%>/image/newguide/jiantou3.gif" width="47" height="48" /></td>
		   <td width="49"></td>
        </tr>
        <tr>
          <td width="168" height="170" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="45"><img src="<%=cp%>/image/newguide/wstsy.gif" width="168" height="45" /></td>
              </tr>
              <tr>
                <td height="60" background="<%=cp%>/image/newguide/bg168_mid.gif" class="content">通过网上下订单，使买家、买家足不出户，轻轻松松就可完成商品交易。</td>
              </tr>
              <tr>    
                <td height="38" background="<%=cp%>/image/newguide/bg168_foot.gif" align="center">&nbsp;</td>
              </tr>
          </table></td>
          <td width="60" align="center"><img src="<%=cp%>/image/newguide/jiantou2.gif" width="48" height="47" /></td>
          <td width="168" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="45"><img src="<%=cp%>/image/newguide/zmj.gif" width="168" height="45" /></td>
              </tr>
              <tr>
                <td height="60" background="<%=cp%>/image/newguide/bg168_mid.gif" class="content">通过网站使用搜索功能，从海量的求购信息库了搜索出你想要的买家。</td>
              </tr>
              <tr>
                <td height="38" background="<%=cp%>/image/newguide/bg168_foot.gif" align="center"><a href="<%=cp%>/front/info/showPurchaseInfoList"><img src="<%=cp%>/image/newguide/djjr.gif" width="67" height="24" class="imgcss" /></a></td>
              </tr>
          </table></td>           
          <td width="60" align="center"><img src="<%=cp%>/image/newguide/jiantou2.gif" width="48" height="47" /></td>
          <td width="168" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">       
              <tr>
                <td height="45"><img src="<%=cp%>/image/newguide/fbcpxx.gif" width="168" height="45" /></td>
              </tr>
              <tr>
                <td height="60" background="<%=cp%>/image/newguide/bg168_mid.gif" class="content">免费发布你的产品，让买家自动找上门来。</td>
              </tr>
              <tr>
                <td height="38" background="<%=cp%>/image/newguide/bg168_foot.gif" align="center"><a href="<%=cp%>/do/product/toCreateProduct"><img src="<%=cp%>/image/newguide/djjr.gif" width="67" height="24" class="imgcss" /></a></td>
              </tr>
          </table></td>
		   <td width="49"></td>
        </tr>       
      </table></td>
	</tr>
</table>

	  <table class="hsbx-1" align="center" width="950" border="0" cellpadding="0" cellspacing="0">
        <tbody><tr valign="top"> 
          <td class="wz-12" valign="middle" align="center" bgcolor="#f0f0f0" height="30">
		  <a href="http://www.aiecp.com/aiecp/75153818781745152" target="_blank">关于我们</a>
  		  |  <a href="http://www.aiecp.com/aiecp/75716768735166464" target="_blank">版权声明</a> | 友情链接 | 帮助中心  |</td>
        </tr>
      </tbody></table>
      <table style="font-size: 12px;" width="100%" bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" height="95">
        <tbody>
         <tr>                
                <td align="center" height="20"> @ 2009 版权所有 <a href="http://www.cqxh.com.cn/" target="_blank">新合集团</a></td>
          </tr>
		  
		 <tr>
          <td align="center" height="20">地址：中国重庆市渝中区新华路216号 电话：+86 23 
63824458  </td>
        </tr>
		<tr>                
          <td align="center" height="20">国际中文域名:<a href="http://www.xn--rpvt55hwcg.com/" target="_blank">www.望龙门.com</a> 
            　　<a href="http://www.%CD%FA%C1%FA%C3%C5.cn/" target="_blank">www.旺龙门.com</a></td>
        </tr>
		<tr>
          <td align="center" height="20">呼叫中心热线：+86 23 86312316</td>
        </tr>
		 <tr>
          <td align="center" height="20">渝ICP备05009208号 </td>
        </tr>
		<tr><td height="15"></td></tr>
		
      </tbody></table>

</body>
</html>