package com.bornsoft.asn.action.productType;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.bean.productType.ProductType;
import com.bornsoft.asn.service.productType.ProductTypeService;
import com.bornsoft.asn.utils.common.AsnConstLib;
import com.bornsoft.asn.utils.common.WebContext;
import com.bornsoft.asn.utils.common.productNavi.ProductNavigatorService;
import com.bornsoft.asn.utils.common.productNavi.ProductTypeIf;
import com.opensymphony.xwork2.ActionSupport;

public class ProductTypeRootAction extends ActionSupport{
	public String execute() throws Exception {
//		ProductTypeIf ptif = ProductNavigatorService.getNaviType(AsnConstLib.NavigatorLevel0);
//		ptif.init("~/front/cate1", null	, new String[]{"1=1"});
		String url0 = "~/front/cate1";
		url0 = WebContext.fullUrl(url0);
		url0 = ProductNavigatorService.getUrl(url0, new String[] {"1=1"});
		Map m = getNaviType();
		WebContext.getRequest().setAttribute("ptL", m);
		WebContext.getRequest().setAttribute("url0", url0);
		return SUCCESS;
	}
	
	private Map getNaviType(){
		Map map = new HashMap();
		List<ProductType> ptFirstL = null;
		List<ProductType> ptSecL = null;
		try {
			ptFirstL = ProductTypeService.getFirstProductTypeByPriority(1);
			ptSecL = ProductTypeService.getSecondProductTypeByPriority(1);
			map.put("ptFirstL", ptFirstL);
			map.put("ptSecL", ptSecL);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

}

