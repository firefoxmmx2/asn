package com.bornsoft.asn.service.discount;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.discount.Discount;
import com.bornsoft.asn.bean.discount.Discount2product;
import com.bornsoft.asn.dao.discount.DiscountDao;
import com.bornsoft.asn.service.advert.AdvertService;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class DiscountService {
	public static final Logger log = Logger.getLogger(DiscountService.class);
	/**
	 * @author chenl
	 * @date 2010-04-07
	 * @discription 新增活动
	 * */
	public static void insertDiscount(Discount discount) throws Exception{
		log.debug("insertDiscount starts ....");
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			DiscountDao.insertDiscount(discount);
			sqlMapFactory.getSqlMap().commitTransaction();
			
			log.debug("insertDiscount finished ....");
		}catch(Exception e){
			log.error("新增折扣活动出错",e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	/**
	 * @author chenl
	 * @date 2010-04-07
	 * @discription 查询所有活动
	 * */
	public static List<Discount> listDiscount(Map m) throws Exception{
		log.debug("listDiscount starts ....");
		try{
			List<Discount> list = DiscountDao.listDiscount(m);
			
			log.debug("listDiscount finished ....");
			return list;
		}catch(Exception e){
			log.error("新增折扣活动出错",e);
			throw e;
		}
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-07
	 * @discription 查询总数
	 * */
	public static Long getDiscountCount(Map m) throws Exception{
		log.debug("getDiscountCount starts ....");
		try{
			Long count = DiscountDao.getDiscountCount(m);
			
			log.debug("getDiscountCount finished ....");
			return count;
		}catch(Exception e){
			log.error("新增折扣活动出错",e);
			throw e;
		}
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-08
	 * @discription 删除
	 * */
	public static void delDiscount(long activatyId) throws Exception{
		log.debug("delDiscount starts .....");
		try{
			sqlMapFactory.getSqlMap().startTransaction();			
			DiscountDao.delDiscount(activatyId);			
			sqlMapFactory.getSqlMap().commitTransaction();
			
			log.debug("delDiscount finished ....");
		}catch(Exception e){
			log.error("删除折扣活动出错",e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	
	/**
	 * @author chenl
	 * @date 2010-04-08
	 * @discription 根据ID查询
	 * */
	public static Discount getDiscountById(Long activityId) throws Exception{
		log.debug("getDiscountById starts ....");
		try{
			Discount d = DiscountDao.getDiscountById(activityId);
			
			log.debug("getDiscountById finished ....");
			return d;
		}catch(Exception e){
			log.error("删除折扣活动出错",e);
			throw e;
		}
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-08
	 * @discription 根据ID修改活动信息
	 * */
	public static void updateDiscount(Discount d) throws Exception{
		log.debug("updateDiscount starts ....");
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			DiscountDao.updateDiscount(d);
			sqlMapFactory.getSqlMap().commitTransaction();
			
			log.debug("updateDiscount finished ....");
		}catch(Exception e){
			log.error("修改折扣活动出错",e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-08
	 * @discription 添加供应商参与活动
	 * */
	public static void insertD2product(Discount2product d2product) throws Exception{
		log.debug("insertD2product starts ....");
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			DiscountDao.insertD2product(d2product);
			sqlMapFactory.getSqlMap().commitTransaction();
			
			log.debug("insertD2product finished ....");
		}catch(Exception e){
			log.error("供应商添加活动出错",e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-12
	 * @discription 查看已经参与活动的产品
	 * */
	public static List getExistProduct(Map m) throws Exception{
		log.debug("getExistProduct starts ....");
		try{
			List list = DiscountDao.getExistProduct(m);
			
			log.debug("getExistProduct finished ....");
			return list;
		}catch(Exception e){
			log.error("查看已经参与活动的产品出错",e);
			throw e;
		}
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-12
	 * @discription 查看自己已经参与活动
	 * */
	public static List getSelfActivity(Map m)throws Exception{
		log.debug("getSelfActivity starts ....");
		try{
			List list = DiscountDao.getSelfActivity(m);
			
			log.debug("getSelfActivity finished ....");
			return list;
		}catch(Exception e){
			log.error("查看自己已经参与活动出错",e);
			throw e;
		}
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-12
	 * @discription 查看自己已经参与活动的总记录
	 * */
	public static Long getSelfActivityCount(Map m)throws Exception{
		log.debug("getSelfActivityCount starts ....");
		try{
			Long count = DiscountDao.getSelfActivityCount(m);
			
			log.debug("getSelfActivityCount finished ....");
			return count;
		}catch(Exception e){
			log.error("新增折扣活动出错",e);
			throw e;
		}
	}
	
	
	/**
	 * @author chenl
	 * @date 2010-04-13
	 * @discription 删除供应商自己参与的活动记录
	 * */
	public static void delselfDiscount(Map m) throws Exception{
		log.debug("delselfDiscount starts ....");
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			DiscountDao.delselfActivity(m);
			sqlMapFactory.getSqlMap().commitTransaction();
			
			log.debug("delselfDiscount finished ....");
		}catch(Exception e){
			log.error("删除供应商自己的折扣活动记录出错",e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	
	/**
	 * @author chenl
	 * @date 2010-04-13
	 * @discription 管理员查看某活动的参与供应商
	 * */
	public static List checkjoinSupplier(Map m)throws Exception{
		log.debug("checkjoinSupplier starts ....");
		try{
			List list = DiscountDao.checkjoinSupplier(m);
			
			log.debug("checkjoinSupplier finished ....");
			return list;
		}catch(Exception e){
			log.error("管理员查看某活动的参与供应商出错",e);
			throw e;
		}
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-12
	 * @discription 管理员查看某活动的参与供应商总记录
	 * */
	public static Long getJoinSupplierCount(Map m)throws Exception{
		log.debug("getJoinSupplierCount starts ....");
		try{
			Long count = DiscountDao.getJoinSupplierCount(m);
			
			log.debug("getJoinSupplierCount finished ....");
			return count;
		}catch(Exception e){
			log.error("新增折扣活动出错",e);
			throw e;
		}
	}
}
