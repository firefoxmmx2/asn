<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>    
<%@page import="java.util.*" %>
<%@page import="com.bornsoft.asn.bean.report.*" %>   

<script type="text/javascript" src="<%=request.getContextPath()%>/common/changedate.jsp"></script>

   
   <s:form theme="simple" action="getT.action">
   <table align="center" width="792" height="51" cellpadding="0" cellspacing="0">
      <tr>
         <td height="39" class="title">交易统计</td>
     </tr>
      <tr>
        
        <td height="60" class="boder_y">
            
            
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
               <tr>
                <td width="60%" height="25">
                    <s:radio list="#{'1':'按成交量','2':'按单价','3':'按成交总金额'}" name="conditions"/>                                          
               </td>
               <td width="10%"></td>
                <td width="30%"></td>
               </tr>
               <tr>
                   <td width="60%" height="25">
                                                   排名:<s:select list="#{'':'所有','10':'前10名','20':'前20名','30':'前30名'}" name="tranCount"/>
                   </td> 
                   
                    <td width="10%" align="center">
                     &nbsp;
                     </td>
                     <td width="30%"></td>
               </tr>
              <tr>
                <td  width="60%" height="25">
	                                         时间:
	               <input type="text" width="50%" readonly="readonly" name="startDate" value='<s:date name="startDate" format="yyyy-MM-dd"/>' onClick="popUpCalendar(this, this, 'yyyy-mm-dd')" />
	                                             至
	               <input type="text" width="50%" readonly="readonly" name="endDate"  value='<s:date name="endDate" format="yyyy-MM-dd"/>' onClick="popUpCalendar(this, this, 'yyyy-mm-dd')" />
	               
	            </td>
	            <td width="10%" align="center">
                     &nbsp;
                </td>
	            <td width="30%" align="center">
	              <input type="submit"  width="50" height="25" />
	            </td>
             </tr>
            
             
            </table>
            
        </td>
      </tr>
      <tr>
      	    <td>
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:20px;" class="table_border">
                   <tr>
                      <td width="25%"  height="28" align="center" bgcolor="e8f5fb">产品名称</td>
                      <td align="center" valign="middle"  width="25%" bgcolor="e8f5fb">成交数量</td>
                      <td  align="center" valign="middle"  width="25%" bgcolor="e8f5fb">成交单价</td>
                      <td  width="25%" align="center" bgcolor="e8f5fb">成交总金额</td>
                  </tr>
                  
                  <% List<ReportTrade> list=(List)request.getAttribute("list2"); %>
                  <%for(int i=0;i<list.size();i++) { %>
                  
				  <tr>
                      <td  height="28" width="25%" align="center" > <%=list.get(i).getProductName() %></td>
                      <td align="center" valign="middle"  width="25%"><%=list.get(i).getCountQuantity() %></td>
                      <td  align="center" valign="middle"  width="25%"><%=list.get(i).getCountProPrice() %></td>
                      <td  width="25%" align="center" > <%=list.get(i).getTotalProPrice()%></td>
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

