package com.bornsoft.asn.dao.order;

import java.sql.SQLException;
import java.sql.SQLFeatureNotSupportedException;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.bean.order.Order;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class HuaZhangOrderDao {
	public static List<Order> getOrderList(Map m) throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("getHuaZhangOrderList",m);
	}
	
	public static Integer getOrderListCount(Map m)throws Exception{
		return (Integer) sqlMapFactory.getSqlMap().queryForObject("getHuaZhangOrderListCount", m);
	}
	
	public static void updateHuaZhangOrder(Map m)throws Exception{
		sqlMapFactory.getSqlMap().update("updateHuaZhangOrder", m);
	}
}
