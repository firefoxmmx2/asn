package com.bornsoft.asn.service.product;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.product.ProductCustom;
import com.bornsoft.asn.bean.product.ProductPurchase;
import com.bornsoft.asn.dao.product.ProductCustomDao;
import com.bornsoft.asn.dao.product.ProductPurchaseDao;
import com.bornsoft.asn.dao.product.ProductSupplyDao;
import com.bornsoft.asn.utils.common.ImageSize;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class ProductPurchaseService {

	public static void insertProductPurchase(ProductPurchase pp,File originalPic) throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			String[] picPaths=new String[]{"",""};
			if(originalPic!=null){
				picPaths=ImageSize.drawImage(originalPic);
			}else{
				picPaths=ImageSize.drawDefaultImage();
			}
			if(pp!=null){
				pp.setBigPicPath(picPaths[0]);
				pp.setSmallPicPath(picPaths[1]);
			}		
			ProductPurchaseDao.insertProductPurchase(pp);		
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			// TODO: handle exception
			Logger log = Logger.getLogger("ProductPurchaseService");
			log.info("插入ProductPurchase出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	public static int getProductPurchaseListCount(Integer memberId,String status)throws Exception{
		HashMap m=new HashMap();
		m.put("memberId", memberId);
		m.put("purchaseStatus", status);
		return ProductPurchaseDao.getProductPurchaseListCount(m);
	}
	
	public static List<ProductPurchase> getProductPurchaseList(Integer memberId,String status,int page,int pageSize) throws Exception{
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;
		HashMap m=new HashMap();
		m.put("memberId", memberId);
		m.put("purchaseStatus", status);
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		return ProductPurchaseDao.getProductPurchaseList(m);
	}
	
	public static ProductPurchase getProductPurchase(String purchaseId)throws Exception{
		Integer id=Integer.parseInt(purchaseId);
		return ProductPurchaseDao.getProductPurchase(id);
	}
	
	public static void updateProductPurchase(ProductPurchase pp,File originalPic)throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			String[] picPaths=new String[]{"",""};
			if(originalPic!=null&&pp!=null){
				picPaths=ImageSize.drawImage(originalPic);
				pp.setBigPicPath(picPaths[0]);
				pp.setSmallPicPath(picPaths[1]);
			}
			ProductPurchaseDao.updateProductPurchase(pp);
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			// TODO: handle exception
			Logger log = Logger.getLogger("ProductPurchaseService");
			log.info("updateProductPurchase出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	public static void setProductPurchaseStatus(String[] strings,String status)throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			HashMap m=new HashMap();
			for(String s:strings){
				m.put("purchaseId", s);
				m.put("purchaseStatus", status);
				ProductPurchaseDao.setProductPurchaseStatus(m);
			}
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			// TODO: handle exception
			Logger log = Logger.getLogger("ProductPurchaseService");
			log.info("updateProductPurchase出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	
	public static int getSearchProductPurchaseListCount(Integer memberId,String status,String sName)throws Exception{
		HashMap m=new HashMap();
		m.put("memberId", memberId);
		m.put("searchName", sName);
		m.put("purchaseStatus",status);
		return ProductPurchaseDao.getSearchProductPurchaseListCount(m);
	}
	
	public static List<ProductPurchase> searchProductPurchaseList(Integer memberId,int page,int pageSize,String sName,String status)throws Exception{
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;
		HashMap m=new HashMap();
		m.put("memberId", memberId);
		m.put("searchName", sName);
		m.put("purchaseStatus",status);
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		return ProductPurchaseDao.searchProductPurchaseList(m);
	}
	
	public static void deleteProductPurchaseByMemberId(String memberId)throws Exception{
		Integer id=Integer.parseInt(memberId);
		ProductPurchaseDao.deleteProductPurchaseByMemberId(id);
	}
	
}
