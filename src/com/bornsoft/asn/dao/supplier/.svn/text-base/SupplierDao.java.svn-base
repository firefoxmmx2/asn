package com.bornsoft.asn.dao.supplier;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.bean.supplier.Supplier;
import com.bornsoft.asn.dao.CommonDAO;
import com.bornsoft.asn.utils.common.sqlMapFactory;


/**
 * Supplier DAO
 * */
public class SupplierDao extends CommonDAO {
	
	
	public Supplier getSupplierById(long supplierId) throws SQLException{
		return (Supplier)this.queryForObject("getSupplierById", supplierId, null);
	}
	
	/*****
	 * @author cl
	 * @discription 完善供应商信息
	 * @date 2010-03-04 
	 * ***/
	public static void insertSupplierInfo(Supplier supplier) throws SQLException{
		sqlMapFactory.getSqlMap().insert("addSupplierInfo",supplier);
	}
	/*****
	 * @author cl
	 * @discription 修改供应商信息
	 * @date 2010-03-08
	 * ***/
	public static void updateSupplier(Supplier supplier) throws SQLException{
		sqlMapFactory.getSqlMap().update("updateSupplier", supplier);
	}
	
	/*****
	 * @author cl
	 * @discription 查询供应商信息
	 * @date 2010-03-12
	 * ***/
	public static List searchSupplier(Map map) throws SQLException{
		return sqlMapFactory.getSqlMap().queryForList("searchSupplier",map);
	}
	
	/*****
	 * @author cl
	 * @discription 前台 ----查询供应商信息总记录
	 * @date 2010-04-15
	 * ***/
	public static long searchSupplierCount(Map m)throws SQLException{
		return (Long)sqlMapFactory.getSqlMap().queryForObject("searchSupplierCount", m);
	}
	
	/*****
	 * @author cl
	 * @discription 删除供应商信息
	 * @date 2010-03-18
	 * ***/
	public static void deleteSupplier(long memberId) throws SQLException{
		sqlMapFactory.getSqlMap().delete("delSupplier",memberId);
	}
	
	/*****
	 * @author cl
	 * @discription 查询供应商列表
	 * @date 2010-03-18
	 * ***/
	public static List listSupplier(Map para) throws SQLException{
		return sqlMapFactory.getSqlMap().queryForList("listSuppliser",para);
	}
	
	/*****
	 * @author cl
	 * @discription 审核供应商状态
	 * @date 2010-03-18
	 * ***/
	public static void checkSupplier(Supplier supplier)throws SQLException{
		sqlMapFactory.getSqlMap().update("updateSupplierApproveState", supplier);
	}
	
	/*****
	 * @author cl
	 * @discription 查询供应商总的记录
	 * @date 2010-03-26
	 * ***/
	public static long getSupplierCount(Map para) throws SQLException{
		return (Long)sqlMapFactory.getSqlMap().queryForObject("getSupplierCount", para);
	} 
	
	/**
	 * @author cl
	 * @discription 企业供应商 ---查询自己担保的个人供应商
	 * @date 2010-03-26
	 * */
	public static List getVoucherByMemberId(Map para) throws SQLException{
		return sqlMapFactory.getSqlMap().queryForList("getVoucherBymemberID",para);
	}
	
	/*****
	 * @author cl
	 * @discription 查询担保人总的记录
	 * @date 2010-03-26
	 * ***/
	public static long getVoucherCount(Map para) throws SQLException{
		return (Long)sqlMapFactory.getSqlMap().queryForObject("getVoucherCount", para);
	} 
	/*****
	 * @author cl
	 * @discription 修改担保状态
	 * @date 2010-03-29
	 * ***/
	public static void updateVouchState(Map m)throws SQLException{
		sqlMapFactory.getSqlMap().update("updateVoucherState", m);
	}
	
	/**
	 * @author cl
	 * @discription 管理员 ---查询所有担保
	 * @date 2010-03-29
	 * */
	public static List getAllVoucher(Map m) throws SQLException{
		return sqlMapFactory.getSqlMap().queryForList("getAllVoucher",m);
	}
	
	/*****
	 * @author cl
	 * @discription 查询所有担保总的记录
	 * @date 2010-03-29
	 * ***/
	public static long getAllVoucherCount(Map m) throws SQLException{
		return (Long)sqlMapFactory.getSqlMap().queryForObject("getAllVouchCount", m);
	}
	
	/*****
	 * @author cl
	 * @discription 供应商诚信承诺状态
	 * @date 2010-05-11
	 * ***/
	public static void updPromiseState(Map m)throws SQLException{
		sqlMapFactory.getSqlMap().update("updatePromiseState",m);
	}
	
	/*****
	 * @author cl
	 * @discription 冻结和恢复供应商
	 * @date 2010-05-28
	 * ***/
	public static void updLockState(Map m)throws SQLException{
		sqlMapFactory.getSqlMap().update("updateLockedState", m);
	}
}
