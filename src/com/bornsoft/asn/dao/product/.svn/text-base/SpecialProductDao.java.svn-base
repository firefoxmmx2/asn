package com.bornsoft.asn.dao.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.bean.product.SpecialProduct;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class SpecialProductDao {
	public static void insertSpecialProduct(SpecialProduct sp)throws Exception{
		sqlMapFactory.getSqlMap().insert("insertSpecialProduct",sp);
	}
	
	public static void deleteSpecialProductById(String id)throws Exception{
		sqlMapFactory.getSqlMap().delete("deleteSpecialProductById", id);
	}
	
	public static void updateSpecialProduct(SpecialProduct sp)throws Exception{
		sqlMapFactory.getSqlMap().update("updateSpecialProduct", sp);
	}
	
	public static List<SpecialProduct> getSpecialProductList(HashMap m) throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("getSpecialProductList", m);
	}
	
	public static Integer getSpecialProductListCount(HashMap m)throws Exception{
		return (Integer) sqlMapFactory.getSqlMap().queryForObject("getSpecialProductListCount", m);
	}

	public static SpecialProduct getSpecialProductById(String id)throws Exception {
		return (SpecialProduct) sqlMapFactory.getSqlMap().queryForObject("getSpecialProductById",id);
	}
	
	public static List<SpecialProduct> getSpecialProductList1(HashMap m) throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("getSpecialProductList1", m);
	}
	
	public static void updateSnumber(Map m) throws Exception{
		sqlMapFactory.getSqlMap().update("updateSnumber", m);
	}
}
