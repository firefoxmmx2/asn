package com.bornsoft.asn.dao.advert;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.bean.advert.Advert;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class AdvertDao {
	
	/****
	 * insert
	 * **/
	public static void insertAdvert(Advert advert)throws SQLException{
		sqlMapFactory.getSqlMap().insert("insertAdvert", advert);
	}

	/****
	 * search list
	 * **/
	public static List<Advert> listAdvert(Map m)throws SQLException{
		return (List<Advert>)sqlMapFactory.getSqlMap().queryForList("listAdvert", m);
	}
	
	/****
	 * search count
	 * **/
	public static Integer getAdvertCount(Map m)throws SQLException{
		return (Integer)sqlMapFactory.getSqlMap().queryForObject("getAdvertCount", m);
	}
	
	public static void updAdvertStatus(Map m) throws SQLException{
		sqlMapFactory.getSqlMap().update("updAdvertStatus", m);
	}
	
	public static Advert getAdvertById(Long id)throws SQLException{
		return (Advert)sqlMapFactory.getSqlMap().queryForObject("getAdvertById", id);
	}
	
	/****
	 * update status
	 * **/
	public static void updateAdvertHandleStatus(Map m)throws SQLException{
		sqlMapFactory.getSqlMap().update("updAdvertHandleStatus", m);
	}
	
	public static void updateAdvert(Advert advert)throws SQLException{
		sqlMapFactory.getSqlMap().update("updateAdvert", advert);
	}
}
