package com.bornsoft.asn.dao.product;

import java.util.HashMap;
import java.util.List;

import com.bornsoft.asn.bean.product.ProductSupply;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class ProductSupplyDao {
	public static void insertProductSupply(ProductSupply ps) throws Exception{
		sqlMapFactory.getSqlMap().insert("insertProductSupply", ps);
	}
	public static void deleteProductSupply(Integer productId)throws Exception{
		sqlMapFactory.getSqlMap().delete("deleteProductSupply", productId);
	}
	public static void updateProductSupply(ProductSupply ps)throws Exception{
		sqlMapFactory.getSqlMap().update("updateProductSupply", ps);
	}
	public static ProductSupply getProductSupply(Integer productId) throws Exception{
		return (ProductSupply) sqlMapFactory.getSqlMap().queryForObject("getProductSupply", productId);
	}
	public static List<ProductSupply> getProductSuppluList(Integer supplierId) throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("getProductSupplyList", supplierId);	
	}
	public static List<ProductSupply> getProductSuppluListOn(Integer supplierId) throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("getProductSupplyListOn", supplierId);	
	}
	public static void setProductSupplyOff(Integer productId) throws Exception{
		sqlMapFactory.getSqlMap().update("setProductSupplyOff", productId);
	}
	public static int getProductSupplyCountOn(Integer supplierId) throws Exception{
		return ((Integer)sqlMapFactory.getSqlMap().queryForObject("getProductSupplyCountOn", supplierId)).intValue();
	}
	public static List<ProductSupply> getProductSuppluListOnPage(HashMap<String,Integer> hashMap) throws Exception{	
		return sqlMapFactory.getSqlMap().queryForList("getProductSuppluListOnPage", hashMap);	
	}
	public static List<ProductSupply> getProductSuppluListOffPage(HashMap<String,Integer> hashMap) throws Exception{	
		return sqlMapFactory.getSqlMap().queryForList("getProductSuppluListOffPage", hashMap);	
	}
	public static int getProductSupplyCountOff(Integer supplierId) throws Exception{
		return ((Integer)sqlMapFactory.getSqlMap().queryForObject("getProductSupplyCountOff", supplierId)).intValue();
	}
	public static void setProductSupplyOn(Integer productId) throws Exception{
		sqlMapFactory.getSqlMap().update("setProductSupplyOn", productId);
	}
	public static int getProductSupplyCountSearch(HashMap hashMap) throws Exception{
		return ((Integer)sqlMapFactory.getSqlMap().queryForObject("getProductSupplyCountSearch", hashMap)).intValue();
	}
	public static List<ProductSupply> getProductSupplyListPageSearch(HashMap m) throws Exception {
		return sqlMapFactory.getSqlMap().queryForList("getProductSupplyListPageSearch", m);
	}
	public static void setProductSupplyStatus(HashMap m) throws Exception{
		sqlMapFactory.getSqlMap().update("setProductSupplyStatus", m);
	}
	public static void deleteProductSupplyBySupplierId(Integer supplierId)throws Exception{
		sqlMapFactory.getSqlMap().delete("deleteProductSupplyBySupplierId", supplierId);
	}
}
