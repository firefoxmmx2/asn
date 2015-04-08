<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="com.bornsoft.asn.bean.member.Member" %> 
<%@ page import="com.bornsoft.asn.service.member.MemberService" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>农业综合服务网络平台&nbsp;|&nbsp;新农村现代经营服务网络平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
<link rel="stylesheet" rev="stylesheet" href="<%=request.getContextPath()%>/front/css/product.css" type="text/css" />
<SCRIPT src="<%=request.getContextPath()%>/front/js/cookie.js"></SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
<style type="text/css">
.btn_black2{
    border:0;
    FONT-SIZE: 12px;
    background:url(../images/btn_black2.gif) no-repeat 0 0;
    WIDTH: 81px;
    CURSOR: pointer;
    COLOR: #fff;
    LINE-HEIGHT: 25px;
    HEIGHT: 25px;
}

</style>
</head>
<SCRIPT type="text/javascript">


function cartInfo()
{
	this.productId = "";
	this.productName= "";
	this.productPrice= "";
	this.productCount="";
	this.productImage="";
}

      var pr=[];
	  var ProIDList = cookie.Get("carList");
	  var arr=ProIDList.split("&");
	  for(i=0;i<arr.length;i++){
		 var shoppingCart=new cartInfo();
         var info=arr[i].split("|");
         shoppingCart.productId=info[0];
         shoppingCart.productName=info[2];
         shoppingCart.productPrice=info[4];
         shoppingCart.productCount=info[1];
         shoppingCart.productImage=info[3];
         pr.push(shoppingCart);
  	  }


	function clearShopCart(){
		 var c=$("#listtable tr").length-3;
	     $('table tr:gt(0):lt('+c+')').remove();
		 Common.clearAll();
		 document.getElementById("listData").style.display="none";
		 document.getElementById("emptyData").style.display="block";

    }  	



    function updateCount(){
    	 var c=$("#listtable tr").length-2;
    	 var tPrice=0;
    	 $("#listtable tr").slice(1,c).each(function(){
    		  var vf=parseFloat($(this).children().eq(3).text());
    		  var vi=parseInt($(this).children().eq(4).children().val());
    		  var subPrice=vf*vi;
    		  $(this).children().eq(5).text(subPrice);
    		  tPrice+=subPrice;
        	 });
        $("#allCountPrice").text(tPrice);
    }




</SCRIPT>

<body onLoad="updateCount();">

<form action="" id="shopInfo">
<div id="dt01">
<!--  购物车头部开始    -->	
    <div class="gwc01">	 
	  <div class="gwc01_1">您好，欢迎来到新农村现代经营服务网络平台</div>
	  <!-- 
	  <div class="gwc01_2">我要买&nbsp;|&nbsp;我要卖&nbsp;|&nbsp;购物车&nbsp;|&nbsp;收藏夹&nbsp;|&nbsp;付款方式</div>
	  <div class="gwc01_3">帮助</div>
	   -->
	</div>
	
	<div class="gwc02">
	     <div class="gwc02_1"></div>
		 <div class="gwc02_2">我的购物车</div>
	</div>
	
	<!--  进货单导航头开始    -->	
	<div class="gwc03">
	  <div class="flow-steps">
    <ol class="num5">
        <li class="done current-prev"><span class="first">1.注册/登录</span> </li>
        <li class="current"><span>2.我的购物车</span> </li>
        <li><span>3.填写交易信息,确认产生订单</span> </li>
        <li><span>4.配送/签收货物</span> </li>
        <li class="last"><span>5.交易成功</span> </li>
    </ol>
</div>
	</div>
	
	<!--  进货单导航头结束    -->

     <div class="accountstitle2">
	        <div class="leftpart2">订购信息确认</div>
	 </div>
	<div class="gwc05" id="listData">
	   <table width="100%"  id="listtable" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td width="56" class="gwc05_1">序号</td>
			    <td colspan="2" class="gwc05_1">货品</td>
				<td width="244" class="gwc05_1">单价（元）</td>
			    <td width="186" class="gwc05_1">数量</td>
			    <td width="187" class="gwc05_1">金额（元）</td>
			    <td width="155" class="gwc05_1">&nbsp;</td>
            </tr>
			      <SCRIPT LANGUAGE = "JavaScript">
			          function removeRow(rt,id)
			          {  
			              if(confirm("你确定你要删除信息")){
			            	  $(rt).parent().parent().remove();
			              	  Common.reMoveOne(id);   
			                }
			              else{
			               return;
			               }
			          } 
			
			             if(pr[0].productId!="null"){
			        	  for(i=0;i<pr.length;i++){
			            	  var sct=new cartInfo();
			        	        sct=pr[i];
			        	        document.write("<tr>");
			        	        document.write("<td height='25' >");
			        	        document.write(i+1);
			        	        document.write("</td>");
			        	        document.write("<td width='255' >");
			        	        document.write("<img src='<%=request.getContextPath()%>");
			        	        document.write(sct.productImage+"'>");
			        	        document.write("</td>");
			        	        document.write("<td width='226'  class='gwc05_2'>");
			        	        document.write(" <a href='#'><span>");
			        	        document.write(sct.productName);
			        	        document.write("</span></a>");
			        	        document.write("</td>");
			        	        document.write("<td>");
			        	        document.write(sct.productPrice);
			        	        document.write("</td>");
			        	        document.write("<td align='center'>");
			        	        document.write("<input type='text' size='6' align='middle' value='  ");
			        	        document.write(sct.productCount);
			        	        document.write("' onmousemove='updateCount();'/>");
			        	        document.write("</td>");
			        	        document.write("<td class='jine' align='center'>");
			        	        document.write("00.0.0.");
			        	        document.write("</td>");
			        	        document.write("<td width='50' class='le_shanchu'>");
			        	        document.write("<input value='删除' type='button' onclick='removeRow(this,"+sct.productId.split('=')[0]+")' alt='删除'>");
			        	        document.write("</td>");
			        	        document.write("</tr>");
			        	  }
			             }
			         
			          </SCRIPT>
                  <tr>
    <td height="30"> 
      
    </td>
    <td width="187">
        <input type="button" value="清空购物车"  id="clearData" onClick="clearShopCart();"/>  
    </td>
    <td width="93"><a href="cate1.action"><img src="<%=request.getContextPath()%>/fieldSalesProductInfo/images/zgg.jpg" width="73" height="24"></a></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td colspan="2"  valign="bottom"> 总价(不包含运费)：<span class="jine2" id="allCountPrice">0.00</span>元 </td>
    </tr>
  <tr>
    <td height="40">&nbsp;</td>
    <td>&nbsp;</td>
	    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>
       <a href="toConfirmInfoPage.action" id="shopId">
          <img src="<%=request.getContextPath()%>/fieldSalesProductInfo/images/qsww.jpg" width="106" height="24">
       </a></td>
  </tr>
</table>

	</div>
	
	
	
	<div style="display: none;" id="emptyData">
	   <img src="<%=request.getContextPath()%>/fieldSalesProductInfo/images/empty_cart.gif">
	   <a href="cate0.action">购买商品</a>
	</div>
	
    <!--  购物车头部结束    -->	

</div>
</form>
</body>
</html>
