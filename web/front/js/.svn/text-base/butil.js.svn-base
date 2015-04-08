/**
 * Javascript utilities from bornsoft
 * Created by Ken Liu Kunyun on Mar 12, 2010
 */
var butil={
	debugState: false,
	debugDiv: null,
	options:{},
	loadedScripts:{}
};

String.prototype.replaceToken = function(pattern, replacement) {
	  return this.split(pattern).join(replacement);
};

/**
 * regular expression escape 
 * @return
 */
String.prototype.regexEscape = function() {
	  return this.replaceToken("\\", "\\\\")
	  	.replaceToken("(", "\\(")
	  	.replaceToken(")", "\\)")
	  	.replaceToken("*", "\\*")
	  	.replaceToken(".", "\\.")
	  	.replaceToken("?", "\\?")
	  	.replaceToken("[", "\\[")
	  	.replaceToken("]", "\\]");
};



butil.setDebug=function(value){
	butil.debugState=value;
};

butil.hideDebug=function(){
	$(butil.debugDiv).css("visibility", "hidden");
};

butil.clearDebug=function(){
	$("#butilDebugMessage").html("&nbsp;");
};

butil.showDebug=function(){
	$(butil.debugDiv).css("visibility", "visible");
	var dbgObj=$(butil.debugDiv);
	dbgObj.find("#butilDebugTitle").width((dbgObj.innerWidth()-$("#butilDebugClose").width()-4)+"px");
};


(function(){
	var s="<div style='background-color:#DDDDDD; border-bottom: solid 1px; border-left:none; border-top:none; border-right:none;'>"+
	"<span id='butilDebugTitle' style='float:left; background-color:#DDDDDD; padding:2px; margin:0px;'>butil调试信息</span>"+
	"<span id='butilDebugClose' style='float:left; background-color:#DDDDDD; margine:0px;padding:0px;'>"+
	"<button onclick='butil.clearDebug()' style='white-space:nowrap'>清除</button>"+
	"<button onclick='butil.hideDebug()' style='white-space:nowrap'>关闭</button>"+
	"</span>"+
	"</div>"+
		"<div id='butilDebugMessage' style='clear:both;padding:4px; margin:0px; height:300px; overflow:auto;'></div>";
	var dbg=document.createElement("div");
	butil.debugDiv=dbg;
	var dbgObj=$(dbg);
	dbgObj.attr("id", "butilDebug");
	dbgObj.attr("style", 'position:absolute; left:0; top:0; width:500px; '+
			'padding:0px; margin:0px;'+
			'z-index:99; background-color:#FFF; border:solid 1px; visibility:hidden;');
	dbgObj.html(s);
	$(document).ready(function(){
		document.body.appendChild(dbg);
	});
	
})();


/**
 * get parameters object from location href
 */
butil.getParameters=function(uri){
	if(typeof(uri)=="undefined"){
		uri = unescape(window.location.href);
	}
	var queryString = {};
	uri.replace(
	    new RegExp("([^?=&]+)(=([^&]*))?", "g"),
	    function($0, $1, $2, $3) { queryString[$1] = $3; }
	);
	return queryString;
};

/**
 * get one element by id or name
 */
butil.element=function(idOrName){
	return document.getElementById(idOrName) || document.getElementsByName(idOrName)[0];
};

/**
 * Get the page base path of web url
 * 
 * @return path
 */
butil.getPageBase = function() {
	var docPath = document.location.pathname;
	docPath = docPath.substr(0, docPath.lastIndexOf("/") + 1);
	return docPath;
};

/**
 * Get the code base path of fileName
 * if no file name, refer to butil.js
 * @return none
 */
butil.getContextPath = function() {
	var ret = "./";
	if(butil["contextPath"]){
		ret=butil["contextPath"];
	}else{
		var oElm = document;
		var strTagName = "script";
		var arrElements = (strTagName == "*" && oElm.all) ? oElm.all : oElm
				.getElementsByTagName(strTagName);
		//var oAttributeValue = new RegExp("(^|\\s)src(\\s|$)");
		var oCurrent;
		var oAttribute;
		for ( var i = 0; i < arrElements.length; i++) {
			oCurrent = arrElements[i];
			oAttribute = oCurrent.getAttribute && oCurrent.getAttribute("src");
			if (typeof oAttribute == "string" && oAttribute.length > 0) {
				var index = oAttribute.lastIndexOf("butil.js");
				if (index > 0) {
					ret = oAttribute.substr(0, index);
					var match=new RegExp("(.*?/)js/", "img").exec(ret);
					if(match) ret=match[1];
				}
			}
		}
		butil["contextPath"]=ret;
	}
	return ret;
};

/**
 * extract full path of a ~/abc.js like file name
 */
butil.fullPath = function(path) {
	// process the context path
	var ret=path.replace("~/", butil.getContextPath());
	// Process the relative path
	if (ret.indexOf("/") != 0) {
		ret = butil.getPageBase() + ret;
	}
	return ret;
};

butil.debug=function(mess){
	if(!butil.debugState) return;
	var divObj=$(butil.debugDiv);
	var msgObj=divObj.find("#butilDebugMessage");
	msgObj.append(mess+"<br/>");
	butil.showDebug();
	if(divObj.draggable) divObj.draggable();
};

/**
 * get url content as text
 * @param url url for data
 * @param param to send, using json style
 * @param dataType, "json", "xml", "html"
 * @param errHandler handler for error
 */
butil.getUrl=function(url, param, dataType, httpType) {
	if(url.indexOf("~/")==0) url=butil.fullPath(url);
	var ret=null;
	$.ajax({
	    url:  url,
	    async:false,
	    type: (typeof(httpType)=="undefined" ? 'GET' : httpType),
	    data: param,
	    dataType: dataType,
	    error: function(request, err){
			butil.debug(request.responseText);
	    },
	    success: function (data, textStatus) {
	        ret=data;
	        if(typeof(data)=="string" && data.indexOf("Exception")>0) butil.debug(data); 
	    }
	});
	return ret;
};

butil.getJson=function(url, param) {
	return butil.getUrl(url, param, "json");
};

butil.loadJs=function(fileName){
	var fn=butil.fullPath(fileName);
	if(!butil.loadedScripts[fn]) {
		butil.loadedScripts[fn]=fn;
		content=butil.getUrl(fn);
	}
};

butil.loadCss=function(fileName){
	var fn=butil.fullPath(fileName);
	 var fileref=document.createElement("link");
	  fileref.setAttribute("rel", "stylesheet");
	  fileref.setAttribute("type", "text/css");
	  fileref.setAttribute("href", fn);
	  document.getElementsByTagName("head")[0].appendChild(fileref);
};

// useful ??????????? 
function IncludeJS(sId, fileUrl, source) 
{ 
if ( ( source != null ) && ( !document.getElementById( sId ) ) ){ 
var oHead = document.getElementsByTagName('HEAD').item(0);
var oScript = document.createElement( "script" );
oScript.language = "javascript";
oScript.type = "text/javascript";
oScript.id = sId;
oScript.defer = true;
oScript.text = source;
oHead.appendChild( oScript );
} 
} 
/**
 * 滚动广告
 * */
function guanggao(content,option,delaytime){
	guanggao.option = {};
	guanggao.defOption = {
			distance:20,
			direction:"left",
			speed:"normal"
			};
	guanggao.content = null;
	guanggao.init = function(content,option,delaytime){
			guanggao.content = content;
			if(option != null)
				guanggao.option = option;
			guanggao.delaytime = delaytime;
	};
	guanggao.delaytime = 0;
	this.draw = function(){
		var len  = $(guanggao.content).find(".slider").find("img").length;
	    var index = 0;
	   	if($(guanggao.content).find(".numberbar") != []){
	   		$(guanggao.content).find(".numberbar li").mouseover(function(){
	    	    index  =   $(guanggao.content).find(".numberbar li").index(this);
	    	    domove(index);
	    	});	
    	}

	   	$(guanggao.content).hover(
	    function(){
    	    if(interval){
    	    	clearInterval(interval);
    	    }
    	    },
	    function(){
    	    interval = setInterval(function(){
    	    	domove(index);
    	    	index++;
	    	    if(index==len){index=0;}
	    	    } , 
	    	    guanggao.delaytime);
	    });

	    
	    var interval = setInterval(function(){
	    	domove(index);
	    index++;
	    if(index==len){index=0;}
	    } , guanggao.delaytime);
	    
    };
    
	guanggao.domove = function(i){
    	var animateOption = {};
    	var speed = 0;
    	if(guanggao.option["direction"] == "top" || guanggao.option["direction"] == "left")
    		animateOption[guanggao.option["direction"] ] = -guanggao.option["distance"]*i;
    	else
    		animateOption[guanggao.option["direction"] ] = guanggao.option["distance"]*i;
		if(guanggao.option["speed"] == "fast")
    		speed = 400;
		else if(guanggao.option["speed"] == "normal")
    		speed = 1000;
		else if(guanggao.option["speed"] == "slow")
    		speed = 3000;
		else 
    		speed = 400;
		$(guanggao.content).find(".slider").stop(true,false).animate(animateOption,speed);
		if($(guanggao.content).find(".numberbar") != [])
			$(guanggao.content).find(".numberbar li").eq(i).addClass("on").siblings().removeClass("on");
    };
    var domove = guanggao.domove;
    guanggao.init(content,option,delaytime);
};