<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   

<style>
<!--
.ads-a a:link{color:#ffffff;}
.ads-a a:visited{color:#ffffff;}
.ads-a a:hover{color:#ff0000;}

.ads-blank{display: block;}
.ads-none{display: none;}
-->
</style>   
<script type="text/javascript">
<!--
function ads(val){
	for(var i=1; i<=4; i++){
		if(val == i){
			document.getElementById("ncpadstext-"+i).bgColor = "#ff6600";
			document.getElementById("ads-0"+i).className="ads-blank";
			//$("#ads_01").attr("src","${pageContext.request.contextPath}/image/channel/ncp/foot"+i+".jpg");
		}else{
			document.getElementById("ncpadstext-"+i).bgColor = "#bbbbbb";
			document.getElementById("ads-0"+i).className="ads-none";
		}
	}
}
var val = 1;
setInterval(changeImg,8000);
function changeImg(){		
		if(val == 4){
			val = 1;
		}else{
			val++;
		}
		//$("#ads_01").attr("src","${pageContext.request.contextPath}/image/channel/ncp/foot"+val+".jpg");
		document.getElementById("ads-0"+val).className="ads-blank";
		for(var i=1; i<=4; i++){
			if(val == i){
				document.getElementById("ncpadstext-"+i).bgColor = "#ff6600";
			}else{
				document.getElementById("ncpadstext-"+i).bgColor = "#bbbbbb";
				document.getElementById("ads-0"+i).className="ads-none";
			}
		}
}

//-->
</script>    
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="m10 lunhuan">
      <tr>
        <td valign="top" colspan="4">
        	<span class="ads-blank" id="ads-01"><img src="${pageContext.request.contextPath}/image/channel/ncp/foot1.jpg" width="767" height="278" /></span>
        	<span class="ads-none" id="ads-02"><img src="${pageContext.request.contextPath}/image/channel/ncp/foot2.jpg" width="767" height="278" /></span>
        	<span class="ads-none" id="ads-03"><img src="${pageContext.request.contextPath}/image/channel/ncp/foot3.jpg" width="767" height="278" /></span>
        	<span class="ads-none" id="ads-04"><img src="${pageContext.request.contextPath}/image/channel/ncp/foot4.jpg" width="767" height="278" /></span>
        </td>
      </tr>   
      <tr>
	  <td width="191" id="ncpadstext-1" height="27" bgcolor="#ff6600" onmousedown="ads('1')" class="boderight ads-a"><a href="#">瑞瓦瑞瓦蜂蜜</a></td>
	  <td width="191" id="ncpadstext-2" height="27" bgcolor="#bbbbbb" onmousedown="ads('2')" class="boderight ads-a"><a href="#">【睡舒安】茶</a></td>
	  <td width="191" id="ncpadstext-3" height="27" bgcolor="#bbbbbb" onmousedown="ads('3')" class="boderight ads-a"><a href="#">有机杂粮礼盒</a></td>
	  <td width="191" id="ncpadstext-4" height="27" bgcolor="#bbbbbb" onmousedown="ads('4')" class="wz14baib ads-a"><a href="#">六星和田玉枣</a></td>
	  </tr>               
    </table>