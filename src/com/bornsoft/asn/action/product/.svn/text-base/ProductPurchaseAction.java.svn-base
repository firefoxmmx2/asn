package com.bornsoft.asn.action.product;

import java.io.File;
import java.util.Date;
import java.util.List;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.product.ProductPurchase;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.service.product.ProductPurchaseService;
import com.bornsoft.asn.service.productType.ProductTypeService;
import com.bornsoft.asn.utils.common.PageTool;

public class ProductPurchaseAction extends BaseAction{
	private ProductPurchase productPurchase;
	private List<ProductPurchase> listPP;
	private File originalPic;
	private int page=1;
    private int pageSize=5 ;
    private String pageBar ;
	

	public ProductPurchase getProductPurchase() {
		return productPurchase;
	}

	public void setProductPurchase(ProductPurchase productPurchase) {
		this.productPurchase = productPurchase;
	}

	public List<ProductPurchase> getListPP() {
		return listPP;
	}

	public void setListPP(List<ProductPurchase> listPP) {
		this.listPP = listPP;
	}

	public File getOriginalPic() {
		return originalPic;
	}

	public void setOriginalPic(File originalPic) {
		this.originalPic = originalPic;
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

	public String toCreateProductPurchase()throws Exception{
		return SUCCESS;
	}
	
	public String createProductPurchase()throws Exception{
		Integer purchaseId=IdMakerService.newId("ProductPurchase").intValue();
		Integer memberId=((Long)MemberService.getMemberId()).intValue();
		productPurchase.setPurchaseId(purchaseId);
		productPurchase.setMemberId(memberId);
		productPurchase.setPurchaseStartDate(new Date());
		long ms=(Long.parseLong(productPurchase.getInfoValidity()))*24*60*60*1000;
		productPurchase.setPurchaseEndDate(new Date(new Date().getTime()+ms));
		productPurchase.setIpAddress(this.getRequest().getRemoteAddr());
		ProductPurchaseService.insertProductPurchase(productPurchase,originalPic);
		this.getRequest().setAttribute("tip", "求购信息发布成功");
		return SUCCESS;
	}
	
	public String toProductPurchaseListOn()throws Exception{
		Integer memberId=((Long)MemberService.getMemberId()).intValue();
		PageTool pageTool=new PageTool();
		int count=ProductPurchaseService.getProductPurchaseListCount(memberId, "on");
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
		listPP=ProductPurchaseService.getProductPurchaseList(memberId, "on", page, pageSize); 	
		for(ProductPurchase pp:listPP){
			pp.setProductType(ProductTypeService.getProductTypeByCode(pp.getProductType()));
		}
		return SUCCESS;
	}
	
	public String toProductPurchaseListOff()throws Exception{
		Integer memberId=((Long)MemberService.getMemberId()).intValue();
		PageTool pageTool=new PageTool();
		int count=ProductPurchaseService.getProductPurchaseListCount(memberId, "off");
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
		listPP=ProductPurchaseService.getProductPurchaseList(memberId, "off", page, pageSize); 	
		for(ProductPurchase pp:listPP){
			pp.setProductType(ProductTypeService.getProductTypeByCode(pp.getProductType()));
		}
		return SUCCESS;
	}
	
	public String toUpdateProductPurchase()throws Exception{
		String id=this.getRequest().getParameter("purchaseId");
		productPurchase=ProductPurchaseService.getProductPurchase(id);
		String type=ProductTypeService.getProductTypeByCode(productPurchase.getProductType());
		this.getRequest().setAttribute("pType", type);
		return SUCCESS;
	}
	
	public String updateProductPurchase()throws Exception{
		productPurchase.setPurchaseModifyDate(new Date());
		long ms=(Long.parseLong(productPurchase.getInfoValidity()))*24*60*60*1000;
		productPurchase.setPurchaseEndDate(new Date(new Date().getTime()+ms));
		productPurchase.setIpAddress(this.getRequest().getRemoteAddr());
		ProductPurchaseService.updateProductPurchase(productPurchase, originalPic);
		this.getRequest().setAttribute("tip", "求购信息修改成功");
		return SUCCESS;
	}
	
	public String setProductPurchaseOff()throws Exception{
		String ids=this.getRequest().getParameter("purchaseIds");
		String[] strings=ids.split(",");
		ProductPurchaseService.setProductPurchaseStatus(strings, "off");
		return SUCCESS;
	}
	
	public String setProductPurchaseOn()throws Exception{
		String ids=this.getRequest().getParameter("purchaseIds");
		String[] strings=ids.split(",");
		ProductPurchaseService.setProductPurchaseStatus(strings, "on");
		return SUCCESS;
	}
	
	public String setProductPurchaseDel()throws Exception{
		String ids=this.getRequest().getParameter("purchaseIds");
		String[] strings=ids.split(",");
		ProductPurchaseService.setProductPurchaseStatus(strings, "del");
		return SUCCESS;
	}
	
	public String searchProductPurchaseListOn()throws Exception{
		Integer memberId=((Long)MemberService.getMemberId()).intValue();
		String sName=this.getRequest().getParameter("searchName");
		PageTool pageTool=new PageTool();
		int count=ProductPurchaseService.getSearchProductPurchaseListCount(memberId, "on", sName);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	listPP=ProductPurchaseService.searchProductPurchaseList(memberId, page, pageSize, sName, "on");
		for(ProductPurchase pp:listPP){
			pp.setProductType(ProductTypeService.getProductTypeByCode(pp.getProductType()));
		}
		this.getRequest().setAttribute("searchName", sName);
		return SUCCESS;
	}
	
	public String searchProductPurchaseListOff()throws Exception{
		Integer memberId=((Long)MemberService.getMemberId()).intValue();
		String sName=this.getRequest().getParameter("searchName");
		PageTool pageTool=new PageTool();
		int count=ProductPurchaseService.getSearchProductPurchaseListCount(memberId, "off", sName);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	listPP=ProductPurchaseService.searchProductPurchaseList(memberId, page, pageSize, sName, "off");
		for(ProductPurchase pp:listPP){
			pp.setProductType(ProductTypeService.getProductTypeByCode(pp.getProductType()));
		}
		this.getRequest().setAttribute("searchName", sName);
		return SUCCESS;
	}
	
}
