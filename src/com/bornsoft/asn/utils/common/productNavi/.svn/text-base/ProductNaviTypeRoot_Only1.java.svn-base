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

public class ProductNaviTypeRoot_Only1 implements ProductTypeIf
{

	public Map getProductType(String typeCode)
	{
		Map<String,Object> map = new HashMap<String,Object>();
		List<ProductType> ptfL = null;
		
		try{
			ptfL = ProductTypeService.getFirstProductType();
			map.put("cur", "所有分类");
			map.put("ptfL", ptfL);
		}catch(Exception e){
			e.printStackTrace();
			System.err.println("得到1级列表出错");
		}
		return map;
	}

	public Map getProductType(String typeCode, String facade)
	{
		
		return null;
	}

	public void init(String url, String typeCode, String[] para)
	{
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
		req.setAttribute("ptf1", m.get("cur"));
		req.setAttribute("ptfL1", m.get("ptfL"));
		req.setAttribute("url1", url);
	}

	public void init(String url, String typeCode, String facade, String[] para)
	{
	}
	
}
