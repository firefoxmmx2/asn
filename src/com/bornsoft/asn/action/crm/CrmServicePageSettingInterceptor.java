package com.bornsoft.asn.action.crm;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsStatics;

import com.bornsoft.asn.service.crm.CrmServPlanService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class CrmServicePageSettingInterceptor extends AbstractInterceptor
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 1L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception
	{
		ActionContext actionContext = invocation.getInvocationContext();
		HttpServletRequest request = (HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
		request.setAttribute("status", CrmServPlanService.status);
		request.setAttribute("type", CrmServPlanService.type);
		request.setAttribute("sendType", CrmServPlanService.sendType);
		request.setAttribute("excuteType", CrmServPlanService.excuteType);
		return invocation.invoke();
	}

}
