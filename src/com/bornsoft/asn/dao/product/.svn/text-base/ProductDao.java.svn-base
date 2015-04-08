package com.bornsoft.asn.dao.product;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.product.Product;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class ProductDao {
	/**
	 * 添加产品点击
	 * @throws SQLException
	 */
	public static void insertPdtClick(long productId) throws SQLException {
		try{
			sqlMapFactory.getSqlMap().update("insertPdtClick",productId);
		}catch(Exception e){
			Logger log = Logger.getLogger(ProductDao.class);
			log.error("添加产品点击 错误 DAO", e);
			throw new SQLException(e);
		}
	}
	
	public static List<Product> getProductBySidAndNum(HashMap m) throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("getProductBySidAndNum",m);
	}
	public static void insertProduct(Product product)throws Exception{
		sqlMapFactory.getSqlMap().insert("insertProduct", product);
	}
	public static int getProductCount(HashMap m)throws Exception {
		return ((Integer)sqlMapFactory.getSqlMap().queryForObject("getProductCount",m)).intValue();
	}
	public static List<Product> getProductList(HashMap m) throws Exception {
		return sqlMapFactory.getSqlMap().queryForList("getProductList", m);
	}
	public static Product getProductById(String productId)throws Exception {
		return (Product) sqlMapFactory.getSqlMap().queryForObject("getProductById",productId);
	}
	/**
	 * 根据产品ID查询产品信息
	 * 2010-4-1
	 * @author yuwenqiang
	 * @param productId
	 * @return
	 * @throws Exception
	 */
	public static Product getProductById(Integer productId)throws Exception{
		return (Product)sqlMapFactory.getSqlMap().queryForObject("selectProduct",productId);
	}
	public static void updateProduct(Product product) throws Exception{
		sqlMapFactory.getSqlMap().update("updateProduct", product);
		
	}
	public static int getProductSearchCount(HashMap m)throws Exception {
		return ((Integer)sqlMapFactory.getSqlMap().queryForObject("getProductSearchCount",m)).intValue();
	}    
	
	public static List<Product> getProductSearchList(HashMap m)throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("getProductSearchList", m);
	}
	public static void setProductStatus(HashMap m)throws Exception {
		sqlMapFactory.getSqlMap().update("setProductStatus",m);	
	}
	public static List<Product> getProductListChenL(Integer supplierId)throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("getProductListChenL", supplierId);
	}
	public static HashMap<String,Double> getPriceById(Integer productId)throws Exception{
		return (HashMap<String, Double>) sqlMapFactory.getSqlMap().queryForObject("getPriceById", productId);
	} 
	public static void deleteProductById(Integer productId)throws Exception{
		sqlMapFactory.getSqlMap().delete("deleteProductById", productId);
	}
	public static void deleteProductBySupplierId(Integer supplierId)throws Exception{
		sqlMapFactory.getSqlMap().delete("deleteProductBySupplierId", supplierId);
	}
	public static List<Product> getProductListBySupplierId(Integer supplierId)throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("getProductListBySupplierId", supplierId);
	}
	public static List<Product> getAllProductList(HashMap m)throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("getAllProductList", m);
	}
	public static int getAllProductCount(HashMap m)throws Exception{
		return ((Integer)sqlMapFactory.getSqlMap().queryForObject("getAllProductCount",m)).intValue();
	}
	public static void setProductCensor(HashMap m)throws Exception{
		sqlMapFactory.getSqlMap().update("setProductCensor",m);	
	}
	public static List<Product> getProductListOrderByView(Map m)throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("getProductListOrderByView",m);
	}

	public static List<Product> getProductListByType(HashMap m) throws Exception {
		return sqlMapFactory.getSqlMap().queryForList("getProductListByType",m);
	}
	
	public static void setProductAmount(HashMap m)throws Exception{
		sqlMapFactory.getSqlMap().update("setProductAmount",m);
	}
	
	public static Integer getProductAmountById (Integer productId) throws Exception{
		return (Integer) sqlMapFactory.getSqlMap().queryForObject("getProductAmountById",productId);
	}
	
	/**
	 * 修改库存方法
	 * cl 2011-01-05
	 * */
	public static void updateProductAmount(Map m)throws SQLException{
		sqlMapFactory.getSqlMap().update("setProductAmount",m);
	}
}
