/**
 * 
 */
package com.bornsoft.asn.service.accounting;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.bornsoft.asn.dao.discount.DiscountDao;
import com.bornsoft.asn.dao.product.ProductDao;
import com.bornsoft.asn.utils.common.Javascript;

/**
 * 计价与账务服务
 * @author kunyun
 *
 */
public class AccountingService {
	/**
	 * 查询单价
	 * @param productId
	 * @param quantity
	 * @return
	 * @throws Exception 
	 */
	public static Double getPrice(Long productId, int quantity) throws Exception{
		Double price=1d;
		HashMap<String,Double> m=ProductDao.getPriceById(productId.intValue());
		
		if(m.get("price1Range") != null && quantity<=(Double)m.get("price1Range")){
			price= m.get("price1");
		}else if(m.get("price2Range") != null && quantity<=(Double)m.get("price2Range")){
			price= m.get("price2");
		}else if(m.get("price3Range") != null && quantity<=(Double)m.get("price3Range")){
			price= m.get("price3");
		}else{
			price= m.get("price1");
		}
		HashMap map=new HashMap();
		map.put("nowTime", new Date());
		map.put("productId", productId);
		List<String> l=(List<String>) DiscountDao.getScript(map);
		Double price1=price;
		if(l!=null&&l.size()>0){
			for(String s:l){
				Double p= Javascript.evalDouble(s, "x", price, "y", quantity);
				if(p<price1){
					price1=p;
				}
			}
		}
		return price1;
	}
}
