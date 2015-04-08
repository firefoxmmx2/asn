package com.bornsoft.asn.dao.product;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.bean.product.Product;
import com.bornsoft.asn.utils.common.sqlMapFactory;
import com.ibatis.sqlmap.client.SqlMapClient;

/**
 * 前台查询产品数据DAO
 * @author yuwenqiang
 * 2010-2-26
 */
public class SaleProductDao {
static SqlMapClient smc=sqlMapFactory.getSqlMap();
	
	/**
	 * 得到所有商品的信息
	 * 2010-2-26
	 * @author yuwenqiang
	 * @param 
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public static List<Object> getAllProduct(Map map) throws Exception {
		return smc.queryForList("getAllProduct",map);
	}
	
	/***
	 * 得到所有商品的数量
	 * 2010-2-26
	 * @author yuwenqiang
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static int getCount(Map map){
		try{
			return ((Integer)smc.queryForObject("getCount",map)).intValue();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;		
	}
	
	
	@SuppressWarnings("unchecked")
	public static List<Product> findHotProduct(){
		List<Product> list=null;
		try {
			list=smc.queryForList("hotProduct");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public static List<Product> findFrontHotProduct(Map m){
		List<Product> list=null;
		try {
			list=smc.queryForList("fronthotProduct",m);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public static List<Product> findFrontNewProduct(Map m){
		List<Product> list=null;
		try {
			list=smc.queryForList("frontnewProduct",m);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	

	/**@author liujunwei
	 * @description 秀山首页定制产品展示
	 * @param m
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static List<Product> findFrontProduct(Map m){
		List<Product> list=null;
		try {
			list=smc.queryForList("frontnewProductx",m);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	@SuppressWarnings("unchecked")
	public static List<Product> findFrontProducty(Map m){
		List<Product> list=null;
		try {
			list=smc.queryForList("frontnewProducty",m);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 随机显示产品的信息
	 * 2010-4-22
	 * @author yuwenqiang
	 * @param map
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static List<Product> randomProduct(Map<String,Object> map){
		List<Product> list=null;
		try {
			list=smc.queryForList("randomProduct",map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	 /**
	  * 查询当前供应商的其它产品
	  * 2010-4-22
	  * @author yuwenqiang
	  * @param map
	  * @return
	  */
	@SuppressWarnings("unchecked")
	public static List<Product> otherProductBySupp(Map<String,Object> map){
		List<Product> list=null;
		try {
			list=smc.queryForList("otherProductBySupp",map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
}

