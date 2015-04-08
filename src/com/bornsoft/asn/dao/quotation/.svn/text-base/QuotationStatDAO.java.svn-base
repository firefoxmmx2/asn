package com.bornsoft.asn.dao.quotation;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.quotation.QuotationInfoStat;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class QuotationStatDAO {
	public static void insert(QuotationInfoStat q) throws Exception {
		try{
			sqlMapFactory.getSqlMap().insert("insertQuoStat", q);
		}catch (Exception e) {
			Logger log = Logger.getLogger(QuotationStatDAO.class);
			log.error("行情统计信息 插入出错", e);
			throw e;
		}
	}
	
	public static void delete(int statcode) throws Exception {
		try {
			sqlMapFactory.getSqlMap().delete("deleteQuoStatByStatcode", statcode);
		}catch (Exception e) {
			Logger log = Logger.getLogger(QuotationStatDAO.class);
			log.error("行情统计信息 删除出错", e);
			throw new SQLException(e);
		}
	}
	
	public static void update(QuotationInfoStat q) throws Exception {
		try {
			sqlMapFactory.getSqlMap().update("updateQuoStat", q);
		}catch (Exception e) {
			Logger log = Logger.getLogger(QuotationStatDAO.class);
			log.error("行情统计信息 更新出错", e);
			throw new SQLException(e);
		}
	}
	
	public static QuotationInfoStat get(int statcode) throws Exception {
		try{
			return (QuotationInfoStat) sqlMapFactory.getSqlMap().queryForObject("getQuoStatByid", statcode);
		}catch (Exception e) {
			Logger log = Logger.getLogger(QuotationStatDAO.class);
			log.error("行情统计信息 单个查询出错", e);
			throw new SQLException(e);
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public static List<QuotationInfoStat> getAllList() throws Exception {
		try {
			return sqlMapFactory.getSqlMap().queryForList("getQuoStatAllList");
		}catch (Exception e) {
			Logger log = Logger.getLogger(QuotationStatDAO.class);
			log.error("行情统计信息 列表查询出错", e);
			throw new SQLException(e);
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public static List<QuotationInfoStat> get(Map<String,Object> map) throws Exception{
		try
		{
			return sqlMapFactory.getSqlMap().queryForList("getQuotationStat", map);
		}
		catch (Exception e)
		{
			// TODO: handle exception
			Logger log = Logger.getLogger(QuotationStatDAO.class);
			log.error(e);
			throw e;
		}
	}
}
