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
		rule = [ "qm.marketCode:市场编号|required", "qm.marketName:市场名称|required",
				"qm.area:地区|required"];
		yav.init("marketForm", rule);
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
			if (yav.performCheck("marketForm", rule,'inline')) {
				$("form").submit();
			}
		} else if (status == modeStatus.INITVIEW) {
			if(this.name.indexOf("del") != -1){
				if (validateDelete()) {
					$("form[name=delForm]").submit();
				} else {
					alert("至少选择一条记录");
				}
				
			}
			if(this.name.indexOf("find") != -1){
				$("form[name=findForm]").submit();
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
	else if(modeS == modeStatus.ADD || modeS == modeStatus.MODIFY){
		
	}
	//美化按钮
	beautiButton();
});
function beautiButton(){
	$('.button').button();
}