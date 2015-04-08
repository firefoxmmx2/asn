package com.bornsoft.asn.dao.productType;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.productType.ProductType;
import com.bornsoft.asn.utils.common.sqlMapFactory;


public class ProductTypeDao {
	public static List<ProductType> getFirstProductType() throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("selectFirstProductType");		
	}
	
	public static List<ProductType> getSecondProductType() throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("selectSecondProductType");		
	}
	
	public static List<ProductType> getThirdProductType() throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("selectThirdProductType");		
	}
	
	public static ProductType getProductTypeByCode(String productTypeCode) throws Exception{
		return (ProductType)sqlMapFactory.getSqlMap().queryForObject("getProductTypeByCode", productTypeCode);
	}

	//++ add by hooxin -- 10.3.24
	/**
	 * 获取三级分类 通过优先级
	 * @param priority 优先级
	 * @return
	 * @throws Exception
	 */
	public static List<ProductType> getThirdProductTypeByPriority(int priority) throws Exception {
		return sqlMapFactory.getSqlMap().queryForList("selectThirdProductTypeByPriority",priority);
	}
	
	/**
	 * 按照优先级获得一级分类
	 * @param priority 优先级
	 * @return
	 * @throws Exception
	 */
	public static List<ProductType> getFirstProductTypeByPriority(int priority) throws Exception {
		return sqlMapFactory.getSqlMap().queryForList("selectFirstProductTypeByPriority", priority);
	}
	
	/**
	 * 按照优先级获得二级分类
	 * @param priority 优先级
	 * @return
	 * @throws Exception
	 */
	public static List<ProductType> getSecondProductTypeByPriority(int priority) throws Exception {
		return sqlMapFactory.getSqlMap().queryForList("selectSecondProductTypeByPriority", priority);
	}
	//--end by hooxin
	
	//+++ add by hooxin -- 10.3.29
	/**
	 * 插入一个产品分类
	 * @param pt 产品分类
	 * @throws Exception
	 */
	public static void insert(ProductType pt) throws Exception {
		try{
			sqlMapFactory.getSqlMap().insert("insertType", pt);
		}catch (Exception e) {
			Logger log = Logger.getLogger(ProductTypeDao.class.getName());
			log.error("插入产品分类 出错DAO", e);
			throw new SQLException(e);
		}
	}
	
	/**
	 * 更新一个产品分类
	 * @param pt 产品分类
	 * @throws Exception
	 */
	public static void update(ProductType pt) throws Exception {
		try{
			sqlMapFactory.getSqlMap().update("updateType", pt);
		}catch (Exception e) {
			Logger log = Logger.getLogger(ProductTypeDao.class.getName());
			log.error("更新产品分类 出错DAO",e);
			throw new SQLException(e);
		}
	}
	
	/**
	 * 删除一个产品分类
	 * @param ptid 要删除的产品分类ID
	 * @throws Exception
	 */
	public static void delete(int ptid) throws Exception {
		try{
			sqlMapFactory.getSqlMap().delete("deleteType",ptid);
		}catch (Exception e) {
			Logger log = Logger.getLogger(ProductTypeDao.class.getName());
			log.error("删除产品分类 出错DAO",e);
			throw new SQLException(e);
		}
	}
	//--- end
	
	public static List<ProductType> getProductTypeByFatherId(String id) throws SQLException{
		return sqlMapFactory.getSqlMap().queryForList("getProductTypeByFatherId", id);
	}
	
	public static ProductType getProductTypeById(String id)throws SQLException{
		return (ProductType)sqlMapFactory.getSqlMap().queryForObject("getProductTypeById", id);
	}
}
