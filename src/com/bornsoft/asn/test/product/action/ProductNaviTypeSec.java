package com.bornsoft.asn.test.product.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.bornsoft.asn.bean.productType.ProductType;
import com.bornsoft.asn.service.productType.ProductTypeService;
import com.bornsoft.asn.utils.common.PropertyFactory;
import com.bornsoft.asn.utils.common.WebContext;

public class ProductNaviTypeSec implements ProductTypeIf {

	public Map getProductType(String typeCode) {
		List<ProductType> pttL = new ArrayList<ProductType>();
		ProductType pts = null;
		Map m = new HashMap();
		
		try{
			pts = ProductTypeService.getProductTypeByCode2(typeCode);
			pttL = ProductTypeService.getThirdProductType();
			m.put("pts2", pts);
			m.put("pttL2", pttL);
		}catch(Exception e){
			e.printStackTrace();
			System.err.println("得到3级列表出错");
		}
		return m;
	}

	public void init(String url, String[] para) {
		init(url,null,para);
	}

	public void init(String url, String typeCode, String[] para) {
		Map m = getProductType(typeCode);
		if(url == null || url.equals("")){
			url = WebContext.fullUrl(PropertyFactory.getDefaultProperty().getProperty("asn.product.searchUrl"));
		}
		else{
			url = WebContext.fullUrl(url); 
			url = ProductNavigatorService.getUrl(url, para);
		}
		HttpServletRequest req = ServletActionContext.getRequest();
//		req.setAttribute("ptL", m);
		req.setAttribute("pts2", m.get("pts2"));
		req.setAttribute("pttL2", m.get("pttL2"));
		req.setAttribute("url2", url);
	}

	public Map getProductType(String typeCode, String facade) {
		// TODO Auto-generated method stub
		return null;
	}

	public void init(String url, String typeCode, String facade, String[] para) {
		// TODO Auto-generated method stub
		
	}
}
