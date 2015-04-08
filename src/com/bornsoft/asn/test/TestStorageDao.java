package com.bornsoft.asn.test;

import java.util.HashMap;
import java.util.List;

import com.bornsoft.asn.dao.storage.StorageDao;
import com.bornsoft.asn.vo.ProductStorage;

public class TestStorageDao {

	public static void main(String[] args) throws Exception {
		
		//TestStorageDao.getProductStorage();
		TestStorageDao.getStorageById();
	}
	
	public static void getProductStorage() throws Exception{
		HashMap m=new HashMap();
		m.put("supplierId", 1);
		m.put("productName","反对");
		m.put("startCount", 1);
		m.put("endCount", 100);
		List<ProductStorage> l=StorageDao.getStorageList(m);
		for(ProductStorage ps:l){
			System.out.println(ps.getProductName());
		}
		int i=StorageDao.getStorageListCount(m);
		System.out.println(i+"*****************");
	}
	
	public static void getStorageById()throws Exception{
		ProductStorage ps=StorageDao.getStorageById(234);
		System.out.println(ps.getStockAmount()+"*****"+ps.getProductName());
	}
	

}
