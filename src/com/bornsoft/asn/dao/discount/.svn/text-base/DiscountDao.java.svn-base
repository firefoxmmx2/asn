package com.bornsoft.asn.dao.discount;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.bean.discount.Discount;
import com.bornsoft.asn.bean.discount.Discount2product;
import com.bornsoft.asn.dao.CommonDAO;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class DiscountDao extends CommonDAO{
	
	/**
	 * @author chenl
	 * @date 2010-04-07
	 * @discription 新增活动
	 * */
	public static void insertDiscount(Discount discount) throws SQLException{
		sqlMapFactory.getSqlMap().insert("insertDiscount", discount);
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-07
	 * @discription 查询所有活动
	 * */
	public static List<Discount> listDiscount(Map m) throws SQLException{
		return sqlMapFactory.getSqlMap().queryForList("listDiscount", m); 
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-07
	 * @discription 查询总数
	 * */
	public static Long getDiscountCount(Map m) throws SQLException{
		return  (Long)sqlMapFactory.getSqlMap().queryForObject("getDiscountCount", m);
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-08
	 * @discription 删除
	 * */
	public static void delDiscount(long activatyId) throws SQLException{
		sqlMapFactory.getSqlMap().delete("deleteDiscount", activatyId);
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-08
	 * @discription 根据ID查询
	 * */
	public static Discount getDiscountById(Long activityId) throws SQLException{
		return (Discount)sqlMapFactory.getSqlMap().queryForObject("getDiscountById",activityId);
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-08
	 * @discription 根据ID修改活动信息
	 * */
	public static void updateDiscount(Discount d) throws SQLException{
		sqlMapFactory.getSqlMap().update("updateDiscount", d);
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-08
	 * @discription 添加供应商参与活动
	 * */
	public static void insertD2product(Discount2product d2product) throws SQLException{
		sqlMapFactory.getSqlMap().insert("insertD2product", d2product);
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-12
	 * @discription 查看已经参与活动的产品
	 * */
	public static List getExistProduct(Map m) throws SQLException{
		return sqlMapFactory.getSqlMap().queryForList("getExistProduct",m);
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-12
	 * @discription 查看自己已经参与活动
	 * */
	public static List getSelfActivity(Map m)throws SQLException{
		
		return sqlMapFactory.getSqlMap().queryForList("getSelfActivity",m);
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-12
	 * @discription 查看自己已经参与活动的总记录
	 * */
	public static Long getSelfActivityCount(Map m)throws SQLException{
		
		return (Long)sqlMapFactory.getSqlMap().queryForObject("getSelfActivityCount",m);
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-13
	 * @discription 删除自己已经参与活动的记录
	 * */
	public static void delselfActivity(Map m) throws SQLException{
		try{
			sqlMapFactory.getSqlMap().delete("delselfDiscount", m);
		}catch(SQLException e){
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-13
	 * @discription 管理员查看某活动的参与供应商
	 * */
	public static List checkjoinSupplier(Map m)throws SQLException{
		return sqlMapFactory.getSqlMap().queryForList("getJoinSupplierInfo", m);
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-12
	 * @discription 管理员查看某活动的参与供应商总记录
	 * */
	public static Long getJoinSupplierCount(Map m)throws SQLException{
		
		return (Long)sqlMapFactory.getSqlMap().queryForObject("getJoinSupplierCount",m);
	}
	
	public static List<String> getScript(Map m)throws SQLException{
		return  sqlMapFactory.getSqlMap().queryForList("getScript",m);
	}
}
