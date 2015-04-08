// JScript 文件

/*  移动 */

//$('#toopendiv').jqDrag('#tablemenu');

$(document).ready(function(){		
		$("#toopendiv").draggable({handle:'div',containment:'#bgdiv'});
	 //$('#toopendiv').jqDrag('#tablemenu');
});

var showGrow = 0; 
var selectCount = 0; 
var items = null;

function openCarSelectDiv(){   
    openBg(1);
    openSelect(1);
};

function closeCarSelectDiv(){   
    openBg(0);
    openSelect(0);
};

function openBg(state){ 
    if(state == 1){
        $("#bgdiv").show();
        var h = document.body.offsetHeight > document.documentElement.offsetHeight ? document.body.offsetHeight : document.documentElement.offsetHeight;
        $("#bgdiv").height(h);
//        hideElement("select",document.getElementById("bg"));
    }
    else{
        $("#bgdiv").hide();
//        showElement("select");
    } 
};

/************************************************************************/
/*功能：控制弹出div的显示状态
/************************************************************************/
function openSelect(state){ 
    if(state == 1){    	
    	var windowWidth = document.documentElement.clientWidth;     
    	var windowHeight = document.documentElement.clientHeight;     
    	var pHeight = $("#toopendiv").height();     
    	var pWidth = $("#toopendiv").width();  
        $("#toopendiv").show();
        $("#toopendiv").css("left",(windowWidth-pWidth)/2 + "px");                   
        $("#toopendiv").css("top",(windowHeight-pHeight)/2 + "px");  
    }
    else{
        $("#toopendiv").hide();
    }
};

function onselProductType(typeName){
		//向父页面生成复选框的代码
	document.getElementById("tocheckboxdiv").innerHTML = document.getElementById("tocheckboxdiv").innerHTML+"<input type='checkbox' class='frmrd' name='supplier.productType' value='"+typeName+"' id='productType' checked='checked' />"+typeName;
	openBg(0);
	openSelect(0);
}
