package com.bornsoft.asn.dao.customer;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.utils.common.sqlMapFactory;

public class StatisticsDao {
	
	/*******
	 * 根据订单数查询
	 * ****/
	public static List getStatisticsbyOrderCount(Map m)throws SQLException{
		
		return sqlMapFactory.getSqlMap().queryForList("getStatisticsbyOrderCount",m);		
	}
	
	/*******
	 * 根据订单金额总数查询
	 * ****/
	public static List getStatisticsbyAmountMoney(Map m)throws SQLException{
		
		return sqlMapFactory.getSqlMap().queryForList("getStatisticsbyAmountMoney",m);		
	}
	
	/*******
	 * 总记录
	 * ****/
	public static Integer getStatisticsbyAmountMoneyCount(Map m)throws SQLException{
		
		return (Integer)sqlMapFactory.getSqlMap().queryForObject("getStatisticsbyAmountMoneyCount",m);		
	}
	/*******
	 * 总记录
	 * ****/
	public static Integer getStatisticsbyOrderCountCount(Map m)throws SQLException{
		
		return (Integer)sqlMapFactory.getSqlMap().queryForObject("getStatisticsbyOrderCountCount",m);		
	}
	
	/*******
	 * 根据客户消费能力
	 * ****/
	public static List getConsumePower(Map m)throws SQLException{
		
		return sqlMapFactory.getSqlMap().queryForList("getconsumePower",m);		
	}
	/*******
	 * 根据客户消费能力总记录
	 * ****/
	public static Integer getConsumePowerCount(Map m)throws SQLException{
		
		return (Integer)sqlMapFactory.getSqlMap().queryForObject("getconsumePowerCount",m);		
	}
	
	/*******
	 * 产品销售排行榜
	 * ****/
	public static List getProductSaleTop(Map m)throws SQLException{
		
		return sqlMapFactory.getSqlMap().queryForList("getProductSaleTop",m);
	}
	/*******
	 * 产品销售排行榜总数
	 * ****/
	public static Integer getProductSaleTopCount(Map m)throws SQLException{
		
		return (Integer)sqlMapFactory.getSqlMap().queryForObject("getProductSaleTopCount",m);
	}
	
	/*******
	 * 产品分类销售排行榜
	 * ****/
	public static List getTypeProductSaleTop(Map m)throws SQLException{
		return sqlMapFactory.getSqlMap().queryForList("getProductSaleTopByType",m);
	}
	/*******
	 * 产品销售排行榜--总数根据分类
	 * ****/
	public static Integer getTypeProductSaleTopCount(Map m)throws SQLException{
		
		return (Integer)sqlMapFactory.getSqlMap().queryForObject("getTypeProductSaleTopCount",m);
	}
	
	
	/*******
	 * 产品分类销售排行榜
	 * ****/
	public static List getsatisfaction(Map m)throws SQLException{
		return sqlMapFactory.getSqlMap().queryForList("getsatisfaction",m);
	}
	/*******
	 * 产品分类销售排行榜 ---总数
	 * ****/
	public static Integer getsatisfactionCount(Map m)throws SQLException{
		
		return (Integer)sqlMapFactory.getSqlMap().queryForObject("getsatisfactionCount",m);
	}
	
}
