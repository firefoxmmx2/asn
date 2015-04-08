/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * 页面状态
 */
var modeStatus = {
	ADD : "1",
	DELETE : "2",
	MODIFY : "3",
	INITVIEW : "4"
};

var rule = [];
var validateDelete = null;

var check = function(status) {
	if (status == modeStatus.ADD || status == modeStatus.MODIFY) {
		rule = [ "qpt.quotationPTypeCode:产品类型编号|required", "qpt.quotationPTName:产品类型名称|required",
				"qpt.quotationPTSort:产品类型顺序|required"];
		yav.init("quoPTForm", rule);
	}
	if (status == modeStatus.INITVIEW) {
		validateDelete = function() {
			$checkedMarket = $("input:checked[name=codes]");
			if ($checkedMarket.length == 0)
				return false;
			else
				return true;
		};
	}

};
var bindBtn = function(status) {
	$("input:button[name*=action:]").click(function() {
		if (status == modeStatus.ADD || status == modeStatus.MODIFY) {
			if (yav.performCheck("quoPTForm", rule,'inline')) {
				$("form").submit();
			}
		} else if (status == modeStatus.INITVIEW) {
			if (validateDelete()) {
				$("form[name=delQuoPTForm]").submit();
			} else {
				alert("至少选择一条记录");
			}
		}
	});
	
};

$(document).ready(function() {
	var modeS = $("input[name=mode]").val();
	bindBtn(modeS);
	check(modeS);
	if(modeS == modeStatus.INITVIEW){
		$("#selectAll").selectAll($("input[name=codes]"));
	}
	//美化按钮
	beautiButton();
});

function beautiButton(){
	$('.button').button();
}