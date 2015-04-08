package com.bornsoft.asn.test;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.bornsoft.asn.bean.information.SupplyInfo;
import com.bornsoft.asn.dao.information.InfoDao;

public class TestInfoDao {
	public static void main(String[] args)throws Exception {
		TestInfoDao tid=new TestInfoDao();
		//tid.insertSupplyInfo();
		//tid.setInfoStatus();
		//tid.getSupplyInfoById();
		//tid.showSuppliyInfoList();
		//tid.getSupplyInfoList();
		//tid.showSupplyInfoList();
		//tid.showSupplyInfoListCount();
		tid.showSupplyInfoListLi();
		//tid.getSupplyInfoSearchCount();
	}

	public void insertSupplyInfo()throws Exception{
	//	SupplyInfo s=new SupplyInfo(1, "111", "", "", "on", "key", "180", "ddd", new Date(), null, new Date(), null, "","", 1);
	//	InfoDao.insertSupplyInfo(s);
	}
	
	public void setInfoStatus() throws Exception{
		HashMap m=new HashMap();
		m.put("infoId", 1);
		m.put("infoStatus","on");
		m.put("delDate", new Date());
		InfoDao.setInfoStatus(m);
	}
	
	public void getSupplyInfoById()throws Exception{
		SupplyInfo s=InfoDao.getSupplyInfoById("18");
		System.out.println(s.getTitle()+"********************");
	}
	
	public void showSuppliyInfoList()throws Exception{
		HashMap m=new HashMap();
		m.put("infoStatus","on");
		m.put("startCount", 1);
		m.put("endCount", 10);
		m.put("type", "0002-0002-0007");
		m.put("keyWord", "fadf");
		List<SupplyInfo> l=InfoDao.showSupplyInfoList(m);
		for(SupplyInfo s:l){
			System.out.println(s.getTitle()+"**********");
		}
	}
	
	public void getSupplyInfoList()throws Exception{
		HashMap m=new HashMap();
		m.put("supplierId", 1);
		m.put("infoStatus", "on");
		m.put("startCount", 1);
		m.put("endCount", 5);
		m.put("searchWord", "fadf");
		List<SupplyInfo> l=InfoDao.getSupplyInfoList(m);
		for(SupplyInfo s:l){
			System.out.println(s.getTitle()+"**********");
		}
	}
	
	public void showSupplyInfoList()throws Exception{
		HashMap m=new HashMap();
		m.put("supplierId", 1);
		m.put("infoStatus", "on");
		m.put("startCount", 1);
		m.put("endCount", 5);
		m.put("keyWord", "fadf");
		m.put("area", "500236");
		m.put("type", "0002-0002-0007");
		List<SupplyInfo> l=InfoDao.showSupplyInfoList(m);
		for(SupplyInfo s:l){
			System.out.println(s.getTitle()+"**********");
		}
	}
	
	public void showSupplyInfoListCount()throws Exception{
		HashMap m=new HashMap();
		m.put("infoStatus", "on");
		m.put("keyWord", "fadf");
		m.put("area", "500236");
		m.put("type", "0002-0002-0007");
		int i=InfoDao.showSupplyInfoListCount(m);
		System.out.println(i+"************************************");
	}
	
	public void showSupplyInfoListLi()throws Exception{
		HashMap m=new HashMap();
		m.put("startCount", 1);
		m.put("endCount", 5);
		m.put("type", "0003");
		List<SupplyInfo> l=InfoDao.showSupplyInfoList(m);
		for(SupplyInfo s:l){
			System.out.println(s.getTitle()+"**********");
		}
	}
	
	public void getSupplyInfoSearchCount()throws Exception{
		HashMap m=new HashMap();
		m.put("supplierId", 1);
		m.put("infoStatus", "on");
		m.put("over", "");
		int i=InfoDao.getSupplyInfoCount(m);
		System.out.println(i+"**********");
	}
}
