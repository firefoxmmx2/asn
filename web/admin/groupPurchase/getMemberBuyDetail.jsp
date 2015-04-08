<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bornsoft.asn.utils.common.PropertyFactory" %>
<%@ page import="com.bornsoft.asn.bean.member.Member" %>
<%@ page import="com.bornsoft.asn.utils.common.AsnConstLib" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
	String cp=request.getContextPath();
%>




<%


class Locafunction{
		public String prop(Object key){
			return PropertyFactory.getProperty("member.properties", key.toString());
		}
		public String n2s(Object obj){
			return obj==null?"&nbsp;":obj.toString();
		}
		
	}
	Locafunction f=new Locafunction();
	
		List list= (List)request.getAttribute("memberBuyDetailList");
		
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员列表</title>
<style type="text/css">
<!--
.STYLE1 {
	color: #006699;
	font-weight: bold;
	font-size: 14px;
}
.STYLE3 {font-size: 13px}
-->
a:link {
 text-decoration: none;
}


a:visited {
 text-decoration: none;
}
a:hover {
 text-decoration: underline;
 color: #FF0000;
}

</style>


</head>
<s:form action="../../do/client/getUnGroupedMember" name="groupMemberForm" id="groupMemberForm" method="post">
	<s:hidden name="groupMember.id"></s:hidden>
	<table align="center" width="792" height="51" cellpadding="0" cellspacing="0">
   	<tr>
         <td height="39" class="title">团购成员详情</td>
   	</tr>  
	<tr>
		<td height="51" class="boder_y">
	 	 <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr height="30">
            <td  class="color_h"  height="28">
            	会员名称:<s:property value="groupMember.name"/>
		  	</td>
		  	<td  class="color_h">
		  		身份证号:<s:property value="groupMember.cardId"/>
		  	</td>
		  	<td  class="color_h" height="28">                      
            	手机号码:<s:property value="groupMember.mobile"/>
            </td>
		  </tr>
		  <tr>
            <td  class="color_h">
		  		提货方式:<s:property value="@com.bornsoft.asn.service.groupPurchase.GroupPurchaseService@takeGoodsType[groupMember.takeGoodsType]"/>  
		  	</td>
            <td  class="color_h">
            	住址:<s:property value="groupMember.address"/>
            </td>
		  	<td  class="color_h" height="28">
		  		参加时间:<s:date name="groupMember.joinTime" format="yyyy-MM-dd HH:mm"/>
		  	</td>
		  	<td  class="color_h">
		 		状态:<s:property value="@com.bornsoft.asn.service.groupPurchase.GroupPurchaseMemberService@status[groupMember.status]"/>
		  	</td>
            </tr>
        </table>
		</td>
	</tr>
	
	
	<tr>
	    <td>
	    <!-- 用户列表部分 -->
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:20px;" class="table_border">
                   <tr height="30">
						<td align="center" bgcolor="#e8f5fb">产品名称</td>
						<td align="center" bgcolor="#e8f5fb">规格</td>
						<td align="center" bgcolor="#e8f5fb">购买数目</td>	
						<td align="center" bgcolor="#e8f5fb">金额</td>
						<td align="center" bgcolor="#e8f5fb">重量</td>
						<td align="center" bgcolor="#e8f5fb">团购价格</td>	
						<td align="center" bgcolor="#e8f5fb">市场价格</td>
                  </tr>             	
                  <s:iterator status="s" value="groupMember.details" var="details">
                  		<tr height="40">
						<td align="center">
							<s:property value="productDetail.product.productName"/>
						</td>	
						<td align="center">
							<s:property value="productDetail.specs"/>
						</td>
						<td align="center">
							<s:property value="buySum"/> <span><s:property value="productDetail.unit"/></span>
						</td>
						<td align="center">
							<s:property value="costSum"/><span>元</span>
						</td>
						<td align="center">
							<s:property value="productDetail.weight"/><span>斤</span>
						</td>
						<td align="center">
							<s:property value="productDetail.groupPrice"/> <span>元</span> / <span><s:property value="productDetail.unit"/></span>
						</td>
						<td align="center">
							<s:property value="productDetail.marketPrice"/> <span>元</span> / <span><s:property value="productDetail.unit"/></span>
						</td>
					  </tr>
                  	</s:iterator>
					</table>
					
					<table width="790" border="0" align="center" cellspacing="1" cellpadding="2" style="border-top:1px #6cbc48 solid;">
						<tr>
							<td align="left" height="40">
								<input type="button" value="返回" class="sm-buttom5-2" id="backBtn" onClick="javascript:history.go(-1);" />
							</td>		
						</tr>     
					</table>        
					
					<!--<table width="790" border="0" cellspacing="1" cellpadding="2" align="center">
						<s:property value="#request.pageBar" escape="false"/>
					</table>
		--></td>
	</tr>
</table>
</s:form>
<!--<form action="<%=cp%>/do/client/getUnGroupedMember" name="myform" id="myform" >
	<table align="center"  height="51" cellpadding="0" cellspacing="0" width="100%" class="table_border">
	<tr>
		<td class="title"><span class="STYLE1">会员购买详情</span></td>
	</tr>
	<tr>
		<td class="boder_y">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td  class="color_h"  height="28">
            	会员名称:<s:property value="title"/>
		  	</td>
		  	<td  class="color_h">
		  		身份证号:<s:property value="groupPurchaseInfo.currentUsers"/>
		  	</td>
		  	<td  class="color_h" height="28">                      
            	手机号码:<s:property value="groupPurchaseInfo.productName"/>
            </td>
		  </tr>
		  <tr>
            <td  class="color_h">
		  		提货方式:<s:property value="groupPurchaseInfo.upperLimit"/>  
		  	</td>
            <td  class="color_h">
            	住址:<s:property value="groupPurchaseInfo.lowerLimit"/>
            </td>
		  	
		  	</tr>
		  	 
		  	<tr>
		  	
		  	<td  class="color_h" height="28">
		  		参加时间:<s:property value="groupPurchaseInfo.totalCount"/>
		  	</td>
		  	<td  class="color_h">
		 		状态:<s:property value="@com.bornsoft.asn.service.groupPurchase.GroupPurchaseService@status[groupPurchaseInfo.status]"/>
		  	</td>
            </tr>
            <tr>
		  	
          </tr>
        </table>
		</td>
	</tr>
	<tr>
	    <td>
			<table width="100%" border="1" cellspacing="0" cellpadding="0" class="table_border">
                   <tr>
               	  	 <td width="139" height="28" align="center" bgcolor="#e8f5fb">产品名称</td>
               	  	 <td  height="20" align="center" bgcolor="#e8f5fb" style="font-size:13px">金额(元)</td>  
						<td  height="20" align="center" bgcolor="#e8f5fb" style="font-size:13px">购买数量</td>				
						<td height="20" align="center" bgcolor="#e8f5fb" style="font-size:13px">单位</td>
						<td height="20" align="center" bgcolor="#e8f5fb" style="font-size:13px">重量</td>   
						<td  height="20" align="center" bgcolor="#e8f5fb" style="font-size:13px">团购价格(元/箱)</td>    
						<td  height="20" align="center" bgcolor="#e8f5fb" style="font-size:13px">市场价格(元/箱)</td>    
                  </tr>
				  <%
				  	if(list!=null)
					{
						for(int i=0; i<list.size(); i++){
							Map<String,Object> m = new HashMap<String,Object>();
							m = (Map<String,Object>)list.get(i);
							
				%>
			  	<tr>
					<td style="font-size:12px" align="center" height="30">&nbsp;<%=m.get("productName") %></td>
					<td style="font-size:12px" align="center" >&nbsp;<%=m.get("costSum") %></a></td>
					<td style="font-size:12px" align="center" >&nbsp;<%=m.get("buySum") %></a></td>
					<td style="font-size:12px" align="center" >&nbsp;<%=m.get("unit") %></td>
					<td style="font-size:12px" align="center">&nbsp;<%=m.get("weight") %></td>
					<td style="font-size:12px" align="center">&nbsp;<%=m.get("groupPrice") %></td>
					<td style="font-size:12px" align="center">&nbsp;<%=m.get("marketPrice") %></td>
		  		</tr>
				<%
					 }
				}
				%>
		  </table>
		</td>
	</tr>
</table>
</form>-->

</html>

