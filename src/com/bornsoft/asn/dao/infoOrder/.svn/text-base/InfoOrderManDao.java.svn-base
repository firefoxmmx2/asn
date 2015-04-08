package com.bornsoft.asn.dao.infoOrder;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.bornsoft.asn.bean.infoOrder.InfoOrderMan;
import com.bornsoft.asn.utils.common.sqlMapFactory;
import com.bornsoft.asn.vo.InfoOrderManAll;

public class InfoOrderManDao {
	public static List<InfoOrderMan> getInfoOrderManByMemberId(Long m)throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("getInfoOrderManByMemberId", m);
	}
	
	public static void insertInfoOrderMan(InfoOrderMan infoOrderMan)throws Exception{
		sqlMapFactory.getSqlMap().insert("insertInfoOrderMan",infoOrderMan);
	}
	
	public static void setInfoOrderManCancel(HashMap m)throws Exception{
		sqlMapFactory.getSqlMap().update("setInfoOrderManCancel", m);
	}
	
	public static void setInfoOrderManEmail(HashMap m) throws Exception{
		sqlMapFactory.getSqlMap().update("setInfoOrderManEmail", m);
	}
	
	public static void setInfoOrderManAllCancel(HashMap m)throws Exception{
		sqlMapFactory.getSqlMap().update("setInfoOrderManAllCancel", m);
	}
	public static List<InfoOrderManAll> getInfoOrderManAll(HashMap m)throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("getInfoOrderManAll", m);
	}
	public static Integer getInfoOrderManAllCount(HashMap m)throws Exception{
		return (Integer) sqlMapFactory.getSqlMap().queryForObject("getInfoOrderManAllCount", m);
	} 
}
