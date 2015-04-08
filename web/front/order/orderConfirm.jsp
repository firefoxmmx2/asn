<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page import="com.bornsoft.asn.service.member.MemberService,com.bornsoft.asn.bean.member.Member"%>
<%@page import="java.util.Hashtable" %>
<%@page import="com.bornsoft.asn.bean.shoppingCart.CartItem" %>
<%@page import="java.util.Iterator" %>
<%@page import="java.lang.String" %>
<%@page import="java.util.List" %>
<%@page import="com.bornsoft.asn.bean.order.DrawerAddress" %>
<%@page import="com.bornsoft.asn.utils.common.Calculator" %>
<%@page import="com.bornsoft.asn.service.product.DeliveryService" %>
<%@page import="com.bornsoft.asn.bean.product.Delivery" %>
<%
   String cp=request.getContextPath();
   List<DrawerAddress> adds=(List)request.getAttribute("listAddresses");
   int vl= adds.size();
   
   String template = (String)request.getAttribute("template");
   String addUrla = "";
   if(template!=null&&template.trim().length()>0)
   	addUrla = "&template="+template;
   String addUrlb = "";
   if(template!=null&&template.trim().length()>0)
   	addUrlb = "?template="+template;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.util.List"%><html>
<head>
<title>农业综合服务网络平台&nbsp;|&nbsp;新农村现代经营服务网络平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front/css/index-v1.css" media="screen" />
<LINK href="<%=cp%>/js/yav/yav-style.css"  type=text/css rel=stylesheet></LINK>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front/css/car.css" media="screen" />
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<script type="text/javascript" src="<%=cp%>/js/geoloc/geoloc.js"></script>
<script type="text/javascript" src="<%=cp%>/js/yav/yav.js"></script>
<script type="text/javascript" src="<%=cp%>/js/yav/yav-config.js"></script>
<style>
<!--
body{
	/*background:#A5D2A7;*/
	padding: 0;margin: 0;
}
.red{ color:#FF0000;}
-->
</style>
<script type="text/javascript">
		//初始化地区组件
		geoloc.debugOn();
		$(document).ready(function(){
			geoloc.init("divArea","- 不限省市 -", "- 不限地州市 -", "- 不限区县 -", "area");
		});
		
		// 取地区选择结果，如果没有选择，结果为null；如果选择，数据形式为：310101|黄浦区
		function showSelection(){
			var sel=geoloc.getSelection("divArea");
			if(sel==null){
				alert("没有选择");
			} else {
				alert(sel);
			}
		}
		

        //进入页面的时候判断选择
        var sv_=<%=vl%>;
        if(sv_==0){
        $(document).ready(function(){
        	    document.getElementById("other_ad").style.display="block";
               	document.getElementById("r16").checked="checked";
            });
        }
        
        
        
		function countPrice(){
			/* var s=document.getElementById("s_price").value;
			 			 if(v==""){
				   $("#totalprice").text(parseFloat(s).toFixed(1));
				   $("#tPrice").val(parseFloat(s).toFixed(1));
			 }
			 else{
				   $("#tPrice").val((parseFloat(s)+parseFloat(v)).toFixed(1));
				   $("#totalprice").text((parseFloat(s)+parseFloat(v)).toFixed(1));
				 }	
			 */		
			}


        //为物流配送留的接口动作
		function checkInfo(){
			//var v=document.getElementById("freightvalue").value;
			//if(v==""){
			//	 alert('请输入运费');
             //    return false;
			//	}
			// else{
			//	chooseAddress();
			//    return true;
			//   }
			}

        //返回到已购物的列表页面
		function shopProductList(){
			window.location.href="toConfirmInfoPage.action";
	     }


         //展开其它地址的层
        function openOtherAddress(){
                document.getElementById("other_ad").style.display="block";
            }

        //关闭其它地址的层
        function closeOtherAddress(){ 
             	document.getElementById("other_ad").style.display="none";
  
            }

       function chooseAddress(){
    			var _value= $("input:checked[name=addressId]").val();
                if(_value==-1){
                	var rules=new Array(
            				"area:地区|required",
            				"detailAddress:详细地址|required",
            				"detailAddress:详细地址|minlength|8",
            				"zipCode:邮政编码|required",
            				"zipCode:邮政编码|numeric",
            				"zipCode|mask|member.zip_mask",			
            				"mobileNumber:手机为必填，以便以后收取短信，建议固定电话也填上|required",
            				"mobileNumber:联系人|required"
            			);
            			// 遮罩规则的详细定义
            			yav.addMask('member.zip_mask', '      ', '1234567890');		
            			// 输入提示
            			yav.addHelp("zipCode", "邮政编码固定为6位数字");
            			// 输入时验证
            			yav.init('confirmOrderListForm', rules);
            			// 提交前验证
            			$("#confirmOrderListForm").submit(function () {
            				  return yav.performCheck("confirmOrderListForm", rules, "inline");  // classic 或者 inline
            			});
                }else{
					return true;
                    }

           }
        
		function onSelliuyan(obj){
			obj.className = "messagetextarea";
			var str = "选填，可告诉卖家你对商品的特殊要求，如颜色、尺码";
			if(obj.value == str){
				obj.value = "";
			}
		}
		function onSelliuyanClose(obj){
			if(obj.value.trim() == ""){
				obj.className= "liuyan";
				obj.value = "选填，可告诉卖家你对商品的特殊要求，如颜色、尺码";
			}
		}

		function onselPostMoney(val,valSUP){
			var postOld = document.getElementById("recordPost"+val).value;//记录修改前的运费
			var post = document.getElementById("postMoney"+val).value;	//得到需要修改的运费		
			var totalprice = $("#totalprice").text(); //得到总的价格
			var supplierTotal = $("#supplierTotal"+valSUP).text(); //供应商总价
			var value = 0.0;
			var valueSU = 0.0;
			
			value = parseFloat(post) + parseFloat(totalprice)-parseFloat(postOld);
			valueSU = parseFloat(post) + parseFloat(supplierTotal)-parseFloat(postOld);
			$("#totalprice").text(format(value,'#.00')); //显示总的价格
			$("#recordPost"+val).val(post);//修改记录价格			
			$("#supplierTotal"+valSUP).text(format(valueSU,'#.00'));
		}
		//格式化数据
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
</head>

  <body onload="countPrice();">
  <div style="width:974px;background:#FFFFFF;">
  
  
      <div id="doc">
          <div id="masthead2">          
               <ul>
                  <li class="second_title">我的购物清单 </li>
               </ul>            
          </div>
         <div style="clear: both;"></div>
         <div class="flow-steps">
	         <ol class="num5">
			   <li class="done current-prev">
			     <span class="first">加入购物车</span>
		       </li>
		       <li class="current">
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
			
         <div id="supply">
			  <form name="confirmOrderListForm" id="confirmOrderListForm" action="<%=cp%>/front/mall/saveOrderInfo.action" method="post" onsubmit="return checkInfo();">
			      <!--<s:hidden name="addressId" id="chooseAddress_id" />-->
			      <s:hidden name="template" id="template" />
			      
			      <div class="accountstitle">
	                 <div class="leftpart">收货地址确认</div>
	                 <div class="rightpart">
	                    <a href="<%=request.getContextPath()%>/do/do/addressManager/addressList.action">管理我的收货地址</a>
                     </div>
	              </div>
	              <div style="clear: both;"></div>
	              <ul id="address" class="m-v clr">
	                <s:iterator value="listAddresses" var="rs" status="ss" >
                      <li class="selected" id="" onclick="">
                      	<label>
        	            	<input id="addressId" name="addressId" value="<s:property value="id"/>" <s:if test="#ss.isFirst()">checked="checked"</s:if> type="radio" onclick="closeOtherAddress();" class="checkbox" />
        	            	<s:property value="drawerName" />&nbsp;
        	            	<s:property value="city" />&nbsp;
        	            	<s:property value="detailAddress" />&nbsp;
        	            	<s:property value="drawerNumber" />
        	            </label>
        			  </li>
        			</s:iterator>
    				<li class="selected">
    				    <label>
    				    	<input id="addressId" name="addressId" tabindex="15" value="-1" type="radio" onclick="openOtherAddress();" <s:if test="listAddresses == null || listAddresses.size==0">checked="checked"</s:if> />
	                    	使用其它地址 （<font color="#666666">如果该用其它地址，必须详细填写下面信息</font>）
	                    </label>	                    
	             	</li>			
	             	<li style="display: none;background:#F3F9FF;" id="other_ad">
	             		<table width="100%" cellpadding="0" cellspacing="0">
		                    <tr>
		                    	<td class="padRight">地          区：</td>
		                    	<td><em class="red">*</em>
		                    		<input type="hidden" name="area" id="area"/>
			                        <span id="divArea"></span>
			                        <span id="errorsDiv_area"></span>
		                    	</td>
		                    </tr>
		                    <tr>
		                    	<td class="padRight">邮政编码：</td>
		                    	<td><em class="red">*</em>
		                    		<input class="pc" maxlength="6" name="zipCode" tabindex="23" type="text"/>
	                                <span id="errorsDiv_zipCode"></span>
		                    	</td>
		                    </tr>
		                    <tr>
		                    	<td class="padRight">详细地址：</td>
		                    	<td><em class="red">*</em>
		                    		<input class="pc" maxlength="64" name="detailAddress" tabindex="23" type="text" size="60"/> 
	                                <span id="errorsDiv_detailAddress"></span>
		                    	</td>
		                    </tr>
		                    <tr>
		                    	<td class="padRight">收货人姓名：</td>
		                    	<td><em class="red">*</em>
		                    		<input class="pc" maxlength="20" name="drawerName" tabindex="25" type="text" size="15"/> 
	                                <span id="errorsDiv_drawerName"></span>
		                    	</td>
		                    </tr>
		                    <tr>
		                    	<td class="padRight">电  话：</td>
		                    	<td><em class="red">*</em>
		                    		<input class="pc" maxlength="20" name="drawerNumber" tabindex="25" type="text" size="15"/>
	                                                                                     手机<input class="mb m-l" name="mobileNumber" maxlength="11" tabindex="27" type="text"/>
	                                <span id="errorsDiv_mobileNumber"></span>
	                                                                                   手机必须填写 
		                    	</td>
		                    </tr>
		                    		
		                </table>             	
	             	
	             	</li>			
	         </ul>	
	        
	                   
	         	
		<!-- 以上为收货地址 -->		
		    <div class="accountstitle">
	            <div class="leftpart">订购信息确认 </div>
	        </div>
	        <div style="width:952px;float: left;">
         	<div style="float:left;width: 100%; border-bottom:3px #A7CBFF solid; height: 20px;">
         		<table width="100%" border="0" cellpadding="0" cellspacing="0">
         			 <tr>   
			            <td align="center" width="502" colspan="2">货品</td>		           
			            <td align="center" width="100">单价(元)</td>			            
			            <td align="center" width="100">数量</td>			            
			            <td align="center" width="100">小计(元)</td>
			            <td align="center" width="150">运送方式</td>
			        </tr>
         		</table>
         	</div>
         </div> 
	        
		    <table class="supply-table" id="J_supplyEnable" cellpadding="0" cellspacing="0">
		    <colgroup valign="middle">
		        <col width="85"></col>
		        <col width="417"></col>
		        <col width="100"></col>
		        <col width="100"></col>
		        <col width="100"></col>
		        <col width="150"></col>		        
		    </colgroup>
		    
		    <%
			    Hashtable<Long, Hashtable<Long, CartItem>> list=(Hashtable)request.getAttribute("newListInfo");
	            Double val=new Double(0); 
	            int m = 0; //标注
	            for(Iterator it = list.keySet().iterator(); it.hasNext();) {
	            Long key=(Long)it.next();
	            Member mem=MemberService.getMember(key);
            %>
		    <thead>
		        <tr>
		            <td class="s-company s-btline" colspan="5">
			            <div  style="padding-top:15px;padding-left: 15px;">卖家名称:&nbsp;
			               <span class="company">
			                 <a href="<%=cp%>/front/shop/supplierShopSy?supplierid=<%=mem.getMemberId() %>" target="_blank">
			                    <%=mem.getFullName()%>
			                 </a>
			               </span>
			            </div>
		            </td>		           
		        </tr>
		        
		    </thead>
		    

		    
		    <tbody>
		    <!-- 	
		    <tr>   
		            <td class="bold bluebg" align="center" width="30%" colspan="2">货品</td>		           
		            <td class="s-price bold bluebg" width="20%"  align="left">单价(元)</td>
		            <td width="5%" class="bold bluebg" align="left">&nbsp;</td>
		            <td class="s-amount bold bluebg" width="10%" align="left">数量</td>
		            <td width="10%" class="bold bluebg" align="left">&nbsp;</td>
		            <td class="bold bluebg" width="15%" align="left"style="text-align: left;">金额(元)</td>
		            
		        </tr>	
		        
		      -->
		    <%
		    	Hashtable<Long, CartItem>   value   = (Hashtable<Long, CartItem>)list.get(key);
		    	double everyPriceVal = 0;
		    	int n = 0; 
            	for(Iterator itr = value.keySet().iterator(); itr.hasNext();) {
            	Long  key1   =   (Long)itr.next();
           		CartItem item=(CartItem)value.get(key1);
           	%>		
				   <tr class="selected selmixclass mixed" userselected="1" style="background: #E2F2FF;">
    		            <td class="s-mixed linetb" height="70" align="center">
    		            	<input type="hidden" name="productIds" value="<%=item.getProductId()%>"/>
	    		              <a href="product/displayDetailProduct.action?productId=<%=item.getProductId()%><%=addUrla %>" target="_blank">
								<img src="<%=request.getContextPath()%><%=item.getImage()%>" width="50" height="50" border="0"/>	
							 </a>
					    </td>
					    
					    
					     <td class="s-name lineTD linetb" align="left" valign="top">
    		              <a href="product/displayDetailProduct.action?productId=<%=item.getProductId()%><%=addUrla %>" target="_blank">
							<%=item.getName() %>
						  </a>
					    </td>

					    
    		            <td class="s-price lineTD linetb" align="center"> <%=item.getPrice() %></td>    		            
    		            <td class="s-amount lineTD linetb" align="center"><%=item.getQuantity() %></td>    		            
    		            <td class="s-total lineTD linetb" align="center">
    		             <em>
					      <%=Calculator.keepTwoDecimal(item.getPrice()*item.getQuantity()) %>
					      <%
					      	val+=(item.getPrice()*item.getQuantity());//计算总价
					      	everyPriceVal += (item.getPrice()*item.getQuantity());//计算单个供应商总价
					      	if(item.getPostType() == 0){
					      		
					      	}
					      %> 
					     </em>
					    </td>
					    <td align="center" class="linetb"> 
					    <%
					    	if(item.getPostType() == 0){
						    	Delivery dalivery = DeliveryService.getDelivery(new Long(key1).intValue());
						    	String str = "<select id='postMoney"+key1+"' name='postFree["+m+"]' style='width:100px;height:20px;' onchange='onselPostMoney("+key1+","+key+")'>";
						    	str += "<option selected='selected' value='"+dalivery.getExpress()+"'>快递 "+dalivery.getExpress()+"元</option>";
						    	str += "<option value='"+dalivery.getPost()+"'>平邮 "+dalivery.getPost()+"元</option>";
						    	str += "<option value='"+dalivery.getEms()+"'>EMS "+dalivery.getEms()+"元</option>";
						    	str += "</select>";	
						    	str += "<input type='hidden' name='recordPost"+key1+"' id='recordPost"+key1+"' value='"+dalivery.getExpress()+"' />";
						    	val += dalivery.getExpress(); //总金额加上运费
						    	everyPriceVal += dalivery.getExpress(); ////计算单个供应商总价+运费
					    		out.print(str);
					    	}else if(item.getPostType() == 1){
					    	%>卖家承担 <input type="hidden" value="-1" name="postFree[<%=m%>]"  /> <%
					    	} else if(item.getPostType() == 2){
					    	%>联系卖家商定  <input type="hidden" value="-2" name="postFree[<%=m%>]"  /><%
					    	}
					    %>						     	    
					    </td>
    		        </tr>
	         </tbody>	         
	        
	       <%
	       	n++;
	       	} 
	       %>
	       		<tr style="background:#f5fbff;">
	         		<td height="50" align="right"> 给卖家留言:</td>
	         		<td colspan="3" style="text-align: left;">	         			
	         			<div style="width:100%;float:left;"><textarea id="messagetextarea_<%=key%>" class="liuyan" name="specialExplain" onfocus="onSelliuyan(this)" onblur="onSelliuyanClose(this)">选填，可告诉卖家你对商品的特殊要求，如颜色、尺码</textarea></div>
	         		</td>
	         		
	         		<td colspan="2" style="padding-right: 10px;text-align:right;">合计（含运费）：<em id="supplierTotal<%=key%>" style="color:#FF7300; font-size:14px;font-weight:700;"><%=Calculator.keepTwoDecimal(everyPriceVal) %></em>元</td>
	         	</tr>
          <% m++;} %>
		</table>		
		<!--以上为订购信息 -->		
		<div class="messagebox">			
			实付款(含运费):<span id="totalprice"><%= Calculator.keepTwoDecimal(val) %></span>元&nbsp;&nbsp;
        </div>
    	
    	<table width="952" cellpadding="0" cellspacing="0">
    		<tr>
    			<td align="right"><a href="<%=cp%>/front/mall/toConfirmInfoPage.action<%=addUrlb %>">返回购物车</a></td>
    			<td width="140"><input class="submitbutton" value="确认无误，购买"  type="submit" onclick="return chooseAddress();" />
    			</td>
    		</tr>
    	</table>    		
      
        <table width="952" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
        	<tr>
        		<td width="560">&nbsp;</td>        	
        		<td><div style="border: 1px #FFCC7F solid; background: #FFFFE5;padding:2px 10px;float: left;width: 360px;">
        		若有价格变动（包括运费），您可以在点击该按钮后，联系卖家修改   
        		</div>
        		</td>
        	</tr>    
        </table>
	</form>
   </div>
  </div>
  
  
  </div>
</body>
</html>
 