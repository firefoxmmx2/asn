package com.bornsoft.asn.dao.member;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.action.member.MemberGroup;
import com.bornsoft.asn.action.member.MemberGroupRelation;
import com.bornsoft.asn.dao.quotation.QuotationDAO;
import com.bornsoft.asn.utils.common.sqlMapFactory;



public class MemberGroupDao {
	
	public static int findMemberGroupCount(String groupName,String memberId) throws SQLException{
		Map<String,String> m = new HashMap<String, String>();
		m.put("BELONG_TO", memberId);
		if(groupName != null && groupName.trim().length() > 0){
			m.put("GROUP_NAME", groupName);}
		else
		{
			m.put("GROUP_NAME", "");
		}
		try{
			return (Integer)sqlMapFactory.getSqlMap().queryForObject("findMemberGroupCount",m);
		}catch (Exception e) {
			Logger log = Logger.getLogger(QuotationDAO.class);
			log.error("得到组名数目出错 DAO", e);
			throw new SQLException(e);
		}
	}
	
	public static int getGroupMemberCount(String groupId) throws SQLException{
		Map<String,String> m = new HashMap<String, String>();
		if(groupId != null && groupId.trim().length() > 0){
			m.put("GROUP_ID", groupId);}
		else
		{
			m.put("GROUP_ID", "");
		}
		try{
			return (Integer)sqlMapFactory.getSqlMap().queryForObject("findGroupMemberCount",m);
		}catch (Exception e) {
			Logger log = Logger.getLogger(QuotationDAO.class);
			log.error("得到组名数目出错 DAO", e);
			throw new SQLException(e);
		}
	}
	
	public static List<Member> getGroupMemberList(int startCount,int endCount,String groupId,String mId) throws 

SQLException{
		Map<String,String> m = new HashMap<String, String>();
		if(startCount >=0 && endCount > startCount){
			m.put("startCount", String.valueOf(startCount));
			m.put("endCount", String.valueOf(endCount));
			m.put("BELONG_TO", mId);
		}
		
		if(groupId != null && groupId.trim().length() > 0)
		{
			m.put("GROUP_ID", groupId);
		}
		else
		{
			m.put("GROUP_ID", "");
		}
		return (List<Member>)sqlMapFactory.getSqlMap().queryForList("findGroupMemberList", m);
	}
	
	public static List<Member> getUnGroupedMemberList(String ssoAccount,String mId) throws SQLException{
		Map<String,String> m = new HashMap<String, String>();
			m.put("BELONG_TO", mId);
		
		if(ssoAccount!=null&&ssoAccount.trim().length()>0)
		{
			m.put("ssoAccount", ssoAccount);
		}
		else
		{
			m.put("ssoAccount", "");
		}
		
		return (List<Member>)sqlMapFactory.getSqlMap().queryForList("getUnGroupedMemberList", m);
	}
	
	public static int getUnGroupedMemberCount(long mId) throws SQLException{
		return (Integer)sqlMapFactory.getSqlMap().queryForObject("findUnGroupedMemberCount");
	}
	
	public static List<MemberGroup> findMemberGroupList(String groupName,String memberId) throws 

	SQLException{
			Map<String,String> m = new HashMap<String, String>();
			m.put("BELONG_TO",memberId);
			
			if(groupName != null && groupName.trim().length() > 0)
				m.put("GROUP_NAME", groupName);
			
			return (List<MemberGroup>)sqlMapFactory.getSqlMap().queryForList("findMemberGroupList", m);
		}
	
	public static List<MemberGroup> checkGroup(String groupName,String mId) throws SQLException{
		MemberGroup mg=new MemberGroup();
		if(groupName!=null&&groupName.length()>0)
		{
			mg.setGroup_name(groupName);
		}
		mg.setBelong_to(mId);
		
		return (List<MemberGroup>)sqlMapFactory.getSqlMap().queryForList("checkGroup", mg);
	}
	
	public static void addMemberGroup(Map m) throws Exception {
		MemberGroup mg=new MemberGroup();
		mg.setGroup_name((String)m.get("GROUP_NAME"));
		mg.setBelong_to((String)m.get("BELONG_TO"));
		mg.setID((String)m.get("ID"));
		sqlMapFactory.getSqlMap().insert("insertMemberGroup",mg);
	}
	
	public static void delGroupMember(Map m) throws Exception {
		MemberGroupRelation mgr=new MemberGroupRelation();
		mgr.setGROUP_ID((String)m.get("groupId"));
		mgr.setMEMBER_ID((String)m.get("delGroupMember"));
		
	}
	
	public static void deleteGroupInfo(String groupId) throws Exception {
		MemberGroup mg=new MemberGroup();
		mg.setID(groupId);
		sqlMapFactory.getSqlMap().delete("deleteMemberGroup",mg);
	}
	
	//删除组别时同时将该组别内的成员分配为未分组成员
	public static void deleteInGroupMember(String groupId) throws Exception {
		MemberGroupRelation mgr=new MemberGroupRelation();
		mgr.setGROUP_ID(groupId);
		sqlMapFactory.getSqlMap().delete("deleteInGroupMember",mgr);
	}
	
	public static void delGroupMember(String memberId) throws Exception {
		MemberGroupRelation mgr=new MemberGroupRelation();
		mgr.setMEMBER_ID(memberId);
		sqlMapFactory.getSqlMap().delete("deleteGroupMember",mgr);
	}
	
	//得到所有组员
	public static List<Member> getAllMember(String ssoAccount) throws Exception {
		Member mb=new Member();
		mb.setSsoAccount(ssoAccount);
		return (List<Member>)sqlMapFactory.getSqlMap().queryForList("getAllMember",mb);
	}
	
	//得到要编辑组名的旧组名
	public static MemberGroup getEditGroup(String groupId) throws Exception {
		MemberGroup mg=new MemberGroup();
		mg.setID(groupId);
		return (MemberGroup)sqlMapFactory.getSqlMap().queryForObject("getEditGroup",mg);
	}
	
	public static void inGroup(String memberId,String groupIdset) throws Exception {
		String mId=memberId;
		String groupId=groupIdset;
		MemberGroupRelation mgr=new MemberGroupRelation();
		mgr.setGROUP_ID(groupIdset);
		mgr.setMEMBER_ID(memberId);
		sqlMapFactory.getSqlMap().insert("insertGroup",mgr);
	}
	
	public static void upGroupName(Map mm) throws Exception {
		MemberGroup mg=new MemberGroup();
		mg.setGroup_name((String)mm.get("GROUP_NAME"));
		mg.setID((String)mm.get("GROUP_ID"));
		sqlMapFactory.getSqlMap().update("upGroupName",mg);
	}
}