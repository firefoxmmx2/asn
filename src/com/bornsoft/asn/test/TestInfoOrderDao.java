package com.bornsoft.asn.test;

import java.util.Date;
import java.util.HashMap;

import com.bornsoft.asn.bean.infoOrder.InfoOrderMan;
import com.bornsoft.asn.dao.infoOrder.InfoOrderManDao;

public class TestInfoOrderDao {

	public static void main(String[] args) throws Exception {
		//TestInfoOrderDao.insertInfoOrderMan();
		TestInfoOrderDao.setInfoOrderManCancel();
	}
	
	public static void insertInfoOrderMan()throws Exception{
		InfoOrderMan iom=new InfoOrderMan();
		iom.setCancel("Y");
		iom.setCreateTime(new Date());
		iom.setEmail("email@oo.com");
		iom.setId(1l);
		iom.setInfoTypeId(1l);
		iom.setMemberId(1l);
		InfoOrderManDao.insertInfoOrderMan(iom);
		
	}
	
	public static void setInfoOrderManCancel()throws Exception{
		HashMap m=new HashMap<String, Object>();
		m.put("cancel", "N");
		m.put("modifyTime", new Date());
		m.put("id", 1);
		InfoOrderManDao.setInfoOrderManCancel(m);
	}

}
