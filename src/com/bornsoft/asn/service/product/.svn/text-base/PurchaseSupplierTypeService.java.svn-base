package com.bornsoft.asn.service.product;

import java.util.List;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.product.PurchaseSupplierType;
import com.bornsoft.asn.dao.product.PurchaseSupplierTypeDAO;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class PurchaseSupplierTypeService {
	/**
	 * 获取 所有的 供应类型
	 * @return 供应类型
	 * @throws Exception
	 */
	public static List getPSTypeAll() throws Exception {
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			return PurchaseSupplierTypeDAO.getPSTypeAll();
		}catch (Exception e) {
			Logger log = Logger.getLogger(PurchaseSupplierTypeService.class.getName());
			log.error("获取 所有的 供应类型 出错 service", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	/**
	 * 新增 一个 供应类型
	 * @param pst 要新增的 供应类型
	 * @throws Exception
	 */
	public static void newPSType(PurchaseSupplierType pst) throws Exception {
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			PurchaseSupplierTypeDAO.insertPSType(pst);
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			Logger log = Logger.getLogger(PurchaseSupplierTypeService.class.getName());
			log.error("新增 一个 供应类型 出错 service", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	/**
	 *  修改 一个 供求类型
	 * @param pst 要 修改的供求类型
	 * @throws Exception
	 */
	public static void modifyPSType(PurchaseSupplierType pst) throws Exception {
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			PurchaseSupplierTypeDAO.updatePSType(pst);
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			Logger log = Logger.getLogger(PurchaseSupplierTypeService.class.getName());
			log.error("修改 一个 供求类型 出错 service", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	/**
	 * 删除 一个 供求类型
	 * @param typeId 类型ID
	 * @throws Exception
	 */
	public static void deletePSType(int typeId) throws Exception {
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			PurchaseSupplierTypeDAO.deletePSType(typeId);
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			Logger log = Logger.getLogger(PurchaseSupplierTypeService.class.getName());
			log.error(" 删除 一个 供求类型 出错 service", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	/**
	 * 获取一个指定代码的 供求类型
	 * @param typeCode 类型代码
	 * @return 供求类型
	 * @throws Exception
	 */
	public static PurchaseSupplierType getPSTypeByCode(String typeCode) throws Exception {
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			return PurchaseSupplierTypeDAO.getPSTypeByCode(typeCode);
		}catch (Exception e) {
			Logger log = Logger.getLogger(PurchaseSupplierTypeService.class.getName());
			log.error("获取一个指定代码的 供求类型 出错 service", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
}
