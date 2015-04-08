<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<s:iterator value="quotationList" status="stat">
	<div>
		<ul><li>
		<span><s:date name="quotationList[#stat.index].releaseDate" format="yyyy-MM-dd"/></span>
		<a href="<%=request.getContextPath() %>/front/mall/quotation/QuotationShow?qcd=<s:property value="quotationList[#stat.index].quotationCode"/>">
	<s:property value="quotationList[#stat.index].quotationName"/>
	</a>
		</li></ul>
	</div>	
</s:iterator>