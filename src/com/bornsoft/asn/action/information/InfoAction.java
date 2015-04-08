package com.bornsoft.asn.action.information;

import java.util.List;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.information.PurchaseInfo;
import com.bornsoft.asn.bean.information.SupplyInfo;
import com.bornsoft.asn.bean.productType.ProductType;
import com.bornsoft.asn.service.information.InfoService;
import com.bornsoft.asn.service.productType.ProductTypeService;
import com.bornsoft.asn.utils.common.KeywordTool;
import com.bornsoft.asn.utils.common.PageCreator;
import com.bornsoft.asn.utils.common.PageTool;
import com.bornsoft.asn.utils.common.WebContext;

public class InfoAction extends BaseAction{
    private List<ProductType> firstType;
    private List<SupplyInfo> listS1;
    private List<SupplyInfo> listS2;
    private List<SupplyInfo> listS3;
    private List<SupplyInfo> listS;
    private List<PurchaseInfo> listP;
    private List<PurchaseInfo> listP1;
	private int page=1;
    private int pageSize=10 ;
    private String pageBar ;
    
    //2010-10-19 liujunwei fixed 页面模板配置
    private String template = "";
    
	/**
	 * @return the template
	 */
	public String getTemplate()
	{
		return template;
	}

	/**
	 * @param template the template to set
	 */
	public void setTemplate(String template)
	{
		this.template = template;
	}

	public List<ProductType> getFirstType() {
		return firstType;
	}

	public void setFirstType(List<ProductType> firstType) {
		this.firstType = firstType;
	}

	public List<SupplyInfo> getListS1() {
		return listS1;
	}

	public void setListS1(List<SupplyInfo> listS1) {
		this.listS1 = listS1;
	}
	
	public List<SupplyInfo> getListS2() {
		return listS2;
	}

	public void setListS2(List<SupplyInfo> listS2) {
		this.listS2 = listS2;
	}

	public List<SupplyInfo> getListS3() {
		return listS3;
	}

	public void setListS3(List<SupplyInfo> listS3) {
		this.listS3 = listS3;
	}

	public List<SupplyInfo> getListS() {
		return listS;
	}

	public void setListS(List<SupplyInfo> listS) {
		this.listS = listS;
	}

	public List<PurchaseInfo> getListP() {
		return listP;
	}

	public void setListP(List<PurchaseInfo> listP) {
		this.listP = listP;
	}

	public List<PurchaseInfo> getListP1() {
		return listP1;
	}

	public void setListP1(List<PurchaseInfo> listP1) {
		this.listP1 = listP1;
	}
	
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

	public String getKeyword()throws Exception{
		String source=this.getRequest().getParameter("source");
		String keyword=KeywordTool.getInstatnce().getKeywordString(source);
		if(keyword!=null&&!keyword.trim().equals("")){
			print(keyword);
		}else{
			print("no");
		}
		return null;
	}

	public String showInfoMain()throws Exception{
		firstType = ProductTypeService.getFirstProductType();
		listS1=InfoService.showSupplyInfoLi(1,36,null,null,null,"3600",null);
		for(SupplyInfo si:listS1){
			String[] tns=si.getTypeName().split("-");
			String tn=tns[tns.length-1];
			if(tn.length()>6){
				tn=tn.substring(0, 6)+"...";
			}
			si.setTypeName(tn);
			String s=si.getTitle();
			if(s.length()>8){
				s=s.substring(0, 8);
				si.setTitle(s+"...");
			}
		}
		
		listP1=InfoService.showPurchaseInfoLi(1,36,null,null,null,"3600",null);
		for(PurchaseInfo si:listP1){
			String[] tns=si.getTypeName().split("-");
			String tn=tns[tns.length-1];
			if(tn.length()>6){
				tn=tn.substring(0, 6)+"...";
			}
			si.setTypeName(tn);
			String s=si.getTitle();
			if(s.length()>8){
				s=s.substring(0, 8);
				si.setTitle(s+"...");
			}
		}	
		listS=InfoService.showSupplyInfoLong(1, 12, "3600");
		for(SupplyInfo si:listS){
			String[] tns=si.getTypeName().split("-");
			String tn=tns[tns.length-1];
			if(tn.length()>6){
				tn=tn.substring(0, 6)+"...";
			}
			si.setTypeName(tn);
			String s=si.getTitle();
			if(s.length()>8){
				s=s.substring(0, 8);
				si.setTitle(s+"...");
			}
		}
		listP=InfoService.showPurchaseInfoLong(1, 12, "3600");
		for(PurchaseInfo si:listP){
			String[] tns=si.getTypeName().split("-");
			String tn=tns[tns.length-1];
			if(tn.length()>6){
				tn=tn.substring(0, 6)+"...";
			}
			si.setTypeName(tn);
			String s=si.getTitle();
			if(s.length()>8){
				s=s.substring(0, 8);
				si.setTitle(s+"...");
			}
		}
		return SUCCESS;
	}
	
	public String showInfo1()throws Exception{
		listS=InfoService.showSupplyInfoLi(1,14,null,null,null,null,null);
		for(SupplyInfo si:listS){
			String title=si.getTitle();
			if(title.length()>7){
				title=title.substring(0,7)+"...";
				si.setTitle(title);
			}
		}

		return SUCCESS;
	}
	
	public String showInfo2()throws Exception{
		listP=InfoService.showPurchaseInfoLi(1, 14, null,null,null,null,null);
		for(PurchaseInfo pi:listP){
			String title=pi.getTitle();
			if(title.length()>7){
				title=title.substring(0, 7)+"...";
				pi.setTitle(title);
			}
		}
		return SUCCESS;
	}
	
	public String showInfo3()throws Exception{
		listS=InfoService.showSupplyInfoLi(1,21,null,null,null,null,null);
		for(SupplyInfo si:listS){
			String title=si.getTitle();
			if(title.length()>16){
				title=title.substring(0,16)+"...";
				si.setTitle(title);
			}
		}

		return SUCCESS;
	}
	
	public String showInfo4()throws Exception{
		listP=InfoService.showPurchaseInfoLi(1, 21, null,null,null,null,null);
		for(PurchaseInfo pi:listP){
			String title=pi.getTitle();
			if(title.length()>16){
				title=title.substring(0, 16)+"...";
				pi.setTitle(title);
			}
		}
		return SUCCESS;
	}
	
	public String xiuShanInfo1()throws Exception{
		listS=InfoService.showSupplyInfoLi(1, 5, null, null, null, null, "500241");
		for(SupplyInfo si:listS){
			String title=si.getTitle();
			if(title.length()>16){
				title=title.substring(0,16)+"...";
				si.setTitle(title);
			}
		}
		return SUCCESS;
	}
	
	public String xiuShanInfo2()throws Exception{
		listP=InfoService.showPurchaseInfoLi(1, 5, null, null, null, null, "500241");
		for(PurchaseInfo pi:listP){
			String title=pi.getTitle();
			if(title.length()>16){
				title=title.substring(0, 16)+"...";
				pi.setTitle(title);
			}
		}
		return SUCCESS;
	}
	
	public String xiuShanInfo3()throws Exception{
		PageCreator pc=new PageCreator();
		pc.setCurrentPage(page);
		pc.setTotalRow(InfoService.showSupplyInfoListCount(null,null,"500241"));
		pageBar=pc.getPageBar();
		listS=InfoService.showSupplyInfoList(page, 10, null, null, "500241");
		for(SupplyInfo si:listS){
			String title=si.getTitle();
			if(title.length()>16){
				title=title.substring(0,16)+"...";
				si.setTitle(title);
			}
		}
		return SUCCESS;
	}
	
	public String xiuShanInfo4()throws Exception{
		PageCreator pc=new PageCreator();
		pc.setCurrentPage(page);
		pc.setTotalRow(InfoService.showPurchaseInfoListCount(null, null, "500241"));
		pageBar=pc.getPageBar();
		listP=InfoService.showPurchaseInfoList(page, 10, null, null, "500241");
		for(PurchaseInfo pi:listP){
			String title=pi.getTitle();
			if(title.length()>16){
				title=title.substring(0, 16)+"...";
				pi.setTitle(title);
			}
		}
		return SUCCESS;
	}
	
	//管理员方法
	
	public String toAllSupplyInfoList()throws Exception{
		String searchTitle=this.getRequest().getParameter("searchTitle");
		String searchId=this.getRequest().getParameter("searchId");
		String supplierId=this.getRequest().getParameter("supplierId");
		String supplierName=this.getRequest().getParameter("supplierName");
		String censor=this.getRequest().getParameter("censor");
		if(censor==null||censor.trim().equals("")){
			censor="3";
		}	
		Integer censor1=null;
		Integer searchId1=null;
		Integer supplierId1=null;
		censor1=Integer.valueOf(censor);
		if(searchId!=null&&!searchId.trim().equals("")){
			try {
				searchId1=Integer.valueOf(searchId);
			} catch (Exception e) {
				searchId1=null;
				searchId=null;
				e.printStackTrace();
			}
		}else{
			searchId1=null;
		}
		if(supplierId!=null&&!supplierId.trim().equals("")){
			try {
				supplierId1=Integer.valueOf(supplierId);
			} catch (Exception e) {
				supplierId=null;
				supplierId1=null;
				e.printStackTrace();
			}
		}else{
			supplierId1=null;
		}
		int count=InfoService.getAllSupplyInfoCount(supplierId1, supplierName, null, searchTitle, searchId1, censor1);
		PageTool pageTool=new PageTool();
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();		
		
		listS=InfoService.getAllSupplyInfoList(supplierId1, supplierName, null, searchTitle, searchId1, censor1, page, pageSize);
		for(SupplyInfo s:listS){
			String detail=s.getDetail();
			if(detail!=null&&detail.length()>50){
				detail=detail.substring(0, 50)+"...";
			}
			String title=s.getTitle();
			if(title.length()>12){
				title=title.substring(0, 12)+"...";
			}
			s.setDetail(detail);
			s.setTitle(title);
		}
		this.getRequest().setAttribute("searchTitle", searchTitle);
		this.getRequest().setAttribute("searchId", searchId);
		this.getRequest().setAttribute("supplierId", supplierId);
		this.getRequest().setAttribute("supplierName", supplierName);
		this.getRequest().setAttribute("censor", censor);
		return SUCCESS;
	}
	
	public String toAllPurchaseInfoList()throws Exception{
		String searchTitle=this.getRequest().getParameter("searchTitle");
		String searchId=this.getRequest().getParameter("searchId");
		String memberId=this.getRequest().getParameter("memberId");
		String memberName=this.getRequest().getParameter("memberName");
		String censor=this.getRequest().getParameter("censor");
		if(censor==null||censor.trim().equals("")){
			censor="3";
		}	
		Integer censor1=null;
		Integer searchId1=null;
		Integer memberId1=null;
		censor1=Integer.valueOf(censor);
		if(searchId!=null&&!searchId.trim().equals("")){
			try {
				searchId1=Integer.valueOf(searchId);
			} catch (Exception e) {
				searchId1=null;
				searchId=null;
				e.printStackTrace();
			}
		}else{
			searchId1=null;
		}
		if(memberId!=null&&!memberId.trim().equals("")){
			try {
				memberId1=Integer.valueOf(memberId);
			} catch (Exception e) {
				memberId=null;
				memberId1=null;
				e.printStackTrace();
			}
		}else{
			memberId1=null;
		}
		int count=InfoService.getAllPurchaseInfoCount(memberId1, memberName, null, searchTitle, searchId1, censor1);
		PageTool pageTool=new PageTool();
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();		
		
		listP=InfoService.getAllPurchaseInfoList(memberId1, memberName, null, searchTitle, searchId1, censor1, page, pageSize);
		for(PurchaseInfo p:listP){
			String detail=p.getDetail();
			if(detail!=null&&detail.length()>50){
				detail=detail.substring(0, 50)+"...";
			}
			String title=p.getTitle();
			if(title.length()>12){
				title=title.substring(0, 12)+"...";
			}
			p.setDetail(detail);
			p.setTitle(title);
		}
		this.getRequest().setAttribute("searchTitle", searchTitle);
		this.getRequest().setAttribute("searchId", searchId);
		this.getRequest().setAttribute("memberId", memberId);
		this.getRequest().setAttribute("memberName", memberName);
		this.getRequest().setAttribute("censor", censor);
		return SUCCESS;
	}
	
	public void checkSupplyInfo()throws Exception{
		String infoId=this.getRequest().getParameter("infoId");
		SupplyInfo si=InfoService.getSupplyInfoById(infoId);
		String title=si.getTitle();
		if(title==null){
			title="";
		}
		String key=si.getKeyWord();
		if(key==null){
			key="";
		}else{
			key=key.substring(1, key.length()-1);
		}
		String detail=si.getDetail();
		if(detail==null){
			detail="";
		}
		print(title+"}@"+key+"}@"+detail);
	}
	
	public void checkPurchaseInfo()throws Exception{
		String infoId=this.getRequest().getParameter("infoId");
		PurchaseInfo pi=InfoService.getPurchaseInfoById(infoId);
		String title=pi.getTitle();
		if(title==null){
			title="";
		}
		String key=pi.getKeyWord();
		if(key==null){
			key="";
		}else{
			key=key.substring(1, key.length()-1);
		}
		String detail=pi.getDetail();
		if(detail==null){
			detail="";
		}
		print(title+"}@"+key+"}@"+detail);
	}
	
	public String setInfoCensor()throws Exception{
		String ids=this.getRequest().getParameter("infoIds");
		String doCensor=this.getRequest().getParameter("doCensor");
		Integer censor1=Integer.valueOf(doCensor);
		String[] strings=ids.split(",");
		InfoService.setInfoCensor(strings,censor1);
		return SUCCESS;
	}

	
}
