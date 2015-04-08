package com.bornsoft.asn.dao.product;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.product.PurchaseSupplierType;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class PurchaseSupplierTypeDAO {
	/**
	 * 获取所有的供求信息类型列表
	 * @return 供求信息类型列表
	 * @throws Exception
	 */
	public static List getPSTypeAll() throws Exception{
		try{
			return sqlMapFactory.getSqlMap().queryForList("getpsTypeAll");
		}catch(Exception e){
			Logger log = Logger.getLogger(PurchaseSupplierTypeDAO.class.getName());
			log.error("获取供求类型列表出错 DAO",e);
			throw new SQLException(e);
		}
	}
	
	/**
	 * 插入 一个 供求类型
	 * @param pst 要插入的供求类型
	 * @throws Exception
	 */
	public static void insertPSType(PurchaseSupplierType pst) throws Exception{
		try{
			sqlMapFactory.getSqlMap().insert("insertPSType", pst);
		}catch(Exception e){
			Logger log = Logger.getLogger(PurchaseSupplierTypeDAO.class.getName());
			log.error("插入 一个 供求类型 出错 DAO",e);
			throw new SQLException(e);
		}
	}
	
	/**
	 * 更新 一个 供应类型
	 * @param pst 要更新的供应类型
	 * @throws Exception
	 */
	public static void updatePSType(PurchaseSupplierType pst) throws Exception{
		try{
			sqlMapFactory.getSqlMap().update("updatePSType", pst);
		}catch(Exception e){
			Logger log = Logger.getLogger(PurchaseSupplierTypeDAO.class.getName());
			log.error(" 更新 一个 供应类型 出错 DAO",e);
			throw new SQLException(e);
		}
	}
	
	/**
	 * 删除 一个 供应类型
	 * @param typeId 要删除的供应类型 类型ID
	 * @throws Exception
	 */
	public static void  deletePSType(int typeId) throws Exception{
		try{
			sqlMapFactory.getSqlMap().delete("deletePSType",typeId);
		}catch(Exception e){
			Logger log = Logger.getLogger(PurchaseSupplierTypeDAO.class.getName());
			log.error("删除 一个 供应类型 出错 DAO",e);
			throw new SQLException(e);
		}
	}
	
	/**
	 * 获取 一个 指定类型代码的 供求类型
	 * @param typeCode 指定类型代码
	 * @return 一个 供求类型
	 * @throws Exception
	 */
	public static PurchaseSupplierType getPSTypeByCode(String typeCode) throws Exception {
		try{
			return (PurchaseSupplierType)sqlMapFactory.getSqlMap().queryForObject("",typeCode);
		}catch (Exception e) {
			Logger log = Logger.getLogger(PurchaseSupplierType.class.getName());
			log.error("获取 一个 指定类型代码的 供求类型 出错 DAO",e);
			throw new SQLException(e);
		}
	}
}
