package com.bornsoft.asn.service.order;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.order.Order;
import com.bornsoft.asn.dao.information.InfoDao;
import com.bornsoft.asn.dao.order.HuaZhangOrderDao;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class HuaZhangOrderService {
	public static List<Order> getOrderList(String supplierId,String ssoAccount,String fullName,String email,String certId,String drawerName,String detailAddress,String mobileNumber,String isPayed,String orderId,String orderStatus,Integer startCount,Integer endCount)throws Exception{
		Map m=new HashMap();
		m.put("supplierId", supplierId);
		m.put("ssoAccount", ssoAccount);
		m.put("fullName", fullName);
		m.put("email", email);
		m.put("certId", certId);
		m.put("drawerName", drawerName);
		m.put("detailAddress", detailAddress);
		m.put("mobileNumber", mobileNumber);
		m.put("isPayed", isPayed);
		m.put("orderId", orderId);
		m.put("orderStatus", orderStatus);
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		return HuaZhangOrderDao.getOrderList(m);
	}
	public static Integer getOrderListCount(String supplierId,String ssoAccount,String fullName,String email,String certId,String drawerName,String detailAddress,String mobileNumber,String isPayed,String orderId,String orderStatus)throws Exception{
		Map m=new HashMap();
		m.put("supplierId", supplierId);
		m.put("ssoAccount", ssoAccount);
		m.put("fullName", fullName);
		m.put("email", email);
		m.put("certId", certId);
		m.put("drawerName", drawerName);
		m.put("detailAddress", detailAddress);
		m.put("mobileNumber", mobileNumber);
		m.put("isPayed", isPayed);
		m.put("orderId", orderId);
		m.put("orderStatus", orderStatus);
		return HuaZhangOrderDao.getOrderListCount(m);
	}
	public static void huaZhang(String[] ids, String isPayed)throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			Map m=new HashMap();
			Date date=new Date();
			for(String id:ids){
				m.put("orderId", id);
				m.put("isPayed", isPayed);
				m.put("payedTime", date);
				HuaZhangOrderDao.updateHuaZhangOrder(m);
			}
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			// TODO: handle exception
			Logger log = Logger.getLogger("HuaZhangService");
			log.info("huaZhang出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
		
	}
	
}
