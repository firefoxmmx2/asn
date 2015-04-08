package com.bornsoft.asn.utils.common.productNavi;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.bornsoft.asn.bean.productType.ProductType;
import com.bornsoft.asn.service.productType.ProductTypeService;
import com.bornsoft.asn.utils.common.PropertyFactory;
import com.bornsoft.asn.utils.common.WebContext;

public class ProductNaviTypeRoot implements ProductTypeIf {
	public Map getProductType(String typeCode) {
		Map map = new HashMap();
		List<ProductType> ptFirstL = null;
		List<ProductType> ptSecL = null;
		List<ProductType> ptThrL = null;
		try {
			ptFirstL = ProductTypeService.getFirstProductType();
			ptSecL = ProductTypeService.getSecondProductType();
			ptThrL = ProductTypeService.getThirdProductType();
			map.put("ptFirstL", ptFirstL);
			map.put("ptSecL", ptSecL);
			map.put("ptThrL", ptThrL);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return map;
	}
	
	public void init(String url,String typeCode, String... para) {
		Map m = getProductType(null);
		if(url == null || url.equals("")){
			url = WebContext.fullUrl(PropertyFactory.getDefaultProperty().getProperty("asn.product.searchUrl"));
		}
		else{
			url = WebContext.fullUrl(url); 
			url = ProductNavigatorService.getUrl(url, para);
		}
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("ptL", m);
		req.setAttribute("url0", url);
	}

	public Map getProductType(String typeCode, String facade) {
		// TODO Auto-generated method stub
		return null;
	}

	public void init(String url, String typeCode, String facade, String... para) {
		// TODO Auto-generated method stub
		
	}
}
