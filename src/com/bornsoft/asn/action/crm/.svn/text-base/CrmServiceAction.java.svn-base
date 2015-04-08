package com.bornsoft.asn.action.crm;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.crm.CrmServicePlan;
import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.exception.ActionException;
import com.bornsoft.asn.service.crm.CrmServPlanService;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.utils.common.AsnConstLib;
import com.bornsoft.asn.utils.common.PageAjaxTool;
import com.bornsoft.asn.utils.common.PageCreator;
import com.opensymphony.xwork2.ActionSupport;

public class CrmServiceAction extends ActionSupport
{

	/**
	 * 
	 */
	private static final long		serialVersionUID	= 1L;

	// 图片高宽
	private Integer					width				= 700;
	private Integer					height				= 600;
	// 所有客戶
	private List<Member>			customers;
	private String					planCustomerIds;
	// 客户省级分布图表地址
	private String					distProvImage;
	// 客户县级分布地址
	private String					distCtryImage;
	// 服务排程列表
	private List<CrmServicePlan>	crmsPlans;
	private String					formAction;
	private CrmServicePlan			crmServPlan;
	// 客戶分頁
	private Integer					page				= 1;
	private String					pageBar;
	private Integer					pageSize			= 20;
	// 分頁客戶
	private List<Member>			pageCustomers;
	private String					keywordTitle;
	private String					keywordStatus;
	private List<Long>				crmPlanIds;

	/**
	 * 客户视图
	 * 
	 * @return 目标页面
	 * @throws Exception
	 */
	public String customerView() throws Exception
	{
		distCtryImage = CrmServPlanService.generateCustomerDistView(
				MemberService.getMemberId(),
				width,
				height,
				CrmServPlanService.FILTER_LEVEL_COUNTRY);

		return SUCCESS;
	}

	public String customerServiceView() throws Exception
	{
		formAction = "cView";
		if (keywordStatus != null && keywordStatus.length() == 0)
			keywordStatus = null;
		int count = CrmServPlanService.getCrmServPlansCount(
				null,
				keywordTitle,
				keywordStatus);
		PageCreator pagetool = new PageCreator();
		pagetool.setPageSize(page);
		pagetool.setPageSize(pageSize);
		pagetool.setTotalRow(count);
		pageBar = pagetool.getPageBar();

		crmsPlans = CrmServPlanService.getCrmServPlans(
				pagetool.getStartCount(),
				pagetool.getEndCount(),
				null,
				keywordTitle,
				keywordStatus);
		return SUCCESS;
	}

	public String toCustomerServAdd() throws Exception
	{
		formAction = "cServAdd";
		// Long memberId = MemberService.getMemberId();
		crmServPlan = new CrmServicePlan();
		crmServPlan.setId(IdMakerService
				.newId(AsnConstLib.CRM_SERVICE_PLAN_ID_TYPE));

		return SUCCESS;
	}

	public String customerServiceAdd() throws Exception
	{
		if (crmServPlan == null)
			throw new ActionException("crm service plan is null");
		if (planCustomerIds != null)
		{
			// 設置關聯客戶列表
			customers = new ArrayList<Member>();
			for (String id : planCustomerIds.split(","))
			{
				if (id.length() == 0)
					continue;
				try
				{
					Long mid = Long.parseLong(id);
					Member customer = new Member();
					customer.setMemberId(mid);
					customers.add(customer);
				}
				catch (NumberFormatException e)
				{
					Logger log = Logger.getLogger(CrmServiceAction.class);
					log.error(id + " 不能轉化爲 長整型");
					continue;
				}

			}
			crmServPlan.setCustomer(customers);
		}
		Long memberId = MemberService.getMemberId();
		CrmServPlanService.addCrmServPlan(crmServPlan, memberId);

		return SUCCESS;
	}

	public String toCustomerServModify() throws Exception
	{
		formAction = "cServModify";
		if (crmServPlan == null)
			throw new ActionException("crm service plan is null");
		crmServPlan = CrmServPlanService.getCrmServPlan(crmServPlan.getId());

		return SUCCESS;
	}

	public String customerServiceModify() throws Exception
	{
		if (crmServPlan == null)
			throw new ActionException("crm service plan is null");
		if (planCustomerIds != null)
		{
			// 設置關聯客戶列表
			customers = new ArrayList<Member>();
			for (String id : planCustomerIds.split(","))
			{
				if (id.length() == 0)
					continue;
				try
				{
					Long mid = Long.parseLong(id);
					Member customer = new Member();
					customer.setMemberId(mid);
					customers.add(customer);
				}
				catch (NumberFormatException e)
				{
					Logger log = Logger.getLogger(CrmServiceAction.class);
					log.error(id + " 不能轉化爲 長整型");
					continue;
				}

			}
			crmServPlan.setCustomer(customers);
		}
		Long memberId = MemberService.getMemberId();
		CrmServPlanService.modifyCrmServPlan(crmServPlan, memberId);

		return SUCCESS;
	}

	public String customerServiceRemove() throws Exception
	{
		CrmServPlanService.removeCrmServPlan(crmPlanIds);
		return SUCCESS;
	}

	public String getMorePageCustomers() throws Exception
	{

		if (formAction == null)
			formAction = "";
		Long curMemberId = MemberService.getMemberId();
		customers = MemberService.getCustomers(curMemberId);
		Integer count = MemberService.getCustomersCount(curMemberId);
		PageAjaxTool pageTool = new PageAjaxTool();
		pageTool.setPageSize(pageSize);
		pageTool.setCurrentPage(page);
		pageTool.setTotalRow(count);
		pageBar = pageTool.getPageBar();
		pageCustomers = MemberService.getCustomers(
				pageTool.getStartCount(),
				pageTool.getEndCount(),
				curMemberId);

		return SUCCESS;
	}

	public Integer getWidth()
	{
		return width;
	}

	public Integer getHeight()
	{
		return height;
	}

	public String getDistProvImage()
	{
		return distProvImage;
	}

	public String getDistCtryImage()
	{
		return distCtryImage;
	}

	public void setWidth(Integer width)
	{
		this.width = width;
	}

	public void setHeight(Integer height)
	{
		this.height = height;
	}

	public void setDistProvImage(String distProvImage)
	{
		this.distProvImage = distProvImage;
	}

	public void setDistCtryImage(String distCtryImage)
	{
		this.distCtryImage = distCtryImage;
	}

	public String getFormAction()
	{
		return formAction;
	}

	public void setFormAction(String formAction)
	{
		this.formAction = formAction;
	}

	public CrmServicePlan getCrmServPlan()
	{
		return crmServPlan;
	}

	public void setCrmServPlan(CrmServicePlan crmServPlan)
	{
		this.crmServPlan = crmServPlan;
	}

	public List<Member> getCustomers()
	{
		return customers;
	}

	public List<CrmServicePlan> getCrmsPlans()
	{
		return crmsPlans;
	}

	public void setCustomers(List<Member> customers)
	{
		this.customers = customers;
	}

	public void setCrmsPlans(List<CrmServicePlan> crmsPlans)
	{
		this.crmsPlans = crmsPlans;
	}

	public Integer getPage()
	{
		return page;
	}

	public String getPageBar()
	{
		return pageBar;
	}

	public void setPage(Integer page)
	{
		this.page = page;
	}

	public void setPageBar(String pageBar)
	{
		this.pageBar = pageBar;
	}

	public Integer getPageSize()
	{
		return pageSize;
	}

	public void setPageSize(Integer pageSize)
	{
		this.pageSize = pageSize;
	}

	public List<Member> getPageCustomers()
	{
		return pageCustomers;
	}

	public void setPageCustomers(List<Member> pageCustomers)
	{
		this.pageCustomers = pageCustomers;
	}

	public String getPlanCustomerIds()
	{
		return planCustomerIds;
	}

	public void setPlanCustomerIds(String planCustomerIds)
	{
		this.planCustomerIds = planCustomerIds;
	}

	public String getKeywordTitle()
	{
		return keywordTitle;
	}

	public void setKeywordTitle(String keywordTitle)
	{
		this.keywordTitle = keywordTitle;
	}

	public String getKeywordStatus()
	{
		return keywordStatus;
	}

	public void setKeywordStatus(String keywordStatus)
	{
		this.keywordStatus = keywordStatus;
	}

	public List<Long> getCrmPlanIds()
	{
		return crmPlanIds;
	}

	public void setCrmPlanIds(List<Long> crmPlanIds)
	{
		this.crmPlanIds = crmPlanIds;
	}
}
