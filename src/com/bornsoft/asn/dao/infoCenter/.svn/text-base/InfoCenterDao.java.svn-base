package com.bornsoft.asn.dao.infoCenter;

import java.util.HashMap;
import java.util.List;

import com.bornsoft.asn.bean.infoCenter.InfoCenter;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class InfoCenterDao {
	
	public static void insertInfoCenter(InfoCenter infoCenter)throws Exception{
		sqlMapFactory.getSqlMap().insert("insertInfoCenter",infoCenter);
	}
	
	public static void deleteInfoCenterById(String id)throws Exception{
		sqlMapFactory.getSqlMap().delete("deleteInfoCenterById",id);
	}
	
	public static void updateInfoCenter(InfoCenter infoCenter)throws Exception{
		sqlMapFactory.getSqlMap().update("updateInfoCenter", infoCenter);
	}
	
	public static InfoCenter getInfoCenterById(String id)throws Exception{
		return (InfoCenter) sqlMapFactory.getSqlMap().queryForObject("getInfoCenterById",id);
	} 
	
	public static List<InfoCenter> getInfoList(HashMap m)throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("getInfoList",m);
	}
	
	public static Integer getInfoListCount(HashMap m)throws Exception{
		return (Integer) sqlMapFactory.getSqlMap().queryForObject("getInfoListCount", m);
	}
	
	public static void setInfoCenterStatus(HashMap m)throws Exception{
		sqlMapFactory.getSqlMap().update("setInfoCenterStatus", m);
	}
}
