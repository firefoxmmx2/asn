package com.bornsoft.asn.action.information;

import java.util.Date;
import java.util.List;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.information.PurchaseInfo;
import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.bean.productType.ProductType;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.information.InfoService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.service.productType.ProductTypeService;
import com.bornsoft.asn.utils.common.PageCreator;
import com.bornsoft.asn.utils.common.PageTool;

public class PurchaseInfoAction extends BaseAction{
	private PurchaseInfo purchaseInfo;
	private List<PurchaseInfo> listP;
	private int page=1;
    private int pageSize=5 ;
    private String pageBar ;
    private List<ProductType> firstType;
	private List<ProductType> secondType;
	public PurchaseInfo getPurchaseInfo() {
		return purchaseInfo;
	}
	public void setPurchaseInfo(PurchaseInfo purchaseInfo) {
		this.purchaseInfo = purchaseInfo;
	}
	public List<PurchaseInfo> getListP() {
		return listP;
	}
	public void setListP(List<PurchaseInfo> listP) {
		this.listP = listP;
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
	public List<ProductType> getFirstType() {
		return firstType;
	}
	public void setFirstType(List<ProductType> firstType) {
		this.firstType = firstType;
	}
	public List<ProductType> getSecondType() {
		return secondType;
	}
	public void setSecondType(List<ProductType> secondType) {
		this.secondType = secondType;
	}
	public String toCreatePurchaseInfo()throws Exception{
		Member m=MemberService.getMember();
		String area=m.getArea();
		this.getRequest().setAttribute("area",area);
		return SUCCESS;
	}
	
	public String createPurchaseInfo()throws Exception{
		Integer infoId=IdMakerService.newId("Info").intValue();
		Integer memberId=((Long)MemberService.getMemberId()).intValue();
		purchaseInfo.setInfoId(infoId);
		purchaseInfo.setMemberId(memberId);
		purchaseInfo.setStartDate(new Date());
		purchaseInfo.setIpAddreess(this.getRequest().getRemoteAddr());
		purchaseInfo.setKeyWord("，"+purchaseInfo.getKeyWord()+"，");
		long ms=Long.parseLong(purchaseInfo.getInfoValidity())*24*60*60*1000;
		purchaseInfo.setEndDate(new Date(new Date().getTime()+ms));
		InfoService.insertPurchaseInfo(purchaseInfo);
		this.getRequest().setAttribute("tip", "求购信息发布成功");
		return SUCCESS;
	}
	
	public String toPurchaseInfoListOn()throws Exception{
		Integer memberId=((Long)MemberService.getMemberId()).intValue();
		PageTool pageTool=new PageTool();
		int count=InfoService.getPurchaseInfoCount(memberId, "on");
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();	   	
	   	listP=InfoService.getPurchaseInfoList(memberId, "on",page,pageSize);
	   	for(PurchaseInfo s:listP){
	   		String keyWord=s.getKeyWord();
	   		s.setKeyWord(keyWord.substring(1,keyWord.length()-1));
	   		String title=s.getTitle();
	   		if(title.length()>10){
	   			title=title.substring(0, 10);
	   			s.setTitle(title+"...");
	   		}
	   		String key=s.getKeyWord();
	   		if(key.length()>12){
	   			key=key.substring(0, 12);
	   			s.setKeyWord(key+"...");
	   		}
	   	}
		return SUCCESS;
	}
	
	public String toPurchaseInfoListOff()throws Exception{
		Integer memberId=((Long)MemberService.getMemberId()).intValue();
		PageTool pageTool=new PageTool();
		int count=InfoService.getPurchaseInfoCount(memberId, "off");
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();   	
	   	listP=InfoService.getPurchaseInfoList(memberId, "off",page,pageSize);
	   	for(PurchaseInfo s:listP){
	   		String keyWord=s.getKeyWord();
	   		s.setKeyWord(keyWord.substring(1,keyWord.length()-1));
	   		String title=s.getTitle();
	   		if(title.length()>10){
	   			title=title.substring(0, 10);
	   			s.setTitle(title+"...");
	   		}
	   		String key=s.getKeyWord();
	   		if(key.length()>12){
	   			key=key.substring(0, 12);
	   			s.setKeyWord(key+"...");
	   		}
	   	}
		return SUCCESS;
	}
	
	public String setPurchaseInfoOff()throws Exception{
		String ids=this.getRequest().getParameter("infoIds");
		String[] strings=ids.split(",");
		//权限验证
		for(String s:strings){
			PurchaseInfo pi=InfoService.getPurchaseInfoById(s);
			if(!validatePurchaseInfo(pi, ((Long)MemberService.getMemberId()).intValue())){
				return INPUT;
			}
		}
		InfoService.setInfoStatus(strings,"off");
		return SUCCESS;
	}
	
	public String setPurchaseInfoOn()throws Exception{
		String ids=this.getRequest().getParameter("infoIds");
		String[] strings=ids.split(",");
		//权限验证
		for(String s:strings){
			PurchaseInfo pi=InfoService.getPurchaseInfoById(s);
			if(!validatePurchaseInfo(pi, ((Long)MemberService.getMemberId()).intValue())){
				return INPUT;
			}
		}
		InfoService.setInfoStatus(strings,"on");
		return SUCCESS;
	}
	
	public String setPurchaseInfoDel()throws Exception{
		String ids=this.getRequest().getParameter("infoIds");
		String[] strings=ids.split(",");
		//权限验证
		for(String s:strings){
			PurchaseInfo pi=InfoService.getPurchaseInfoById(s);
			if(!validatePurchaseInfo(pi, ((Long)MemberService.getMemberId()).intValue())){
				return INPUT;
			}
		}
		InfoService.setInfoStatus(strings,"del");
		return SUCCESS;
	}
	
	public String toUpdatePurchaseInfo()throws Exception{
		String id=this.getRequest().getParameter("infoId");
		purchaseInfo=InfoService.getPurchaseInfoById(id);
		//权限控制
		if(!validatePurchaseInfo(purchaseInfo, ((Long)MemberService.getMemberId()).intValue())){
			return INPUT;
		}
		String keyWord=purchaseInfo.getKeyWord();
		purchaseInfo.setKeyWord(keyWord.substring(1,keyWord.length()-1));
		String area=purchaseInfo.getArea();
		this.getRequest().setAttribute("area",area);
		return SUCCESS;
	}
	
	public String updatePurchaseInfo()throws Exception{
		//权限控制
		if(!validatePurchaseInfo(purchaseInfo, ((Long)MemberService.getMemberId()).intValue())){
			return INPUT;
		}
		purchaseInfo.setModifyDate(new Date());
		purchaseInfo.setIpAddreess(this.getRequest().getRemoteAddr());
		long ms=Long.parseLong(purchaseInfo.getInfoValidity())*24*60*60*1000;
		purchaseInfo.setEndDate(new Date(new Date().getTime()+ms));
		purchaseInfo.setKeyWord("，"+purchaseInfo.getKeyWord()+"，");
		InfoService.updatePurchaseInfo(purchaseInfo);
		this.getRequest().setAttribute("tip", "求购信息修改成功");
		return SUCCESS;
	}
	
	public String searchPurchaseInfoListOn()throws Exception{
		String sTitle=this.getRequest().getParameter("searchTitle");
		String sWord=this.getRequest().getParameter("searchWord");
		String censor=this.getRequest().getParameter("censor");
	   	this.getRequest().setAttribute("searchTitle",sTitle);
		this.getRequest().setAttribute("searchWord",sWord);	
		this.getRequest().setAttribute("censor", censor);
		if(sWord!=null&&!sWord.equals("")){
			sWord="，"+sWord+"，";
		}else{
			sWord="";
		}
		Integer memberId=((Long)MemberService.getMemberId()).intValue();
		PageTool pageTool=new PageTool();
		int count=InfoService.getPurchaseInfoSearchCount(memberId, "on", sTitle, sWord,censor);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	listP=InfoService.getPurchaseInfoSearchList(memberId, "on", sTitle, sWord,censor, page, pageSize);
	   	for(PurchaseInfo s:listP){
	   		String keyWord=s.getKeyWord();
	   		s.setKeyWord(keyWord.substring(1,keyWord.length()-1));
	   		String title=s.getTitle();
	   		if(title.length()>10){
	   			title=title.substring(0, 10);
	   			s.setTitle(title+"...");
	   		}
	   		String key=s.getKeyWord();
	   		if(key.length()>12){
	   			key=key.substring(0, 12);
	   			s.setKeyWord(key+"...");
	   		}
	   	}
	   	return SUCCESS;
	}
	
	public String searchPurchaseInfoListOff()throws Exception{
		String sTitle=this.getRequest().getParameter("searchTitle");
		String sWord=this.getRequest().getParameter("searchWord");
		String censor=this.getRequest().getParameter("censor");
	   	this.getRequest().setAttribute("searchTitle",sTitle);
		this.getRequest().setAttribute("searchWord",sWord);	
		this.getRequest().setAttribute("censor", censor);
		if(sWord!=null&&!sWord.equals("")){
			sWord="，"+sWord+"，";
		}else{
			sWord="";
		}
		Integer memberId=((Long)MemberService.getMemberId()).intValue();
		PageTool pageTool=new PageTool();
		int count=InfoService.getPurchaseInfoSearchCount(memberId, "off", sTitle, sWord,censor);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	listP=InfoService.getPurchaseInfoSearchList(memberId, "off", sTitle, sWord,censor, page, pageSize);
	   	for(PurchaseInfo s:listP){
	   		String keyWord=s.getKeyWord();
	   		s.setKeyWord(keyWord.substring(1,keyWord.length()-1));
	   		String title=s.getTitle();
	   		if(title.length()>10){
	   			title=title.substring(0, 10);
	   			s.setTitle(title+"...");
	   		}
	   		String key=s.getKeyWord();
	   		if(key.length()>12){
	   			key=key.substring(0, 12);
	   			s.setKeyWord(key+"...");
	   		}
	   	}
		return SUCCESS;
	}
	
	public String showPurchaseInfoList()throws Exception{
		String searchWord=this.getRequest().getParameter("searchWord");	
		String area=this.getRequest().getParameter("area");
		String searchkey=this.getRequest().getParameter("searchkey");
		if(searchkey!=null&&!searchkey.trim().equals("")){
			searchWord=searchkey;
		}	
		this.getRequest().setAttribute("searchWord",searchWord);
		this.getRequest().setAttribute("area",area);
		if(searchWord!=null&&!searchWord.trim().equals("")){
			searchWord="，"+searchWord+"，";
		}else{
			searchWord="";
		}
		area=checkArea(area);
		PageCreator pc=new PageCreator();
//		String pageBox=this.getRequest().getParameter("pageBox");
//		if(pageBox!=null&&!pageBox.trim().equals("")){
//			page=Integer.parseInt(pageBox);
//		}
		pc.setCurrentPage(page);
		pc.setTotalRow(InfoService.showPurchaseInfoListCount(null,searchWord,area));
		pageBar=pc.getPageBar();
		listP=InfoService.showPurchaseInfoList(page,pc.getPageSize(),null,searchWord,area);
	   	for(PurchaseInfo s:listP){
	   		String keyWord=s.getKeyWord();
	   		s.setKeyWord(keyWord.substring(1,keyWord.length()-1));
	   		String detail=s.getDetail();
	   		if(detail.length()>120){
	   			s.setDetail(detail.substring(0, 120)+"......");
	   		}
	   	}
		firstType = ProductTypeService.getFirstProductType();
		return SUCCESS;
	}
	
	public String showPurchaseInfoList1()throws Exception{
		String searchWord=this.getRequest().getParameter("searchWord");	
		String area=this.getRequest().getParameter("area");
		this.getRequest().setAttribute("searchWord",searchWord);
		this.getRequest().setAttribute("area",area);
		if(searchWord!=null&&!searchWord.trim().equals("")){
			searchWord="，"+searchWord+"，";
		}else{
			searchWord="";
		}
		area=checkArea(area);
		String typeId=this.getRequest().getParameter("typeId");
		String type=this.getRequest().getParameter("type");//从详细页面进入时判断
		ProductType mainType=ProductTypeService.getProductTypeById(typeId);
		if(type!=null&&!type.trim().equals("")){
			mainType=ProductTypeService.getProductTypeByCode2(type);
		}
		this.getRequest().setAttribute("mainType",mainType);
		String code=mainType.getPtcode();
		if(code.length()==9){
			ProductType lastOneType=ProductTypeService.getProductTypeById(mainType.getPtparentid()+"");
			this.getRequest().setAttribute("lastOneType",lastOneType);
		}else if(code.length()==14){
			ProductType lastTwoType=ProductTypeService.getProductTypeById(mainType.getPtparentid()+"");
			this.getRequest().setAttribute("lastTwoType",lastTwoType);
			ProductType lastOneType=ProductTypeService.getProductTypeById(lastTwoType.getPtparentid()+"");
			this.getRequest().setAttribute("lastOneType",lastOneType);
		}
		
		
		secondType=ProductTypeService.getProductTypeByFatherId(typeId);
		listP=InfoService.showPurchaseInfoList(page,10,mainType.getPtcode(),searchWord,area);
	   	for(PurchaseInfo s:listP){
	   		String keyWord=s.getKeyWord();
	   		s.setKeyWord(keyWord.substring(1,keyWord.length()-1));
	   		String detail=s.getDetail();
	   		if(detail.length()>120){
	   			s.setDetail(detail.substring(0, 120)+"......");
	   		}
	   	}
	   	PageCreator pc=new PageCreator();
//		String pageBox=this.getRequest().getParameter("pageBox");
//		if(pageBox!=null&&!pageBox.trim().equals("")){
//			page=Integer.parseInt(pageBox);
//		}
		pc.setCurrentPage(page);
		pc.setTotalRow(InfoService.showPurchaseInfoListCount(mainType.getPtcode(),searchWord,area));
		pageBar=pc.getPageBar();
		return SUCCESS;
	}
	
	
	public String showPurchaseInfo()throws Exception{
		Integer mid=((Long) MemberService.getMemberId()).intValue();
		if(mid==1230){
			String id=this.getRequest().getParameter("infoId");
			String type=this.getRequest().getParameter("type");
			purchaseInfo=InfoService.getPurchaseInfoById(id);
			String keyWord=purchaseInfo.getKeyWord();
			purchaseInfo.setKeyWord(keyWord.substring(1,keyWord.length()-1));
			String area =purchaseInfo.getArea();
			if(area!=null&&area.trim().length()>7){
				area=area.substring(7);
			}else{
				area="暂无";
			}
			purchaseInfo.setArea(area);
			Integer memberId=purchaseInfo.getMemberId();
			Member m=MemberService.getMember(purchaseInfo.getMemberId());
			this.getRequest().setAttribute("member", m);
			listP=InfoService.showPurchaseInfoLi(1,10,type,memberId,id,null,null);
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
		}else{
			String id=this.getRequest().getParameter("infoId");
			String type=this.getRequest().getParameter("type");
			purchaseInfo=InfoService.getPurchaseInfoById(id);
			Integer censor=purchaseInfo.getCensor();
			if(censor<3){
				String keyWord=purchaseInfo.getKeyWord();
				purchaseInfo.setKeyWord(keyWord.substring(1,keyWord.length()-1));
				String area =purchaseInfo.getArea();
				if(area!=null&&area.trim().length()>7){
					area=area.substring(7);
				}else{
					area="暂无";
				}
				purchaseInfo.setArea(area);
				Integer memberId=purchaseInfo.getMemberId();
				Member m=MemberService.getMember(purchaseInfo.getMemberId());
				this.getRequest().setAttribute("member", m);
				listP=InfoService.showPurchaseInfoLi(1,10,type,memberId,id,null,null);
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
			}else if(censor<19){
				this.getRequest().setAttribute("tip", "该信息正在审核中，暂时不能查看");
				return "censor";
			}else{
				this.getRequest().setAttribute("tip", "该信息已被屏蔽，如有疑问请联系管理员");
				return "censor";
			}
		}
	}
	
	private String checkArea(String area){
		if(area!=null&&area.length()>7){
			area=area.substring(0, 6);
			String area1=area.substring(0, 3);
			if(area1.equals("500")||area1.equals("110")||area1.equals("120")||area1.equals("310")||area1.equals("710")||area1.equals("810")){
				String area2=area.substring(3,6);
				if(area2.equals("000")){
					area=area1;
				}
			}else{
				String area_1=area.substring(2, 6);
				if(area_1.equals("0000")){
					area=area.substring(0,2);
				}else{
					String area_2=area.substring(4, 6);
					if(area_2.equals("00")){
						area=area.substring(0, 4);
					}
				}
			}
			
		}else{
			area="";
		}
		return area;
	}
	
	public String toAllPurchaseInfoList()throws Exception{
		return SUCCESS;
	}
	
	//权限控制
	private boolean validatePurchaseInfo(PurchaseInfo info,Integer memberId)throws Exception{
		if(info.getMemberId().equals(memberId)){
			return true;
		}
		return false;
	}
	
}
