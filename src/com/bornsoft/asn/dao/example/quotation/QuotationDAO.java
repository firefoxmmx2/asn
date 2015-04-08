package com.bornsoft.asn.dao.example.quotation;

import java.util.List;

import com.bornsoft.asn.bean.example.quotation.Quotation;
import com.bornsoft.asn.utils.common.sqlMapFactory;

/**
 * package的命名规则 com.bornsoft.asn.分成名称或者工具名词.模块名
 * */
public class QuotationDAO {
	public static void insertQuotation(Quotation tt) throws Exception {
		sqlMapFactory.getSqlMap().insert("insertQuotation", tt);
	}
	
	public static void deleteQuotation(int quotationCode) throws Exception {
		sqlMapFactory.getSqlMap().delete("deleteQuotation", quotationCode);
	}
	
	public static void updateQuotation(Quotation tt) throws Exception {
		sqlMapFactory.getSqlMap().update("updateQuotation", tt);
	}
	
	public static Quotation getQuotationByCode(int quotationCode) throws Exception {
		return (Quotation) sqlMapFactory.getSqlMap().queryForObject("getQuotation", quotationCode);
	}
	
	public static List<Quotation> getQuotationList() throws Exception {
		return sqlMapFactory.getSqlMap().queryForList("getQuotationList");
	}
}
