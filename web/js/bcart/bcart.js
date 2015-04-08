var bcart={
	images:{
		spacer: "~/image/spacer.gif",
		cart: "~/image/common-16x16/cart.png",
		plus: "~/image/common-16x16/add.png",
		minus: "~/image/common-16x16/minus.png",
		remove: "~/image/common-16x16/Remove.png",
		money: "~/image/common-16x16/money_yen.png",
		packageUnit: "~/image/common-16x16/package.png",
		home: "~/image/common-16x16/home.png"
	},
	urls: {
			showProduct: "~/front/displayDetailProduct?productId={id}",
			listCart: "~/front/shoppingCart/listCart",
			changeQuantity: "~/front/shoppingCart/setQuantity",
			canChangeQuantity: "~/front/shoppingCart/canSetQuantity",
			clearCart: "~/front/test/xxx",
			addItem: "~/front/shoppingCart/toShoppingCart"
		},
		defaultWidth: 740,
		defaultHeight: 250,
		ui:null,
		templates:{
			item: "<div class='col cartItem' itemId='{itemId}' supplierId='{supplierId}'><div class='roc'>"+
				"<div class='col cartImage'><a target='_blank' href='{detailUrl}'><img src={image} border=0 /></a></div>"+
				"<div class='col nowrap'>"+
				"<span class='cartName' title='品名'>" +
				"<a target='_blank' href='{detailUrl}'>{productName}</a>" +
				"</span><br/>"+
				"<img align='absmiddle' src='{srcHome}' /><span class='cartSupplier' title='供应商'>{supplierName}</span>"+
				"&nbsp;<img align='absmiddle' src='{srcPackageUnit}' /><span title='计量单位' >{unit}</span><br/>"+
				"<img align='absmiddle' src='{srcMoney}' />"+
				"<span class='cartPriceOriginal' style='display:{priceOriginalDisplay}' title='原价'>{priceOriginal}</span>&nbsp;"+
				"<span class='cartPrice' title='优惠价'>{price}</span><br/>"+
				"<button class='cartButton' title='减少订购数量' onclick='bcart.changeQuantity(this, -1)'><img src='{srcMinus}' /></button>"+
				"<input class='cartQuantity' title='订购数量，可直接输入数字' type='text' size='3' maxlength='5' value='{quantity}' onchange='bcart.changeQuantity(this, NaN)' />"+
				"<button class='cartButton' title='增加订购数量'  onclick='bcart.changeQuantity(this, 1)'><img src='{srcPlus}' /></button>"+
				"<button class='cartButton' title='取消订购'  onclick='bcart.changeQuantity(this, 0)'><img src='{srcRemove}' /></button>"+
				"</div>"+
				"<div class='col nowrap'></div>"+
				"</div></div>"
		}
	};

//需要jQuery UI 的CSS 
butil.loadCss("~/css/jquilib/themes/base/jquery.ui.all.css");

// 需要自己的CSS 
butil.loadCss("~/js/bcart/bcart.css");

$(document).ready(function(){
	var elem=document.createElement("div");
	elem.setAttribute("id", "bcartDiv");
	elem.setAttribute("style", "display:none");
	document.body.appendChild(elem);
	bcart.ui=$("#bcartDiv");
	bcart.ui.dialog({ 
		autoOpen: false,
		title: "<img  align='absmiddle' src='"+butil.fullPath(bcart.images.cart)+"' />&nbsp;购物车", 
		width: bcart.defaultWidth,
		height: bcart.defaultHeight,
		buttons: {
			"现在结账": function() { bcart.doCheckOut(); },
			"关闭窗口": function() { $(this).dialog("close"); }
		}  
	});
});

// 去结账
bcart.doCheckOut=function(){
	window.location.href=butil.fullPath("~/front/toConfirmInfoPage.action");
};

// 绘制购物车商品界面 
bcart.render=function(){
	var data=butil.getJson(bcart.urls.listCart);  // 取数据
	if(!data) return;
	bcart.data=data;
	/*
 * 数据格式
 {
 "338":{
 		"214":{
 				"image":"/pic/product/s1268641973396.jpg",
 				"name":"钟灵雾尖",
 				"price":35.5,
 				"productId":214,
 				"quantity":1,
 				"supplierId":338,
 				"supplierName":"新合联佳"
 	 			},
 	 		"213":{
 	 	 	 		"image":"/pic/product/s1268641864022.jpg",
 	 	 	 		"name":"永川秀芽",
 	 	 	 		"price":35.5,
 	 	 	 		"productId":213,
 	 	 	 		"quantity":2,
 	 	 	 		"supplierId":338,
 	 	 	 		"supplierName":"新合联佳"
 	 	 	 	 	}
	 	 	 },
	 "7":{
	 	 	"223":{
	 	 	 	"image":"/pic/product/snopic.jpg",
	 	 	 	"name":"美国黑提",
	 	 	 	"price":35.5,
	 	 	 	"productId":223,
	 	 	 	"quantity":1,
	 	 	 	"supplierId":7,
	 	 	 	"supplierName":"金帆果品"
		 	 	}
		 }
} 

	*/
	var s="";
	var cp=butil.getContextPath();
	// 逐个供应商
	for(supplierId in data){
		var list=data[supplierId];
		// 逐个商品
		for(productId in list){
			var item=list[productId];
			var sItem=bcart.templates.item
			.replaceToken("{image}", cp+item.image)
			.replaceToken("{supplierName}", item.supplierName)
			.replaceToken("{productName}", item.name)
			.replaceToken("{price}", item.price)
			.replaceToken("{priceOriginal}", item.priceOriginal)
			.replaceToken("{priceOriginalDisplay}", item.price==item.priceOriginal ? "none" : "inline")
			.replaceToken("{quantity}", item.quantity)
			.replaceToken("{itemId}", item.productId)
			.replaceToken("{supplierId}", item.supplierId)
			.replaceToken("{unit}", item.unit)
			.replaceToken("{srcMinus}", butil.fullPath(bcart.images.minus))
			.replaceToken("{srcPlus}", butil.fullPath(bcart.images.plus))
			.replaceToken("{srcRemove}", butil.fullPath(bcart.images.remove))
			.replaceToken("{srcMoney}", butil.fullPath(bcart.images.money))
			.replaceToken("{srcHome}", butil.fullPath(bcart.images.home))
			.replaceToken("{srcPackageUnit}", butil.fullPath(bcart.images.packageUnit))
			.replaceToken("{srcSpacer}", butil.fullPath(bcart.images.spacer))
			.replaceToken("{detailUrl}", butil.fullPath(bcart.urls.showProduct.replaceToken("{id}", item.productId)));
			s+=sItem;
		}
	}
	if(s=="") s="购物车中还没有商品。";
	// 重绘
	bcart.ui.html(s);
};

// show cart
bcart.showCart=function(){
	if (!bcart.ui) return;
	bcart.ui.dialog("open");
	bcart.render();  // 重新绘制显示区
};

// 修改数量
bcart.changeQuantity=function(elem, count){
	if(!bcart.data) return;
	var itemId=$(elem).parents("*[itemId]").attr("itemId");
	var supplierId=$(elem).parents("*[itemId]").attr("supplierId");
	var item=bcart.data[supplierId][itemId];
	var newQuantity=isNaN(count) ? parseInt($(elem).val()) : (count==0 ? count : item.quantity+count);
	var canChange=butil.getJson(bcart.urls.canChangeQuantity, {supplierId: supplierId, productId: itemId, count:newQuantity});
	if(canChange.result==false){
		if(isNaN(count)){
			alert("可以订购的数量范围是{min}到{max}，请在此范围内修改。"
					.replaceToken("{min}", canChange.min)
					.replaceToken("{max}", canChange.max)
					);
			if(parseInt(elem.value)<canChange.min){
				newQuantity=canChange.min;
			}else{
				newQuantity=canChange.max;
			}
		}else if (count==1){
			alert("最大订购量是{max}。"
					.replaceToken("{max}", canChange.max)
					);
			newQuantity=canChange.max;
		}else if (count==-1){
			alert("最小订购量是{min}。"
					.replaceToken("{min}", canChange.min)
					);
			newQuantity=0;
		}
	}
	if(count==-1 && newQuantity==0){
		if(!confirm("已达最小订购数量了，再减少就是取消订购。\r\n确定要取消订购吗？")) return;
	}
	item.quantity=newQuantity;
	// 调用更改数量的Url
	butil.getUrl(bcart.urls.changeQuantity, {supplierId: supplierId, productId: itemId, count:newQuantity});
	// 重新绘制显示区 
	bcart.render();
};

bcart.clear=function(){
	// 调用清空购物车的Url
	butil.getUrl(bcart.urls.clearCart);
	// 重新绘制显示区 false for test only!!!
	bcart.render();
};

// 添加新项目
bcart.addItem=function(productId, quantity, supplierId){
	if(typeof(quantity)=="undefined") quantity=1;
	if(quantity=="") quantity=1;
	// 调用添加项目的Url
	butil.getUrl(bcart.urls.addItem, {productId: productId, count: quantity, supplierId: supplierId}); // TODO 提供参数
	bcart.showCart();
};


