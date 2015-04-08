package com.bornsoft.asn.dao.ship;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.bean.ship.Delivery;
import com.bornsoft.asn.bean.ship.Logistics;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class ShipDao {
	
	public static List<Logistics> getLogistics()throws SQLException{
		return (List<Logistics>)sqlMapFactory.getSqlMap().queryForList("getLogistics");
		
	}
	
	public static void saveDelivery(Delivery delivery)throws SQLException{
		sqlMapFactory.getSqlMap().insert("insertShipDelivery", delivery);
	}
	
	public static Delivery getDeliveryByOrderId(Map m)throws SQLException{
		return (Delivery) sqlMapFactory.getSqlMap().queryForObject("getDeliveryById", m);
	}

}
