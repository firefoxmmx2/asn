package com.bornsoft.asn.test;

import com.bornsoft.asn.bean.product.ProductCustomProperty;
import com.bornsoft.asn.dao.product.ProductCustomPropertyDao;

public class TestProductCustomPropertyDao {

	public static void main(String[] args) throws Exception {
		TestProductCustomPropertyDao tpspd=new TestProductCustomPropertyDao();
		//tpspd.insertProductCustomProperty();
		tpspd.deleteList();
	}
	
	public void insertProductCustomProperty() throws Exception{
		ProductCustomProperty pcp=new ProductCustomProperty(2, 2, "b","abcdefg");
		ProductCustomPropertyDao.insertProductCustomProperty(pcp);
	}

	public void deleteList()throws Exception{
		ProductCustomPropertyDao.deleteProductCustomPropertyList(314);
	}
}
