package com.bornsoft.asn.dao.recruitment;

import java.util.HashMap;
import java.util.List;

import com.bornsoft.asn.bean.recruitment.Recruitment;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class RecruitmentDao {
	public static void insertRecruitment(Recruitment r)throws Exception{
		sqlMapFactory.getSqlMap().insert("insertRecruitment",r);
	}
	public static Integer getRecruitmentListCount(HashMap m)throws Exception{
		return  (Integer) sqlMapFactory.getSqlMap().queryForObject("getRecruitmentListCount", m);
	}
	public static List<Recruitment> getRecruitmentList(HashMap m)throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("getRecruitmentList", m);
	}
	public static void setRecruitmentStatus(HashMap m) throws Exception {
		sqlMapFactory.getSqlMap().update("setRecruitmentStatus", m);	
	}
	public static Recruitment getRecruitmentById(String id) throws Exception {
		return (Recruitment) sqlMapFactory.getSqlMap().queryForObject("getRecruitmentById", id);
	}
	public static void updateRecruitment(Recruitment r) throws Exception {
		sqlMapFactory.getSqlMap().update("updateRecruitment", r);	
	}
	public static void setRecruitmentPublishedTime(HashMap m) throws Exception{
		sqlMapFactory.getSqlMap().update("setRecruitmentPublishedTime", m);	
	}
}
