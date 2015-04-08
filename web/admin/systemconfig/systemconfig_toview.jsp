<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
    
<form id="syscfgForm" name="sysConfigForm" method="post" action="<s:property value="formPath"/>">
<table height="51" align="center" width="792" cellspacing="0" cellpadding="0">
   	<tbody><tr>
         <td height="39" class="title">系统参数配置表</td>
   	</tr>
   	
	<tr>
		<td height="51" class="boder_y">
	 	 <!--<table border="0" width="85%" cellspacing="0" cellpadding="0">
          <tbody><tr>
            <td width="70%" class="color_h">
            	名称<input type="text" value="" name="discountbean.discountName">
		  	开始日期<input type="text" value="" size="10" id="beginDate" name="discountbean.beginDate" class="hasDatepicker">
		  	结束日期<input type="text" value="" size="10" id="endDate" name="discountbean.endDate" class="hasDatepicker">
		  	</td>
            <td align="center" width="10%"><img height="25" width="50" style="cursor: pointer;"  src="../../image/comdo/button_qd.gif"></td>
          	<td align="right" width="20%">[ <a href="../discount/listSelfDiscount">查看自己参与的活动</a> ]</td>
          </tr>
        </tbody></table>-->
		</td>
	</tr>
	
	<tr>
	    <td>
		    <table border="0" width="100%" cellspacing="0" cellpadding="0" class="table_border" style="margin-top: 20px;">
                   <tbody><tr>
                   		<td height="28" bgcolor="#e8f5fb" align="center"><label><input type="checkbox" class="cbborder" onclick="checkAll(this)" id="allSelect" name="allSelect">配置鍵</label></td>
						<td bgcolor="#e8f5fb" align="center" width="200">配置名称</td>
						<td bgcolor="#e8f5fb" align="center">配置值</td>
						<td bgcolor="#e8f5fb" align="center">配置分组</td>
						<td bgcolor="#e8f5fb" align="center">操作</td>
                  </tr>
				  	<s:iterator value="configList">
					  <tr>
						<td height="30"><label><input type="checkbox" value="<s:property value="configId"/>" class="cbborder" id="tblistbox" name="tblistbox"><s:property value="itemName"/> </label></td>
						<td><s:property value="itemTitle"/> </td>
						<td width="40%"><div style="height:50px; overflow: hidden;"><s:property value="itemValue"/></div></td>	
						<td><s:property value="groupName"/></td>
						<td>
							<input type="button" onclick="window.location.href='<s:property value="authorPath"/>?config.configId=<s:property value="configId"/>'" value="修改">
						</td>
					  </tr>
					  </s:iterator>
					</tbody></table>					

					<!--<table border="0" align="center" width="790" cellspacing="1" cellpadding="2">
						<tbody><tr align="right"><td align="right" width="98%"><a href="#">首   页</a>&nbsp;<a href="#">上一页</a>&nbsp;<a href="#">下一页</a>&nbsp;<a href="#">末  页</a>&nbsp;&nbsp; 共2条记录  每页<select onchange="this.form.page.value=1;this.form.pageSize.value=this.value;this.form.submit();" name="pagesize" size="1"><option value="5">5</option><option selected="" value="10">10</option><option value="20">20</option><option value="50">50</option><option value="100">100</option></select>条 分1页显示 转到<select onchange="this.form.page.value=this.value;this.form.submit();"><option selected="" value="1">1</option></select>页<input type="hidden" id="thePage" name="page" value="1"> <input type="hidden" id="thePageSize" name="pageSize" value="10"> <input type="button" style="display: none;" onclick="this.form.submit()" id="pageButton"></td></tr>
					</tbody></table>-->
		</td>
	</tr>
</tbody></table>

</form>