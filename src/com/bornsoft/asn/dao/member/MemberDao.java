package com.bornsoft.asn.dao.member;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.dao.CommonDAO;
import com.bornsoft.asn.utils.common.sqlMapFactory;

/**
 * Member DAO
 */
public class MemberDao extends CommonDAO
{

	/**
	 * get member by id
	 * 
	 * @param memberId
	 * @return
	 * @throws SQLException
	 */
	public Member getMemberById(long memberId) throws SQLException
	{
		return (Member) this.queryForObject("getMemberById", memberId, null);
	}

	/**
	 * get member by sso account
	 * 
	 * @param ssoAccount
	 * @return
	 * @throws SQLException
	 */
	public Member getMemberBySsoAccount(String ssoAccount) throws SQLException
	{
		return (Member) this.queryForObject(
				"getMemberBySsoAccount",
				ssoAccount,
				null);
	}

	@SuppressWarnings("unchecked")
	public List<Member> listMemberByParam(Map parameters) throws SQLException
	{
		return (List) this.queryForList("getMemberList", parameters);
	}
	
	/**
	 * @author cl
	 * @description 获取所有记录  -----综合查询
	 * @date 2010-11-25
	 */
	public List<Member> listGeneralMember(Map parameters) throws SQLException
	{
		return (List) this.queryForList("getGeneralMemberList", parameters);
	}

	/**
	 * @author cl
	 * @description 用户注册
	 * @date 2010-02-26
	 */
	public void insertMember(Member member) throws SQLException
	{
		sqlMapFactory.getSqlMap().insert("addMember", member);
	}

	/**
	 * @author cl
	 * @description 修改会员资料
	 * @date 2010-03-08
	 */
	public static void updateMemberById(Member member) throws SQLException
	{
		sqlMapFactory.getSqlMap().update("updateMemberById", member);
	}

	public static void updateMemberLastLogin(HashMap<String,Object> paras)
			throws SQLException
	{
		sqlMapFactory.getSqlMap().update("updateMemberLastLogin", paras);

	}

	/**
	 * @author cl
	 * @description 查询所有的企业会员资料
	 * @date 2010-03-09
	 */
	public static List<Member> getAllenterprise() throws SQLException
	{
		return sqlMapFactory.getSqlMap().queryForList("getAllenterprise");
	}

	/**
	 * @author cl
	 * @description 查询的企业会员资料————根据会员名称
	 * @date 2010-03-09
	 */
	public static List<Member> getEnterpriseByName(String strname)
			throws SQLException
	{
		return sqlMapFactory.getSqlMap().queryForList(
				"getEnterpriseByName",
				strname);
	}

	/**
	 * @author cl
	 * @description 邮箱验证，获取用户信息
	 * @date 2010-03-15
	 */
	public static Member getMemberByMailCode(String mailCode)
			throws SQLException
	{
		return (Member) sqlMapFactory.getSqlMap().queryForObject(
				"getMemberByMailCode",
				mailCode);
	}

	/**
	 * @author cl
	 * @description 修改审核状态
	 * @date 2010-03-15
	 */
	public static void updateApproveState(Member member) throws SQLException
	{
		sqlMapFactory.getSqlMap().update("updateApproveState", member);
	}

	/**
	 * @author cl
	 * @description 修改邮件验证码
	 * @date 2010-03-15
	 */
	public static void updateMailVerifyCode(Member member) throws SQLException
	{
		sqlMapFactory.getSqlMap().update("updateMailVerifyCode", member);
	}

	/**
	 * 根据会员的ID批量查询会员的信息
	 * 2010-3-12
	 * 
	 * @author yuwenqiang
	 * @param memberIds
	 * @return
	 * @throws SQLException
	 */
	public static List<Member> getMemberList(List<Long> memberIds)
			throws SQLException
	{
		return sqlMapFactory.getSqlMap().queryForList(
				"findMemberList",
				memberIds);
	}

	/**
	 * @author cl
	 * @discription 管理员彻底删除用户信息
	 * @date 2010-03-18
	 */
	public static void deleteMember(Long memberId) throws SQLException
	{
		sqlMapFactory.getSqlMap().delete("delMember", memberId);
	}

	/**
	 * @author cl
	 * @description 修改邮箱
	 * @date 2010-03-21
	 */
	public static void updateMail(Member member) throws SQLException
	{
		sqlMapFactory.getSqlMap().update("updateMail", member);
	}

	/**
	 * @author cl
	 * @description 获取记录总行数
	 * @date 2010-03-25
	 */
	public static int getMemberCount(Map para) throws SQLException
	{
		return ((Long) sqlMapFactory.getSqlMap().queryForObject("getMemberCount",para)).intValue();

	}
	
	/**
	 * @author cl
	 * @description 获取记录总行数 -----综合查询
	 * @date 2010-011-25
	 */
	public static int getGeneralMemberCount(Map para) throws SQLException
	{
		return ((Long) sqlMapFactory.getSqlMap().queryForObject("getGeneralMemberCount",para)).intValue();

	}

	/**
	 * @author cl
	 * @discription 修改会员锁定状态
	 * @date 2010-04-01
	 */
	public static void updMemberLocked(Map m) throws SQLException
	{
		sqlMapFactory.getSqlMap().update("updMemberLocked", m);
	}

	/**
	 * 获取符合参数的客户
	 * @param map 参数列表
	 * @return 客户
	 * @author hooxin
	 * @since 2010-11-3
	 */
	@SuppressWarnings("unchecked")
	public static List<Member> getCustomer(Map<String,Object> map)
	{
		List<Member> mlist = null;
		try
		{
			mlist = sqlMapFactory.getSqlMap().queryForList("getCustomer", map);
		}
		catch (SQLException e)
		{
			Logger log = Logger.getLogger(MemberDao.class);
			log.error(e);
		}
		return mlist;
	}
	
	/**
	 * 
	 * 獲取符合條件的記錄數
	 * @param map 條件
	 * @return 記錄數
	 * @author hooxin
	 */
	public static Integer getCustomerCount(Map<String,Object> map)
	{
		Integer count = 0;
		try
		{
			count = (Integer) sqlMapFactory.getSqlMap().queryForObject("getCustomerCount",map);
		}
		catch (SQLException e)
		{
			Logger log= Logger.getLogger(MemberDao.class);
			log.error(e);
			e.printStackTrace();
		}
		
		return count;
		
	}
}
