<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@page import="java.util.*" %>
<%@page import="com.bornsoft.asn.bean.report.*" %>
<%@page import="com.bornsoft.asn.vo.ReportMemberBean" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/geoloc/geoloc.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/yav/yav.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/yav/yav-config.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/changedate.jsp"></script>

<script type="text/javascript">
geoloc.debugOn();
$(document).ready(function(){
	geoloc.init("divArea","- 不限省市 -", "- 不限地州市 -", "- 不限区县 -", "area",$("#area").val().substring(0,6));
});

// 取地区选择结果，如果没有选择，结果为null；如果选择，数据形式为：310101|黄浦区
function showSelection(){
	var sel=geoloc.getSelection("divArea");
	if(sel==null){
		alert("没有选择");
	} else {
		alert(sel);
	}
}



</script>


<s:form action="getM.action" theme="simple">
<table align="center" width="792" height="51" cellpadding="0" cellspacing="0">
   <tr>
         <td height="39" class="title">会员统计</td>
   </tr>
	<tr>
		<td height="51" class="boder_y">
	 	 <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="6%" class="color_h">
                                地区：</td>
            <td width="67%" class="color_h">
            <table>
              <tr>
              <td>
               <s:hidden name="area" id="area"/>
	           <span id="divArea"></span>
            </td>
              </tr>
            </table>

	        </td>
            <td width="10%" align="center">
                <input type="submit"  width="50" height="25" />
            </td>
            <td width="17%">&nbsp;</td>
          </tr>
          <tr>
            <td width="6%" class="color_h">
                时间:
            </td>
            <td width="67%">
               <input type="text" width="50" readonly="readonly" name="startDate" value='<s:date name="startDate" format="yyyy-MM-dd"/>' onClick="popUpCalendar(this, this, 'yyyy-mm-dd')" />
                                              至
               <input type="text" width="50" readonly="readonly" name="endDate" value='<s:date name="endDate" format="yyyy-MM-dd"/>' onClick="popUpCalendar(this, this, 'yyyy-mm-dd')" />
            </td>
          </tr>
        </table>
		</td>
	</tr>
	<tr>
	    <td>
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:20px;" class="table_border">
                   <tr>
                      <td width="25%"  height="28" align="center" bgcolor="e8f5fb">地区</td>
                      <td align="center" valign="middle"  width="25%" bgcolor="e8f5fb">企业</td>
                      <td  align="center" valign="middle"  width="25%" bgcolor="e8f5fb">个人</td>
                      <td  width="25%" align="center" bgcolor="e8f5fb">总数量</td>
                  </tr>
                  <% Map<String,ReportMemberBean> map= (Map)request.getAttribute("list0"); %>
                  <%for(Iterator it=map.entrySet().iterator();it.hasNext();) {%>
                  <% Map.Entry e = (Map.Entry)it.next(); %>
                  <% ReportMemberBean bean=(ReportMemberBean)e.getValue(); %>
				  <tr>
                      <td  height="28" width="25%" align="center" > <%=bean.getArea().substring(7) %></td>
                      <td align="center" valign="middle"  width="25%"><%=bean.getComCount() %></td>
                      <td  align="center" valign="middle"  width="25%"><%=bean.getPreCount() %></td>
                      <td  width="25%" align="center" ><%=bean.getComCount()+bean.getPreCount() %></td>
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

