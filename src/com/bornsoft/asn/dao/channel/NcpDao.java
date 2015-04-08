package com.bornsoft.asn.dao.channel;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.bean.product.Product;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class NcpDao {
	
	public static Integer getNcpHotProductCount(Map m)throws SQLException{
		return (Integer)sqlMapFactory.getSqlMap().queryForObject("ncp-fronthotProductCount",m);
	}
	
	public static List<Product> ncpHotProduct(Map m)throws SQLException{
		return (List<Product>)sqlMapFactory.getSqlMap().queryForList("ncp-fronthotProduct",m); 
	}

}
