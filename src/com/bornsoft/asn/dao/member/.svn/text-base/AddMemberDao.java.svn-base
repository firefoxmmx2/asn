package com.bornsoft.asn.dao.member;

import java.sql.SQLException;
import java.util.Map;

import com.bornsoft.asn.action.member.MemberGroup;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class AddMemberDao {

	/**
	 * @author cz 
	 * @description 新增用户类别
	 * @date 2010-09-27
	 * */
	public static void addMemberGroup(Map m) throws SQLException{
		MemberGroup mg=new MemberGroup();
		mg.setBelong_to((String)m.get("BELONG_TO"));
		mg.setGroup_name((String)m.get("GROUP_NAME"));
		sqlMapFactory.getSqlMap().insert("addMemberGroup",mg);
	}
	
}
