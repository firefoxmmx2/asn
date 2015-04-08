<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
</script>
<h1 align="center" style="float:left; width:598px; text-align: center; font-size:22px;"><s:property value="#attr.quoInfo.quotationName" /> </h1>
<div align="center">时间：<s:date name="#attr.quoInfo.releaseDate" format="yyyy-MM-dd"/>&nbsp;&nbsp; 来源：<s:property value="#attr.quoInfo.source"/> </div>
