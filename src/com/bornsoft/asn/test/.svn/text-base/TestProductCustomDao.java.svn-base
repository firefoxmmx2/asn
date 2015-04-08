package com.bornsoft.asn.test;

import java.util.List;

import com.bornsoft.asn.bean.product.ProductCustom;
import com.bornsoft.asn.dao.product.ProductCustomDao;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class TestProductCustomDao {

	public static void main(String[] args) throws Exception {
		TestProductCustomDao tpcd =new TestProductCustomDao();
//		tpcd.insertProductCustom();
		tpcd.deleteProductCustomList();
//		tpcd.getProductCustomList();
	}
	
	public void insertProductCustom()throws Exception{
		for(int i=1;i<=10;i++){
			ProductCustom pc=new ProductCustom(i,2,"Property"+i,"newnewnew"+i);
			ProductCustomDao.insertProductCustom(pc);
		}
	}
	
	public void deleteProductCustomList()throws Exception{
		ProductCustomDao.deleteProductCustomList(46);
	}
	
	public void getProductCustomList() throws Exception{
		List<ProductCustom> l=sqlMapFactory.getSqlMap().queryForList("getProductCustomList", 2);
		for(ProductCustom pc:l){
			System.out.println("**********"+pc.getPropertyName());
		}
	}

}
