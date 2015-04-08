package com.bornsoft.asn.service.product;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.product.Product;
import com.bornsoft.asn.bean.product.SpecialProduct;
import com.bornsoft.asn.dao.product.ProductDao;
import com.bornsoft.asn.dao.product.SpecialProductDao;
import com.bornsoft.asn.service.accounting.AccountingService;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.utils.common.ImageSize;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class SpecialProductService {
	public static void insertSpecialProduct(String[] ids,String type)throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			for(String id:ids){
				Product p=ProductDao.getProductById(id);
				SpecialProduct sp=new SpecialProduct();
				sp.setId(IdMakerService.newId("specialProduct"));
				sp.setName(p.getProductName());
				if(p.getPrice1()!=null&&p.getPrice1Range()!=null){
					sp.setOriginalPrice(p.getPrice1());
					sp.setNewPrice(AccountingService.getPrice(Long.parseLong(id), p.getPrice1Range()));
				}else if(p.getPrice1()!=null){
					sp.setOriginalPrice(p.getPrice1());
					sp.setNewPrice(p.getPrice1());
				}else{
					sp.setOriginalPrice(null);
					sp.setNewPrice(null);
				}
				sp.setProductId(p.getProductId().longValue());
				sp.setSmallPicPath(p.getSmallPicPath());
				sp.setType(type);
				sp.setBigPicPath(p.getBigPicPath());
				sp.setUnit(p.getProductUnit());
				sp.setSupplierId(p.getSupplierId());
				SpecialProductDao.insertSpecialProduct(sp);
			}
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			Logger log = Logger.getLogger("SpecialProductService");
			log.info("insertSpecialProduct出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
		
		//SpecialProductDao.insertSpecialProduct(sp);
	}
	public static void deleteSpecialProductById(String[] ids)throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			for(String id:ids){
				SpecialProductDao.deleteSpecialProductById(id);
			}
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			Logger log = Logger.getLogger("SpecialProductService");
			log.info("deleteSpecialProduct出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
		
	}
	public static void updateSpecialProduct(SpecialProduct sp,File originalPic)throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			String[] picPaths=new String[]{"",""};
			if(originalPic!=null&&sp!=null){
				picPaths=ImageSize.drawImage(originalPic);
				sp.setSmallPicPath(picPaths[1]);
				sp.setBigPicPath(picPaths[0]);
			}
			SpecialProductDao.updateSpecialProduct(sp);
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			// TODO: handle exception
			Logger log = Logger.getLogger("SpecialProductService");
			log.info("插入SpecialProduct出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	public static void updateSnumber(List<SpecialProduct> list)throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			Map m=new HashMap();
			for(SpecialProduct sp:list){
				m.put("id", sp.getId());
				m.put("snumber", sp.getSnumber());
				SpecialProductDao.updateSnumber(m);
			}
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			// TODO: handle exception
			Logger log = Logger.getLogger("SpecialProductService");
			log.info("updateSnumber出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	public static List<SpecialProduct> getSpecialProductList(String name,String type,String productId,int startCount,int endCount,String supplierId)throws Exception{
		HashMap m=new HashMap();
		if(name!=null&&!name.trim().equals("")){
			m.put("name",name);
		}
		if(type!=null&&!type.trim().equals("")){
			m.put("type", type);
		}
		if(productId!=null&&!productId.trim().equals("")){
			m.put("productId", productId);
		}
		if(supplierId!=null&&!supplierId.trim().equals("")){
			m.put("supplierId", supplierId);
		}
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		return SpecialProductDao.getSpecialProductList(m);
	}
	
	public static List<SpecialProduct> getSpecialProductList(String name,String type,String productId,int startCount,int endCount,String supplierId,String area)throws Exception{
		HashMap m=new HashMap();
		if(name!=null&&!name.trim().equals("")){
			m.put("name",name);
		}
		if(type!=null&&!type.trim().equals("")){
			m.put("type", type);
		}
		if(productId!=null&&!productId.trim().equals("")){
			m.put("productId", productId);
		}
		if(supplierId!=null&&!supplierId.trim().equals("")){
			m.put("supplierId", supplierId);
		}
		if(area!=null&&!area.trim().equals("")){
			m.put("area", area);
		}
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		
		List<SpecialProduct> tmpList = SpecialProductDao.getSpecialProductList1(m);
		List<SpecialProduct> retList = new ArrayList();
		if(tmpList!=null)
		{
			for(SpecialProduct sp:tmpList)
			{
				sp.setProductUnit(ProductDao.getProductById(sp.getProductId().intValue()).getProductUnit());
				retList.add(sp);
			}
				
		}
		
		return retList;
	}
	
	public static Integer getSpecialProductListCount(String name,String type,String productId,String supplierId)throws Exception{
		HashMap m=new HashMap();
		if(name!=null&&!name.trim().equals("")){
			m.put("name",name);
		}
		if(type!=null&&!type.trim().equals("")){
			m.put("type", type);
		}
		if(productId!=null&&!productId.trim().equals("")){
			m.put("productId", productId);
		}
		if(supplierId!=null&&!supplierId.trim().equals("")){
			m.put("supplierId", supplierId);
		}
		return SpecialProductDao.getSpecialProductListCount(m);
	}
	public static SpecialProduct getSpecialProductById(String id)throws Exception{
		return SpecialProductDao.getSpecialProductById(id);
	}
}
