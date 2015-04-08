package com.bornsoft.asn.service.customer;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import oracle.sql.BLOB;

import com.bornsoft.asn.bean.bizOpp.SaleSource;
import com.bornsoft.asn.dao.customer.BizOppDao;
import com.bornsoft.asn.dao.recruitment.RecruitmentDao;
import com.bornsoft.asn.utils.common.FileUpDownLoad;
import com.bornsoft.asn.utils.common.sqlMapFactory;
import com.bornsoft.asn.vo.BizOpp;
import com.bornsoft.asn.vo.ProductPriceLog;

public class BizOppService {
	
	public static List<BizOpp> getBizOppList(Long supplierId,String productName,Integer startCount,Integer endCount)throws Exception{
		HashMap m=new HashMap();
		m.put("supplierId", supplierId);
		if(productName!=null&&!productName.equals("")){
			m.put("productName", productName);
		}
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		return BizOppDao.getBizOppList(m);
	}
	
	public static Integer getBizOppListCount(Long supplierId,String productName)throws Exception{
		HashMap m=new HashMap();
		m.put("supplierId", supplierId);
		if(productName!=null&&!productName.equals("")){
			m.put("productName", productName);
		}
		return BizOppDao.getBizOppListCount(m);
	}
	
	public static List<ProductPriceLog> getProductListLog(Long supplierId,String productName,Integer startCount,Integer endCount)throws Exception{
		HashMap m=new HashMap();
		m.put("supplierId", supplierId);
		if(productName!=null&&!productName.equals("")){
			m.put("productName", productName);
		}
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		return BizOppDao.getProductListLog(m);
	}
	
	public static Integer getProductListLogCount(Long supplierId,String productName)throws Exception{
		HashMap m=new HashMap();
		m.put("supplierId", supplierId);
		if(productName!=null&&!productName.equals("")){
			m.put("productName", productName);
		}
		return BizOppDao.getProductListLogCount(m);
	}
	
	public static void insertSaleSource(SaleSource ss,File file)throws Exception{		
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			if(file!=null){
				String fileId=System.currentTimeMillis()+"";
				String destination=FileUpDownLoad.getDestination(ss.getSupplierId()+"", fileId);
				FileUpDownLoad.uploadFile(file,destination);
				ss.setFileId(fileId);
			}
			BizOppDao.insertSaleSource(ss);
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			Logger log = Logger.getLogger("insertSaleSource");
			log.info("insertSaleSource出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
		
	}
	public static void deleteSaleSource(Long id)throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			SaleSource ss=BizOppDao.getSaleSource(id);
			if(ss.getFileId()!=null){
				FileUpDownLoad.deleteFile(ss.getSupplierId()+"", ss.getFileId()+"");
			}
			BizOppDao.deleteSaleSource(id);
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			Logger log = Logger.getLogger(" deleteSaleSource");
			log.info(" deleteSaleSource出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}	
	}
	public static SaleSource getSaleSource(Long id)throws Exception{
		return BizOppDao.getSaleSource(id);
	}
	public static List<SaleSource> getSaleSourceList(Long supplierId,String title,Integer startCount,Integer endCount)throws Exception{
		HashMap m=new HashMap();
		if(supplierId!=null){
			m.put("supplierId", supplierId);
		}
		if(title!=null&&!title.trim().equals("")){
			m.put("title",title);
		}
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		return BizOppDao.getSaleSourceList(m);
	}
	public static Integer getSaleSourceListCount(Long supplierId,String title)throws Exception{
		HashMap m=new HashMap();
		if(supplierId!=null){
			m.put("supplierId", supplierId);
		}
		if(title!=null&&!title.trim().equals("")){
			m.put("title",title);
		}
		return BizOppDao.getSaleSourceListCount(m);
	}
	
	public static void modifySaleSource(SaleSource ss,File file)throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			if(file!=null){
				FileUpDownLoad.deleteFile(ss.getSupplierId()+"", ss.getFileId()+"");
				String fileId=System.currentTimeMillis()+"";
				String destination=FileUpDownLoad.getDestination(ss.getSupplierId()+"", fileId);
				FileUpDownLoad.uploadFile(file,destination);
				ss.setFileId(fileId);
			}
			BizOppDao.updateSaleSource(ss);
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			Logger log = Logger.getLogger("modifySaleSource");
			log.info("modifySaleSource出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
}
