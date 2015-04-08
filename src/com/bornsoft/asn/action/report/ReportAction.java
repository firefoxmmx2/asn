package com.bornsoft.asn.action.report;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.action.PageAction;
import com.bornsoft.asn.bean.report.ReportClick;
import com.bornsoft.asn.bean.report.ReportTrade;
import com.bornsoft.asn.service.report.ReportService;
import com.bornsoft.asn.utils.common.PageUtil;
import com.bornsoft.asn.vo.ReportMemberBean;

public class ReportAction extends PageAction{

	private static final long serialVersionUID = -3020741798546928378L;
    
	
	private Map<String,ReportMemberBean> list0;

	private List<ReportClick>  list1;
	private List<ReportTrade>  list2;
	//地区
	private String area;
	//是否是供应商
	private String ifSupper;
	//会员类别
	private String memberType;
	
	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	//排名
	private int rank;
	
	//产品成交量排名
	private int tranCount;
	
	//条件
	private String conditions;
	
	
	//开始时间
	private Date startDate;
	//结束时间
	private Date endDate;
	
	
	
	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public int pages=1;
	public int pagesize=5;
	public String pageBar ;
	public String formId;
	public PageUtil page = new PageUtil(); 
	
	
	
	
	
	public int getPages() {
		return pages;
	}

	public void setPages(int pages) {
		this.pages = pages;
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

	public String getPageBar() {
		return pageBar;
	}

	public void setPageBar(String pageBar) {
		this.pageBar = pageBar;
	}

	public String getFormId() {
		return formId;
	}

	public void setFormId(String formId) {
		this.formId = formId;
	}

	public PageUtil getPage() {
		return page;
	}

	public void setPage(PageUtil page) {
		this.page = page;
	}

	public String getConditions() {
		return conditions;
	}

	public void setConditions(String conditions) {
		this.conditions = conditions;
	}

	public int getTranCount() {
		return tranCount;
	}

	public void setTranCount(int tranCount) {
		this.tranCount = tranCount;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getIfSupper() {
		return ifSupper;
	}

	public void setIfSupper(String ifSupper) {
		this.ifSupper = ifSupper;
	}

	public String getMemberType() {
		return memberType;
	}

	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}
	
	public Map<String, ReportMemberBean> getList0() {
		return list0;
	}

	public void setList0(Map<String, ReportMemberBean> list0) {
		this.list0 = list0;
	}


	/**
	 * 会员
	 * 2010-4-28
	 * @author yuwenqiang
	 * @return
	 */
	public String getM(){
		Map<String,Object> map =new HashMap<String, Object>();
		if(area!=null)
			if(!area.equals(""))
			   map.put("area", area.substring(0, 6));
        
		if(startDate!=null)
			map.put("startDate", startDate);
		if(endDate!=null)
			map.put("endDate", endDate);
		
		
		page.setCurPage(pages);
	   	page.setPageSize(pagesize);
	   	page.setTotalRow(ReportService.getCount0(map));
	   	page.setFormid(0);
	   	pageBar = page.getToolsMenu();
	   	
		map.put("start", page.getStart());
		map.put("end", page.getEnd());
		
		list0=ReportService.get0(map);
		return SUCCESS;
	}
	


	public List<ReportClick> getList1() {
		return list1;
	}

	public void setList1(List<ReportClick> list1) {
		this.list1 = list1;
	}

	public List<ReportTrade> getList2() {
		return list2;
	}

	public void setList2(List<ReportTrade> list2) {
		this.list2 = list2;
	}

	/**
	 * 产品点击率
	 * 2010-4-28
	 * @author yuwenqiang
	 * @return
	 */
	public String getC(){
		Map<String,Object> map =new HashMap<String, Object>();
		if(rank==0){
			map.put("rank",10000);	
		}else{
			map.put("rank",rank);
		}
		
		page.setCurPage(pages);
	   	page.setPageSize(pagesize);
	   	page.setTotalRow(ReportService.getCount1(map));
	   	page.setFormid(0);
	   	pageBar = page.getToolsMenu();
	   	
		map.put("start", page.getStart());
		map.put("end", page.getEnd());
		
		list1=ReportService.get1(map);
		return SUCCESS;
	}
	
	/**
	 * 产品交易
	 * 2010-4-28
	 * @author yuwenqiang
	 * @return
	 */
	public String getT(){
		Map<String,Object> map =new HashMap<String, Object>();
		if(tranCount==0){
			map.put("tranCount", 10000);	
		}else{
			map.put("tranCount", tranCount);
		}
		
		if(startDate!=null)
			map.put("startDate", startDate);
		if(endDate!=null)
			map.put("endDate", endDate);
		
		if(conditions!=null){
		if(conditions.equals("1")){
			map.put("conditions", "countQuantity");
		}else if(conditions.equals("2")){
			map.put("conditions", "countProPrice");
		}else{
			map.put("conditions", "totalProPrice");
		}
		}else{
			map.put("conditions", "countQuantity");
		}
		
		page.setCurPage(pages);
	   	page.setPageSize(pagesize);
	   	page.setTotalRow(ReportService.getCount2(map));
	   	page.setFormid(0);
	   	pageBar = page.getToolsMenu();
	   	
		map.put("start", page.getStart());
		map.put("end", page.getEnd());
		
		list2=ReportService.get2(map);
		return SUCCESS;
	}
	
	
	
	
}
