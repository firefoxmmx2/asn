package com.bornsoft.asn.service.example.quotation;

import java.util.List;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.example.quotation.Quotation;
import com.bornsoft.asn.dao.example.quotation.QuotationDAO;
import com.bornsoft.asn.utils.common.sqlMapFactory;

/**
 * package的命名规则 com.bornsoft.asn.分成名称或者工具名词.模块名
 * */
public class QuotationService {
	public static void insertQuotation(Quotation tt) throws Exception {
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			QuotationDAO.insertQuotation(tt);
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			// TODO: handle exception
			Logger log = Logger.getLogger("QuotationService");
			log.info("插入行情出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	public static void updateQuotation(Quotation tt) throws Exception{
		try {
			sqlMapFactory.getSqlMap().startTransaction();
			QuotationDAO.updateQuotation(tt);
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch(Exception e) {
			Logger log = Logger.getLogger("QuotationService");
			log.info("更改行情信息出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally {
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	public static void deleteQuotation(Quotation tt) throws Exception {
		try {
			sqlMapFactory.getSqlMap().startTransaction();
			QuotationDAO.deleteQuotation(tt.getQuotationCode());
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch(Exception e) {
			Logger log = Logger.getLogger("QuotationService");
			log.info("删除行情出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally {
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	public static Quotation getQuotation(Quotation tt) {
		
		try {
			return QuotationDAO.getQuotationByCode(tt.getQuotationCode());
		}catch(Exception e) {
			Logger log = Logger.getLogger("QuotationService");
			log.info("获得单个行情信息出错", e);
			return null;
		}
	}
	
	public static List<Quotation> getQuotationList() {
		try {
			return QuotationDAO.getQuotationList();
		}catch(Exception e) {
			Logger log = Logger.getLogger("QuotationService");
			log.info("获取行情信息列表出错", e);
			return null;
		}
		
	}
}
