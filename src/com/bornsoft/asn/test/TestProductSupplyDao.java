package com.bornsoft.asn.test;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.bornsoft.asn.bean.product.ProductSupply;
import com.bornsoft.asn.dao.product.ProductSupplyDao;
import com.bornsoft.asn.service.product.ProductSupplyService;
import com.bornsoft.asn.utils.common.sqlMapFactory;
import com.ibatis.sqlmap.client.SqlMapClient;

public class TestProductSupplyDao {

	public static void main(String[] args) throws Exception {
		TestProductSupplyDao tpsd=new TestProductSupplyDao();
//		tpsd.insertProductSupply();
//		tpsd.deleteProductSupply(1);
//		tpsd.updateProductSupply();
//		tpsd.getProductSupply(1);
//		tpsd.getProductSupplyList(1);
//		tpsd.getProductSupplyListOn(1);
//		tpsd.setProductSupplyOff();
//		tpsd.getProductSupplyCountOn();
		tpsd.getProductSupplyListOnPage();
//		tpsd.getProductSupplyCountSearch();
//		tpsd.getProductSupplyListPageSearch();
//		tpsd.setProductSupplyStatus();
//		tpsd.deleteProductSupplyBySupplierId();
	}

	public void insertProductSupply() throws Exception{
		for(int i=161;i<=188;i++){
			Date date=new Date();
			ProductSupply ps=new ProductSupply(i, 1, "sa", "h", "off","/pic/product/snopic.jpg", "/pic/product/bnopic.jpg", "0001-0005-0002", "Y", 25.5, "个", "100", "个", "1000", "个", "好得很","no", "no", "0, 1","180", date, date, date, "192.168.0.111","");
			ProductSupplyDao.insertProductSupply(ps);
		}
	}
	
	public void deleteProductSupply(Integer id) throws Exception{
		ProductSupplyDao.deleteProductSupply(id);
	}
	
	public void updateProductSupply()throws Exception{
		Date date=new Date();
		ProductSupply ps=new ProductSupply(1, 1, "update", "updatePear", "off","", "", "1000-2000-3000", "1", 25.5, "个", "100", "个", "1000", "个", "好","no", "no", "180","1", date, date, date, "192.168.0.100","");
		ProductSupplyDao.updateProductSupply(ps);
	}
	
	public void getProductSupply(Integer i)throws Exception{
		ProductSupply ps=ProductSupplyDao.getProductSupply(i);
		System.out.println("#####"+ps.getProductName());
	}
	
	public void getProductSupplyList(Integer i) throws Exception{
		List<ProductSupply> l=ProductSupplyDao.getProductSuppluList(i);
		for(ProductSupply ps: l){
			System.out.println(ps.getProductName()+"##########");
		}
	}
	
	public void getProductSupplyListOn(Integer i) throws Exception{
		List<ProductSupply> l=ProductSupplyDao.getProductSuppluListOn(i);
		for(ProductSupply ps: l){
			System.out.println(ps.getProductName()+"##########");
		}
	}
	
	public void setProductSupplyOff() throws Exception{
		ProductSupplyDao.setProductSupplyOff(53);
	}
	
	public void getProductSupplyCountOn()throws Exception{
		int i=ProductSupplyDao.getProductSupplyCountOn(1);
		System.out.println("###################"+i+"###################");
	}
	
	public void getProductSupplyListOnPage() throws Exception{
		HashMap<String,Integer> m=new HashMap<String, Integer>();
		m.put("supplierId", 1);
		m.put("startCount", 5);
		m.put("endCount", 10);
		List<ProductSupply> l=ProductSupplyDao.getProductSuppluListOnPage(m);
		for(ProductSupply ps:l){
			System.out.println(ps.getProductName()+"######################################################");
		}
		
		SqlMapClient sqlMap = sqlMapFactory.getSqlMap();
		sqlMap.startTransaction();
		List<ProductSupply> ll=sqlMap.queryForList("getProductSupplyListAll",null, 3, 4);
		sqlMap.commitTransaction(); 
		for(ProductSupply ps:ll){
			System.out.println(ll.size());
			System.out.println(ps.getProductName()+"******************************************************");
		}
	}
	
	public void getProductSupplyCountSearch() throws Exception{
		HashMap m=new HashMap();
		m.put("supplierId", 1);
		m.put("searchName", "r");
		m.put("productStatus", "on");
		int i=ProductSupplyDao.getProductSupplyCountSearch(m);
		System.out.println("***"+i+"*****************************************");
	}
	
	public void getProductSupplyListPageSearch() throws Exception{
		HashMap m=new HashMap();
		m.put("supplierId", 2);
		m.put("searchName", "r");
		m.put("productStatus", "off");
		m.put("startCount", 1);
		m.put("endCount", 5);
		List<ProductSupply> l=ProductSupplyDao.getProductSupplyListPageSearch(m);
		for(ProductSupply ps:l){
			System.out.println(ps.getProductName()+"######################################################");
		}
	}
	
	public void setProductSupplyStatus()throws Exception{
		HashMap m=new HashMap();
		m.put("productId", "44");
		m.put("productStatus", "off");
		ProductSupplyDao.setProductSupplyStatus(m);
	}
	
	public void deleteProductSupplyBySupplierId()throws Exception{
//		ProductSupplyDao.deleteProductSupplyBySupplierId(1);
	}
}
