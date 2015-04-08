package com.bornsoft.asn.dao.information;

import java.util.HashMap;
import java.util.List;

import com.bornsoft.asn.bean.information.PurchaseInfo;
import com.bornsoft.asn.bean.information.SupplyInfo;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class InfoDao {
	public static void insertSupplyInfo(SupplyInfo supplyInfo)throws Exception{
		sqlMapFactory.getSqlMap().insert("insertSupplyInfo",supplyInfo);
	}
	public static void insertPurchaseInfo(PurchaseInfo purchaseInfo)throws Exception{
		sqlMapFactory.getSqlMap().insert("insertPurchaseInfo",purchaseInfo);
	}
	public static int getSupplyInfoCount(HashMap m)throws Exception{
		return ((Integer)sqlMapFactory.getSqlMap().queryForObject("getSupplyInfoCount",m)).intValue();
	}
	public static int getPurchaseInfoCount(HashMap m)throws Exception{
		return ((Integer)sqlMapFactory.getSqlMap().queryForObject("getPurchaseInfoCount",m)).intValue();
	}
	public static List<SupplyInfo> getSupplyInfoList(HashMap m)throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("getSupplyInfoList", m);
	}
	public static List<PurchaseInfo> getPurchaseInfoList(HashMap m)throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("getPurchaseInfoList", m);
	}
	public static SupplyInfo getSupplyInfoById(String infoId)throws Exception{
		return (SupplyInfo) sqlMapFactory.getSqlMap().queryForObject("getSupplyInfoById",infoId);
	}
	public static PurchaseInfo getPurchaseInfoById(String infoId)throws Exception{
		return (PurchaseInfo) sqlMapFactory.getSqlMap().queryForObject("getPurchaseInfoById",infoId);
	}
	public static void updateSupplyInfo(SupplyInfo supplyInfo)throws Exception{
		sqlMapFactory.getSqlMap().update("updateSupplyInfo", supplyInfo);
	}
	public static void updatePurchaseInfo(PurchaseInfo purchaseInfo)throws Exception{
		sqlMapFactory.getSqlMap().update("updatePurchaseInfo", purchaseInfo);
	}
	public static void setInfoStatus(HashMap m)throws Exception{
		sqlMapFactory.getSqlMap().update("setInfoStatus",m);	
	}
	public static int showSupplyInfoListCount(HashMap m) throws Exception{
		return ((Integer)sqlMapFactory.getSqlMap().queryForObject("showSupplyInfoListCount",m)).intValue();
	}
	public static int showPurchaseInfoListCount(HashMap m) throws Exception{
		return ((Integer)sqlMapFactory.getSqlMap().queryForObject("showPurchaseInfoListCount",m)).intValue();
	}
	public static List<SupplyInfo> showSupplyInfoList(HashMap m)throws Exception {
		return sqlMapFactory.getSqlMap().queryForList("showSupplyInfoList",m);
	}
	public static List<PurchaseInfo> showPurchaseInfoList(HashMap m)throws Exception {
		return sqlMapFactory.getSqlMap().queryForList("showPurchaseInfoList",m);
	}
	public static List<SupplyInfo> getAllSupplyInfoList(HashMap m)throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("getAllSupplyInfoList",m);
	}
	public static List<PurchaseInfo> getAllPurchaseInfoList(HashMap m)throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("getAllPurchaseInfoList",m);
	}
	public static int getAllSupplyInfoCount(HashMap m)throws Exception{
		return ((Integer)sqlMapFactory.getSqlMap().queryForObject("getAllSupplyInfoCount",m)).intValue();
	}
	public static int getAllPurchaseInfoCount(HashMap m)throws Exception{
		return ((Integer)sqlMapFactory.getSqlMap().queryForObject("getAllPurchaseInfoCount",m)).intValue();
	}
	public static void setInfoCensor(HashMap m)throws Exception{
		sqlMapFactory.getSqlMap().update("setInfoCensor",m);	
	}
}
