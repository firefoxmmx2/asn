<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags"  prefix="s"%>
<%@page import="java.util.*" %>
<%@page import="com.bornsoft.asn.bean.report.ReportClick" %>
   
<s:form action="getC.action" theme="simple" >
  
  <table align="center" width="792" height="51" cellpadding="0" cellspacing="0">
  
     <tr>
         <td height="39" class="title">产品点击率统计</td>
     </tr>
    <tr>
		<td height="51" class="boder_y">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0">
             <tr>
                <td width="30%">
                                             排名 :<s:select list="#{'':'所有','10':'前10名','20':'前20名','30':'前30名','100':'前100名'}" name="rank"/>
                </td>
                <td width="20%" align="center">
                <input type="submit"  width="50" height="25" />
                </td>
                  <td width="50%">&nbsp;</td>
                </tr>
             
          </table>
		</td>
    </tr>
    
    
    	<tr>
	    <td>
		    <table width="50%" border="0" cellspacing="0" cellpadding="0" style="margin-top:20px;" class="table_border">
                   <tr>
                      <td width="50%"  height="28" align="center" bgcolor="e8f5fb">产品名称</td>
                      <td align="center" valign="middle"  width="50%" bgcolor="e8f5fb">点击次数</td>
                  </tr>
                  <%List<ReportClick> list=(List)request.getAttribute("list1");%>
                   <%for(int i=0;i<list.size();i++){ %>

				  <tr>
                      <td  height="28" width="50%" align="center" > <%=list.get(i).getProductName() %></td>
                      <td align="center" valign="middle"  width="50%"><%=list.get(i).getClickCount() %></td>
                  </tr>
                   <%} %>

				  
		  </table>
</td>
	</tr>
  </table>
  <table>
    <tr>
      <td>
		 ${request.pageBar}
      </td>
    </tr>
  </table>
  </s:form>
