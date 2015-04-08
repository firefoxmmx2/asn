package com.bornsoft.asn.test.product.action;

import java.lang.reflect.Field;
import java.net.URLDecoder;

import com.bornsoft.asn.bean.product.ProductNavigator;
import com.bornsoft.asn.utils.common.AsnConstLib;
import com.bornsoft.asn.utils.common.PropertyFactory;
import com.bornsoft.asn.utils.common.WebContext;
import com.opensymphony.xwork2.ActionSupport;

public class productNavigatorBroswerAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6366624045701430137L;
	public String facade;
	
	private String type;
	public String url;
	public String ret;
	public productNavigatorBroswerAction() {
		url = PropertyFactory.getDefaultProperty().getProperty("asn.product.searchUrl");
	}
	@Override
	public String execute() throws Exception {
//		
//		if (pn == null) {
//			pn = new ProductNavigator();
//			ret = "success";
//		}
//		if(facade != null){
//			facade = URLDecoder.decode(facade, "UTF-8");
//			facade = URLDecoder.decode(facade, "UTF-8");
//			pn = pn.parseFacades(facade);
//		}
		url = "~/front/broswer";
//		facade="12::你好##13::你好##";
		ProductNavigatorService.getProductNavigator(url, type, facade, "userData=fff&user=xxx");

		
		if(type == null){
			ProductTypeIf ptif = ProductNavigatorService.getNaviType(AsnConstLib.NavigatorLevel0);
			ptif.init(url, type, new String[] {"userData=上帝","user=xxx"});
			WebContext.getRequest().setAttribute("typen", AsnConstLib.NavigatorLevel0);
		}
		else if(type.split("-").length == Integer.parseInt(AsnConstLib.NavigatorLevel1)){
			ProductTypeIf ptif = ProductNavigatorService.getNaviType(AsnConstLib.NavigatorLevel1);
			ptif.init(url, type, new String[] {"userData=上帝","user=xxx"});
			WebContext.getRequest().setAttribute("typen", AsnConstLib.NavigatorLevel1);
		}
		else if(type.split("-").length == Integer.parseInt(AsnConstLib.NavigatorLevel2)){
			ProductTypeIf ptif = ProductNavigatorService.getNaviType(AsnConstLib.NavigatorLevel2);
			ptif.init(url, type, new String[]{"userData=上帝","user=xxx"});
			
			WebContext.getRequest().setAttribute("typen", AsnConstLib.NavigatorLevel2);
		}
		else if(type.split("-").length == Integer.parseInt(AsnConstLib.NavigatorLevel3)){
			ProductTypeIf ptif = ProductNavigatorService.getNaviType(AsnConstLib.NavigatorLevel3);
			ptif.init(url, type, new String[]{"userData=fff","user=xxx"});
			
			WebContext.getRequest().setAttribute("typen", AsnConstLib.NavigatorLevel3);
		}
		if (ret == null)
			ret = SUCCESS;
		return ret;
	}

//	private String switchAction() {
//		if (pn != null && pn.getTypeCode() != null) {
//			String[] results = pn.getTypeCode().split("-");
//			try {
//				Field f = AsnConstLib.class.getField("NavigatorLevel"
//						+ results.length);
//				ret = f.get(AsnConstLib.class).toString();//###
//			} catch (Exception e) {
//				e.printStackTrace();
//				System.err.println(productNavigatorBroswerAction.class
//						.getName()
//						+ "反射出错");
//			}
////			if (pn.getFacades() != null && pn.getFacades().size() > 0)
////				ret = AsnConstLib.NavigatorFacades;
//		} else {
//			ret = AsnConstLib.NavigatorLevel0;
//		}
//		return ret;
//	}

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
}
