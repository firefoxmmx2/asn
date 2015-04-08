package com.bornsoft.asn.dao.recruitment;

import com.bornsoft.asn.bean.recruitment.Experience;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class ExperienceDao {
	public static void insertExperience(Experience e)throws Exception{
		sqlMapFactory.getSqlMap().insert("insertExperience",e);
	}
	public static void deleteExperienceByEid(String id) throws Exception{
		sqlMapFactory.getSqlMap().delete("deleteExperienceByEid", id);
	}
	public static Experience getExperienceByEid(String eid)throws Exception{
		return (Experience) sqlMapFactory.getSqlMap().queryForObject("getExperienceByEid", eid);
	}
}
