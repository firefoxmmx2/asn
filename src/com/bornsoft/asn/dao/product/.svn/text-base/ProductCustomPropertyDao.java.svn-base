package com.bornsoft.asn.dao.product;

import java.util.List;

import com.bornsoft.asn.bean.product.ProductCustomProperty;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class ProductCustomPropertyDao {
	public static void insertProductCustomProperty(ProductCustomProperty pcp) throws Exception{
		sqlMapFactory.getSqlMap().insert("insertProductCustomProperty", pcp);
	}

	public static List<ProductCustomProperty> getProductCustomPropertyList(Integer productId)throws Exception {
		return sqlMapFactory.getSqlMap().queryForList("getProductCustomPropertyList", productId);
	}

	public static void deleteProductCustomPropertyList(Integer productId)throws Exception{
		sqlMapFactory.getSqlMap().delete("deleteProductCustomPropertyList",productId);
		
	}
}
