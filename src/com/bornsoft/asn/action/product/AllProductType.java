package com.bornsoft.asn.action.product;

import java.util.List;

import com.bornsoft.asn.bean.order.Order;
import com.bornsoft.asn.bean.product.Product;
import com.bornsoft.asn.service.order.OrderService;
import com.bornsoft.asn.service.product.DisplayProductService;
import com.bornsoft.asn.utils.common.AsnConstLib;
import com.bornsoft.asn.utils.common.PropertyFactory;
import com.bornsoft.asn.utils.common.WebContext;
import com.bornsoft.asn.utils.common.productNavi.ProductNavigatorService;
import com.bornsoft.asn.utils.common.productNavi.ProductTypeIf;
import com.opensymphony.xwork2.ActionSupport;

public class AllProductType extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6366624045701430137L;
	public String facade;
	
	private String type;
	public String url;
	public String ret;
	public List<Product> hotProduct;
	private List<Order> sucOrderInfo;

	public AllProductType() {
		url = PropertyFactory.getDefaultProperty().getProperty("asn.product.searchUrl");
	}
	@Override
	public String execute() throws Exception {

		url = "~/front/cate1";
		ProductNavigatorService.getProductNavigator(url, type, facade, "userData=fff&user=xxx");
		
		if(type == null){
			ProductTypeIf ptif = ProductNavigatorService.getNaviType(AsnConstLib.NavigatorLevel0);
			ptif.init(url, type, new String[]{"userData=上帝","user=xxx"});
			WebContext.getRequest().setAttribute("typen", AsnConstLib.NavigatorLevel0);
		}
		else if(type.split("-").length == Integer.parseInt(AsnConstLib.NavigatorLevel1)){
			ProductTypeIf ptif = ProductNavigatorService.getNaviType(AsnConstLib.NavigatorLevel1);
			ptif.init(url, type, new String[]{"userData=上帝","user=xxx"});
			WebContext.getRequest().setAttribute("typen", AsnConstLib.NavigatorLevel1);
		}
		else if(type.split("-").length == Integer.parseInt(AsnConstLib.NavigatorLevel2)){
			ProductTypeIf ptif = ProductNavigatorService.getNaviType(AsnConstLib.NavigatorLevel2);
			ptif.init(url, type, new String[]{"userData=上帝","user=xxx"});
			WebContext.getRequest().setAttribute("typen", AsnConstLib.NavigatorLevel2);
		}
		
		hotProduct=DisplayProductService.getFrontHotProduct(null,1,10);
		
		sucOrderInfo=OrderService.getSucOrderList(null);
		
		if (ret == null)
			ret = SUCCESS;
		return ret;
	}

	public void setFacade(String facade) {
		this.facade = facade;
	}

	public String getFacade() {
		return facade;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUrl() {
		return url;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getType() {
		return type;
	}
	
	public List<Product> getHotProduct() {
		return hotProduct;
	}
	public void setHotProduct(List<Product> hotProduct) {
		this.hotProduct = hotProduct;
	}
	
		public List<Order> getSucOrderInfo() {
		return sucOrderInfo;
	}
	public void setSucOrderInfo(List<Order> sucOrderInfo) {
		this.sucOrderInfo = sucOrderInfo;
	}
}
