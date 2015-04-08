package com.bornsoft.asn.test;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.bornsoft.asn.bean.product.ProductPurchase;
import com.bornsoft.asn.dao.product.ProductPurchaseDao;

public class TestProductPurchaseDao {

	public static void main(String args[]) throws Exception{
		TestProductPurchaseDao tppd=new TestProductPurchaseDao();
//		tppd.insertProductPurchase();
//		tppd.getProductPurchaseList();
//		tppd.getProductPurchaseListCount();
//		tppd.getProductPurchase();
//		tppd.updateProductPurchase();
//		tppd.setProductPurchaseStatus();
//		tppd.searchProductPurchaseList();
//		tppd.getSearchProductPurchaseListCount();
		tppd.deleteProductPurchaseByMemberId();
	}
	
	public void insertProductPurchase() throws Exception{
		for(int i=51;i<=100;i++){
			ProductPurchase pp=new ProductPurchase(i, 1, "off"+i, "OFF"+i, "off", "0001-0005-0002", "30", "pack", "50", "detail", "/pic/product/snopic.jpg", "/pic/product/bnopic.jpg", "tail", "180",new Date(),null,new Date(),"192.186.0.225");
			ProductPurchaseDao.insertProductPurchase(pp);
		}
	}
	
	public void getProductPurchaseList()throws Exception{
		HashMap m=new HashMap();
		m.put("memberId", "1");
		m.put("purchaseStatus", "on");
		m.put("startCount", "1");
		m.put("endCount", "5");
		List<ProductPurchase> lpp=ProductPurchaseDao.getProductPurchaseList(m);
		for(ProductPurchase pp:lpp){
			System.out.println(pp.getProductName()+"###################################"+pp.getMemberId());
		}
	}
	
	public void getProductPurchaseListCount()throws Exception{
		HashMap m=new HashMap();
		m.put("memberId","1" );
		m.put("purchaseStatus", "off");
		System.out.println(ProductPurchaseDao.getProductPurchaseListCount(m));
	}
	
	public void getProductPurchase()throws Exception{
		ProductPurchase pp=ProductPurchaseDao.getProductPurchase(10);
		System.out.println(pp.getProductName()+"#######################");
	}
	
	public void updateProductPurchase()throws Exception{
		ProductPurchase pp=new ProductPurchase(50, 2, "3","3", "on", "", "", "", "", "", "", "", "", "180", new Date(), new Date(), new Date(),"");
		ProductPurchaseDao.updateProductPurchase(pp);
	}
	
	public void setProductPurchaseStatus()throws Exception{
		HashMap m=new HashMap();
		m.put("purchaseStatus", "off");
		m.put("purchaseId", "49");
		ProductPurchaseDao.setProductPurchaseStatus(m);
	}
	
	public void searchProductPurchaseList()throws Exception{
		HashMap m=new HashMap();
		m.put("memberId", "1");
		m.put("purchaseStatus", "on");
		m.put("startCount", "1");
		m.put("endCount", "5");
		m.put("searchName", "n");
		List<ProductPurchase> lpp=ProductPurchaseDao.searchProductPurchaseList(m);
		for(ProductPurchase pp:lpp){
			System.out.println(pp.getProductName()+"##########**********");
		}
	}
	
	public void getSearchProductPurchaseListCount()throws Exception{
		HashMap m=new HashMap();
		m.put("memberId", "1");
		m.put("purchaseStatus", "on");
		m.put("searchName", "n");
		System.out.println(ProductPurchaseDao.getSearchProductPurchaseListCount(m)+"###########################");
	}
	
	public void deleteProductPurchaseByMemberId()throws Exception{
		ProductPurchaseDao.deleteProductPurchaseByMemberId(1);
	}
}
