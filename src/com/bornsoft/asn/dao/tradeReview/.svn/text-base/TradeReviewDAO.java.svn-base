package com.bornsoft.asn.dao.tradeReview;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.tradeReview.TradeReview;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class TradeReviewDAO {
	public static void insert(TradeReview tr) throws SQLException{
		try{
			sqlMapFactory.getSqlMap().insert("insertTr", tr);
		}catch (Exception e) {
			// TODO: handle exception
			Logger log = Logger.getLogger(TradeReviewDAO.class);
			log.error("插入一个评价信息 错误 DAO", e );
			throw new SQLException(e);
		}
	}
	
	public static void update(TradeReview tr) throws SQLException{
		try{
			sqlMapFactory.getSqlMap().update("updateTr",tr);
		}catch (Exception e) {
			// TODO: handle exception
			Logger log = Logger.getLogger(TradeReviewDAO.class);
			log.error("更改一个评价信息 错误 DAO", e);
			throw new SQLException(e);
		}
		
	}
	@SuppressWarnings("unchecked")
	public static List get(Map m) throws SQLException{
		try{
			return sqlMapFactory.getSqlMap().queryForList("getTr", m);
		}catch (Exception e) {
			// TODO: handle exception
			Logger log = Logger.getLogger(TradeReviewDAO.class);
			log.error("获取评价信息 错误 DAO",e );
			throw new SQLException(e);
		}
	}
	
	public static void delete(long trId) throws SQLException{
		try{
			sqlMapFactory.getSqlMap().delete("deleteTr",trId);
		}catch (Exception e) {
			// TODO: handle exception
			Logger log = Logger.getLogger(TradeReviewDAO.class);
			log.error("删除评价信息出错");
			throw new SQLException(e);
		}
	}
}
