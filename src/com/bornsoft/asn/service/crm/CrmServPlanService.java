package com.bornsoft.asn.service.crm;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jfree.chart.JFreeChart;

import com.bornsoft.asn.bean.crm.CrmServicePlan;
import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.dao.crm.CrmServPlanDao;
import com.bornsoft.asn.exception.ActionException;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.utils.common.CurveGenerator;
import com.bornsoft.asn.utils.common.WebContext;
import com.bornsoft.asn.utils.common.sqlMapFactory;

/**
 * @author hooxin
 */

public class CrmServPlanService
{

	/**
	 * 狀態已執行
	 */
	public static final String			STATUS_EXECUTED			= "Y";
	/**
	 * 狀態未執行
	 */
	public static final String			STATUS_NON_EXE			= "N";

	/**
	 * 類型生日
	 */
	public static final String			TYPE_BIRTHDAY			= "B";
	/**
	 * 類型假日
	 */
	public static final String			TYPE_HOLIDAYS			= "H";
	/**
	 * 類型其他
	 */
	public static final String			TYPE_OTHERS				= "O";
	/**
	 * 發送類型郵件
	 */
	public static final String			SEND_TYPE_MAIL			= "M";
	/**
	 * 發送類型短信
	 */
	public static final String			SEND_TYPE_SMS			= "S";

	/**
	 * 發送類型電話
	 */
	public static final String			SEND_TYPE_PHONE			= "P";
	/**
	 * 執行類型立即
	 */
	public static final String			EXCUTE_TYPE_IMMEDIATELY	= "N";
	/**
	 * 執行類型定時
	 */
	public static final String			EXCUTE_TYPE_SCHEDULED	= "Y";

	/**
	 * 執行類型鍵值對
	 */
	public static Map<String,Object>	excuteType				= new HashMap<String,Object>();

	/**
	 * 發送類型鍵值對
	 */
	public static Map<String,Object>	sendType				= new HashMap<String,Object>();

	/**
	 * 類型鍵值對
	 */
	public static Map<String,Object>	type					= new HashMap<String,Object>();

	/**
	 * 狀態鍵值對
	 */
	public static Map<String,Object>	status					= new HashMap<String,Object>();

	/**
	 * 分布图过滤等级，县级
	 */
	public static final int				FILTER_LEVEL_COUNTRY	= 0;
	/**
	 * 分布图过滤等级，城级
	 */
	public static final int				FILTER_LEVEL_CITY		= 1;

	static
	{

		excuteType.put(EXCUTE_TYPE_IMMEDIATELY, "立即");
		excuteType.put(EXCUTE_TYPE_SCHEDULED, "定时");

		sendType.put(SEND_TYPE_MAIL, "邮件");
		sendType.put(SEND_TYPE_PHONE, "电话");
		sendType.put(SEND_TYPE_SMS, "短信");

		type.put(TYPE_BIRTHDAY, "生日");
		type.put(TYPE_HOLIDAYS, "节假日");
		type.put(TYPE_OTHERS, "其他");

		status.put(STATUS_EXECUTED, "已执行");
		status.put(STATUS_NON_EXE, "未执行");

	}

	/**
	 * 获取单个服务
	 * 
	 * @param crmServPlanId
	 *            服务ID
	 * @return 服务
	 */
	public static CrmServicePlan getCrmServPlan(Long crmServPlanId)
	{
		if (crmServPlanId == null || crmServPlanId == 0)
			throw new ActionException("crm service plan id is null or 0");

		return CrmServPlanDao.get(crmServPlanId);
	}

	/**
	 * 获取单个服务（带客户信息）
	 * 
	 * @param planId
	 *            服务ID
	 * @param customerStart
	 *            客户起始记录数
	 * @param customerEnd
	 *            客户结束记录数
	 * @param memberId
	 *            供应商ID
	 * @return 服务
	 */
	public static CrmServicePlan getCrmServPlan(
			Long planId, Integer customerStart, Integer customerEnd,
			Long memberId)
	{
		if (planId == null)
			throw new ActionException("crm service plan id is null");
		CrmServicePlan csp = CrmServPlanDao.get(planId);
		csp.setCustomer(getPlanCustomers(
				customerStart,
				customerEnd,
				memberId,
				planId));

		return csp;
	}

	/**
	 * 获取单个服务（带客户信息）
	 * 
	 * @param planId
	 *            服务ID
	 * @param memberId
	 *            供应商ID
	 * @return 服务
	 */
	public static CrmServicePlan getCrmServPlan(Long planId, Long memberId)
	{
		if (planId == null)
			throw new ActionException("crm service plan id is null");
		CrmServicePlan csp = CrmServPlanDao.get(planId);
		csp.setCustomer(getPlanCustomers(memberId, planId));

		return csp;
	}

	/**
	 * 获取服务记录数
	 * 
	 * @param planId
	 *            服务ID
	 * @param title
	 *            标题
	 * @param status
	 *            状态
	 * @return 记录数
	 */
	public static Integer getCrmServPlansCount(
			Long planId, String title, String status)
	{
		Map<String,Object> map = new HashMap<String,Object>();
		if (planId != null)
			map.put("planId", planId);
		if (title != null)
			map.put("title", title);
		if (status != null)
			map.put("status", status);

		return CrmServPlanDao.count(map);
	}

	/**
	 * 得到全部服务
	 * 
	 * @return 全部服务
	 */
	public static List<CrmServicePlan> getCrmServPlans()
	{
		Map<String,Object> map = new HashMap<String,Object>();

		return CrmServPlanDao.list(map);
	}

	/**
	 * 获取指定服务（分页）
	 * 
	 * @param start
	 *            起始记录数
	 * @param end
	 *            结束记录数
	 * @param planId
	 *            服务ID
	 * @param title
	 *            标题
	 * @return 服务
	 */
	public static List<CrmServicePlan> getCrmServPlans(
			Integer start, Integer end, Long planId, String title)
	{
		Map<String,Object> map = new HashMap<String,Object>();

		if (start != null)
			map.put("start", start);
		if (end != null)
			map.put("end", end);
		if (planId != null)
			map.put("planId", planId);
		if (title != null)
			map.put("title", title);

		return CrmServPlanDao.list(map);
	}

	/**
	 * 获取指定服务（分页）
	 * 
	 * @param start
	 *            起始记录数
	 * @param end
	 *            结束记录数
	 * @param planId
	 *            服务ID
	 * @param title
	 *            标题
	 * @param status
	 *            状态
	 * @return 服务
	 */
	public static
			List<CrmServicePlan> getCrmServPlans(
					Integer start, Integer end, Long planId, String title,
					String status)
	{
		Map<String,Object> map = new HashMap<String,Object>();

		if (start != null)
			map.put("start", start);
		if (end != null)
			map.put("end", end);
		if (planId != null)
			map.put("planId", planId);
		if (title != null)
			map.put("title", title);
		if (status != null)
			map.put("status", status);
		return CrmServPlanDao.list(map);
	}

	/**
	 * 添加服务排程
	 * 
	 * @param csp
	 *            需要添加的服务排程
	 * @param memberId
	 *            供应商ID
	 */
	public static void addCrmServPlan(CrmServicePlan csp, Long memberId)throws Exception
	{

		try
		{
			sqlMapFactory.getSqlMap().startTransaction();
			Member theMember = MemberService.getMember(memberId);
			csp.setCreateMan(theMember.getShortName() == null
					|| theMember.getShortName().length() == 0 ? "暫無"
					: theMember.getShortName());
			csp.setCreateTime(new Date());
			if (csp.getTiming() != null && csp.getTiming().length() == 0)
				csp.setTiming(null);

			CrmServPlanDao.insert(csp);
			// 添加關聯客戶
			if (csp.getCustomer() != null && csp.getCustomer().size() > 0)
			{
				// 關聯新的客戶,不關鏈老的客戶
				for (Member m : csp.getCustomer())
				{
					Map<String,Object> map = new HashMap<String,Object>();
					map.put("planId", csp.getId());
					map.put("memberId", m.getMemberId());
					CrmServPlanDao.insertPlanMapping(map);
				}
			}
			sqlMapFactory.getSqlMap().commitTransaction();

		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * 修改服务排程
	 * 
	 * @param csp
	 *            需要修改的服务
	 * @param memberId
	 *            供应商ID
	 */
	public static void modifyCrmServPlan(CrmServicePlan csp, Long memberId)
	{
		if (csp == null || csp.getId() == null || csp.getId() == 0)
			throw new ActionException("crm service plan id is null or 0");
		try
		{
			sqlMapFactory.getSqlMap().startTransaction();
			CrmServPlanDao.update(csp);
			// 修改關聯
			if (csp.getCustomer() != null && csp.getCustomer().size() > 0)
			{
				List<Member> oldCustomers = getPlanCustomers(
						memberId,
						csp.getId());
				List<Member> newCustomers = csp.getCustomer();

				// 關聯新的客戶,不關鏈老的客戶

				for (Member m : oldCustomers)
				{
					boolean isContain = false;

					for (Member m2 : newCustomers)
					{
						if (m2.getMemberId() == m.getMemberId())
						{
							isContain = true;
							break;
						}
					}
					if (!isContain)
					{
						Map<String,Object> map = new HashMap<String,Object>();
						map.put("planId", csp.getId());
						map.put("memberId", m.getMemberId());
						CrmServPlanDao.deletePlanMapping(map);
					}
				}

				for (Member m : csp.getCustomer())
				{
					boolean isContain = false;

					for (Member m2 : oldCustomers)
					{
						if (m2.getMemberId() == m.getMemberId())
						{
							isContain = true;
							break;
						}
					}
					if (!isContain)
					{
						Map<String,Object> map = new HashMap<String,Object>();
						map.put("planId", csp.getId());
						map.put("memberId", m.getMemberId());
						CrmServPlanDao.insertPlanMapping(map);
					}
				}

			}
			sqlMapFactory.getSqlMap().commitTransaction();
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			try
			{
				sqlMapFactory.getSqlMap().endTransaction();
			}
			catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally
			{
				try
				{
					sqlMapFactory.getSqlMap().endTransaction();
				}
				catch (SQLException e)
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

	}

	/**
	 * 删除一个服务
	 * 
	 * @param crmServPlanId
	 *            要删除的服务
	 */
	public static void removeCrmServPlan(Long crmServPlanId)
	{
		if (crmServPlanId == null || crmServPlanId == 0)
			throw new ActionException("crm service plan id is null or 0");

		try
		{
			sqlMapFactory.getSqlMap().startTransaction();
			CrmServPlanDao.delete(crmServPlanId);
			sqlMapFactory.getSqlMap().commitTransaction();
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			try
			{
				sqlMapFactory.getSqlMap().endTransaction();
			}
			catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/**
	 * 删除多个服务
	 * 
	 * @param crmPlanId
	 *            要删除的服务ID集合
	 */
	public static void removeCrmServPlan(List<Long> crmPlanId)
	{
		if (crmPlanId == null || crmPlanId.size() == 0)
			throw new ActionException("crm service plan id is null or 0");

		try
		{
			sqlMapFactory.getSqlMap().startTransaction();
			for (Long crmServPlanId : crmPlanId)
				CrmServPlanDao.delete(crmServPlanId);
			sqlMapFactory.getSqlMap().commitTransaction();
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			try
			{
				sqlMapFactory.getSqlMap().endTransaction();
			}
			catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/**
	 * 获取服务关联客户
	 * 
	 * @param memberId
	 *            供应商ID
	 * @param planId
	 *            服务ID
	 * @return 服务关联客户
	 */
	public static List<Member> getPlanCustomers(Long memberId, Long planId)
	{
		List<Member> planCustomers = null;
		Map<String,Object> map = new HashMap<String,Object>();
		if (memberId == null || memberId == 0)
			throw new ActionException("member id is null or 0!");
		if (planId == null || planId == 0)
			throw new ActionException("plan id is null or 0");
		map.put("memberId", memberId);
		map.put("planId", planId);
		planCustomers = CrmServPlanDao.getPlanCustmoers(map);

		return planCustomers;
	}

	/**
	 * 获取服务关联客户（分页）
	 * 
	 * @param start
	 *            起始记录数
	 * @param end
	 *            结束记录数
	 * @param memberId
	 *            供应商ID
	 * @param planId
	 *            服务ID
	 * @return
	 */
	public static List<Member> getPlanCustomers(
			Integer start, Integer end, Long memberId, Long planId)
	{
		List<Member> planCustomers = null;
		Map<String,Object> map = new HashMap<String,Object>();
		if (memberId == null || memberId == 0)
			throw new ActionException("member id is null or 0!");
		if (planId == null || planId == 0)
			throw new ActionException("plan id is null or 0");
		map.put("memberId", memberId);
		map.put("planId", planId);
		if (start != null)
			map.put("start", start);
		if (end != null)
			map.put("end", end);

		planCustomers = CrmServPlanDao.getPlanCustmoers(map);

		return planCustomers;
	}

	/**
	 * 生成客户分布图
	 * 
	 * @param memberId
	 *            供应商ID
	 * @param width
	 *            图片宽度
	 * @param height
	 *            图片高度
	 * @param filterLevel
	 *            过滤机别（参考FILTER_LEVEL_CITY,FITLER_LEVEL_COUNTRY）
	 * @return 分布图地方
	 * @throws Exception 
	 */
	public static String generateCustomerDistView(
			Long memberId, int width, int height, int filterLevel) throws Exception
	{
		String distImagePath = null;
		List<Member> customers = MemberService.getCustomers(memberId);
		Map<String,Object> dataset = new HashMap<String,Object>();
		Map<String,Double> countMap = new HashMap<String,Double>();

		// 統計人數 也可以使用 數據庫統計
		if (customers != null && customers.size() > 0)
		{
			if (filterLevel == FILTER_LEVEL_COUNTRY)
			{
				for (Member m : customers)
				{
					String key = (m.getArea() != null && m
							.getArea()
							.trim()
							.length() > 0) ? m.getArea().split("\\|")[1] : "其他";
					if (countMap.get(key) == null || countMap.get(key) == 0)
						countMap.put(key, new Double(1));
					else
					{
						Double count = countMap.get(key);
						count += 1;
						countMap.put(key, count);
					}
				}
			}
			else if (filterLevel == FILTER_LEVEL_CITY)
			{

			}

			for (Member m : customers)
			{
				String key = (m.getArea() != null && m
						.getArea()
						.trim()
						.length() > 0) ? m.getArea().split("\\|")[1] : "其他";
				dataset.put(key, countMap.get(key));
			}
			try
			{
				JFreeChart chart = CurveGenerator.generatePie(null, dataset);
				distImagePath = CurveGenerator.saveChartOnServerAsPng(
						WebContext.getRequest(),
						chart,
						width,
						height);
			}
			catch (Exception e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return distImagePath;
	}

}
