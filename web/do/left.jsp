?<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="com.bornsoft.asn.service.member.Permission" %>
<%@ page import="com.bornsoft.asn.service.supplier.SupplierService" %>
<%@ page import="com.bornsoft.asn.utils.common.AsnConstLib" %>
<%@ page import="com.bornsoft.asn.utils.common.TimeDebug" %>
<%
Permission perm=new Permission(request);
boolean isSupplier=SupplierService.isSupplier(session);
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML><HEAD><TITLE></TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<META content=no-cache http-equiv=Pragma>
<META content=no-cache http-equiv=Cache-Control>
<META content=-1000 http-equiv=Expires>
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<link href="../css/menu.css" rel="stylesheet" type="text/css" />

<!--控制点击一个目录后 列出隐藏内容-->
<SCRIPT language=javascript>
			function expand(el)
			{
				childObj = document.getElementById("child" + el);

				if (childObj.style.display == 'none')
				{
					childObj.style.display = 'block';
				}
				else
				{
					childObj.style.display = 'none';
				}

				return;
			}
		</SCRIPT>

<SCRIPT type=text/javascript src="../js/jquery-1.4.2.min.js"></SCRIPT>

<SCRIPT type=text/javascript> 
$(document).ready(function(){
						   
	$(".pane .delete").click(function(){
		$(this).parents(".pane").animate({ opacity: 'hide' }, "slow");
	});
 
});
</SCRIPT>

<STYLE type=text/css>.style1 {
	COLOR: #00ffff
}
H3 {
	PADDING-BOTTOM: 0.3em; MARGIN: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; PADDING-TOP: 0px
}
P {
	PADDING-BOTTOM: 0.5em; MARGIN: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; PADDING-TOP: 0px
}
.pane {
	POSITION: relative; PADDING-BOTTOM: 10px; PADDING-LEFT: 20px; PADDING-RIGHT: 20px; BACKGROUND: #edf5e1; BORDER-TOP: #c4df9b 2px solid; PADDING-TOP: 10px
}
.pane .delete {
	POSITION: absolute; TOP: 10px; CURSOR: pointer; RIGHT: 10px
}
.menuTr{
	background-image:url(../image/menu_files/menu_bt2.gif); background-repeat:no-repeat;
}
</STYLE>
</HEAD>
<BODY background=../image/menu_files/menuback.jpg leftMargin=0 topMargin=0>
<TABLE border=0 cellSpacing=0 cellPadding=0 width=150>
  <TBODY>
  <TR>
    <TD vAlign=top width=243 align=middle>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width=100% height=1>
        <TBODY>
        <TR>
          <td width="30">&nbsp;</td></TR></TBODY></TABLE>
          <!-- 一级菜单 -->
      <TABLE border=0 cellSpacing=0 cellPadding=0 width=150>
        <TBODY>
        <TR height=29>
          <TD style="PADDING-LEFT: 30px" background=../image/menu_files/menu_bt.jpg><A 
            class=menuParent onClick="expand(1)"
            href="javascript:void(0);">&nbsp;资料修改</A></TD></TR>
        <TR height=4>
          <TD></TD></TR></TBODY></TABLE>
      <TABLE style="DISPLAY: none" id=child1 border=0 cellSpacing=0 
      cellPadding=0 width=100%>
        <TBODY>
        <TR height=2>
          <TD></TD></TR>
        <TR height=20>
          <td width="30">&nbsp;</td>
          <TD class="menuTr"><A class=menuChild 
            href="member/member_update.jsp" 
            target=mainFrame>&nbsp;修改会员资料</A></TD></TR>
        <TR height=20>
          <td width="30">&nbsp;</td>
          <TD class="menuTr"><A class=menuChild 
            href="supplier/updateSupplier" 
            target=mainFrame>&nbsp;修改供应商资料</A></TD></TR>
        <TR height=4>
          <TD></TD></TR></TBODY></TABLE>

          <!-- 一级菜单 -->
        <TABLE border=0 cellSpacing=0 cellPadding=0 width=150>
        <TBODY>
        <TR height=29>
          <TD style="PADDING-LEFT: 30px" background=../image/menu_files/menu_bt.jpg><A 
            class=menuParent onclick=expand(3) 
            href="javascript:void(0);">&nbsp;商品管理</A></TD></TR>
        <TR height=4>
          <TD></TD></TR></TBODY></TABLE>
      <TABLE style="DISPLAY: none" id=child3 border=0 cellSpacing=0 cellPadding=0 width=100%>
        <TBODY>
        <TR height=20>
          <td width="30">&nbsp;</td>
          <TD class="menuTr"><A class=menuChild 
            href="product/toCreateProduct" 
            target=mainFrame>&nbsp;发布商品</A></TD></TR>
        <TR height=20>
          <td width="30">&nbsp;</td>
          <TD class="menuTr"><A class=menuChild 
            href="product/toProductListOn" 
            target=mainFrame>&nbsp;商品列表</A></TD></TR>
        <TR height=20>
          <td width="30">&nbsp;</td>
          <TD class="menuTr"><A class=menuChild 
            href="discount/discount_index.jsp" 
            target=mainFrame>&nbsp;折扣管理</A></TD></TR>
        <TR height=4>
          <TD colSpan=2></TD></TR></TBODY></TABLE>
          
          <!-- 一级菜单 -->
        <TABLE border=0 cellSpacing=0 cellPadding=0 width=150>
        <TBODY>
        <TR height=29>
          <TD style="PADDING-LEFT: 30px" background=../image/menu_files/menu_bt.jpg><A 
            class=menuParent onclick=expand(6) 
            href="javascript:void(0);">&nbsp;交易管理</A></TD></TR>
        <TR height=4>
          <TD></TD></TR></TBODY></TABLE>
      <TABLE style="DISPLAY: none" id=child6 border=0 cellSpacing=0 cellPadding=0 width=100%>
        <TBODY>
        <TR height=20>
          <td width="30">&nbsp;</td>
          <TD class="menuTr"><A class=menuChild 
            href="../front/queryBuyOrder.action?orderStatus=WFK" 
            target=mainFrame>&nbsp;买入订单</A></TD></TR>
        <TR height=20>
          <td width="30">&nbsp;</td>
          <TD class="menuTr"><A class=menuChild 
            href="../front/querySoldOrder.action?orderStatus=YFK" 
            target=mainFrame>&nbsp;卖出订单</A></TD></TR>
        <TR height=4>
          <TD colSpan=2></TD></TR></TBODY></TABLE>
          
       <!-- 一级菜单 -->
      <TABLE border=0 cellSpacing=0 cellPadding=0 width=150>
        <TBODY>
        <TR height=29>
          <TD style="PADDING-LEFT: 30px" background=../image/menu_files/menu_bt.jpg><A 
            class=menuParent onclick=expand(2) 
            href="javascript:void(0);">&nbsp;供应信息</A></TD></TR>
        <TR height=4>
          <TD></TD></TR></TBODY></TABLE>
      <TABLE style="DISPLAY: none" id=child2 border=0 cellSpacing=0 
      cellPadding=0 width=100%>
        <TBODY>
        <TR height=2>
          <TD></TD></TR>
        <TR height=20>
          <td width="30">&nbsp;</td>
          <TD class="menuTr"><A class=menuChild 
            href="info/toCreateSupplyInfo" 
            target=mainFrame>&nbsp;发布供应信息</A></TD></TR>
        <TR height=20>
          <td width="30">&nbsp;</td>
          <TD class="menuTr"><A class=menuChild 
            href="info/toSupplyInfoListOn" 
            target=mainFrame>&nbsp;供应信息列表</A></TD></TR>
        <TR height=20>
          <td width="30">&nbsp;</td>
          <TD class="menuTr"><A class=menuChild 
            href="#info/toSupplyInfoMatch" 
            target=mainFrame>&nbsp;供应信息匹配</A></TD></TR>
        <TR height=4>
          <TD></TD></TR></TBODY></TABLE>
          
          
          
      
		<!-- 一级菜单 -->
		<%if(isSupplier && SupplierService.getCurrentSupplier(session).getSupplierType().equals("1")) {%>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width=150>
        <TBODY>
        <TR height=29>
          <TD style="PADDING-LEFT: 30px" background=../image/menu_files/menu_bt.jpg><A 
            class=menuParent onClick="" href="voucher/listVoucher" target="mainFrame">&nbsp;担保名单</A></TD></TR>
        <TR height=4>
          <TD></TD></TR></TBODY></TABLE>
          <%}%>
          <!--一级菜单-->
      <TABLE border=0 cellSpacing=0 cellPadding=0 width=150>
        <TBODY>
        <TR height=29>
          <TD style="PADDING-LEFT: 30px" background=../image/menu_files/menu_bt.jpg><A 
            class=menuParent onclick=expand(4) 
            href="javascript:void(0);">&nbsp;求购信息</A></TD></TR>
        <TR height=4>
          <TD></TD></TR></TBODY></TABLE>
      <TABLE style="DISPLAY: none" id=child4 border=0 cellSpacing=0 cellPadding=0 width=100%>
        <TBODY>
        <TR height=20>
          <td width="30">&nbsp;</td>
          <TD class="menuTr"><A class=menuChild 
            href="info/toCreatePurchaseInfo" 
            target=mainFrame>&nbsp;发布求购信息</A></TD></TR>
        <TR height=20>
          <td width="30">&nbsp;</td>
          <TD class="menuTr"><A class=menuChild 
            href="info/toPurchaseInfoListOn" 
            target=mainFrame>&nbsp;求购信息列表</A></TD></TR>
        <TR height=20>
          <td width="30">&nbsp;</td>
          <TD class="menuTr"><A class=menuChild 
            href="#info/toPurchaseInfoMatch" 
            target=_self>&nbsp;求购信息匹配</A></TD></TR>
        <TR height=4>
          <TD colSpan=2></TD></TR></TBODY></TABLE>
          
          
          <!--一级菜单-->
      <%if(perm.memberAdmin() || perm.supplierAdmin()){%>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width=150>
        <TBODY>
        <TR height=29>
          <TD style="PADDING-LEFT: 30px" background=../image/menu_files/menu_bt.jpg>
          	<A class=menuParent onclick=expand(5) href="javascript:void(0);">&nbsp;系统管理</A>
          </TD>
        </TR>
        <TR height=4>
          <TD></TD></TR></TBODY></TABLE>
      <TABLE style="DISPLAY: none" id=child5 border=0 cellSpacing=0 cellPadding=0 width=100%>
        <TBODY>
        <%if(perm.memberAdmin()){%>
        <TR height=20>
          <td width="30">&nbsp;</td>
          <TD class="menuTr">
          	<A class=menuChild href="member/listMemberByParam" target=mainFrame>&nbsp;会员列表</A>
          </TD>
        </TR>
        <%}%>
        <%if(perm.supplierAdmin()){%>
        <TR height=20>
          <td width="30">&nbsp;</td>
          <TD class="menuTr"><A class=menuChild href="supplier/listSupplier" target=mainFrame>&nbsp;供应商表</A></TD>
        </TR>
        <TR height=20>
          <td width="30">&nbsp;</td>
          <TD class="menuTr"><A class=menuChild href="geoLocManage/toView" target=mainFrame>&nbsp;地 区 表</A></TD>
        </TR>
        <TR height=20>
          <td width="30">&nbsp;</td>
          <TD class="menuTr"><A class=menuChild href="ptManage/toView" target=mainFrame>&nbsp;商品分类表</A></TD>
        </TR>
        <TR height=20>
          <td width="30">&nbsp;</td>
          <TD class="menuTr"><A class=menuChild href="#" target=_self>&nbsp;商品列表</A></TD>
        </TR>
        <TR height=20>
          <td width="30">&nbsp;</td>
          <TD class="menuTr"><A class=menuChild href="#" target=_self>&nbsp;求购列表</A></TD>
        </TR>
        <TR height=20>
          <td width="30">&nbsp;</td>
          <TD class="menuTr"><A class=menuChild href="voucher/listAllVoucher" target=mainFrame>&nbsp;担保列表</A></TD>
        </TR>
        <TR height=20>
          <td width="30">&nbsp;</td>
          <TD class="menuTr"><A class=menuChild href="discount/listAdminDiscount" target=mainFrame>&nbsp;折扣管理</A></TD>
        </TR>
        <%}%>
        <TR height=4>
          <TD colSpan=2></TD></TR></TBODY></TABLE>
     <%}%>
     
		<!-- 一级菜单 -->
      <%if(perm.quotationAdmin()){%>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width=150>
        <TBODY>
        <TR height=29>
          <TD style="PADDING-LEFT: 30px" background=../image/menu_files/menu_bt.jpg>
          	<A class=menuParent onClick="" href="quotation/quotation-control!toView" target="mainFrame" style1>&nbsp;行情管理</A>
          </TD>
        </TR>
        <TR height=4>
          <TD></TD></TR></TBODY></TABLE>
        <%}%>
        
		<!-- 一级菜单 -->
      <TABLE border=0 cellSpacing=0 cellPadding=0 width=150>
        <TBODY>
        <TR height=29>
          <TD style="PADDING-LEFT: 30px" background=../image/menu_files/menu_bt.jpg>
          	<A class=menuParent onClick="" href="javascript:void(0);" style1>&nbsp;咨询投诉</A>
          </TD>
        </TR>
        <TR height=4>
          <TD></TD></TR></TBODY></TABLE>
          
		<!-- 一级菜单 -->
      <TABLE border=0 cellSpacing=0 cellPadding=0 width=150>
        <TBODY>
        <TR height=29>
          <TD style="PADDING-LEFT: 30px" background=../image/menu_files/menu_bt.jpg>
          	<A class=menuParent onClick="" href="http://appsvr.aiecp.com:8080/ptnsso/changePassword.sso" target="mainFrame" style1>&nbsp;修改密码</A>
          </TD>
        </TR>
        <TR height=4>
          <TD></TD></TR></TBODY></TABLE>



		<!-- 一级菜单 -->
      <TABLE border=0 cellSpacing=0 cellPadding=0 width=150>
        <TBODY>
        <TR height=29>
          <TD style="PADDING-LEFT: 30px" background=../image/menu_files/menu_bt.jpg>
          	<A class=menuParent onClick="" href="javascript:void(0);" style1>&nbsp;使用说明</A>
          </TD>
        </TR>
        <TR height=4>
          <TD></TD></TR></TBODY></TABLE>
          
          <!-- 一级菜单 -->
      <TABLE border=0 cellSpacing=0 cellPadding=0 width=150>
        <TBODY>
        <TR height=29>
          <TD style="PADDING-LEFT: 30px" background=../image/menu_files/menu_bt.jpg>
          	<A class=menuParent onClick="" href="../logout?retry=yes" target="_top">&nbsp;重新登录</A>
          </TD>
       </TR>
       <TR height=4>
          <TD></TD></TR></TBODY></TABLE>
          
      <TABLE border=0 cellSpacing=0 cellPadding=0 width=150>
        <TBODY>
        <TR height=29>
          <TD style="PADDING-LEFT: 30px" background=../image/menu_files/menu_bt.jpg>
          	<A class=menuParent onClick="" href="../logout" target="_top">&nbsp;退出系统</A>
          </TD>
        </TR>
        <TR height=4>
          <TD></TD></TR></TBODY></TABLE>
        </TD>
       </TR>
  <TR height=4>
    <TD></TD></TR></TBODY></TABLE></BODY></HTML>
