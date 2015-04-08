package com.bornsoft.asn.service.ship;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.order.Order;
import com.bornsoft.asn.bean.order.OrderItem;
import com.bornsoft.asn.bean.ship.Delivery;
import com.bornsoft.asn.bean.ship.Logistics;
import com.bornsoft.asn.dao.ship.ShipDao;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.service.storage.StorageService;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class DeliveryService {
	
	/****
	 * search list
	 * **/
	public static List<Logistics> getLogistics()throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			List<Logistics> list = ShipDao.getLogistics();
			sqlMapFactory.getSqlMap().commitTransaction();
			return list;
		}catch(Exception e){
			Logger log = Logger.getLogger("DeliveryService");
			log.info("search Logistics list error", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	public static Delivery saveDelivery(Long orderId,Delivery delivery)throws Exception{		
		try{
			delivery.setOrderId(orderId);
			delivery.setId(IdMakerService.newId("deliverId").intValue()); //Id
			delivery.setCreateTime(new Date());
			delivery.setCreateMan(MemberService.getMemberFullName());
			delivery.setStatus("N");
			sqlMapFactory.getSqlMap().startTransaction();
			ShipDao.saveDelivery(delivery);			
			sqlMapFactory.getSqlMap().commitTransaction();
			return delivery;
		}catch(Exception e){
			Logger log = Logger.getLogger("DeliveryService");
			log.info("save Delivery error", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}		
	}
	
	public static Delivery getDeliveryByOrderId(Long orderId)throws Exception{		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("orderId", orderId);
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			Delivery delivery = ShipDao.getDeliveryByOrderId(map);			
			sqlMapFactory.getSqlMap().commitTransaction();
			return delivery;
		}catch(Exception e){
			Logger log = Logger.getLogger("DeliveryService");
			log.info("by orderId search Delivery error", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}		
	}
}
