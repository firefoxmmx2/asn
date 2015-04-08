package com.bornsoft.asn.test;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.bornsoft.asn.bean.productType.ProductType;
import com.bornsoft.asn.dao.customer.BizOppDao;
import com.bornsoft.asn.dao.discount.DiscountDao;
import com.bornsoft.asn.dao.productType.ProductTypeDao;
import com.bornsoft.asn.utils.common.Calculator;
import com.bornsoft.asn.vo.BizOpp;

public class TestOtherDao {

	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		TestOtherDao tod=new TestOtherDao();
		//tod.getScript();
		//tod.getProductTypeByFatherId();
		tod.getBizOppList();
	}
	
	public static void getScript() throws Exception{
		HashMap m=new HashMap();
		m.put("nowTime", new Date());
		m.put("productId", 319);
		List<String> l=(List<String>) DiscountDao.getScript(m);
//		if(l==null){
//			System.out.println("##########null");
//		}else if(l.size()==0){
//			System.out.println("**********0");
//			System.out.println(20.01*100);
//		}
//		double discount=1;
//		if(l!=null&&l.size()>0){
//			for(String s:l){
//				System.out.println(s);
//				String[] strings=s.split("\\*");
//				double dis=Double.valueOf(strings[1]);
//				if(dis<discount){
//					discount=dis;
//				}
//			}
//		}
//		double d2=100.1;
//		Double test=Calculator.multiply(0.0185, 200.0);
//		System.out.println(discount+"*"+d2+"="+test+"----------"+d2*discount);
	}
	
	public static void getProductTypeByFatherId()throws Exception{
		List<ProductType> l= ProductTypeDao.getProductTypeByFatherId("1");
		for(ProductType p:l){
			System.out.println(p.getPttypeName());
		}
	}
	
	public static void getBizOppList()throws Exception{
		HashMap m=new HashMap();
		m.put("supplierId", 1);
		m.put("startCount", 1);
		m.put("endCount", 5);
		
		List<BizOpp> l= BizOppDao.getBizOppList(m);
		
		for(BizOpp bo:l){
			System.out.println(bo.getProductName()+"***************"+bo.getInfoId());
		}
	}

}
