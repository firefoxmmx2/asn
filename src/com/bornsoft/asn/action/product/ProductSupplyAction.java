package com.bornsoft.asn.action.product;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.product.ProductCustom;
import com.bornsoft.asn.bean.product.ProductSupply;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.service.product.ProductCustomService;
import com.bornsoft.asn.service.product.ProductSupplyService;
import com.bornsoft.asn.service.productType.ProductTypeService;
import com.bornsoft.asn.utils.common.PageTool;


public class ProductSupplyAction extends BaseAction{
	private ProductSupply productSupply;
	private List<ProductCustom> listPC;
	private File originalPic;
	private List<ProductSupply> listPS;
	private int page=1;
    private int pageSize=5 ;
    private String pageBar ;

	
	public ProductSupply getProductSupply() {
		return productSupply;
	}

	public void setProductSupply(ProductSupply productSupply) {
		this.productSupply = productSupply;
	}

	public List<ProductCustom> getListPC() {
		return listPC;
	}

	public void setListPC(List<ProductCustom> listPC) {
		this.listPC = listPC;
	}
	
	public File getOriginalPic() {
		return originalPic;
	}

	public void setOriginalPic(File originalPic) {
		this.originalPic = originalPic;
	}

	public List<ProductSupply> getListPS() {
		return listPS;
	}

	public void setListPS(List<ProductSupply> listPS) {
		this.listPS = listPS;
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

	public String toCreateProductSupply()throws Exception{
		return SUCCESS;
	}

	public String createProductSupply()throws Exception{
		Integer productId=IdMakerService.newId("ProductSupply").intValue();
		Integer supplierId=((Long)MemberService.getMemberId()).intValue();
		productSupply.setProductId(productId);
		productSupply.setSupplierId(supplierId);
		productSupply.setProductStartDate(new Date());
		long ms=Long.parseLong(productSupply.getInfoValidity())*24*60*60*1000;
		productSupply.setProductEndDate(new Date(new Date().getTime()+ms));
		productSupply.setIpAddress(this.getRequest().getRemoteAddr());
		
		List<ProductCustom> nlistPC=new ArrayList<ProductCustom>();
		if(listPC!=null&&listPC.size()>0){
			for(ProductCustom pc:listPC){
				if(pc!=null&&!pc.getPropertyName().trim().equals("")){
					pc.setProductCustomId(IdMakerService.newId("ProductCustom").intValue());
					pc.setProductId(productId);
					nlistPC.add(pc);
				}
			}
		}

		ProductSupplyService.insertProductSupply(productSupply, nlistPC, originalPic);
		this.getRequest().setAttribute("tip", "供应信息发布成功");
		return SUCCESS;
	}
	
	public String toProductSupplyListOn()throws Exception{
		Integer supplierId=((Long)MemberService.getMemberId()).intValue();
		PageTool pageTool=new PageTool();
		int count =ProductSupplyService.getProductSupplyCountOn(supplierId);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
		
		
		listPS=ProductSupplyService.getProductSupplyListOnPage(supplierId, page, pageSize);
		for(ProductSupply ps:listPS){
			String pType=ProductTypeService.getProductTypeByCode(ps.getProductType());
			ps.setProductType(pType);
		}
//		Integer supplierId=((Long)MemberService.getMemberId()).intValue();
//		listPS=ProductSupplyService.getProductSupplyListOn(supplierId);
//		for(ProductSupply ps:listPS){
//			String pType=ProductTypeService.getProductTypeByCode(ps.getProductType());
//			ps.setProductType(pType);
//		}
		
		return SUCCESS;
	}
	
	public String toUpdateProductSupply()throws Exception{
		String id=this.getRequest().getParameter("productId");
		productSupply=ProductSupplyService.getProductSupply(id);
		String pType=ProductTypeService.getProductTypeByCode(productSupply.getProductType());
		this.getRequest().setAttribute("pType", pType);
		listPC=ProductCustomService.getProductCustomList(productSupply.getProductId());
		return SUCCESS;
	}
	
	public String updateProductSupply()throws Exception{
		productSupply.setProductModifyDate(new Date());
		long ms=Long.parseLong(productSupply.getInfoValidity())*24*60*60*1000;
		productSupply.setProductEndDate(new Date(new Date().getTime()+ms));
		productSupply.setIpAddress(this.getRequest().getRemoteAddr());
		
		List<ProductCustom> nlistPC=new ArrayList<ProductCustom>();
		if(listPC!=null&&listPC.size()>0){
			for(ProductCustom pc:listPC){
				if(pc!=null&&!pc.getPropertyName().trim().equals("")){
					pc.setProductCustomId(IdMakerService.newId("ProductCustom").intValue());
					pc.setProductId(productSupply.getProductId());
					nlistPC.add(pc);
				}
			}
		}
		ProductSupplyService.updateProductSupply(productSupply, nlistPC, originalPic);
		this.getRequest().setAttribute("tip", "供应信息修改成功");
		return SUCCESS;
	}
	
	public String setProductSupplyOff()throws Exception{
		String ids=this.getRequest().getParameter("productIds");
		String[] strings=ids.split(",");
		
		ProductSupplyService.setProductSupplyOff(strings);
		return SUCCESS;
	}
	
	public String toProductSupplyListOff()throws Exception{
		Integer supplierId=((Long)MemberService.getMemberId()).intValue();
		PageTool pageTool=new PageTool();
		int count =ProductSupplyService.getProductSupplyCountOff(supplierId);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
		
		
		listPS=ProductSupplyService.getProductSupplyListOffPage(supplierId, page, pageSize);
		for(ProductSupply ps:listPS){
			String pType=ProductTypeService.getProductTypeByCode(ps.getProductType());
			ps.setProductType(pType);
		}
		return SUCCESS;
	}
	
	public String setProductSupplyOn()throws Exception{
		String ids=this.getRequest().getParameter("productIds");
		String[] strings=ids.split(",");
		ProductSupplyService.setProductSupplyOn(strings);
		return SUCCESS;
	}
	
	public String setProductSupplyDel()throws Exception{
		String ids=this.getRequest().getParameter("productIds");
		String[] strings=ids.split(",");
		ProductSupplyService.setProductSupplyStatus(strings, "del");
		return SUCCESS;
	}
	
	public String searchProductSupplyListOn()throws Exception{
		String sName=this.getRequest().getParameter("searchName");
		Integer supplierId=((Long)MemberService.getMemberId()).intValue();
		PageTool pageTool=new PageTool();
		int count =ProductSupplyService.getProductSupplyCountSearch(supplierId,sName,"on");
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
		
		listPS=ProductSupplyService.getProductSupplyListPageSearch(supplierId,page,pageSize,sName,"on");
		for(ProductSupply ps:listPS){
			String pType=ProductTypeService.getProductTypeByCode(ps.getProductType());
			ps.setProductType(pType);
		}
		this.getRequest().setAttribute("searchName", sName);
		return SUCCESS;
	}
	
	public String searchProductSupplyListOff()throws Exception{
		String sName=this.getRequest().getParameter("searchName");
		Integer supplierId=((Long)MemberService.getMemberId()).intValue();
		PageTool pageTool=new PageTool();
		int count =ProductSupplyService.getProductSupplyCountSearch(supplierId,sName,"off");
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
		
		listPS=ProductSupplyService.getProductSupplyListPageSearch(supplierId,page,pageSize,sName,"off");
		for(ProductSupply ps:listPS){
			String pType=ProductTypeService.getProductTypeByCode(ps.getProductType());
			ps.setProductType(pType);
		}
		this.getRequest().setAttribute("searchName", sName);
		return SUCCESS;
	}
}
