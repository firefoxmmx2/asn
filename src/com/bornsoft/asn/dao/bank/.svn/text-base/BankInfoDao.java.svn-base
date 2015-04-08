package com.bornsoft.asn.dao.bank;

import java.sql.SQLException;
import java.util.List;

import com.bornsoft.asn.bean.bank.BankInfo;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class BankInfoDao {
	
	/*****
	 * @author cl
	 * @discription 完善供应商————银行信息
	 * @date 2010-03-04 
	 * ***/
	public static void insertBankInfo(BankInfo bankinfo) throws SQLException{
		sqlMapFactory.getSqlMap().insert("addBankInfo", bankinfo);
	}
	
	/*****
	 * @author cl
	 * @discription 根据memberID查询 银行信息
	 * @date 2010-03-08 
	 * ***/
	public static BankInfo getBankInfoById(long memberID) throws SQLException{
		return (BankInfo)sqlMapFactory.getSqlMap().queryForObject("getBankInfoById",memberID);
	}
	
	/*****
	 * @author cl
	 * @discription修改银行信息
	 * @date 2010-03-08 
	 * ***/
	public static void updateBankinfo(BankInfo bankinfo) throws SQLException{
		sqlMapFactory.getSqlMap().update("updateBankInfo", bankinfo);
	}
	
	/*****
	 * @author cl
	 * @discription删除银行信息
	 * @date 2010-03-18 
	 * ***/
	public static void deleteBankinfo(long memberId) throws SQLException{
		sqlMapFactory.getSqlMap().update("delBankInfo", memberId);
	}
}
