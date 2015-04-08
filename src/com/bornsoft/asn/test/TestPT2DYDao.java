package com.bornsoft.asn.test;

import java.util.List;

import com.bornsoft.asn.bean.product.PT2DY;
import com.bornsoft.asn.dao.product.PT2DYDao;

public class TestPT2DYDao {

	public static void main(String[] args) throws Exception {
		TestPT2DYDao t=new TestPT2DYDao();
		//t.insertPT2DY();
		//t.getPT2DY();
		//t.deleteList();
	}

	public void insertPT2DY() throws Exception{
		PT2DY p=new PT2DY(3,21);
		PT2DYDao.insertPT2DY(p);
	}
	
	public void getPT2DY()throws Exception{
		List<PT2DY> l=PT2DYDao.getPT2DY("315");
		for(PT2DY p:l){
			System.out.println(p.getDeliveryId()+"@@@"+p.getProductId());
		}
	}
	
	public void deleteList()throws Exception{	
		PT2DYDao.deleteList(317);
	}
}
