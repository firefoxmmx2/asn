package com.bornsoft.asn.action.advert;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.advert.Advert;
import com.bornsoft.asn.bean.advert.proposerAdvert;
import com.bornsoft.asn.service.advert.AdvertService;
import com.bornsoft.asn.service.advert.ProposerAdvertService;
import com.bornsoft.asn.utils.common.PageTool;
import com.bornsoft.asn.utils.common.AsnConstLib.advertHandleStatus;
import com.bornsoft.asn.utils.common.AsnConstLib.advertStatus;
import com.bornsoft.asn.utils.common.AsnConstLib.proposerAdvertHandleStatus;

public class AdverAction extends BaseAction {
	
	private Advert advert; 
	private File advertPic;
	private List<Advert> listAdvert;
	private List<proposerAdvert> proposerAdvert;
	
	private proposerAdvert proAdvert;
	
	
	
	public proposerAdvert getProAdvert() {
		return proAdvert;
	}
	public void setProAdvert(proposerAdvert proAdvert) {
		this.proAdvert = proAdvert;
	}
	public List<proposerAdvert> getProposerAdvert() {
		return proposerAdvert;
	}
	public void setProposerAdvert(List<proposerAdvert> proposerAdvert) {
		this.proposerAdvert = proposerAdvert;
	}

	private int page=1;
    private int pageSize=10 ;
    private String pageBar ;
	
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
	
	
	
	
	public String listAdvert()throws Exception{
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
		
		
		int count = AdvertService.getAdvertCount(para);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
		listAdvert = AdvertService.listAdvert(para);
		return SUCCESS;
	}
	
	/***********
	 * insert
	 * 
	 * ********/
	public String insertAdvert() throws Exception{
		
		String advert_msg = AdvertService.insertAdvert(advert, advertPic);
		
		this.request("advert_msg", advert_msg);
		return SUCCESS;
	}
	
	/******
	 * stauts
	 * 
	 * *****/
	public String updAdvertStatus()throws Exception{
		String type = this.request("type");
		String idset = this.request("idset");
		String[] arrayID = idset.split(",");
		
		for(int i =0; i<arrayID.length;i++){
			Map<String ,Object> m = new HashMap<String,Object>();
			m.put("advertId", arrayID[i]);
			if(type.equals("publish")){
				m.put("status", advertStatus.P);
			}
			if(type.equals("cancel")){
				m.put("status", advertStatus.C);
			}
			
			if(type.equals("close")){
				m.put("status", advertStatus.S);
			}
			
			AdvertService.updAdvertStatus(m);
		}
		return SUCCESS;
	}
	
	/******
	 * Advert information
	 * 
	 * *****/
	public String infoAdvert()throws Exception{
		String id = this.request("advertId");
		
		if(id == null){
			id = this.session("advertId").toString();
		}
		
		advert = AdvertService.getAdvertById(new Long(id));
		proposerAdvert = AdvertService.getPropoerAdvertById(new Long(id));
		return SUCCESS;
	}
	
	public String updAdvertHandleStatus() throws Exception{
		String proposerId = this.request("proposerId");
		String advertId = this.request("advertId");
		
		Map<String, Object> advm = new HashMap<String, Object>();
		advm.put("advertId", advertId);
		advm.put("handleStatus", advertHandleStatus.P);
		AdvertService.updAdvertHandleStatus(advm);
		
		
		Map<String, Object> m = new HashMap<String, Object>();  //申请成功的一个人
		m.put("proposerId", proposerId);
		m.put("handleStatus",proposerAdvertHandleStatus.P);
		ProposerAdvertService.updateStatus(m);
		
		proposerAdvert = AdvertService.getPropoerAdvertById(new Long(advertId));//处理所有申请失败的人，状态为失败
		for(int i=0; i<proposerAdvert.size(); i++){
			proAdvert = proposerAdvert.get(i);
			if(!proAdvert.getProposerId().toString().equals(proposerId)){
				m.put("proposerId", proAdvert.getProposerId());
				m.put("handleStatus",proposerAdvertHandleStatus.U);
				ProposerAdvertService.updateStatus(m);
			}
		}
		
		this.session("advertId",advertId);
		return SUCCESS;
	}
	
	
	public String toUpdateAdvert()throws Exception{
		String advertId = this.request("advertId");
		if(advertId == null){
			advertId = this.session("advertId").toString();
		}
		
		advert = AdvertService.getAdvertById(new Long(advertId));
		return SUCCESS;
	}
	
	
	public String updateAdvert()throws Exception{
		String advert_msg = AdvertService.updateAdvert(advert, advertPic);
		
		this.request("advert_msg", advert_msg);
		this.session("advertId", advert.getAdvertId());		
		return SUCCESS;
	}
}
