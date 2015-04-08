package com.bornsoft.asn.action.activity;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.service.activity.ActivityService;
import com.bornsoft.asn.utils.common.WebContext;

public class ActivityAction extends BaseAction {

	/**
	 * 
	 */
	private List list;
	private static final long serialVersionUID = 1L;
	
	
	public List getList() {
		return list;
	}



	public void setList(List list) {
		this.list = list;
	}



	public String secKill()throws Exception{
		
		list = ActivityService.getSecKillActivity();
		
		return SUCCESS;
	}
	
	public String getSystemTime() {
		HttpServletResponse response = WebContext.getResponse();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(new Date().getTime());
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
		return null;
	}
	

}
