package com.bornsoft.asn.dao.storage;

import java.util.HashMap;
import java.util.List;

import com.bornsoft.asn.bean.storage.StorageInOut;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class StorageInOutDao {
	public static void insertStorageInOut(StorageInOut sio)throws Exception{
		sqlMapFactory.getSqlMap().insert("insertStorageInOut",sio);
	}
	public static List<StorageInOut> getStorageInOutByProductId(HashMap m)throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("getStorageInOutByProductId", m);
	}
	public static Integer getStorageInOutByProductIdCount(HashMap m)throws Exception{
		return (Integer) sqlMapFactory.getSqlMap().queryForObject("getStorageInOutByProductIdCount", m);
	}
	public static StorageInOut getStorageInOutById(Integer id)throws Exception{
		return (StorageInOut) sqlMapFactory.getSqlMap().queryForObject("getStorageInOutById",id);
	}
}
