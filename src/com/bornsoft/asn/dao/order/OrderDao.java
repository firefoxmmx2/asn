package com.bornsoft.asn.dao.order;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.bean.infoOrder.InfoOrder;
import com.bornsoft.asn.bean.order.Order;
import com.bornsoft.asn.bean.order.OrderItem;
import com.bornsoft.asn.utils.common.sqlMapFactory;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.util.finder.ClassFinder.Info;

public class OrderDao {
	static SqlMapClient smc=sqlMapFactory.getSqlMap();
	/**
	 * 保存订单信息
	 * 2010-4-6
	 * @author yuwenqiang
	 * @param Info
	 * @return
	 */
	public static Order saveOrderInfo(Order Info){
		  Order or=null;
		try {
			or=(Order) smc.insert("addOrder", Info);
			return or;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 保存订单信息细项信息
	 * 2010-4-6
	 * @author yuwenqiang
	 * @param obj
	 * @return
	 */
	public static OrderItem saveOrderItem(OrderItem obj){
		try {
			return (OrderItem) smc.insert("insertOrderItem", obj);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 供应商会员查询自己需要管理的订单信息
	 * 2010-4-6
	 * @author yuwenqiang
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static List<Order> findOrderByMember(Map<String,Object> map){
		try {
			return smc.queryForList("selectOrderInfo",map);
		} catch (SQLException e) {
			return null;
		}
	}
	
	
	/**
	 * 获得订单的数量
	 * 2010-4-9
	 * @author yuwenqiang
	 * @return
	 */
	public static int getSoldOrderCount(Map<String,Object> map){
		 try {
		    return 	(Integer)smc.queryForObject("soldOrderCount",map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public static int getBuyOrderCount(Map<String,Object> map){
		 try {
		    return 	(Integer)smc.queryForObject("buyOrderCount",map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
	
	/**
	 * 查询交易成功的订单信息
	 * 2010-4-26
	 * @author yuwenqiang
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static List<Order> getSucessOrderInfo(Map map){
        try {
		    return	(List<Order>)smc.queryForList("getProductByType",map);
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return null;
	}
	
	
	/**
	 * 后台供应商查询订单数量
	 * 2010-4-9
	 * @author yuwenqiang
	 * @param map
	 * @return
	 */
	public static int getBackOrderCount(Map<String,Object> map){
		try {
			return (Integer) smc.queryForObject("selectBackOrderCount",map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	/**
	 * 后台供应商查询自己的订单信息
	 * 2010-4-9
	 * @author yuwenqiang
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static List<Order> findBackOrderList(Map<String,Object> map){
		try {
			return smc.queryForList("selectBackOrderList", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 改变订单信息
	 * 2010-4-13
	 * @author yuwenqiang
	 * @param map
	 */
	public static void updateOrderInfo(Map<String,Object> map){
		try {
			smc.update("updateOrderInfo", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 根据订单的ID查询订单信息
	 * 2010-4-14
	 * @author yuwenqiang
	 * @param id
	 * @return
	 */
	public static Order findOrderInfoById(long id)
	{
		try {
			return (Order) smc.queryForObject("selectOrderById", id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}	
	
	/**
	 * 根据订单ID查询其子项信息
	 * 2010-4-20
	 * @author yuwenqiang
	 * @param mId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static List<OrderItem> findOrderItems(long orderId){
		try {
		   return smc.queryForList("itemByOrderId", orderId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 查询该产品的已销售数量
	 * 2010-4-29
	 * @author yuwenqiang
	 * @param proId
	 * @return
	 */
	public static int getSoldCount(long proId){
		Object obj=null;
      try {
	        obj=smc.queryForObject("pro_sold",proId);
	        if(obj==null){
	        	return 0;
	        }
	        else{
	        	return (Integer)obj;
	        }
	} catch (SQLException e) {
		e.printStackTrace();
	}
      return 0;
	}
	
/***
 * 查询该产品的订购数量
 * 2010-4-29
 * @author yuwenqiang
 * @param proId
 * @return
 */
	public static int getPredeterCount(long proId){
		Object obj=null;
	      try {
	    	  obj=smc.queryForObject("predetermined",proId);
		  	  if(obj==null){
		        	return 0;
		        }
		        else{
		        	return (Integer)obj;
		        }
	  	} catch (SQLException e) {
	  		e.printStackTrace();
	  	}
	        return 0;
	  	}
	
	
	@SuppressWarnings("unchecked")
	public static List<Order> getDealOrder(long memberId){
		try {
		    return smc.queryForList("dealOrderByMember",memberId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
     * 管理员订单查询（坐席人员查询客户咨询订单用的）
     * add cl
     * 2010-10-09
     * */
	public static List<Order> searchAdminOrder(Map m) throws SQLException{
		return (List<Order>)sqlMapFactory.getSqlMap().queryForList("searchAdminOrder", m);
	}
	public static Integer searchAdminOrderCount(Map m) throws SQLException{
		return (Integer)sqlMapFactory.getSqlMap().queryForObject("searchAdminOrderCount", m);
	}
	
	/////////////////////////////////////////////////////////////

	/**
	 * 插入订单批号映射
	 * @param map 参数集合
	 */
	public static void insertOrderBatchNumber(Map<String,Object> map){
		try {
			sqlMapFactory.getSqlMap().insert("OrderInfo.batchNum.insert", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除订单批号映射
	 * @param map 参数集合
	 */
	public static void deleteOrderBatchNumber(Map<String,Object> map){
		try {
			sqlMapFactory.getSqlMap().delete("OrderInfo.batchNum.delete", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 验证批号里是否已存在该订单
	 * @param orderId 订单号
	 * @return 如果存在返回TRUE，否则FALSE
	 */
	public static boolean checkBatchNumberIsExistOrder(Long orderId) {
		boolean ret=false;
		try {
			int value = (Integer)sqlMapFactory.getSqlMap().queryForObject("OrderInfo.batchNum.checkExistOrder", orderId);
			ret=value > 0?true:false;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ret;
	}
	
	/**
	 * 查询订单列表，通过批号
	 * @param map 查询参数映射
	 * @return 订单列表 
	 */
	@SuppressWarnings("unchecked")
	public static List<Order> findOrderByBatchNumber(Map<String, Object> map){
		List<Order> lst=null;
		try {
			lst=sqlMapFactory.getSqlMap().queryForList("OrderInfo.order.findByBatchNum", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lst;
	}
}
