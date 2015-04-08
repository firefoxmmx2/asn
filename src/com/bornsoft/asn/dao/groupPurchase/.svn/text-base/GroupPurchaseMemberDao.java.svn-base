package com.bornsoft.asn.dao.groupPurchase;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.groupPurchase.GroupPurchaseMember;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class GroupPurchaseMemberDao {
	public static void insert(GroupPurchaseMember gpi) {

	}

	public static void update(GroupPurchaseMember gpi) {

	}

	public static void delete(Long groupPurcharseMemberId) {

	}

	public static List<GroupPurchaseMember> get(Map<String, Object> condition) {
		List<GroupPurchaseMember> lst=null;
		try {
			lst= sqlMapFactory.getSqlMap().queryForList("GroupPurchaseMember.get", condition);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Logger log=Logger.getLogger("");
			log.error(e);
		}
		return lst;
	}

	public static Integer count(Map<String, Object> condition) {
		return null;
	}
	
	/**
	 * 修改团购成员状态
	 * @param status 状态值
	 * @param groupMemberId 团购成员ID
	 * @throws SQLException
	 */
	public static void updateStatus(String status,Long groupMemberId) throws SQLException{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", status);
		map.put("id", groupMemberId);
		sqlMapFactory.getSqlMap().update("GroupPurchaseMember.updateStatus",map);
		
	}
	
	/**
	 * 通过团购成员ID，获取成员信息
	 * @param groupMemberId 团购成员ID
	 * @return 成员信息
	 */
	public static GroupPurchaseMember getById(Long groupMemberId){
		GroupPurchaseMember groupMember=null;
		try {
			groupMember = (GroupPurchaseMember)sqlMapFactory.getSqlMap().queryForObject("GroupPurchaseMember.getById",groupMemberId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return groupMember;
	}
}
