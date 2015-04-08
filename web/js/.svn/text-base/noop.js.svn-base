/***
 * Noop
 * @author Ken Liu Kunyun on Feb 23, 2010
 * repeatly call servlet /contextpath/noop to prevent from session timeout 
 * dependency: noop servlet mapped to /contextpath/noop
 */
(function(){
	var root=document.location.pathname;
	root=root.substr(0,root.indexOf("/",1));
	var serverUrl=root+"/noop";
	var interval=2*6*1000;
	function noop(){
		try{
			var img=document.createElement("IMG");
			img.src=serverUrl+"?"+(new Date());
		}catch(e){}
		setTimeout(noop, interval);
	}
	setTimeout(noop, interval);
})();
