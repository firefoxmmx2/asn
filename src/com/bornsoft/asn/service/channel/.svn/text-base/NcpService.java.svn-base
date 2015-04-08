package com.bornsoft.asn.service.channel;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.advert.Advert;
import com.bornsoft.asn.bean.product.Product;
import com.bornsoft.asn.dao.advert.AdvertDao;
import com.bornsoft.asn.dao.channel.NcpDao;
import com.bornsoft.asn.service.advert.AdvertService;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class NcpService {
	public static final Logger log = Logger.getLogger(NcpService.class);
	
	public static Integer getNcpHotProductCount(String code)throws Exception{
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("productType", code);
		int count=0;
		
		log.debug("getNcpHotProductCount starts ....");
		try{
			count = NcpDao.getNcpHotProductCount(m);
			
			log.debug("getNcpHotProductCount finished ....");
			return count;
		}catch(Exception e){
			log.error("search advert list error", e);
			throw e;
		}
	}
	
	public static List<Product> ncpHotProduct(int startCount,int endCount,String code)throws Exception{
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		m.put("productType", code);
		
		log.debug("ncpHotProduct starts ....");
		try{
			List<Product> list = NcpDao.ncpHotProduct(m);
			
			log.debug("ncpHotProduct finished ....");
			return list;
		}catch(Exception e){
			log.error("search advert list error", e);
			throw e;
		}
	}

}
