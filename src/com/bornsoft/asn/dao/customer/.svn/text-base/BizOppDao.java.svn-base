package com.bornsoft.asn.dao.customer;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.util.HashMap;
import java.util.List;

import oracle.sql.BLOB;

import com.bornsoft.asn.bean.bizOpp.SaleSource;
import com.bornsoft.asn.utils.common.sqlMapFactory;
import com.bornsoft.asn.vo.BizOpp;
import com.bornsoft.asn.vo.ProductPriceLog;

public class BizOppDao {
	public static List<BizOpp> getBizOppList(HashMap m)throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("getBizOppList",m);
	}
	public static Integer getBizOppListCount(HashMap m)throws Exception{
		return (Integer) sqlMapFactory.getSqlMap().queryForObject("getBizOppListCount",m);
	}
	public static List<ProductPriceLog> getProductListLog(HashMap m) throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("getProductPriceLogList",m);
	}
	public static Integer getProductListLogCount(HashMap m) throws Exception{
		return (Integer) sqlMapFactory.getSqlMap().queryForObject("getProductPriceLogListCount",m);
	}
	public static void insertSaleSource(SaleSource ss)throws Exception{
		sqlMapFactory.getSqlMap().insert("insertSaleSource", ss);
	}
	public static void deleteSaleSource(Long id)throws Exception{
		sqlMapFactory.getSqlMap().delete("deleteSaleSource", id);
	}
	public static void updateSaleSource(SaleSource ss)throws Exception{
		sqlMapFactory.getSqlMap().update("updateSaleSource", ss);
	}
	public static SaleSource getSaleSource(Long id)throws Exception{
		return (SaleSource) sqlMapFactory.getSqlMap().queryForObject("getSaleSource", id);
	}
	public static List<SaleSource> getSaleSourceList(HashMap m)throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("getSaleSourceList",m);
	}
	public static Integer getSaleSourceListCount(HashMap m)throws Exception{
		return (Integer) sqlMapFactory.getSqlMap().queryForObject("getSaleSourceListCount", m);
	}
	
	
}
