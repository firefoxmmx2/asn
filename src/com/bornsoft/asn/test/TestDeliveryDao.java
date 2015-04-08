package com.bornsoft.asn.test;

import com.bornsoft.asn.bean.product.Delivery;
import com.bornsoft.asn.dao.product.DeliveryDao;

public class TestDeliveryDao {

	public static void main(String[] args) throws Exception {
		//TestDeliveryDao.insertDelivery();
		//TestDeliveryDao.deleteDelivery();
		TestDeliveryDao.getdelivery();
	}

	public static void insertDelivery()throws Exception{
		Delivery delivery=new Delivery();
		delivery.setDeliveryId(1);
		delivery.setProductId(214);
		delivery.setPost(10d);
		delivery.setExpress(20d);
		delivery.setEms(30d);
		DeliveryDao.insertDelivery(delivery);
	}
	
	public static void deleteDelivery()throws Exception{
		DeliveryDao.deleteDelivery(214);
	}
	
	public static void getdelivery()throws Exception{
		Delivery d=DeliveryDao.getDelivery(214);
		System.out.println(d.getPost()+"*"+d.getExpress());
	}
}
