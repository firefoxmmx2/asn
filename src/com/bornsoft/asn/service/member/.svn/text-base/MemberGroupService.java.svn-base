package com.bornsoft.asn.service.member;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.action.member.MemberGroup;
import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.dao.member.MemberGroupDao;
import com.bornsoft.asn.dao.quotation.QuotationDAO;
import com.bornsoft.asn.dao.quotation.QuotationProductDAO;
import com.bornsoft.asn.service.quotation.QuotationService;
import com.bornsoft.asn.utils.common.sqlMapFactory;





/**
 * @author Administrator
 *
 */
/**
 * @author Administrator
 *
 */
public class MemberGroupService {
	
	/**
	 * 得到组别记录数
	*/
	public static int findMemberGroupCount(String groupName,String memberId) throws Exception{
		try{
			return MemberGroupDao.findMemberGroupCount(groupName,memberId);
		}catch (Exception e) {
			// TODO: handle exception
			Logger log = Logger.getLogger(QuotationService.class);
			log.error("得到行情信息记录数 SERVICE", e);
			throw e;
		}
	}
	
	/**
	 * 得到组别成员记录数
	*/
	public static int getGroupMemberCount(String groupId) throws Exception{
		try{
			return MemberGroupDao.getGroupMemberCount(groupId);
		}catch (Exception e) {
			// TODO: handle exception
			Logger log = Logger.getLogger(QuotationService.class);
			log.error("得到行情信息记录数 SERVICE", e);
			throw e;
		}
	}
	
	/**
	 * 分页得到会员组别信息
	 * @param startCount 起始记录数
	 * @param endCount 结束记录数
	 * @param group_name 分组名称
	 * @return
	 * @throws Exception
	 */
	public static List<MemberGroup> findMemberGroupList(String groupName,String memberId) throws Exception{
		try{
			return MemberGroupDao.findMemberGroupList(groupName,memberId);
		}catch (Exception e) {
			Logger log = Logger.getLogger(MemberGroup.class);
			log.info("获取行情信息列表出错 SERVICE", e);
			throw e;
		}
	}
	
	//不分页得到会员组别信息
	public static List<MemberGroup> checkGroup(String groupName,String mId) throws Exception{
		try{
			return MemberGroupDao.checkGroup(groupName,mId);
		}catch (Exception e) {
			Logger log = Logger.getLogger(MemberGroup.class);
			log.info("获取会员组别列表出错 SERVICE", e);
			throw e;
		}
	}
	
	public static int getUnGroupedMemberCount(long mId) throws Exception{
		return MemberGroupDao.getUnGroupedMemberCount(mId);
	}
	
	/**
	 * 分页得到会员组别信息
	 * @param startCount 起始记录数
	 * @param endCount 结束记录数
	 * @param group_name 分组名称
	 * @return
	 * @throws Exception
	 */
	public static List<Member> getGroupMemberList(int startCount, int endCount, String groupId,String mId) throws Exception{
		try{
			return MemberGroupDao.getGroupMemberList(startCount, endCount, groupId,mId);
		}catch (Exception e) {
			Logger log = Logger.getLogger(MemberGroup.class);
			log.info("获取行情信息列表出错 SERVICE", e);
			throw e;
		}
	}
	
	public static void delGroupMember(Map mm)
	{
		try
		{
			MemberGroupDao.delGroupMember(mm);
		}
		catch(Exception e) {
			
		}
	}
	
	/**
	 * @param startCount
	 * @param endCount
	 * @param groupId
	 * @return
	 * @throws Exception
	 */
	public static List<Member> getUnGroupedMemberList(String ssoAccount,String mId) throws Exception{
		return MemberGroupDao.getUnGroupedMemberList(ssoAccount,mId);
	}
	
	public static void addMemberGroup (Map m,String memberId) throws Exception {
		try {
		sqlMapFactory.getSqlMap().startTransaction();
		MemberGroupDao.addMemberGroup(m);
		String groupIdset=(String)m.get("ID");
		memberId=memberId.trim();
		if(memberId.equals("")==false||memberId.length()>0)
		{
			String[] memberIdArray = memberId.split(",");
			for(int i = 0; i<memberIdArray.length; i++){
				MemberGroupDao.inGroup(String.valueOf(memberIdArray[i]),groupIdset);
			}
		}
		sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			Logger log = Logger.getLogger(QuotationService.class);
			log.error("增加新的会员组别， 出错 SERVICE", e);
			throw e;
		} finally {
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	public static void deleteGroupInfo(String groupId) throws Exception {
		try {
			sqlMapFactory.getSqlMap().startTransaction();
			MemberGroupDao.deleteGroupInfo(groupId);
			MemberGroupDao.deleteInGroupMember(groupId);
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			Logger log = Logger.getLogger(QuotationService.class);
			log.error("删除组别及改组会员， 出错 SERVICE", e);
			throw e;
		} finally {
			sqlMapFactory.getSqlMap().endTransaction();
		}
		
	}
	
	public static void inGroup(String memberId,String groupIdset) throws Exception {
		MemberGroupDao.inGroup(memberId,groupIdset);
	}
	
	public static void upGroupName(Map mm) throws Exception {
		MemberGroupDao.upGroupName(mm);
	}
	
	public static MemberGroup getEditGroup(String groupId) throws Exception {
		return MemberGroupDao.getEditGroup(groupId);
	}
	
	public static void delGroupMember(String memberId) throws Exception {
		MemberGroupDao.delGroupMember(memberId);
	}
	
	public static List<Member> getAllMember(String ssoAccount) throws Exception {
		return MemberGroupDao.getAllMember(ssoAccount);
	}
}
