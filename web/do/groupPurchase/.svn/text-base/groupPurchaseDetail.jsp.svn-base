<%@page import="com.bornsoft.asn.bean.groupPurchase.GroupPurchaseInfo"%>
<%@page
	import="com.bornsoft.asn.service.groupPurchase.GroupPurchaseService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>团购信息详情</title>
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>


<s:form action="mkgMemberValid" name="groupMemberForm"
	id="groupMemberForm" method="post">
	<s:hidden name="groupPurchaseInfo.id"></s:hidden>
	<table align="center" width="792" height="51" cellpadding="0"
		cellspacing="0">
		<tr>
			<td height="39" class="title">团购信息详情</td>
		</tr>
		<tr>
			<td height="51" class="boder_y">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="color_h" colspan="4" height="28">团购标题:<s:property
						value="groupPurchaseInfo.title" /></td>
				</tr>
				<tr>
					<td class="color_h" height="28">团购产品:<s:property
						value="groupPurchaseInfo.productName" /></td>
					<td class="color_h">最小团购人数:<s:property
						value="groupPurchaseInfo.lowerLimit" /></td>
					<td class="color_h">最大团购人数:<s:property
						value="groupPurchaseInfo.upperLimit" /></td>
					<td class="color_h">已参团人数:<s:property
						value="groupPurchaseInfo.currentUsers" /></td>
				</tr>

				<tr>

					<td class="color_h" height="28">购买总量:<s:property
						value="groupPurchaseInfo.totalCount" /></td>
					<td>开始时间:<s:date name="groupPurchaseInfo.startTime"
						format="yyyy-MM-dd HH:mm" /></td>
					<td>结束时间:<s:date name="groupPurchaseInfo.stopTime"
						format="yyyy-MM-dd HH:mm" /></td>
					<td class="color_h">发货中心:<s:property
						value="groupPurchaseInfo.goodsCenter" /></td>
				</tr>
				<tr>

					<td class="color_h" colspan="3" height="28">
					页面地址:http://www.cqncp.com/asn<s:property
						value="groupPurchaseInfo.pageAddress" /></td>
					<td class="color_h">状态:<s:property
						value="@com.bornsoft.asn.service.groupPurchase.GroupPurchaseService@status[groupPurchaseInfo.status]" />
					</td>
				</tr>
			</table>
			</td>
		</tr>


		<tr>
			<td><!-- 用户列表部分 -->
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 20px;" class="table_border">
				<tr>
					<td height="28" align="center" bgcolor="#e8f5fb"><label><input
						type="checkbox" name="allSelect" id="allSelect" onClick=""
						class="cbborder"></input></label></td>
					<td align="center" bgcolor="#e8f5fb">成员名称</td>
					<td align="center" bgcolor="#e8f5fb">手机号码</td>
					<td align="center" bgcolor="#e8f5fb" width="200">住址</td>
					<td align="center" bgcolor="#e8f5fb">规格</td>
					<td align="center" bgcolor="#e8f5fb">单位数</td>
					<td align="center" bgcolor="#e8f5fb">提货方式</td>
					<td align="center" bgcolor="#e8f5fb">身份证号</td>
					<td align="center" bgcolor="#e8f5fb">参加时间</td>
					<td align="center" bgcolor="#e8f5fb">状态</td>
				</tr>
				<s:iterator status="s" value="groupPurchaseInfo.groupMembers"
					var="groupMember" begin="#attr.startCount-1"
					end="groupPurchaseInfo.groupMembers.size < #
					attr.endCount ? groupPurchaseInfo.groupMembers.size-1: #attr.endCount-1">
					<tr>
						<td height="40" align="center"><label><input
							type="checkbox" name="groupPurchaseMemberIds" class="cbborder"
							value='<s:property value="id"/>'></label></td>
						<td><a href="getMemberBuyDetail?id=<s:property value="id"/>"><s:property
							value="name" /></a></td>
						<td align="center"><s:property value="mobile" /></td>
						<td align="center"><s:property value="address" /></td>
						<td align="center" valign="middle"><s:iterator
							value="details" var="details" status="s">
							<s:if test="#s.index != details.size-1">
								<div style="border-bottom: 1px #e3e3e3 solid; height: 40px;">
							</s:if>
							<s:else>
								<div style="height: 40px;">
							</s:else>
							<s:property value="productDetail.specs" />(<s:property value="productDetail.groupPrice" />元/<span><s:property value="productDetail.unit" /></span>)
							</div>

						</s:iterator></td>
						<td align="center" valign="middle"><s:iterator
							value="details" status="s" var="details">
							<s:if test="#s.index != details.size-1">
								<div style="border-bottom: 1px #e3e3e3 solid;">
							</s:if>
							<s:else>
								<div>
							</s:else>
							<s:property value="buySum" />
							<span><s:property value="productDetail.unit" /> </span>
							</div>

						</s:iterator></td>
						<td align="center"><s:property
							value="@com.bornsoft.asn.service.groupPurchase.GroupPurchaseService@takeGoodsType[takeGoodsType]" />
						</td>
						<td align="center"><s:property value="cardId" /></td>
						<!--       
						<td align="center">	
							<s:property value="groupCardId"/>
						</td>
						
						<td align="center">
							<s:property value="groupCardPwd"/>
						</td>
						 -->
						<td align="center"><s:date name="joinTime"
							format="yyyy-MM-dd HH:mm" /></td>
						<td align="center"><s:property
							value="@com.bornsoft.asn.service.groupPurchase.GroupPurchaseMemberService@status[status]" />
						</td>

						<!-- 
						<td align="center">
							<s:property value="smsId"/>
						</td>
						<td align="center">
							<s:property value="smsContent"/>
						</td>
						 -->
					</tr>
				</s:iterator>
			</table>

			<table width="790" border="0" align="center" cellspacing="1"
				cellpadding="2" style="border-top: 1px #6cbc48 solid;">
				<tr>
					<td align="left" height="40">
						<input type="button" value="返回" class="sm-buttom5-2" id="backBtn" onclick="javascript:history.go(-1);">
					</td>
				</tr>
			</table>

			<table width="790" border="0" cellspacing="1" cellpadding="2"
				align="center">
				<s:property value="#request.pageBar" escape="false" />
			</table>
			</td>
		</tr>
	</table>
</s:form>