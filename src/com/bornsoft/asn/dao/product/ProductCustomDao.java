package com.bornsoft.asn.dao.product;

import java.sql.SQLException;
import java.util.List;

import com.bornsoft.asn.bean.product.ProductCustom;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class ProductCustomDao {

	public static void insertProductCustom(ProductCustom pc) throws Exception{
		sqlMapFactory.getSqlMap().insert("insertProductCustom", pc);
	}
	
	public static void deleteProductCustomList(Integer productId) throws Exception{
		sqlMapFactory.getSqlMap().delete("deleteProductCustomList", productId);
	}

	public static List<ProductCustom> getProductCustomList(Integer productId)throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("getProductCustomList", productId);
	}
	
}
