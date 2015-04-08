package com.bornsoft.asn.dao.product;

import java.util.List;

import com.bornsoft.asn.bean.product.PT2DY;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class PT2DYDao {
	public static void insertPT2DY(PT2DY p) throws Exception{
		sqlMapFactory.getSqlMap().insert("insertPT2DY",p);
	}

	public static List<PT2DY> getPT2DY(String productId) throws Exception {
		return sqlMapFactory.getSqlMap().queryForList("getPT2DY", productId);
	}

	public static void deleteList(Integer productId) throws Exception{
		sqlMapFactory.getSqlMap().delete("deleteList", productId);
		
	}
}
