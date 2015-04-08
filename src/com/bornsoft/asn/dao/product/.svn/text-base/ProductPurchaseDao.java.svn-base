package com.bornsoft.asn.dao.product;


import java.util.HashMap;
import java.util.List;

import com.bornsoft.asn.bean.product.ProductPurchase;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class ProductPurchaseDao {

	public static void insertProductPurchase(ProductPurchase pp) throws Exception{
		sqlMapFactory.getSqlMap().insert("insertProductPurchase",pp);
	}
	public static int getProductPurchaseListCount(HashMap m) throws Exception{
		return (Integer) sqlMapFactory.getSqlMap().queryForObject("getProductPurchaseCount",m);
	}
	public static List<ProductPurchase> getProductPurchaseList(HashMap m)throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("getProductPurchaseList", m);
	}
	public static ProductPurchase getProductPurchase(Integer purchaseId)throws Exception{
		return (ProductPurchase) sqlMapFactory.getSqlMap().queryForObject("getProductPurchase",purchaseId);
	}
	public static void updateProductPurchase(ProductPurchase productPurchase)throws Exception{
		sqlMapFactory.getSqlMap().update("updateProductPurchase", productPurchase);
	}
	public static void setProductPurchaseStatus(HashMap m)throws Exception{
		sqlMapFactory.getSqlMap().update("setProductPurchaseStatus", m);
	}
	public static int getSearchProductPurchaseListCount(HashMap m)throws Exception{
		return (Integer) sqlMapFactory.getSqlMap().queryForObject("getSearchProductPurchaseCount",m);
	} 
	public static List<ProductPurchase> searchProductPurchaseList(HashMap m)throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("searchProductPurchaseList",m);
	}
	public static void deleteProductPurchaseByMemberId(Integer memberId)throws Exception{
		sqlMapFactory.getSqlMap().delete("deleteProductPurchaseByMemberId", memberId);
	}
}
