package com.bornsoft.asn.action.advert;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.advert.Advert;
import com.bornsoft.asn.bean.advert.proposerAdvert;
import com.bornsoft.asn.service.advert.AdvertService;
import com.bornsoft.asn.service.advert.ProposerAdvertService;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.utils.common.ImageSize;
import com.bornsoft.asn.utils.common.PageTool;
import com.bornsoft.asn.utils.common.AsnConstLib.advertHandleStatus;
import com.bornsoft.asn.utils.common.AsnConstLib.proposerAdvertHandleStatus;

public class ProposerAdvertAction extends BaseAction {
	private Advert advert; 
	private File advertPic;
	private List<Advert> listAdvert;
	private proposerAdvert proposerAdvert;
	
	private int page=1;
    private int pageSize=10 ;
    private String pageBar ;
    
    
    
	public proposerAdvert getProposerAdvert() {
		return proposerAdvert;
	}
	public void setProposerAdvert(proposerAdvert proposerAdvert) {
		this.proposerAdvert = proposerAdvert;
	}
	public Advert getAdvert() {
		return advert;
	}
	public void setAdvert(Advert advert) {
		this.advert = advert;
	}
	public File getAdvertPic() {
		return advertPic;
	}
	public void setAdvertPic(File advertPic) {
		this.advertPic = advertPic;
	}
	public List<Advert> getListAdvert() {
		return listAdvert;
	}
	public void setListAdvert(List<Advert> listAdvert) {
		this.listAdvert = listAdvert;
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
    
	/***
	 * list
	 * 
	 * */
	
	public String listAdvert() throws Exception{
		String pageType = request("pageType"); //如果是查询按钮的提交，就把页数值为初始值
		if(pageType != null){
			page = 1;
			pageSize = 10;
		}
		
		PageTool pageTool=new PageTool();
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;
		Map<String, Object> para=new HashMap<String, Object>();
		para.put("startCount", startCount);
		para.put("endCount", endCount);
		para.put("memberId", MemberService.getMember().getMemberId());
		
		
		int count = ProposerAdvertService.getAdvertCount(para);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
		listAdvert = ProposerAdvertService.listAdvert(para);
		return SUCCESS;
	}
	
	/***
	 * infomation
	 * 
	 * */
	
	public String applyAdvert()throws Exception{
		String id = this.request("advertId");
		if(id == null){
			id = this.session("advertId").toString();
		}
		advert = AdvertService.getAdvertById(new Long(id));
		
		Map<String, Object> m=new HashMap<String, Object>();
		m.put("advertId", id);
		m.put("memberId",MemberService.getMember().getMemberId());		
		proposerAdvert = ProposerAdvertService.getProposerAdvertById(m); //判断是否已经有记录了
		
		return SUCCESS;
	}
	
	/***
	 * 申请广告
	 * */	
	public String insertAdvert()throws Exception{
		String id = this.request("advertId");
		Map<String, Object> m=new HashMap<String, Object>();
		m.put("advertId", id);
		m.put("memberId",MemberService.getMember().getMemberId());		
		proposerAdvert = ProposerAdvertService.getProposerAdvertById(m); //判断是否已经有记录了
		
		if(proposerAdvert != null){
			String[] picPaths = new String[]{"",""};
			if(advertPic != null){
				picPaths=ImageSize.drawImage(advertPic);
			}
			Map<String, Object> pa = new HashMap<String, Object>();
			pa.put("proposerId", proposerAdvert.getProposerId());
			pa.put("handleStatus",proposerAdvertHandleStatus.A);
			pa.put("picPath", picPaths[1]);
			
			ProposerAdvertService.updateStatus(pa);
			return SUCCESS;
		}else{
		
			String[] picPaths = new String[]{"",""};
			if(advertPic != null){
				picPaths=ImageSize.drawImage(advertPic);
			}
			
			proposerAdvert = new proposerAdvert();
			proposerAdvert.setProposerId(IdMakerService.newId("proposerId"));
			proposerAdvert.setAdvertId(new Long(id));
			proposerAdvert.setApplyTime(new Date());
			proposerAdvert.setMemberId(MemberService.getMember().getMemberId());
			proposerAdvert.setHandleStatus(proposerAdvertHandleStatus.A);
			proposerAdvert.setPicPath(picPaths[1]);
			proposerAdvert.setContractNumber("");
			
			
			ProposerAdvertService.insertProposerAdvert(proposerAdvert);
		}
		
		advert = AdvertService.getAdvertById(new Long(id));
		if(advert.getHandleStatus().toString().equals("N")){
			Map<String, Object> advm = new HashMap<String, Object>();
			advm.put("advertId", id);
			advm.put("handleStatus", advertHandleStatus.A);
			AdvertService.updAdvertHandleStatus(advm);
		}
		this.session("advertId", id);
		return SUCCESS;
	}
	
	/***
	 * 撤销申请
	 * */	
	public String cancelProposertAdvert() throws Exception{
		String id = this.request("advertId");
		Map<String, Object> m=new HashMap<String, Object>();
		m.put("proposerId", id);
		m.put("handleStatus",proposerAdvertHandleStatus.C);
		ProposerAdvertService.updateStatus(m);
		return SUCCESS;
	}
    
}
