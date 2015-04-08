package com.bornsoft.asn.service.product;

import java.util.List;

import com.bornsoft.asn.bean.product.PT2DY;
import com.bornsoft.asn.dao.product.PT2DYDao;

public class PT2DYService {

	public static String getDeleveryType(String productId) throws Exception {
		List<PT2DY> l=PT2DYDao.getPT2DY(productId);
		if(l!=null&&l.size()>0){
			StringBuffer s=new StringBuffer();
			for(PT2DY p:l){
				s.append(p.getDeliveryId()+",");
			}
			return s.toString()+"#";
		}else{
			return null;
		}
	}

}
