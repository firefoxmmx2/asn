package com.bornsoft.asn.dao.recruitment;

import com.bornsoft.asn.bean.recruitment.Purpose;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class PurposeDao {
	public static void insertPurpose(Purpose p)throws Exception{
		sqlMapFactory.getSqlMap().insert("insertPurpose",p);
	}
	public static void deletePurposeByEid(String id) throws Exception{
		sqlMapFactory.getSqlMap().delete("deletePurposeByEid", id);
	}
	public static Purpose getPurposeByEid(String eid)throws Exception{
		return (Purpose) sqlMapFactory.getSqlMap().queryForObject("getPurposeByEid", eid);
	}
}
