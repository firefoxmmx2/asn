package com.bornsoft.asn.dao.crm;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.bean.crm.CrmServicePlan;
import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class CrmServPlanDao
{
	public static void insert(CrmServicePlan csp)
	{
		try
		{
			sqlMapFactory.getSqlMap().insert("insertCrmSer", csp);
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}

	public static void update(CrmServicePlan csp)
	{
		try
		{
			sqlMapFactory.getSqlMap().update("updateCrmSer", csp);
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void delete(Long crmServPlanId)
	{
		try
		{
			sqlMapFactory.getSqlMap().delete("deleteCrmSer", crmServPlanId);
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	public static List<CrmServicePlan> list(Map<String,Object> map)
	{
		List<CrmServicePlan> list = null;
		try
		{
			list = sqlMapFactory.getSqlMap().queryForList("getCrmSer", map);
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;

	}

	public static CrmServicePlan get(Long crmServPId)
	{
		CrmServicePlan plan = null;
		try
		{
			plan = (CrmServicePlan) sqlMapFactory.getSqlMap().queryForObject(
					"getCrmSerById",
					crmServPId);
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return plan;
	}

	public static Integer count(Map<String,Object> map)
	{
		Integer count = 0;

		// count = sqlMapFactory.getSqlMap().queryForObject("")
		return count;
	}
	
	@SuppressWarnings("unchecked")
	public static List<Member> getPlanCustmoers (Map<String,Object> map)
	{
		List<Member> lst = null;
		
		try
		{
			lst = sqlMapFactory.getSqlMap().queryForList("getSelectedCustomers", map);
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lst;
	}
	
	public static void insertPlanMapping(Map<String,Object> map)
	{
		try
		{
			sqlMapFactory.getSqlMap().insert("insertPlanMapping",map);
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static void deletePlanMapping(Map<String,Object> map)
	{
		try
		{
			sqlMapFactory.getSqlMap().delete("deletePlanMapping",map);
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
