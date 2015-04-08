package com.bornsoft.asn.service.customer;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.dao.channel.NcpDao;
import com.bornsoft.asn.dao.customer.StatisticsDao;
import com.bornsoft.asn.service.advert.AdvertService;
import com.bornsoft.asn.utils.common.sqlMapFactory;


public class StatisticsService {
	public static final Logger log = Logger.getLogger(StatisticsService.class);
	
	public static List getStatisticsbyOrderCount(Long supplierId,String type,int startCount,int endCount,
			String orderCountDown,String orderCountUp,String orderMoneyDown,String orderMoneyUp)throws Exception{
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		m.put("supplierId", supplierId);
		m.put("orderCountDown", orderCountDown);
		m.put("orderCountUp", orderCountUp);
		m.put("orderMoneyDown", orderMoneyDown);
		m.put("orderMoneyUp", orderMoneyUp);
		List list = null;
		if(type == null){
			type = "order";
		}
		
		log.debug("getStatisticsbyOrderCount starts .....");
		try{
			if(type.equals("order")){
				list = StatisticsDao.getStatisticsbyOrderCount(m);
			}else{
				list = StatisticsDao.getStatisticsbyAmountMoney(m);
			}
			
			log.debug("getStatisticsbyOrderCount finished ....");
			return list;
		}catch(Exception e){
			log.error("search Statistics list error", e);
			throw e;
		}	
	}
	
	public static Integer getCountByorderOrMoney(Long supplierId,String type,
			String orderCountDown,String orderCountUp,String orderMoneyDown,String orderMoneyUp)throws Exception{
		int count= 0;
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("supplierId", supplierId);
		m.put("orderCountDown", orderCountDown);
		m.put("orderCountUp", orderCountUp);
		m.put("orderMoneyDown", orderMoneyDown);
		m.put("orderMoneyUp", orderMoneyUp);
		if(type == null){
			type = "order";
		}
		
		log.debug("getCountByorderOrMoney starts ....");
		try{
			if(type.equals("order")){
				count = StatisticsDao.getStatisticsbyOrderCountCount(m);
			}else{
				count = StatisticsDao.getStatisticsbyAmountMoneyCount(m);
			}
			
			log.debug("getCountByorderOrMoney finished ....");
			return count;
		}catch(Exception e){
			log.error("search Statistics list error", e);
			throw e;
		}
	}
	
	
	
	public static List getConsumePower(Long supplierId,int startCount, int endCount,String fullName,String startTime,String endTime)throws Exception{
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("supplierId", supplierId);
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		m.put("fullName", fullName);
		m.put("startTime", startTime);
		m.put("endTime", endTime);
		List list = null;
		
		log.debug("getConsumePower starts ....");
		try{
			list = StatisticsDao.getConsumePower(m);
			
			log.debug("getConsumePower finished ....");
			return list;
		}catch(Exception e){
			log.error("search Statistics list error", e);
			throw e;
		}		
	}
	
	public static Integer getConsumePowerCount(Long supplierId,String fullName,String startTime,String endTime)throws Exception{
		int count = 0;
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("supplierId", supplierId);
		m.put("fullName", fullName);
		m.put("startTime", startTime);
		m.put("endTime", endTime);
		
		log.debug("getConsumePowerCount starts ....");
		try{
			count = StatisticsDao.getConsumePowerCount(m);
			
			log.debug("getConsumePowerCount finished ....");
			return count;
		}catch(Exception e){
			log.error("search Statistics list error", e);
			throw e;
		}	
	}
	
	public static List getProductSaleTop(Long supplierId,int startCount, int endCount,String type,String productName,String startTime,String endTime,String productTypeName)throws Exception{
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("supplierId", supplierId);
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		m.put("productName", productName);
		m.put("startTime", startTime);
		m.put("endTime", endTime);
		m.put("productTypeName", productTypeName);
		List list = null;
		if(type == null){
			type = "product";
		}
		
		log.debug("getProductSaleTop starts .....");
		try{
			if(type.equals("product")){
				list = StatisticsDao.getProductSaleTop(m);
			}else{
				list = StatisticsDao.getTypeProductSaleTop(m);
			}
			
			log.debug("getProductSaleTop finished ...");
			return list;
		}catch(Exception e){
			log.error("search Statistics list error", e);
			throw e;
		}	
	}
	public static Integer getProductSaleTopCount(Long supplierId,String type,String productName,String startTime,String endTime,String productTypeName)throws Exception{
		int count = 0;
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("supplierId", supplierId);
		m.put("productName", productName);
		m.put("startTime", startTime);
		m.put("endTime", endTime);
		m.put("productTypeName", productTypeName);
		if(type == null){
			type = "product";
		}
		
		log.debug("getProductSaleTopCount starts ....");
		try{
			if(type.equals("product")){
				count = StatisticsDao.getProductSaleTopCount(m);
			}else{
				count = StatisticsDao.getTypeProductSaleTopCount(m);
			}
			
			log.debug("getProductSaleTopCount finished ....");
			return count;
		}catch(Exception e){
			log.error("search Statistics list error", e);
			throw e;
		}	
	}
	
	/*******
	 * 产品分类销售排行榜
	 * ****/
	public static List getsatisfaction(Long supplierId,int startCount, int endCount,String fullName,String startTime,String endTime)throws Exception{
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("supplierId", supplierId);
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		m.put("fullName", fullName);
		m.put("startTime", startTime);
		m.put("endTime", endTime);
		List list = null;
		
		log.debug("getsatisfaction starts ....");
		try{
			list = StatisticsDao.getsatisfaction(m);
			
			log.debug("getsatisfaction finished ....");
			return list;
		}catch(Exception e){
			log.error("search Statistics list error", e);
			throw e;
		}	
	}
	/*******
	 * 产品分类销售排行榜 ---总数
	 * ****/
	public static Integer getsatisfactionCount(Long supplierId,String fullName,String startTime,String endTime)throws Exception{
		int count = 0;
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("supplierId", supplierId);
		m.put("fullName", fullName);
		m.put("startTime", startTime);
		m.put("endTime", endTime);
		
		log.debug("getsatisfactionCount starts .....");
		try{
			count = StatisticsDao.getsatisfactionCount(m);
			
			log.debug("getsatisfactionCount finished ....");
			return count;
		}catch(Exception e){
			log.error("search Statistics list error", e);
			throw e;
		}	
	}
	
}
