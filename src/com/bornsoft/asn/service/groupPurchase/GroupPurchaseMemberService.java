package com.bornsoft.asn.service.groupPurchase;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.bean.groupPurchase.GroupPurchaseMember;
import com.bornsoft.asn.dao.groupPurchase.GroupPurchaseMemberDao;

/**
 * @author hooxin
 * 
 */
public class GroupPurchaseMemberService {
	/**
	 * 状态：Y—有效；N—无效；
	 * 
	 * @fix 状态：Y—未提货；N—已提货；
	 */
	public static Map<String, String> status;
	static {
		status = new HashMap<String, String>();
		status.put("Y", "未提货");
		status.put("N", "已提货");
	}

	public static void appendGroupPurchaseMember(GroupPurchaseMember gpi) {

	}

	public static void modifyGroupPurchaseMember(GroupPurchaseMember gpi) {

	}

	public static void removeGroupPurchaseMember(GroupPurchaseMember gpi) {

	}

	// 条件自己补充不要用map
	public static List<GroupPurchaseMember> getGroupPurchaseMembers() {
		return null;
	}

	public static GroupPurchaseMember getGroupPurchaseMember(Long groupMemberId) {
		GroupPurchaseMember groupMember = null;
		groupMember = GroupPurchaseMemberDao.getById(groupMemberId);
		return groupMember;
	}

	// 条件自己补充不要用map
	public static Integer getGroupPurchaseMembersCount() {
		return null;
	}
}
