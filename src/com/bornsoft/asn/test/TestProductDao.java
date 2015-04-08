package com.bornsoft.asn.test;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.bornsoft.asn.bean.product.Product;
import com.bornsoft.asn.bean.product.SpecialProduct;
import com.bornsoft.asn.dao.product.ProductDao;
import com.bornsoft.asn.dao.product.SpecialProductDao;
import com.bornsoft.asn.service.accounting.AccountingService;

public class TestProductDao {
	public static void main(String[] args) throws Exception {
		TestProductDao tpd=new TestProductDao();
	//	tpd.getProductBySidAndNum();
	//	tpd.insertProduct();
	//	tpd.getProductCount();
	//	tpd.getProductById();
	//	tpd.getProductSearchCount();
	//	tpd.getProductSearchList();
	//	tpd.getProductListCL();
	//	tpd.getPriceById();
	//	tpd.getProductListBySupplierId();
	//tpd.getAllProductList();
	//	tpd.getAllProductCount();
	//	tpd.getProductListOrderByView();
	//	tpd.getSpecialProductList1();
		tpd.getProductAmountByProductId();
	}
	
	public void getProductBySidAndNum()throws Exception{
		HashMap m=new HashMap();
		m.put("supplierId", "1");
		m.put("productNumber", "1111");
		List<Product> l=ProductDao.getProductBySidAndNum(m);
		for(Product p:l){
			System.out.println(p.getProductName()+"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
		}
	}
	
	public void insertProduct()throws Exception{
		//Product p=new Product(2, 1, "abc", "123", "", "", 1d, 2d, 3d, 90, 900, 9000, "", "", "", "Y", 1,100, 9, 5,"det", "del", "tr","trade", new Date(), new Date(), new Date(), "", "", new Date(),5,1);
		//ProductDao.insertProduct(p);
	}
	
	public void getProductCount()throws Exception{
		HashMap m=new HashMap();
		m.put("supplierId", 1);
		m.put("productStatus","off" );
		int i=ProductDao.getProductCount(m);
		System.out.println(i+"#####################################");
	}
	
	public void getProductById()throws Exception{
		Product p=ProductDao.getProductById("215");
		System.out.println(p.getProductName()+"$$$$$$$$$$$$$$$$$$$$$$");
	}
	
	public void getProductSearchCount()throws Exception{
		HashMap m=new HashMap();
		m.put("supplierId", 1);
//		m.put("productStatus","del" );
//		m.put("searchName", "供应洋甘菊油");
//		m.put("searchNumber", "277");
		m.put("over", "");
		int i=ProductDao.getProductSearchCount(m);
		System.out.println(i+"#####################################");
	}
	
	public void getProductSearchList()throws Exception{
		HashMap m=new HashMap();
		m.put("supplierId", 1);
		m.put("productStatus","del" );
		m.put("searchName", "供应洋甘菊油");
		m.put("searchNumber", "277");
		m.put("startCount", 1);
		m.put("endCount", 3);
		List<Product> l=ProductDao.getProductSearchList(m);
		for(Product p:l){
			System.out.println(p.getProductNumber()+"$$$$$$$$$$$$$$$$$$$$$$"+p.getProductId());
		}
	}
	
	public void getProductListCL()throws Exception{
		List<Product> l=ProductDao.getProductListChenL(1);
		for(Product p:l){
			System.out.println(p.getProductName()+"**********");
		}
	}
	
	public void getPriceById()throws Exception{
		HashMap<String,Double> m=ProductDao.getPriceById(293);
		System.out.println(m.get("price1")+"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
		System.out.println(m.get("price2Range")+"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"+m.containsKey("price1Range"));
//		System.out.println(AccountingService.getPrice(293, 100000)+"##########");
	}
	
	public void getProductListBySupplierId()throws Exception{
		List<Product> l=ProductDao.getProductListBySupplierId(1);
		for(Product p:l){
			System.out.println(p.getProductName()+"#####");
		}
	}
	
	public void getAllProductList()throws Exception{
		HashMap m=new HashMap();
		m.put("supplierId", 1);
//		m.put("productStatus","on" );
//		m.put("searchName", "菊");
		m.put("startCount", 1);
		m.put("endCount", 3);
		m.put("censor", 11);
		m.put("searchId", 387);
	//	m.put("supplierName", "重庆");
		List<Product> l=ProductDao.getAllProductList(m);
		for(Product p:l){
			System.out.println(p.getProductName()+"#####");
		}
	}
	
	public void getAllProductCount()throws Exception{
		HashMap m=new HashMap();
//			m.put("supplierId", 1);
//			m.put("productStatus","on" );
//			m.put("searchName", "菊");
//			m.put("censor", 11);
//			m.put("searchId", 388);
//			m.put("supplierName", "重庆");
		System.out.println(ProductDao.getAllProductCount(m)+"**********");
	}
	
	public void getProductListOrderByView()throws Exception{
		HashMap m=new HashMap();
		m.put("startCount", 1);
		m.put("endCount", 5);
		List<Product> list=ProductDao.getProductListOrderByView(m);
		for(Product p:list){
			System.out.println(p.getViewCount()+"*****");
		}
	}
	
	public void getSpecialProductList1()throws Exception{
		HashMap m=new HashMap();
		m.put("area", "500241");
		m.put("startCount", 1);
		m.put("endCount", 5);
		List<SpecialProduct> l=SpecialProductDao.getSpecialProductList1(m);
		for(SpecialProduct sp :l){
			System.out.println(sp.getName()+"**********");
		}
	}
	
	public void getProductAmountByProductId()throws Exception{
		System.out.println("********"+ProductDao.getProductAmountById(241));
	}
	
}
