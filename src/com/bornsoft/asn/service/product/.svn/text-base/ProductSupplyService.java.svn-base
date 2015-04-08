package com.bornsoft.asn.service.product;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.product.ProductCustom;
import com.bornsoft.asn.bean.product.ProductSupply;
import com.bornsoft.asn.dao.product.ProductCustomDao;
import com.bornsoft.asn.dao.product.ProductSupplyDao;
import com.bornsoft.asn.utils.common.ImageSize;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class ProductSupplyService {
	
	public static void insertProductSupply(ProductSupply ps,List<ProductCustom> lpc,File originalPic)throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			String[] picPaths=new String[]{"",""};
			if(originalPic!=null){
				picPaths=ImageSize.drawImage(originalPic);
			}else{
				picPaths=ImageSize.drawDefaultImage();
			}
			if(ps!=null){
				ps.setBigPicPath(picPaths[0]);
				ps.setSmallPicPath(picPaths[1]);
			}
			
			ProductSupplyDao.insertProductSupply(ps);
			if(lpc!=null&&lpc.size()>0){
				for(ProductCustom pc:lpc){
					ProductCustomDao.insertProductCustom(pc);
				}	
			}
			
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			// TODO: handle exception
			Logger log = Logger.getLogger("ProductSupplyService");
			log.info("插入ProductSupply出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	public static List<ProductSupply> getProductSupplyListOn(Integer supplierId)throws Exception{
		return ProductSupplyDao.getProductSuppluListOn(supplierId);
	}
	
	public static ProductSupply getProductSupply(String productId)throws Exception{
		Integer id=Integer.valueOf(productId);
		return ProductSupplyDao.getProductSupply(id);
	}
	
	public static void updateProductSupply(ProductSupply ps,List<ProductCustom> lpc,File originalPic)throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			String[] picPaths=new String[]{"",""};
			if(originalPic!=null&&ps!=null){
				picPaths=ImageSize.drawImage(originalPic);
				ps.setBigPicPath(picPaths[0]);
				ps.setSmallPicPath(picPaths[1]);
			}
			
			ProductSupplyDao.updateProductSupply(ps);
			
			ProductCustomDao.deleteProductCustomList(ps.getProductId());
			if(lpc!=null&&lpc.size()>0){
				for(ProductCustom pc:lpc){
					ProductCustomDao.insertProductCustom(pc);
				}	
			}
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			// TODO: handle exception
			Logger log = Logger.getLogger("ProductSupplyService");
			log.info("updateProductSupply出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	public static void setProductSupplyOff(String[] strings) throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			for(String s:strings){
				Integer productId=Integer.parseInt(s);
				ProductSupplyDao.setProductSupplyOff(productId);
			}
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			// TODO: handle exception
			Logger log = Logger.getLogger("ProductSupplyService");
			log.info("setProductSupplyOff出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	public static int getProductSupplyCountOn(Integer supplierId) throws Exception{
		return ProductSupplyDao.getProductSupplyCountOn(supplierId);
	}

	public static List<ProductSupply> getProductSupplyListOnPage(Integer supplierId,int page,int pageSize) throws Exception{
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;
		HashMap<String,Integer> m=new HashMap<String, Integer>();
		m.put("supplierId", supplierId);
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		return ProductSupplyDao.getProductSuppluListOnPage(m);
	}
	
	public static List<ProductSupply> getProductSupplyListOffPage(Integer supplierId,int page,int pageSize) throws Exception{
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;
		HashMap<String,Integer> m=new HashMap<String, Integer>();
		m.put("supplierId", supplierId);
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		return ProductSupplyDao.getProductSuppluListOffPage(m);
	}
	
	public static int getProductSupplyCountOff(Integer supplierId) throws Exception{
		return ProductSupplyDao.getProductSupplyCountOff(supplierId);
	}
	
	public static void setProductSupplyOn(String[] strings) throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			for(String s:strings){
				Integer productId=Integer.parseInt(s);
				ProductSupplyDao.setProductSupplyOn(productId);
			}
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			// TODO: handle exception
			Logger log = Logger.getLogger("ProductSupplyService");
			log.info("setProductSupplyOff出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	public static int getProductSupplyCountSearch(Integer supplierId,String sn,String status) throws Exception{
		HashMap m=new HashMap();
		m.put("supplierId", supplierId);
		m.put("searchName", sn);
		m.put("productStatus", status);
		return ProductSupplyDao.getProductSupplyCountSearch(m);
	}
	
	
	public static List<ProductSupply> getProductSupplyListPageSearch(Integer supplierId,int page,int pageSize,String sName,String status) throws Exception{
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;
		HashMap m=new HashMap();
		m.put("supplierId", supplierId);
		m.put("searchName", sName);
		m.put("productStatus",status);
		m.put("startCount", startCount);
		m.put("endCount", endCount);	
		return ProductSupplyDao.getProductSupplyListPageSearch(m);
	}
	
	public static void setProductSupplyStatus(String[] strings,String status) throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			HashMap m=new HashMap();
			for(String s:strings){
				m.put("productId", s);
				m.put("productStatus", status);
				ProductSupplyDao.setProductSupplyStatus(m);
			}
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			// TODO: handle exception
			Logger log = Logger.getLogger("ProductSupplyService");
			log.info("setProductSupplySatus出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	public static void deleteProductSupplyBySupplierId(String supplierId) throws Exception{
		try{
			Integer id=Integer.parseInt(supplierId);
			sqlMapFactory.getSqlMap().startTransaction();
			List<ProductSupply> l=ProductSupplyDao.getProductSuppluList(id);
			for(ProductSupply ps:l){
				ProductCustomDao.deleteProductCustomList(ps.getProductId());
			}
			ProductSupplyDao.deleteProductSupplyBySupplierId(id);
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			// TODO: handle exception
			Logger log = Logger.getLogger("ProductSupplyService");
			log.info("deleteProductSupplyBySupplierId出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
}
