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
		rule = [ "qp.quotationPCode:产品编号|required", "qp.quotationPName:产品名称|required",
				"qp.quotationPT.quotationPTName:产品类型|required"];
		yav.init("quoPdtForm", rule);
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
			if (yav.performCheck("quoPdtForm", rule,'inline')) {
				$("form").submit();
			}
		} else if (status == modeStatus.INITVIEW) {
			if(this.name.indexOf('del') != -1)
			if (validateDelete()) {
				$("form[name=delQuoPdtForm]").submit();
			} else {
				alert("至少选择一条记录");
			}
			else if(this.name.indexOf('find') != -1)
				$('form[name*=find]').submit();
		}
	});
	
};

function beautiButton(){
	$('.button').button();
}
$(document).ready(function() {
	var modeS = $("input[name=mode]").val();
	bindBtn(modeS);
	check(modeS);
	if(modeS == modeStatus.INITVIEW){
		$("#selectAll").selectAll($("input[name=codes]"));
	}
	else if(modeS == modeStatus.ADD || modeS == modeStatus.MODIFY){
		$("input[name*=quotationPTName]").selectQuoPT($("input[name*=quotationPTypeCode]"),{width:'430px'});
	}
	//美化按钮
	beautiButton();
});