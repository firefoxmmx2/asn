package com.bornsoft.asn.utils.json;

import flexjson.JSONSerializer;



/**
 * Json converter  
 * @author Ken Liu Kunyun 
 * Create on Feb 26, 2010
 */
public class Json {
	
	public static String getString(Object obj) {
		return new JSONSerializer().serialize(obj);
	}

	/**
	 * get string 
	 * @param obj
	 * @param excludeList delimeter by comma(,)
	 * @return
	 */
	public static String getString(Object obj, String excludeList) {
		JSONSerializer ser=new JSONSerializer();
		String[] prop=excludeList.split(",");
		for(String p : prop){
			ser=ser.exclude(p);
		}
		return ser.serialize(obj);
	}

}
