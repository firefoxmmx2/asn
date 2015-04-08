package com.bornsoft.asn.action.account;

import java.util.Date;
import java.util.List;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.account.Account;
import com.bornsoft.asn.service.account.AccountService;
import com.bornsoft.asn.utils.common.PageTool;


@SuppressWarnings("serial")
public class AccountAction extends BaseAction{
	private Date startTime;
	private Date endTime;
	private int page=1;
	private int pageSize=10 ;
	private String pageBar;
	private Account account;
	private List<Account> accountList;
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String getPageBar() {
		return pageBar;
	}

	public void setPageBar(String pageBar) {
		this.pageBar = pageBar;
	}
	

	/**
	 * 查询账单
	 * @return
	 * @throws Exception
	 */
	public String queryAccount() throws Exception{
		if(account==null)
			account=new Account();
		
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;
		
		int count = AccountService.findAccountCount(account.getId(),startTime,endTime,account.getOrderId());
		
		PageTool pageTool=new PageTool();
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	
	   	accountList=AccountService.findAccount(startCount,endCount,account.getId(),startTime,endTime,account.getOrderId());
		
		return SUCCESS;
	}

	public Date getStartTime() {
		return startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public Account getAccount() {
		return account;
	}

	public List<Account> getAccountList() {
		return accountList;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public void setAccountList(List<Account> accountList) {
		this.accountList = accountList;
	}
}
