<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="s" uri="/struts-tags" %>  
<%@ page import="java.util.List"  %>
<%@ page import="java.util.Map"  %>  
<%@ page import="com.bornsoft.asn.bean.product.Product"  %>  
<%@ page import="com.bornsoft.asn.bean.license.*"  %>  

<%
	String appCp=request.getContextPath();
	String shopId = request.getParameter("supplierid");
	if(shopId==null || shopId.trim().length()<=0)
		shopId="";
		
		List list = (List)request.getAttribute("productSupply");
		
	String colorName = "orange";//orange,blue,red,green
	if(colorName==null || colorName.trim().length()<=0)
		colorName="green";
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><s:property value="member.fullName" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link href="<%=appCp%>/front/shop/css/<%=colorName%>.css" rel="stylesheet" type="text/css" />

<script language="JavaScript" type="text/JavaScript">
<!--
function AddFavorite(sURL, sTitle)
{
    try
    {
        window.external.addFavorite(sURL, sTitle);
    }
    catch (e)
    {
        try
        {
            window.sidebar.addPanel(sTitle, sURL, "");
        }
        catch (e)
        {
            alert("加入收藏失败，请使用Ctrl+D进行添加");
        }
    }
}
function SetHome(obj,vrl){
        try{
                obj.style.behavior='url(#default#homepage)';obj.setHomePage(vrl);
        }
        catch(e){
                if(window.netscape) {
                        try {
                                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
                        }
                        catch (e) {
                                alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。");
                        }
                        var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
                        prefs.setCharPref('browser.startup.homepage',vrl);
                 }
        }
}
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
</head>

<body>
<!--头部开始-->
<table width="959" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="495" height="25">&nbsp;</td>
    <td><img src="<%=appCp%>/front/shop/images/fhsy.jpg" width="14" height="25" /></td>
    <td nowrap width="63" valign="middle"><a href="http://www.aiecp.com/aiecp/72057594037927936/index.html" target="_top">返回平台首页</a></td>
    <td><img src="<%=appCp%>/front/shop/images/cpzx.jpg" width="16" height="25" /></td>
    <td width="61" valign="middle"><a href="http://pubsvr.aiecp.com/asn/front/cate0" target="_top">产品中心</a></td>
    <td><img src="<%=appCp%>/front/shop/images/gys.jpg" width="15" height="25" /></td>
    <td width="62" valign="middle"><a href="http://pubsvr.aiecp.com/asn/front/supplier/searchSupplier" target="_top">供应商</a></td>
    <td><img src="<%=appCp%>/front/shop/images/gqxx.jpg" width="16" height="25" /></td>
    <td width="61" valign="middle"><a href="http://pubsvr.aiecp.com/asn/front/info/showInfoMain" target="_top">供求信息</a></td>
    <td ><img src="<%=appCp%>/front/shop/images/jrsc.jpg" width="14" height="25" /></td>
    <td width="63" valign="middle"><a href="#" onclick="AddFavorite('http://pubsvr.aiecp.com/asn/index.jsp?id=xxx','某某企业')">加入收藏</a></td>
    <td><img src="<%=appCp%>/front/shop/images/swsy.jpg" width="12" height="25" /></td>
    <td valign="middle"><a href="#" onclick="SetHome(this,'http://pubsvr.aiecp.com/asn/index.jsp?id=xxx')">设为首页</a></td>
  </tr>
</table>
<!--头部结束-->
<!--banner开始-->
<table width="959" height="195" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top" class="banner"><span><s:property value="member.fullName" /></span></td>
  </tr>
</table>
<!--banner结束-->
<!--导航开始-->
<table border="0" align="center" cellpadding="0" cellspacing="0" width="959">
  <tr>
    <td width="40" class="nav_bg">&nbsp;</td>
    <td class="nav_bg"><a href="./supplierShopSy?supplierid=<%=shopId%>">首页</a></td>
    <td width="110" class="nav_bg"><a href="./supplierShopGycp?supplierid=<%=shopId%>">供应产品</a></td>
    <td width="110" class="nav_bg"><a href="./supplierShopGsjj?supplierid=<%=shopId%>">公司简介</a></td>
    <td width="110" class="nav_bg"><a href="./supplierShopQydt?supplierid=<%=shopId%>">企业动态</a></td>
    <td width="110" class="nav_bg"><a href="./supplierShopZzry?supplierid=<%=shopId%>">资质荣誉</a></td>
    <td width="110" class="nav_bg"><a href="./supplierShopRczp?supplierid=<%=shopId%>">人才招聘</a></td>
    <td width="110" class="nav_01"><a href="./supplierShopLxfs?supplierid=<%=shopId%>">联系方式</a></td>
    <td width="110" class="nav_bg"></td>
	<td width="39" class="nav_bg">&nbsp;</td>
  </tr>
</table>
<!--导航结束-->


<!--主题部分开始-->
<table width="959" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:8px;">
  <tr>
  <!--左边部分begin-->
    <td width="201" valign="top">
    	<img src="<%=appCp%>/front/shop/images/lxwm532.gif">
		</td>
    <!--左边部分 end-->
    
    
    <td>&nbsp;</td>
    
	<!--右边部分-->
    <td width="750" valign="top">
			<table width="750" height="412" border="0" cellpadding="0" cellspacing="0">
	  	<tr>
    		<td height="27" class="right_title">
	    	<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="35"></td>
                <td width="650">联系方式</td>
                <td width="65" align="center" class="more"></td>
            </tr>
        </table>
				</td>
  		</tr>
  		<tr>
    		<td height="385" valign="top" class="line_orange" align="center">
					  			
    			<br>
    			<!-- begin -->
    			<table  width="90%" cellpadding="0" border="0" align="center" cellspacing="0" class="chanping" >
								<tr>
									<td width="15%" nowrap height="30" align="right">全称：</td>
									<td align="left"><font color="#0045df">&nbsp;<strong><s:property value="member.fullName" /></strong></font></td>
									<td width="15%" nowrap height="30" align="right">供应商类型：</td>
									<td align="left">
										<s:if test='supplier.supplierType == "1"'>单位</s:if>
										<s:elseif test='supplier.supplierType == "2"'>个人</s:elseif> 
									</td>
								</tr>
								<tr>
									<td height="25" nowrap align="right">简称：</td>
									<td align="left">&nbsp;<s:if test="member.shortName == 'null'">暂无</s:if><s:else><s:property value="member.shortName" /></s:else></td>
									<td  height="30" nowrap align="right">证件名称：</td>
									<td align="left">
										<s:if test='member.certType == "1"'>营业执照</s:if>
										<s:elseif test='member.certType == "2"'>组织机构代码证</s:elseif>
										<s:elseif test='member.certType == "3"'>社团证</s:elseif>
										<s:elseif test='member.certType == "4"'>个人身份证</s:elseif>
										<s:elseif test='member.certType == "5"'>护照</s:elseif>
										<s:elseif test='member.certType == "6"'>军官证</s:elseif>
									</td>
								</tr>	
								<tr>
									<td height="25" nowrap align="right">联系电话：</td>
									<td align="left">&nbsp;<s:if test="member.fixedPhone == 'null'">暂无</s:if><s:else> <s:property value="member.fixedPhone" /></s:else></td>
									<td nowrap align="right">证件编号：</td>
									<td align="left">&nbsp;
										<s:if test='member.certType == "4"'>
									  	<%
									  		String certID = request.getAttribute("member.certId").toString();
									  		if(certID != null){
									  			if(certID.length() ==15){
									  				certID = certID.substring(0,6)+"******"+certID.substring(12,15);
									  			}else if(certID.length() ==18){
									  				certID = certID.substring(0,6)+"********"+certID.substring(14,18);
									  			}else{
									  				certID = "<font color='red'>此身份证编号有误</font>";
									  			}
									  			
									  		}else{
									  			certID = "<font color='blue'>暂无</font>";
									  		}
									  		out.print(certID); 
									  	%>				  	
									  	</s:if>
									 	<s:else> <s:property value="member.certId" /></s:else>
									</td>
								</tr>	
								<tr>
									<td height="25" nowrap align="right">联系人：</td>
									<td align="left"> &nbsp;
										<s:if test='supplier.supplierType == "1"'>
											<s:if test="member.contactor == 'null'">暂无</s:if><s:else> 	<s:property value="member.contactor" />	</s:else>
										</s:if>
										<s:else>
											<s:property value="member.fullName" />
										</s:else>
									
									</td>
									<td  height="30" nowrap align="right">收款银行名称：</td>
									<td align="left">&nbsp;<s:property value="bankinfo.bankName" /></td>
								</tr>	
								<tr>
									<td height="25" nowrap align="right">联系地址：</td>
									<td align="left">&nbsp;<s:if test="member.address == 'null'">暂无</s:if><s:else> <s:property value="member.address" /></s:else></td>
									<td height="30" nowrap align="right">帐户名：</td>
									<td align="left">&nbsp;<s:property value="bankinfo.account" /> </td>
								</tr>	
								<tr>
									<td height="25" nowrap align="right">邮政编码：</td>
									<td align="left">&nbsp;<s:if test="member.fixedPhone == 'null'">暂无</s:if><s:else> <s:property value="member.zip" /></s:else></td>
									<td  height="30" nowrap align="right">开户人名称：</td>
									<td  align="left">&nbsp;<s:property value="bankinfo.ownerName" /></td>
								</tr>
								<%if(request.getAttribute("member.qq") != null){ %>
								<tr>
									<td height="30" colspan="4">&nbsp;<a target=blank href=http://wpa.qq.com/msgrd?V=1&Uin=<%=request.getAttribute("member.qq")%>&Exe=QQ&Site=望龙门—农业综合服务网络平台&Menu=yes><img border="0" SRC=http://wpa.qq.com/pa?p=3:<%=request.getAttribute("member.qq")%>:3 alt="给我发消息"></a></td>
								</tr>
								<%	} %>	
								<tr>
									<td height="30" colspan="4">&nbsp;</td>
								</tr>	
					  </table>
						<!--end -->
									
    		</td>
  </tr>
</table>
    
    
	</td>
  </tr>
</table>
<!--主题部分结束-->


<!--foot开始-->
<br><br><br>
<table width="959" border="0" align="center" cellpadding="0" cellspacing="0" class="wz-12" bgcolor="#ffffff" height="107">
<tr>
</tr>
<tr>
  <td align="center" height="20"> @ 2009 版权所有 <a href="http://www.cqxh.com.cn/" target="_blank">新合集团</a></td>
</tr>
<tr>         
  <td align="center" height="20">地址：中国重庆市渝中区新华路216号 电话：+86 23 63824458</td>
</tr>
<tr>
  <td align="center" height="20">国际中文域名:<a href="http://www.aiecp.com/" target="_blank">www.望龙门.com</a> 
    　　<a href="http://www.aiecp.com" target="_blank">www.旺龙门.com</a></td>
</tr>
<tr>
  <td align="center" height="20">呼叫中心热线：+86 23 86312316</td>
</tr>
<tr>
	<td align="center" height="20">渝ICP备05009208号 </td>
</tr>
<tr>
	<td height="15"></td>
</tr>
</table>
<!--foot结束-->
</body>
</html>
