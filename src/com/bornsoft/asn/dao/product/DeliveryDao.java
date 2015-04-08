package com.bornsoft.asn.dao.product;

import com.bornsoft.asn.bean.product.Delivery;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class DeliveryDao {
	public static void insertDelivery(Delivery delivery)throws Exception{
		sqlMapFactory.getSqlMap().insert("insertDelivery",delivery);
	}
	public static Delivery getDelivery(Integer productId)throws Exception{
		return (Delivery) sqlMapFactory.getSqlMap().queryForObject("getDelivery",productId);
	}
	public static void deleteDelivery(Integer productId)throws Exception{
		sqlMapFactory.getSqlMap().delete("deleteDelivery", productId);
	}
}
