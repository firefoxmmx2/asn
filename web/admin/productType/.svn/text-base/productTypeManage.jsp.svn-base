<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:form action="toView" namespace="/admin/ptManage" theme="simple">
	<div class="title"></div>
	<div class="content">
		<fieldset>
			<legend>维护内容</legend>
			<ul>
				<li><div><label>类型编码:<s:textfield name="pt.ptcode"/></label><!-- 类型ID  --><s:hidden name="pt.ptid"/> <s:hidden name="type"/> </div>
				</li>
				<li><div><label>类型名称:<s:textfield name="pt.pttypeName"/> </label></div></li>
				<li><div><label>上级ID:<s:textfield name="pt.ptparentid"/></label> </div></li>
				<li><div><label>优先级:<s:textfield name="pt.priority"/></label> </div></li>
			</ul>
		</fieldset>
	</div>
	<div class="butbar">
		<ul>
			<li><input type="button" value="新增" name="doNew"/> </li>
			<li><input type="button" value="修改" name="doUpdate"/> </li>
			<li><input type="button" value="删除" name="doDelete"/> </li>
		</ul>
	</div>
</s:form>