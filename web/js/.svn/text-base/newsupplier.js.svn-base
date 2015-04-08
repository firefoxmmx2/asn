var delayLength = 10000;

function doMove(panelWidth, tooFar) {
	var leftValue = $("#mover").css("left");
	
	// Fix for IE
	if (leftValue == "auto") { leftValue = 0; };
	
	var movement = parseFloat(leftValue, 10) - panelWidth;
	
	if (movement == tooFar) {
		$("#mover").animate({
			"left": 0
		});
	}
	else {
		$("#mover").animate({
			"left": movement
		});
	}
}

$(function(){
	
    var $slide1 = $("#slide-1");

	var panelWidth = $slide1.css("width");
	var panelPaddingLeft = $slide1.css("paddingLeft");
	var panelPaddingRight = $slide1.css("paddingRight");
	
	panelWidth = parseFloat(panelWidth, 10);
	panelPaddingLeft = parseFloat(panelPaddingLeft, 10);
	panelPaddingRight = parseFloat(panelPaddingRight, 10);

	panelWidth = panelWidth + panelPaddingLeft + panelPaddingRight;
	
	var numPanels = $(".slide").length;
	var tooFar = -(panelWidth * numPanels);
	var totalMoverwidth = numPanels * panelWidth;
	$("#mover").css("width", totalMoverwidth);


	sliderIntervalID = setInterval(function(){
		doMove(panelWidth, tooFar);
	}, delayLength);

	$("#page-wrap").mouseover(function(){
			clearInterval(sliderIntervalID);
	});
	
	$("#page-wrap").mouseout(function(){	
			sliderIntervalID = setInterval(function(){
				doMove(panelWidth, tooFar);
			}, delayLength);
	});
});