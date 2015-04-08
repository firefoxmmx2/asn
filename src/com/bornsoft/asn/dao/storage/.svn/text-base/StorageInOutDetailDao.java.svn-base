package com.bornsoft.asn.dao.storage;

import java.util.List;

import com.bornsoft.asn.bean.storage.StorageInOutDetail;
import com.bornsoft.asn.utils.common.sqlMapFactory;
import com.bornsoft.asn.vo.ProductStorageDetail;

public class StorageInOutDetailDao {
	public static void insertStorageInOutDetail(StorageInOutDetail siod)throws Exception{
		sqlMapFactory.getSqlMap().insert("insertStorageInOutDetail",siod);
	}
	public static List<ProductStorageDetail> getStorageInOutDetailByParentId(Integer pid)throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("getStorageInOutDetailByParentId", pid);
	}
}
