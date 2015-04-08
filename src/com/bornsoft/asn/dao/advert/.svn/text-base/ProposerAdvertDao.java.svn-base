package com.bornsoft.asn.dao.advert;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.bean.advert.Advert;
import com.bornsoft.asn.bean.advert.proposerAdvert;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class ProposerAdvertDao {
	
	/**
	 * list
	 * */
	public static List<Advert> listAdvert(Map m)throws SQLException{
		return (List<Advert>)sqlMapFactory.getSqlMap().queryForList("listAdvert-pa", m);
	}
	
	/****
	 * search count
	 * **/
	public static Integer getAdvertCount(Map m)throws SQLException{
		return (Integer)sqlMapFactory.getSqlMap().queryForObject("getAdvertCount-pa", m);
	}
	
	
	/****
	 * insert
	 * **/
	public static void insertProposerAdvert(proposerAdvert p)throws SQLException{
		sqlMapFactory.getSqlMap().insert("insertProposerAdvert", p);
	}
	
	/****
	 * update status
	 * **/
	public static void updateStatus(Map m)throws SQLException{
		sqlMapFactory.getSqlMap().update("updateHandleStatus", m);
	}
	
	/****
	 * update status
	 * **/
	public static proposerAdvert getProposerAdvertById(Map m)throws SQLException{
		return (proposerAdvert)sqlMapFactory.getSqlMap().queryForObject("getProposerAdvertById-pa", m);
	}
	
	/****
	 * update status
	 * **/
	public static List<proposerAdvert> getProposerAdvertById(Long id)throws SQLException{
		return (List<proposerAdvert>)sqlMapFactory.getSqlMap().queryForList("getProposerAdvertById", id);
	}
	
	
}
