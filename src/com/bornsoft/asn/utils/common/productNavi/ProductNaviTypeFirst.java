package com.bornsoft.asn.utils.common.productNavi;

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

public class ProductNaviTypeFirst implements ProductTypeIf {

	public Map getProductType(String typeCode) {
		Map m = new HashMap();
		ProductType ptf = null;
		List<ProductType> pttL = new ArrayList<ProductType>();
		List<ProductType> ptsL = new ArrayList<ProductType>();
		if (typeCode == null)
			return null;
		try {
			ptf = ProductTypeService.getProductTypeByCode2(typeCode);
			List<ProductType> ptsLt = ProductTypeService.getSecondProductType();
			List<ProductType> pttLt = ProductTypeService.getThirdProductType();
			for (ProductType pts : ptsLt) {
				if (pts.getPtparentid() == ptf.getPtid()) {
					ptsL.add(pts);
					for (ProductType ptt : pttLt) {
						if (ptt.getPtparentid() == pts.getPtid()) {
							pttL.add(ptt);
						}
					}
				}
			}
			pttLt.clear();
			ptsLt.clear();
			
			m.put("ptf", ptf);
			m.put("pttL", pttL);
			m.put("ptsL", ptsL);
			
			return m;

		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("获取导航用2级3级产品类型列表~~出错");
		}

		return null;
	}

	public void init(String url, String typeCode, String... para) {
		Map m = getProductType(typeCode);
		if(url == null || url.equals("")){
			url = WebContext.fullUrl(PropertyFactory.getDefaultProperty().getProperty("asn.product.searchUrl"));
		}
		else{
			url = WebContext.fullUrl(url); 
			url = ProductNavigatorService.getUrl(url, para);
		}
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("url1", url);
		req.setAttribute("ptf1", m.get("ptf"));
		req.setAttribute("pttL1", m.get("pttL"));
		req.setAttribute("ptsL1", m.get("ptsL"));
//		req.setAttribute("ptsM", m);
	}

	public Map getProductType(String typeCode, String facade) {
		// TODO Auto-generated method stub
		return null;
	}

	public void init(String url, String typeCode, String facade, String... para) {
		// TODO Auto-generated method stub
		
	}

}
