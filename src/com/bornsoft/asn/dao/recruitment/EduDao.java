package com.bornsoft.asn.dao.recruitment;

import com.bornsoft.asn.bean.recruitment.Edu;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class EduDao {
	public static void insertEmployee(Edu e)throws Exception{
		sqlMapFactory.getSqlMap().insert("insertEdu",e);
	}
	public static void deleteEduByEid(String id) throws Exception{
		sqlMapFactory.getSqlMap().delete("deleteEduByEid", id);
	}
	public static Edu getEduByEid(String eid)throws Exception{
		return (Edu) sqlMapFactory.getSqlMap().queryForObject("getEduByEid", eid);
	}
}
