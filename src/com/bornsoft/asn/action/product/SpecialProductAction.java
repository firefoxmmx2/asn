package com.bornsoft.asn.action.product;

import java.io.File;
import java.util.List;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.product.Product;
import com.bornsoft.asn.bean.product.SpecialProduct;
import com.bornsoft.asn.service.accounting.AccountingService;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.product.ProductService;
import com.bornsoft.asn.service.product.SpecialProductService;
import com.bornsoft.asn.utils.common.PageTool;
import com.bornsoft.asn.utils.common.WebContext;

public class SpecialProductAction extends BaseAction{
	private SpecialProduct specialProduct;
	private List<SpecialProduct> specialProductList;
	private List<Product> listP;
	private File originalPic;;
	private int page=1;
    private int pageSize=5 ;
    private String pageBar ;
	
	
	public File getOriginalPic() {
		return originalPic;
	}
	public void setOriginalPic(File originalPic) {
		this.originalPic = originalPic;
	}
	public List<Product> getListP() {
		return listP;
	}
	public void setListP(List<Product> listP) {
		this.listP = listP;
	}
	public SpecialProduct getSpecialProduct() {
		return specialProduct;
	}
	public void setSpecialProduct(SpecialProduct specialProduct) {
		this.specialProduct = specialProduct;
	}
	public List<SpecialProduct> getSpecialProductList() {
		return specialProductList;
	}
	public void setSpecialProductList(List<SpecialProduct> specialProductList) {
		this.specialProductList = specialProductList;
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
	
	public String toSpecialProductList()throws Exception{
		String name=this.getRequest().getParameter("name");
		String type=this.getRequest().getParameter("type");
		if(type==null||type.trim().equals("")){
			if(specialProduct!=null){
				type=specialProduct.getType();
				if(type==null||type.trim().equals("")){
					type="tuijian";	
				}
			}else{
				type="tuijian";	
			}
		}
		String productId=this.getRequest().getParameter("productId");
		this.getRequest().setAttribute("name", name);
		this.getRequest().setAttribute("type", type);
		this.getRequest().setAttribute("productId", productId);
		PageTool pageTool=new PageTool();
		int count=SpecialProductService.getSpecialProductListCount(name, type, productId,null);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	Integer start=(page-1)*pageSize+1;
	   	Integer end=page*pageSize;
		specialProductList=SpecialProductService.getSpecialProductList(name, type, productId, start, end,null);
		return SUCCESS;
	}
	
	public String toAllSelectProductList()throws Exception{
		String type=this.getRequest().getParameter("type");
		this.getRequest().setAttribute("type", type);
		String searchName=this.getRequest().getParameter("searchName");
		String searchId=this.getRequest().getParameter("searchId");
		String supplierId=this.getRequest().getParameter("supplierId");
		String supplierName=this.getRequest().getParameter("supplierName");
		Integer censor1=null;
		Integer searchId1=null;
		Integer supplierId1=null;
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
	
		int count=ProductService.getAllProductCount(supplierId1, supplierName, null, searchName, searchId1, censor1,"pass");
		PageTool pageTool=new PageTool();
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	
	   	listP=ProductService.getAllProductList(supplierId1, supplierName, null, searchName, searchId1, censor1,"pass", page, pageSize,null);
		for(Product p:listP){
			String detail=p.getProductDetail();
			String d=splitAndFilterString(detail,50);
			p.setProductDetail(d);
		}
		this.getRequest().setAttribute("searchName", searchName);
		this.getRequest().setAttribute("searchId", searchId);
		this.getRequest().setAttribute("supplierId", supplierId);
		this.getRequest().setAttribute("supplierName", supplierName);
		return SUCCESS;
	}
	
	public void addSpecialProduct()throws Exception{
		String ids=this.getRequest().getParameter("productIds");
		String type=this.getRequest().getParameter("type");
		String[] strings=ids.split(",");
		SpecialProductService.insertSpecialProduct(strings, type);
	}
	
	public String toUpdateSpecialProduct()throws Exception{
		String id=WebContext.getRequest().getParameter("id");
		specialProduct=SpecialProductService.getSpecialProductById(id);
		
		return SUCCESS;
	}
	
	public String updateSpecialProduct()throws Exception{
//		String type=specialProduct.getType();//无效
//		this.getRequest().setAttribute("type", type);
		SpecialProductService.updateSpecialProduct(specialProduct,originalPic);
		return SUCCESS;
	}
	
	public String updateSnumber()throws Exception{
		SpecialProductService.updateSnumber(specialProductList);
		return SUCCESS;
	}
	
	public String deleteSpecialProduct()throws Exception{
		String strings=WebContext.getRequest().getParameter("ids");
		String[] ids=strings.split(",");
	//	String type=this.getRequest().getParameter("type");//无效
	//	this.getRequest().setAttribute("type", type);
		SpecialProductService.deleteSpecialProductById(ids);
		return SUCCESS;
	}
	
	private String splitAndFilterString(String input, int length) {  
        if (input == null || input.trim().equals("")) {  
            return "";  
        }  
        // 去掉所有html元素,  
        String str = input.replaceAll("\\&[a-zA-Z]{1,10};", "").replaceAll(  
                "<[^>]*>", "");  
        str = str.replaceAll("[(/>)<]", "");  
        int len = str.length();  
        if (len <= length) {  
            return str;  
        } else {  
            str = str.substring(0, length);  
            str += "......";  
        }  
        return str;  
    } 
}
