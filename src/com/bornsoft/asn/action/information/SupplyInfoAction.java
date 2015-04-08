package com.bornsoft.asn.action.information;

import java.util.Date;
import java.util.List;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.information.SupplyInfo;
import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.bean.productType.ProductType;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.information.InfoService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.service.productType.ProductTypeService;
import com.bornsoft.asn.service.supplier.SupplierService;
import com.bornsoft.asn.utils.common.PageCreator;
import com.bornsoft.asn.utils.common.PageTool;

public class SupplyInfoAction extends BaseAction{
	private SupplyInfo supplyInfo;
	private List<SupplyInfo> listS;
	private int page=1;
    private int pageSize=5 ;
    private String pageBar ;
    private List<ProductType> firstType;
	private List<ProductType> secondType;
    
	public SupplyInfo getSupplyInfo() {
		return supplyInfo;
	}

	public void setSupplyInfo(SupplyInfo supplyInfo) {
		this.supplyInfo = supplyInfo;
	}

	public List<SupplyInfo> getListS() {
		return listS;
	}

	public void setListS(List<SupplyInfo> listS) {
		this.listS = listS;
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

	public String toCreateSupplyInfo()throws Exception{
		Member m=MemberService.getMember();
		String area=m.getArea();
		this.getRequest().setAttribute("area",area);
		return SUCCESS;
	}
	
	public String createSupplyInfo()throws Exception{
		Integer infoId=IdMakerService.newId("Info").intValue();
		Integer supplierId=((Long)SupplierService.getSupplierId()).intValue();
		supplyInfo.setInfoId(infoId);
		supplyInfo.setSupplierId(supplierId);
		supplyInfo.setStartDate(new Date());
		supplyInfo.setIpAddreess(this.getRequest().getRemoteAddr());
		supplyInfo.setKeyWord("，"+supplyInfo.getKeyWord()+"，");
		long ms=Long.parseLong(supplyInfo.getInfoValidity())*24*60*60*1000;
		supplyInfo.setEndDate(new Date(new Date().getTime()+ms));
		InfoService.insertSupplyInfo(supplyInfo);
		this.getRequest().setAttribute("tip", "供应信息发布成功");
		return SUCCESS;
	}
	
	public String toSupplyInfoListOn()throws Exception{
		Integer supplierId=((Long)SupplierService.getSupplierId()).intValue();
		PageTool pageTool=new PageTool();
		int count=InfoService.getSupplyInfoCount(supplierId, "on");
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();	   	
	   	listS=InfoService.getSupplyInfoList(supplierId, "on",page,pageSize);
	   	for(SupplyInfo s:listS){
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
	
	public String toSupplyInfoListOff()throws Exception{
		Integer supplierId=((Long)SupplierService.getSupplierId()).intValue();
		PageTool pageTool=new PageTool();
		int count=InfoService.getSupplyInfoCount(supplierId, "off");
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();   	
	   	listS=InfoService.getSupplyInfoList(supplierId, "off",page,pageSize);
	   	for(SupplyInfo s:listS){
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
	
	public String setSupplyInfoOff()throws Exception{
		String ids=this.getRequest().getParameter("infoIds");
		String[] strings=ids.split(",");
		//权限控制
		for(String s:strings){
			SupplyInfo si=InfoService.getSupplyInfoById(s);
			if(!validateSupplyInfo(si,((Long)SupplierService.getSupplierId()).intValue())){
				return INPUT;
			}
		}
		InfoService.setInfoStatus(strings,"off");
		return SUCCESS;
	}
	
	public String setSupplyInfoOn()throws Exception{
		String ids=this.getRequest().getParameter("infoIds");
		String[] strings=ids.split(",");
		//权限控制
		for(String s:strings){
			SupplyInfo si=InfoService.getSupplyInfoById(s);
			if(!validateSupplyInfo(si,((Long)SupplierService.getSupplierId()).intValue())){
				return INPUT;
			}
		}
		InfoService.setInfoStatus(strings,"on");
		return SUCCESS;
	}
	
	public String setSupplyInfoDel()throws Exception{
		String ids=this.getRequest().getParameter("infoIds");
		String[] strings=ids.split(",");
		//权限控制
		for(String s:strings){
			SupplyInfo si=InfoService.getSupplyInfoById(s);
			if(!validateSupplyInfo(si,((Long)SupplierService.getSupplierId()).intValue())){
				return INPUT;
			}
		}
		InfoService.setInfoStatus(strings,"del");
		return SUCCESS;
	}
	
	public String toUpdateSupplyInfo()throws Exception{
		String id=this.getRequest().getParameter("infoId");
		supplyInfo=InfoService.getSupplyInfoById(id);
		//权限控制
		if(!validateSupplyInfo(supplyInfo,((Long)SupplierService.getSupplierId()).intValue())){
			return INPUT;
		}
		String keyWord=supplyInfo.getKeyWord();
		supplyInfo.setKeyWord(keyWord.substring(1,keyWord.length()-1));
		String area=supplyInfo.getArea();
		this.getRequest().setAttribute("area",area);
		return SUCCESS;
	}
	
	public String updateSupplyInfo()throws Exception{
		//权限控制
		if(!validateSupplyInfo(supplyInfo,((Long)SupplierService.getSupplierId()).intValue())){
			return INPUT;
		}
		supplyInfo.setModifyDate(new Date());
		supplyInfo.setIpAddreess(this.getRequest().getRemoteAddr());
		long ms=Long.parseLong(supplyInfo.getInfoValidity())*24*60*60*1000;
		supplyInfo.setEndDate(new Date(new Date().getTime()+ms));
		supplyInfo.setKeyWord("，"+supplyInfo.getKeyWord()+"，");
		InfoService.updateSupplyInfo(supplyInfo);
		this.getRequest().setAttribute("tip", "供应信息修改成功");
		return SUCCESS;
	}
	
	public String searchSupplyInfoListOn()throws Exception{
		String sTitle=this.getRequest().getParameter("searchTitle");
		String sWord=this.getRequest().getParameter("searchWord");
		String censor=this.getRequest().getParameter("censor");
	   	this.getRequest().setAttribute("searchTitle",sTitle);
		this.getRequest().setAttribute("searchWord",sWord);	
		this.getRequest().setAttribute("censor", censor);
		if(sWord!=null&&!sWord.trim().equals("")){
			sWord="，"+sWord+"，";
		}else{
			sWord="";
		}
		Integer supplierId=((Long)SupplierService.getSupplierId()).intValue();
		PageTool pageTool=new PageTool();
		int count=InfoService.getSupplyInfoSearchCount(supplierId, "on", sTitle, sWord,censor);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	listS=InfoService.getSupplyInfoSearchList(supplierId, "on", sTitle, sWord,censor, page, pageSize);
	   	for(SupplyInfo s:listS){
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
	
	public String searchSupplyInfoListOff()throws Exception{
		String sTitle=this.getRequest().getParameter("searchTitle");
		String sWord=this.getRequest().getParameter("searchWord");
		String censor=this.getRequest().getParameter("censor");
	   	this.getRequest().setAttribute("searchTitle",sTitle);
		this.getRequest().setAttribute("searchWord",sWord);	
		this.getRequest().setAttribute("censor", censor);
		if(sWord!=null&&!sWord.trim().equals("")){
			sWord="，"+sWord+"，";
		}else{
			sWord="";
		}
		Integer supplierId=((Long)SupplierService.getSupplierId()).intValue();
		PageTool pageTool=new PageTool();
		int count=InfoService.getSupplyInfoSearchCount(supplierId, "off", sTitle, sWord,censor);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	listS=InfoService.getSupplyInfoSearchList(supplierId, "off", sTitle, sWord, censor,page, pageSize);
	   	for(SupplyInfo s:listS){
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
	
	
	public String showSupplyInfoList()throws Exception{
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
		pc.setTotalRow(InfoService.showSupplyInfoListCount(null,searchWord,area));
		pageBar=pc.getPageBar();
		listS=InfoService.showSupplyInfoList(page,pc.getPageSize(),null,searchWord,area);
	   	for(SupplyInfo s:listS){
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
	
	public String showSupplyInfoList1()throws Exception{
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
		listS=InfoService.showSupplyInfoList(page,10,mainType.getPtcode(),searchWord,area);
	   	for(SupplyInfo s:listS){
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
		pc.setTotalRow(InfoService.showSupplyInfoListCount(mainType.getPtcode(),searchWord,area));
		pageBar=pc.getPageBar();
		return SUCCESS;
	}
	
	
	public String showSupplyInfo()throws Exception{
		Integer mid=((Long) MemberService.getMemberId()).intValue();
		if(mid==1230){
			String id=this.getRequest().getParameter("infoId");
			String type=this.getRequest().getParameter("type");
			supplyInfo=InfoService.getSupplyInfoById(id);
			String keyWord=supplyInfo.getKeyWord();
			supplyInfo.setKeyWord(keyWord.substring(1,keyWord.length()-1));
			String area =supplyInfo.getArea();
			if(area!=null&&area.trim().length()>7){
				area=area.substring(7);
			}else{
				area="暂无";
			}
			supplyInfo.setArea(area);
			Integer supplierId=supplyInfo.getSupplierId();
			Member m=MemberService.getMember(supplyInfo.getSupplierId());
			this.getRequest().setAttribute("member", m);
			listS=InfoService.showSupplyInfoLi(1,10,type,supplierId,id,null,null);
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
			return SUCCESS;
		}else{
			String id=this.getRequest().getParameter("infoId");
			String type=this.getRequest().getParameter("type");
			supplyInfo=InfoService.getSupplyInfoById(id);
			Integer censor=supplyInfo.getCensor();
			if(censor<3){
				String keyWord=supplyInfo.getKeyWord();
				supplyInfo.setKeyWord(keyWord.substring(1,keyWord.length()-1));
				String area =supplyInfo.getArea();
				if(area!=null&&area.trim().length()>7){
					area=area.substring(7);
				}else{
					area="暂无";
				}
				supplyInfo.setArea(area);
				Integer supplierId=supplyInfo.getSupplierId();
				Member m=MemberService.getMember(supplyInfo.getSupplierId());
				this.getRequest().setAttribute("member", m);
				listS=InfoService.showSupplyInfoLi(1,10,type,supplierId,id,null,null);
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
	
	//权限控制
	private boolean validateSupplyInfo(SupplyInfo info,Integer supplierId)throws Exception{
		if(info.getSupplierId().equals(supplierId)){
			return true;
		}
		return false;
	}
}
