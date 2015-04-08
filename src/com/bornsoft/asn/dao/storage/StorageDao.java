package com.bornsoft.asn.dao.storage;

import java.util.HashMap;
import java.util.List;

import com.bornsoft.asn.utils.common.sqlMapFactory;
import com.bornsoft.asn.vo.ProductStorage;

public class StorageDao {
	public static List<ProductStorage> getStorageList(HashMap m) throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("getStorageList", m);
	};
	public static Integer getStorageListCount(HashMap m) throws Exception{
		return (Integer) sqlMapFactory.getSqlMap().queryForObject("getStorageListCount", m);
	}
	public static ProductStorage getStorageById(Integer i)throws Exception{
		return (ProductStorage) sqlMapFactory.getSqlMap().queryForObject("getStorageById", i);
	}
	public static void updateStorage(HashMap m)throws Exception{
		sqlMapFactory.getSqlMap().update("updateStorage", m);
	}
}
