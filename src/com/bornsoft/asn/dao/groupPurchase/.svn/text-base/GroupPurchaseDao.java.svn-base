package com.bornsoft.asn.dao.groupPurchase;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.bean.groupPurchase.GroupPurchaseDetail;
import com.bornsoft.asn.bean.groupPurchase.GroupPurchaseInfo;
import com.bornsoft.asn.bean.groupPurchase.GroupPurchaseMemDetail;
import com.bornsoft.asn.bean.groupPurchase.GroupPurchaseMember;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class GroupPurchaseDao {
	public static void insert(GroupPurchaseInfo gpi) throws SQLException{
		sqlMapFactory.getSqlMap().insert("GroupPurchase.insert", gpi);
	}
	
	public static void update(GroupPurchaseInfo gpi) throws SQLException{
		sqlMapFactory.getSqlMap().update("GroupPurchase.update", gpi);

	}
	
	public static void delete(Long groupPurcharseId) throws SQLException{
		sqlMapFactory.getSqlMap().delete("GroupPurchase.delete",groupPurcharseId);		
	}
	
	public static List<GroupPurchaseInfo> get(Map<String, Object> m) throws SQLException{
		return (List)sqlMapFactory.getSqlMap().queryForList("GroupPurchase.get", m);
	}
	
	public static Integer count(Map<String, Object> m) throws SQLException{
		return (Integer)sqlMapFactory.getSqlMap().queryForObject("GroupPurchase.count",m);
	}
	
	public static void updateStatus(Map m)throws SQLException{
		sqlMapFactory.getSqlMap().update("GroupPurchase.status", m);
	}
	
	public static GroupPurchaseInfo getById(Long groupPurchaseId) throws SQLException
	{
		return (GroupPurchaseInfo) sqlMapFactory.getSqlMap().queryForObject("GroupPurchase.getById",groupPurchaseId);
	}
	
	//根据团购ID得到团购明细
	public static List<GroupPurchaseDetail> getGroupPurchaseDetailById(Long id) throws SQLException
	{
		return (List<GroupPurchaseDetail>)sqlMapFactory.getSqlMap().queryForList("GroupPurchaseDetail.getByGroupId", id);
	}
	
	//INSERT团购成员
	public static void addGroupPurchaseMember(GroupPurchaseMember gpm) throws SQLException{
		sqlMapFactory.getSqlMap().insert("GroupPurchaseMember.insert", gpm);
	}
	
	//INSERT团购成员购买明细
	public static void addGroupPurchaseMemDetail(GroupPurchaseMemDetail gpmd) throws SQLException{
		sqlMapFactory.getSqlMap().insert("GroupPurchaseMemDetail.insert", gpmd);
	}
	
	//修改参团人数
	public static void updateCurrentUsers(Long groupPurcharseId)throws SQLException{
		sqlMapFactory.getSqlMap().update("GroupPurchase.updateCurrentUsers", groupPurcharseId);
	}
	
	//SELECT团购成员购买明细
	public static List getMemberBuyDetail(Long id) throws SQLException{
		return sqlMapFactory.getSqlMap().queryForList("getMemberBuyDetail", id);
	}
	
}
