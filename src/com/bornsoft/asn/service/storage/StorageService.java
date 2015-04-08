package com.bornsoft.asn.service.storage;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.storage.StorageInOut;
import com.bornsoft.asn.bean.storage.StorageInOutDetail;
import com.bornsoft.asn.dao.product.ProductDao;
import com.bornsoft.asn.dao.storage.StorageDao;
import com.bornsoft.asn.dao.storage.StorageInOutDao;
import com.bornsoft.asn.dao.storage.StorageInOutDetailDao;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.utils.common.sqlMapFactory;
import com.bornsoft.asn.vo.ProductStorage;
import com.bornsoft.asn.vo.ProductStorageDetail;

public class StorageService {

	public static List<ProductStorage> getStorageList(Integer supplierId,String productName,int startCount,int endCount) throws Exception{
		HashMap m=new HashMap<String, Object>();
		if(supplierId!=null){
			m.put("supplierId", supplierId);
		}
		if(productName!=null&&!productName.equals("")){
			m.put("productName",productName);
		}
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		return StorageDao.getStorageList(m);
	}
	
	public static Integer getStorageListCount(Integer supplierId,String productName)throws Exception{
		HashMap m=new HashMap<String, Object>();
		if(supplierId!=null){
			m.put("supplierId", supplierId);
		}
		if(productName!=null&&!productName.equals("")){
			m.put("productName",productName);
		}
		return StorageDao.getStorageListCount(m);
	}
	
	public static List<ProductStorage> getStorageListOnChange(String[] ids)throws Exception{
		List<ProductStorage> l=new ArrayList<ProductStorage>();
		for(String id:ids){
			ProductStorage ps=StorageDao.getStorageById(Integer.parseInt(id));
			l.add(ps);
		}
		return l;
	}
	
	public static void insertStorageInOut(StorageInOut sio,List<StorageInOutDetail> siods,List<HashMap<String,Object>> list)throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			StorageInOutDao.insertStorageInOut(sio);
			for(StorageInOutDetail siod:siods){
				StorageInOutDetailDao.insertStorageInOutDetail(siod);
			}
			for(HashMap m:list){
				StorageDao.updateStorage(m);
				ProductDao.setProductAmount(m);
			}
			
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			// TODO: handle exception
			Logger log = Logger.getLogger("StorageInOutService");
			log.info("insertStorageInOut出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	public static void insertUpdateProduct(Integer productId,Integer stockAmount,Integer supplierId,String type,Integer modifyAmount)throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			HashMap m=new HashMap();
			Date d=new Date();
			m.put("productId", productId);
			m.put("stockAmount", stockAmount);
			m.put("modifyMan", supplierId);
			m.put("modifyTime", d);
			StorageDao.updateStorage(m);
			
			StorageInOut sio=new StorageInOut();
			sio.setId(IdMakerService.newId("storage"));
			sio.setBillType(type);
			sio.setHandleMan(new Long(supplierId));
			sio.setHandleTime(d);
			StorageInOutDao.insertStorageInOut(sio);
			
			StorageInOutDetail siod=new StorageInOutDetail();
			siod.setId(IdMakerService.newId("storage_detail"));
			siod.setProductId(productId);
			siod.setBillAmount(modifyAmount);
			siod.setStorageInOutId(sio.getId());
			StorageInOutDetailDao.insertStorageInOutDetail(siod);
			
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			// TODO: handle exception
			Logger log = Logger.getLogger("StorageService");
			log.info("insertUpdateProduct出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	public static void insertOrderProduct(Integer productId,Integer supplierId,String type,Integer modifyAmount)throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			int amount=ProductDao.getProductAmountById(productId);
			HashMap m=new HashMap();
			Date d=new Date();
			m.put("productId", productId);
			m.put("stockAmount", (amount-modifyAmount));
			m.put("modifyMan", supplierId);
			m.put("modifyTime", d);
			StorageDao.updateStorage(m);
			
			StorageInOut sio=new StorageInOut();
			sio.setId(IdMakerService.newId("storage"));
			sio.setBillType(type);
			sio.setHandleMan(new Long(supplierId));
			sio.setHandleTime(d);
			StorageInOutDao.insertStorageInOut(sio);
			
			StorageInOutDetail siod=new StorageInOutDetail();
			siod.setId(IdMakerService.newId("storage_detail"));
			siod.setProductId(productId);
			siod.setBillAmount(modifyAmount);
			siod.setStorageInOutId(sio.getId());
			StorageInOutDetailDao.insertStorageInOutDetail(siod);
			
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			// TODO: handle exception
			Logger log = Logger.getLogger("StorageService");
			log.info("insertUpdateProduct出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	public static Integer getStorageInOutByProductIdCount(String id,String billNum,String billType,Integer handleMan)throws Exception{
		HashMap m=new HashMap();
		if(id!=null&&!id.trim().equals("")){
			Integer id1=Integer.parseInt(id);
			m.put("id", id1);
		}
		if(billNum!=null&&!billNum.equals("")){
			m.put("billNum",billNum);
		}
		if(billType!=null&&!billType.trim().equals("")){
			m.put("billType", billType);
		}
		if(handleMan!=null){
			m.put("handleMan", handleMan);
		}
		return  StorageInOutDao.getStorageInOutByProductIdCount(m);
	}
	
	public static List<StorageInOut> getStorageInOutByProductId(String id,String billNum,String billType,Integer handleMan,int startCount,int endCount)throws Exception{
		HashMap m=new HashMap();
		if(id!=null&&!id.trim().equals("")){
			Integer id1=Integer.parseInt(id);
			m.put("id", id1);
		}
		if(billNum!=null&&!billNum.equals("")){
			m.put("billNum",billNum);
		}
		if(billType!=null&&!billType.trim().equals("")){
			m.put("billType", billType);
		}
		if(handleMan!=null){
			m.put("handleMan", handleMan);
		}
		m.put("startCount", startCount);
		m.put("endCount",endCount);
		return StorageInOutDao.getStorageInOutByProductId(m);
	}
	
	public static StorageInOut getStorageInOutById(String id)throws Exception{
		Integer id1=Integer.parseInt(id);
		return StorageInOutDao.getStorageInOutById(id1);
	}
	
	public static List<ProductStorageDetail> getStorageInOutDetailByPid(String pid)throws Exception{
		Integer pid1=Integer.parseInt(pid);
		return StorageInOutDetailDao.getStorageInOutDetailByParentId(pid1);
	}
}
