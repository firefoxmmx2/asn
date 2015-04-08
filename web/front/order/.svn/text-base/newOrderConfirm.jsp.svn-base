<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page import="com.bornsoft.asn.service.member.MemberService,com.bornsoft.asn.bean.member.Member"%>
<%@page import="java.util.Hashtable" %>
<%@page import="com.bornsoft.asn.bean.shoppingCart.CartItem" %>
<%@page import="java.util.Iterator" %>
<%@page import="java.lang.String" %>
<%@page import="com.bornsoft.asn.utils.common.Calculator" %>

<%

long memberId=MemberService.getMemberId(session);
String cp=request.getContextPath();

String template = (String)request.getAttribute("template");
String addUrla = "";
if(template!=null&&template.trim().length()>0)
	addUrla = "&template="+template;
String addUrlb = "";
if(template!=null&&template.trim().length()>0)
	addUrlb = "?template="+template;


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>农业综合服务网络平台&nbsp;|&nbsp;新农村现代经营服务网络平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front/css/car.css" media="screen" />

<style>
<!--
body{
	/*background:#A5D2A7;*/
	padding: 0;margin: 0;
}
-->
</style>

</head>
<script type="text/javascript">

var memberId=<%=memberId%>;
var loginUrl="<%=cp%>/plain/member/login.jsp";

function yu(s){
	 window.location.href="infoConfirm.action?supplierId="+s;
	 }

function checkLogin(){
	var ret=true;
	if(memberId<1){
		var dlg=$("#dlgRegister");
		if(dlg.size()<1) {
			butil.loadCss("~/css/jquilib/themes/base/jquery.ui.all.css");
			dlg=$("<div id='dlgRegister' style='width:500px; height:200px;'><iframe src='"+loginUrl+"' width=100% height=200 /></div>");
			$("body").append(dlg);
			
		}
		dlg.dialog({ 
			title: "为了记录您的订单，需要您进行登录", 
			width: 500,
			height: 250,
			buttons: {}  
		});
		ret=false;
	}
	return ret;
}

// 登录回调
function loginCallback(loginMemberId){
	$("#dlgRegister").dialog("close");
	memberId=loginMemberId;
	//将选择的供应商的ID传进来
	saveOrder($("#su_id").val());
}

//提交订单信息
function saveOrder(){
	if(!checkLogin()){
		 return;
	}else{
		var checkboxArray = document.getElementsByName("tblistbox");
		var value = "";
		for(var i = 0;i < checkboxArray.length; i++){
			if(checkboxArray[i].checked)
	        {
				if(value == ""){
					value += checkboxArray[i].value;
				}else{
					value += ","+checkboxArray[i].value;
				} 
	        }
		}
		
	 //var list= document.getElementsByName("c_box_"+s_val);
     //var flag=false;
    // var chooseProId = [];
	 // for(var i=0;i<list.length;i++){
       //     if(list[i].checked){
       //     	 chooseProId.push(list[i].value);
     //           }
	//	  }
	//  var cpId=chooseProId.join(",");
	
	  if(value.length>0){
	     window.location.href="/asn/front/mall/infoConfirm.action?proIds="+value+"<%=addUrla %>";
	   }
	  else{
             alert("请选择要提交的商品");
		  }
	}
}


function chooseInfo(s_v_id,sup_id,pro_id,check){
    if(!check){
          document.getElementById(s_v_id).checked=false;
          var val=0.0;
          var t_val=parseFloat( $("#total_Price_"+sup_id).text());
          var s_val=parseFloat( $("#countPrice_"+pro_id).text());
          $("#total_Price_"+sup_id).text((t_val-s_val).toFixed(1));
    }
    else{
          var val=0.0;
          var t_val=parseFloat( $("#total_Price_"+sup_id).text());
          var s_val=parseFloat( $("#countPrice_"+pro_id).text());
          $("#total_Price_"+sup_id).text((t_val+s_val).toFixed(1));
        }
}


function selectAllCheckbox(obj_id,key,check){
    var list=document.getElementsByName(obj_id);
    var val=0.0;
    for(var i=0;i<list.length;i++){
            if(check){
              val+=parseFloat( $("#countPrice_"+list[i].value).text());
              $("#total_Price_"+key).text(val.toFixed(1));
   	          list[i].checked=true;
            }else{
             $("#total_Price_"+key).text(val.toFixed(1));
       	     list[i].checked=false;
            }
   }
}

function checkAll(obj){
	var checkbox=document.getElementsByName("tblistbox");
	var value = "";
	var val=0.0;
	for(var i = 0;i < checkbox.length; i++){
		if(checkbox[i].type == "checkbox")
        {
			checkbox[i].checked = obj.checked;
        }		
	}
	calculatorAllPrice();
}

function calculatorAllPrice(){
	var checkboxArray = document.getElementsByName("tblistbox");
	var value = "";
	var val=0.0;
	for(var i = 0;i < checkboxArray.length; i++){
		if(checkboxArray[i].checked)
        {
			value = $("#countPrice_"+checkboxArray[i].value).text();
			if(value != ""){
				val+=parseFloat(value);
			}
        }
	}
	$("#total_Price").text(format(val,'#.00'));
}
var format = function (number, form) {
    var forms = form.split('.'), number = '' + number, numbers = number.split('.')
        , leftnumber = numbers[0].split('')
        , exec = function (lastMatch) {
            if (lastMatch == '0' || lastMatch == '#') {
                if (leftnumber.length) {
                    return leftnumber.pop();
                } else if (lastMatch == '0') {
                    return lastMatch;
                } else {
                    return '';
                }
            } else {
                return lastMatch;
            }
    }, string
   
    string = forms[0].split('').reverse().join('').replace(/./g, exec).split('').reverse().join('');
    string = leftnumber.join('') + string;
   
    if (forms[1] && forms[1].length) {
        leftnumber = (numbers[1] && numbers[1].length) ? numbers[1].split('').reverse() : [];
        string += '.' + forms[1].replace(/./g, exec);
    }
    return string.replace(/\.$/, '');
};
//alert(format(123, '#.00'))                         //输出   123.00
//alert(format(123, '0.##'))                         //输出   123
//alert(format(123, '0000.00 '))                     //输出   0123.00
//alert(format(123456, '###,###.00'))                //输出   123,456.00

</script>
<body>
	<div style="width:974px;background:#FFFFFF;">
    <div id="doc">        
		 <div id="masthead">
		<!--<div style="background:url(<%=cp%>/front/images/logo_p.jpg) no-repeat;height:62px;width:100px;float:left;"></div>-->
			<div style="font-size:18px;font-weight: 700px;line-height: 65px;vertical-align: middle; width:100%;height: 100%;text-align: center">
				<% if(request.getAttribute("productName_wareCount") != null)out.println("产品 <font color=red>"+request.getAttribute("productName_wareCount")+"</font> 库存不足！"); %>
			</div>
		 </div>
		 
		 <div id="postion">
		 	<div class="postion1">您当前位置：首页 > 我的购物车</div>
		 	<div class="postion2">购物车帮您一次性完成批量购买与付款，下单更便捷，付款更简单！</div>
		 </div>		 
		 
         <!--  进货单导航头    -->	
		 <div class="flow-steps" style="clear: both;">
	        <ol class="num5">
			  <li class="current"> 
			   <span class="first">加入购物车</span>
		      </li>
		      <li>
			    <span>确认订单信息</span>
		      </li>
		      <li>
			     <span>付款到银行</span>
		      </li>
			  <li>
			     <span>确认收货</span>
		      </li>
		      <li class="last">
			     <span>交易成功</span>
		      </li>
	        </ol>
         </div>
         
         <div style="width:952px;float: left;padding-top:15px;">
         	<div style="float: left;width:100%;height:25px;font-weight:700;padding-left:16px;">请确认购物车里选中的商品并点击按钮购买</div>
         	<div style="float:left;width: 100%; border-bottom:2px #E6E6E6 solid; height: 30px;background: url('<%=cp%>/front/images/car_title.png') repeat-x;">
         		<table width="100%" border="0" cellpadding="0" cellspacing="0">
         			<tr>
         				<td width="73" height="30" align="center"><label><input class="checkbox" name="tblistbox" value="" checked="checked" onclick="checkAll(this);" type="checkbox" />全选</label></td>
         				<td width="350" align="center" colspan="2">商品</td>
         				<td width="217" align="center">单价(元)</td>
         				<td width="144" align="center">数量</td>
         				<td width="106" align="center">金额(元)</td>
         				<td width="56" align="center">&nbsp;</td>
         			</tr>
         		</table>
         	</div>
         </div>         
			
	<!--  进货单主体    -->	
	<div id="supply" style="clear: both;">		
     	<form name="myform" method="post">
			 <input style="display: none;" type="text" /> 
			 <table class="supply-table" cellpadding="0" cellspacing="0">
				<colgroup valign="middle">
					<col width="58" />
					<col width="85" />
                    <col width="265" />
                    <col width="232" />
					<col width="144" />
					<col width="106" />
					<col width="56" />
				</colgroup>
            <%
            	double val= 0.0; 
            	Hashtable<Long, Hashtable<Long, CartItem>> list=(Hashtable)request.getAttribute("hash");
	            for(Iterator it = list.keySet().iterator(); it.hasNext();) {
	            Long key=(Long)it.next(); 
	            Member mem=MemberService.getMember(key);	            
	            if(((Hashtable<Long, CartItem>)list.get(key)).size()>0){
	        %>
            	<input type="hidden" value="<%=key%>"  id="su_id" />
				
					<tr>
						<td colspan="7">
							<table class="titletable" width="100%">
								<thead>
									<tr>
										<td class="s-company" width="40%">
											<div  style="padding-top:15px;padding-left: 15px;">
												卖家的名称：
												<span class="company">
												 <a href="<%=cp%>/front/shop/supplierShopSy?supplierid=<%=mem.getMemberId() %>" target="_blank"><%=mem.getFullName()%></a>
												</span>
										    </div>
										</td>
									</tr>
								</thead>
							</table>						
						</td>
					</tr>					
				
				
				<%Hashtable<Long, CartItem>   value   = (Hashtable<Long, CartItem>)list.get(key);%>
                <%for(Iterator itr = value.keySet().iterator(); itr.hasNext();) {%>
                     <%Long  key1   =   (Long)itr.next();%>
                     <%CartItem item=(CartItem)value.get(key1);%>
				   <tbody class="supply-body">
					<tr userselected="1" style="background: #E2F2FF;">  
					  <td height="70" class="s-chk lineTD">
						  <input class="supplycheckbox" name="tblistbox" value="<%=key1%>" checked="checked"  type="checkbox" onclick="calculatorAllPrice()" />
					  </td> 
					  
                      <td class="s-mixed" align="center">
                      	<a href="product/displayDetailProduct.action?productId=<%=item.getProductId()%><%=addUrla %>" target="_blank">
							<img src="<%=request.getContextPath()%><%=item.getImage()%>" width="50" height="50" border="1" />
						 </a>
                      </td>
                      
				      <td class="s-name lineTD" align="left" valign="top">
						 <a href="product/displayDetailProduct.action?productId=<%=item.getProductId()%><%=addUrla %>" target="_blank"> <%=item.getName()%> </a>
					  </td>
					  
					  <td class="s-price lineTD">
						  <div class="data" mix="true" datamin="1" datalv1="1" datalv2="5" datalv3="21" datamax="100">
							   <%= Calculator.keepTwoDecimal(item.getPrice()) %>
						  </div>				
					  </td>
					  
					  <td class="s-amount lineTD">
						  <div class="relativediv"><%=item.getQuantity() %> <font color="#666666">(<%=item.getUnit()%>)</font></div>						
					  </td>
					   
					  <td class="s-total lineTD" align="center">
					   <em id="countPrice_<%=key1%>" >
					    <%=  Calculator.keepTwoDecimal(Calculator.multiply(item.getPrice(),item.getQuantity())) %>
					   </em></td>
					   <!-- <td class="s-del"><a href="#">删除</a></td> -->
					   <td char="s-del"><a href="#">-</a></td>
					</tr> 
					
					
					<tr class="line">
						<td colspan="7"></td>
					</tr>					
				</tbody>
				<%
						val+=(item.getPrice()*item.getQuantity()); //计算总价
						} 
						} 
            		} 
           		 %>
			</table>
			
			<table class="supply-table" cellpadding="0" cellspacing="0">
				<tr>
						<td class="marcooperation" align="left" valign="bottom">
							<label><input class="checkbox" value="" name="tblistbox" checked="checked" onclick="checkAll(this)" type="checkbox" />全选</label>
						</td>
						<td style="border: 0px; border-right: 1px solid #ffffff; text-align: right; height: 40px; padding-right: 12px; " valign="bottom"> 总价(不包含运费)：
						    <em id="total_Price" style="font-family: tahoma; font-size: 24px; color: #FF7300; margin-right: 5px; line-height: 24px; " >
						      <%= Calculator.keepTwoDecimal(val) %>
						    </em>元
						</td>
					</tr>
					<tr style="height: 26px;">
						<td colspan="2" style=" border: 0px; text-align: right; height: 36px; padding-right: 12px;">
                            <!-- <a class="continuebtn" title="继续采购" href="cate0.action" >继续采购</a>-->&nbsp;&nbsp;
							<input onclick="saveOrder();" class="submitbutton" value="立刻购买" type="button"/>
						</td>
					</tr>
			</table>
			
		 </form>
	 </div>
     <!--底部 start-->
	 <div class="footerBox"></div>
     <!--标准底部 end-->
   </div>
   
   </div>
   
  </body>
</html>

