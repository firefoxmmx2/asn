package com.bornsoft.asn.utils.common.productNavi;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.bornsoft.asn.bean.facade.ProductFacade;
import com.bornsoft.asn.service.facade.FacadeService;
import com.bornsoft.asn.utils.common.PropertyFactory;
import com.bornsoft.asn.utils.common.WebContext;

public class ProductNaviTypeFac implements ProductTypeIf {

	public Map getProductType(String typeCode) {
		Map m = new HashMap();
		List<ProductFacade> facList = new ArrayList();
		
		try {
			List<ProductFacade> facLists = FacadeService.listFacadeDefineByPt(typeCode);
			for(ProductFacade pf : facLists) {
				if(pf.getOptions() == null || pf.getOptions().equals(""))
					continue;
				String[] options = pf.getOptions().split(";");
				for(int i=0; i<options.length ;i++) {
					String opt = pf.getDefineId()+"::"+options[i]+"##";
					opt = URLEncoder.encode(opt, "utf-8");
					opt = URLEncoder.encode(opt, "utf-8");
					options[i] = opt;
				}
				
				String option = Arrays.toString(options);
				option = option.replaceAll(", ", ";");
				option = option.substring(1,option.length()-1);
				pf.setValue(option);
				facList.add(pf);
			}
			m.put("facListf", facList);
		}catch(Exception e){
			e.printStackTrace();
			System.err.println(ProductNaviTypeFac.class.getName()+": 获得指定TYPECODE立面出错");
			return null;
		}
		return m;
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
		req.setAttribute("facListf", m.get("facListf"));
		req.setAttribute("urlf", url);
	}


	public Map getProductType(String typeCode, String facade) {
		// TODO Auto-generated method stub
		return null;
	}


	public void init(String url, String typeCode, String facade, String[] para) {
		// TODO Auto-generated method stub
		
	}
		
}
