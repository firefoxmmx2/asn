package com.bornsoft.asn.utils.common.productNavi;

import java.util.Map;

public interface ProductTypeIf {
	
	public Map getProductType(String typeCode);
	public Map getProductType(String typeCode, String facade);
	public void init(String url,String typeCode ,String[] para);
	public void init(String url,String typeCode, String facade, String[] para);
}
