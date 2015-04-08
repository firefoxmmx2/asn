/**
 * 
 */
package com.bornsoft.asn.service.facade;


import java.util.ArrayList;
import java.sql.SQLException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.bornsoft.asn.bean.facade.ProductFacade;
import com.bornsoft.asn.dao.facade.FacadeDao;

/**
 * Facade Service
 * @author Ken Liu Kunyun
 * Created on Mar 11, 2010
 *
 */
public class FacadeService {
	/**
	 * get facade define by product type code
	 * @return
	 * @throws SQLException 
	 */
	public static List<ProductFacade> listFacadeDefineByPt(String productType) throws SQLException{
		List<ProductFacade> ret=new FacadeDao().listFacadeDefineByPt(productType);
		return ret;
	}

	/**
	 * Parse facade string to facade list
	 * @param value
	 * @return
	 */
	public static List<ProductFacade> parseFacade(String value){
		List<ProductFacade> ret=new ArrayList<ProductFacade>();
		/*
		Pattern p = Pattern.compile("##(.*?)-(.*?)::(.*?)##", 
				Pattern.CASE_INSENSITIVE | Pattern.DOTALL | Pattern.MULTILINE);
		Matcher m=p.matcher(value);
		while(m.find()){
			ret.add(new ProductFacade(m.group(1), m.group(2), m.group(3))); 
		}
		*/
		String[] list=(value+" ").split("##|::|--");
		for(int i=0; i<list.length/3; i++){
			ret.add(new ProductFacade(list[i*3+1], list[i*3+2], list[i*3+3]));
		}
		return ret;
	}
	

}
