/**
 * ajax 2 
 * Author: Ken Liu Kunyun
 */

var ajax2={};
/**
 * get java root cause from error page
 */
ajax2.getRootCause=function(s) {
	var ret="";
	var message="";
	var cause="";
    var r=/root cause(.*?)\n(.*?)\n/mgi;
	var match = r.exec(s);
	if (match == null) {
		message=s.replace(/<(.*?)>/img, "");
		cause="";
	}else{
		message=match[1].replace(/<(.*?)>/img, "");
		cause=match[2].replace(/<(.*?)>/img, "");
	}
	ret={
			id:"jsonexception_uncaught",
			message:message,
			cause:cause,
			action:""
	};
	return ret;
}


/**
 * getUrl Error list
 */
ajax2['urlError'] = {};

/**
 * get url error form list
 */
ajax2.getUrlError=function(url) {
	return ajax2.urlError[url];
}


/**
 * get data from specified url
 * @param url url for data
 * @param parameter to send, using json style
 * @param dataType, "json", "xml", "html"
 * @param errHandler handler for error
 */
ajax2.getUrl=function(url, param, dataType, errHandler) {
	var ret=null;
	ajax2.urlError[url]='';
	var rc=$.ajax({
	    url:  url,
	    async:false,
	    type: 'GET',
	    data: param,
	    dataType: dataType,
	    error: function(request, err){
			ajax2.urlError[url]=ajax2.getRootCause(request.responseText);
		    if(typeof(errHandler)=="string") {
				eval(unescape(errHandler));			    
			} else {
			    // default error handler
			    var s=request.responseText;
			    var r=/<body[^>]*>(.*?)<\/body>/mgi;
		    	var match = r.exec(s);
		    	if (match != null) s=match[1];
		    	alert(s);
			}
	    },
	    success: function(value){
		    ret=value;
	    	if(ret["id"]=="jsonexception_caught") {
    			ajax2.urlError[url]=value;
    			ret=null;
	    	}
	    }});
    return ret;
}

/**
 * get json data form specified url with given parameters
 * @param url url for data
 * @param parameter to send, using json style
 */
ajax2.getJson=function(url, param){
	return ajax2.getUrl(url, param, "json", "");
}
