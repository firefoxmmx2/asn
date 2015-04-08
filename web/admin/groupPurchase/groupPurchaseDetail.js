/**
 * 团购信息详情
 * @since 2010-12-11
 * @author hooxin
 */

$(function(){
	$('#validBtn').click(function(){
		$('#groupMemberForm').attr('action','mkgMemberValid');
		$('#groupMemberForm').submit();
	});
	$('#invalidBtn').click(function(){
		$('#groupMemberForm').attr('action','mkgMemberInvalid');
		$('#groupMemberForm').submit();
	});
	$('#backBtn').click(function(){
		window.location.href="listGroupPurchase";
	});
	$('#allSelect').selectAll($('input[name=groupPurchaseMemberIds]'));
});

