package com.bornsoft.asn.action.product;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.product.Delivery;
import com.bornsoft.asn.bean.product.Product;
import com.bornsoft.asn.bean.product.ProductCustomProperty;
import com.bornsoft.asn.bean.productType.ProductType;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.product.DeliveryService;
import com.bornsoft.asn.service.product.PT2DYService;
import com.bornsoft.asn.service.product.ProductCustomPropertyService;
import com.bornsoft.asn.service.product.ProductService;
import com.bornsoft.asn.service.productType.ProductTypeService;
import com.bornsoft.asn.service.storage.StorageService;
import com.bornsoft.asn.service.supplier.SupplierService;
import com.bornsoft.asn.utils.common.PageTool;

public class ProductAction extends BaseAction{
	private Product product;
	private List<ProductCustomProperty> listPCP;
	private List<Product> listP;
	private File originalPic;
	private File originalPic1;
	private File originalPic2;
	private File originalPic3;
	private int page=1;
    private int pageSize=5 ;
    private String pageBar ;
    private Delivery delivery;
    private List<ProductType> firstType;
    private List<ProductType> secondType;
    private List<ProductType> thirdType;
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public List<ProductCustomProperty> getListPCP() {
		return listPCP;
	}
	public void setListPCP(List<ProductCustomProperty> listPCP) {
		this.listPCP = listPCP;
	}
	public List<Product> getListP() {
		return listP;
	}
	public void setListP(List<Product> listP) {
		this.listP = listP;
	}
	public File getOriginalPic() {
		return originalPic;
	}
	public void setOriginalPic(File originalPic) {
		this.originalPic = originalPic;
	}
	public File getOriginalPic1() {
		return originalPic1;
	}
	public void setOriginalPic1(File originalPic1) {
		this.originalPic1 = originalPic1;
	}
	public File getOriginalPic2() {
		return originalPic2;
	}
	public void setOriginalPic2(File originalPic2) {
		this.originalPic2 = originalPic2;
	}
	public File getOriginalPic3() {
		return originalPic3;
	}
	public void setOriginalPic3(File originalPic3) {
		this.originalPic3 = originalPic3;
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
	public List<ProductType> getThirdType() {
		return thirdType;
	}
	public void setThirdType(List<ProductType> thirdType) {
		this.thirdType = thirdType;
	}
	public Delivery getDelivery() {
		return delivery;
	}
	public void setDelivery(Delivery delivery) {
		this.delivery = delivery;
	}
	public String checkProductNumber()throws Exception{
		String supplierId=this.getRequest().getParameter("supplierId");
		String productNumber=this.getRequest().getParameter("productNumber");
		String back=ProductService.checkProductNumber(supplierId, productNumber);
		if(back.equals("yes")){
			print("yes");
		}else{
			print("no");
		}
		return null;
	}
    
	public String toCreateProduct()throws Exception{
		firstType = ProductTypeService.getFirstProductType();
		
		return SUCCESS;
	}
	
	
	public String createProduct()throws Exception{
		Integer productId=IdMakerService.newId("Product").intValue();
		Integer deliveryId=IdMakerService.newId("delivery").intValue();
		Integer supplierId=((Long)SupplierService.getSupplierId()).intValue();
		product.setProductId(productId);
		product.setSupplierId(supplierId);
		product.setProductStartDate(new Date());
		product.setIpAddress(this.getRequest().getRemoteAddr());
		
		List<ProductCustomProperty> nlistPCP=new ArrayList<ProductCustomProperty>();
		if(listPCP!=null&&listPCP.size()>0){
			for(ProductCustomProperty pcp:listPCP){
				if(pcp!=null&&!pcp.getPropertyName().trim().equals("")){
					pcp.setProductCPId(IdMakerService.newId("ProductCustomProperty").intValue());
					pcp.setProductId(productId);
					nlistPCP.add(pcp);
				}
			}
		}
		delivery.setDeliveryId(deliveryId);
		ProductService.insertProduct(product, nlistPCP, originalPic,originalPic1,originalPic2,originalPic3,delivery);
		this.getRequest().setAttribute("tip", "商品发布成功");
		return SUCCESS;
	}
	
	public String toProductListOn()throws Exception{
		Integer supplierId=((Long)SupplierService.getSupplierId()).intValue();
		PageTool pageTool=new PageTool();
		int count=ProductService.getProductCount(supplierId, "on");
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	
	   	listP=ProductService.getProductList(supplierId, "on",page,pageSize);
		for(Product p:listP){
			String pType=ProductTypeService.getProductTypeNameByCode(p.getProductType());
			p.setProductType(pType);
		}
	   	return SUCCESS;
	}
	
	public String toUpdateProduct()throws Exception{
		firstType = ProductTypeService.getFirstProductType();
		secondType=ProductTypeService.getSecondProductType();
		thirdType=ProductTypeService.getThirdProductType();
		String id=this.getRequest().getParameter("productId");
		product=ProductService.getProductById(id);
		String type3=product.getProductType();
		String type1=type3.substring(0, 4);
		String type2=type3.substring(0, 9);

		this.getRequest().setAttribute("type1", type1);
		this.getRequest().setAttribute("type2", type2);
		this.getRequest().setAttribute("type3", type3);
		
		String pType=ProductTypeService.getProductTypeNameByCode(product.getProductType());
		String[] names=pType.split("-");
		String name1=names[0]+"-";
		String name2=names[1]+"-";
		this.getRequest().setAttribute("name1", name1);
		this.getRequest().setAttribute("name2", name2);
		this.getRequest().setAttribute("pType", pType);
		
		listPCP=ProductCustomPropertyService.getProductCustomPropertyList(product.getProductId());
		delivery=DeliveryService.getDelivery(product.getProductId());
		if(delivery==null){
			Integer deliveryId=IdMakerService.newId("delivery").intValue();
			delivery=new Delivery();
			delivery.setDeliveryId(deliveryId);
		}
		//权限控制
		if(!validateProduct(product,((Long)SupplierService.getSupplierId()).intValue())){
			return INPUT;
		}
		
		return SUCCESS;
	}
	
	public String updateProduct()throws Exception{
		//权限控制
		if(!validateProduct(product,((Long)SupplierService.getSupplierId()).intValue())){
			return INPUT;
		}
		product.setProductModifyDate(new Date());
		product.setIpAddress(this.getRequest().getRemoteAddr());
		
		List<ProductCustomProperty> nlistPCP=new ArrayList<ProductCustomProperty>();
		if(listPCP!=null&&listPCP.size()>0){
			for(ProductCustomProperty pcp:listPCP){
				if(pcp!=null&&!pcp.getPropertyName().trim().equals("")){
					pcp.setProductCPId(IdMakerService.newId("ProductCustomProperty").intValue());
					pcp.setProductId(product.getProductId());
					nlistPCP.add(pcp);
				}
			}
		}
		delivery.setProductId(product.getProductId());
		Product p=ProductService.findProductById(product.getProductId());
		if(product.getWareCount()!=null&&p.getWareCount()!=null&&!product.getWareCount().equals(p.getWareCount())){
			StorageService.insertUpdateProduct(product.getProductId(), product.getWareCount(),((Long)SupplierService.getSupplierId()).intValue(),"U",product.getWareCount());
		}	
		ProductService.updateProduct(product, nlistPCP, originalPic,originalPic1,originalPic2,originalPic3,delivery);
		this.getRequest().setAttribute("tip", "商品修改成功");	
		return SUCCESS;
	}
	
	public String searchProductListOn()throws Exception{
		String sName=this.getRequest().getParameter("searchName");
		String sNumber=this.getRequest().getParameter("searchNumber");
		String censor=this.getRequest().getParameter("censor");
		Integer supplierId=((Long)SupplierService.getSupplierId()).intValue();
		PageTool pageTool=new PageTool();
		int count=ProductService.getProductSearchCount(supplierId, "on", sName, sNumber,censor);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	
	   	listP=ProductService.getProductSearchList(supplierId, "on", sName, sNumber,censor,page,pageSize);
		for(Product p:listP){
			String pType=ProductTypeService.getProductTypeNameByCode(p.getProductType());
			p.setProductType(pType);
		}
		this.getRequest().setAttribute("searchName", sName);
		this.getRequest().setAttribute("searchNumber", sNumber);
		this.getRequest().setAttribute("censor", censor);
		return SUCCESS;
	}
	
	public String setProductOff()throws Exception{
		String ids=this.getRequest().getParameter("productIds");
		String[] strings=ids.split(",");
		//权限控制
		for(String s:strings){
			Product p=ProductService.getProductById(s);
			if(!validateProduct(p,((Long)SupplierService.getSupplierId()).intValue())){
				return INPUT;
			}
		}
		ProductService.setProductStatus(strings,"off");
		
		return SUCCESS;
	}
	
	public String toProductListOff()throws Exception{
		Integer supplierId=((Long)SupplierService.getSupplierId()).intValue();
		PageTool pageTool=new PageTool();
		int count=ProductService.getProductCount(supplierId, "off");
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	
	   	listP=ProductService.getProductList(supplierId, "off",page,pageSize);
		for(Product p:listP){
			String pType=ProductTypeService.getProductTypeNameByCode(p.getProductType());
			p.setProductType(pType);
		}
	   	return SUCCESS;
	}
	
	public String setProductOn()throws Exception{
		String ids=this.getRequest().getParameter("productIds");
		String[] strings=ids.split(",");
		//权限控制
		for(String s:strings){
			Product p=ProductService.getProductById(s);
			if(!validateProduct(p,((Long)SupplierService.getSupplierId()).intValue())){
				return INPUT;
			}
		}
		ProductService.setProductStatus(strings,"on");
		
		return SUCCESS;
	}
	
	public String setProductDel()throws Exception{
		String ids=this.getRequest().getParameter("productIds");
		String[] strings=ids.split(",");
		//权限控制
		for(String s:strings){
			Product p=ProductService.getProductById(s);
			if(!validateProduct(p,((Long)SupplierService.getSupplierId()).intValue())){
				return INPUT;
			}
		}
		ProductService.setProductStatus(strings,"del");		
		return SUCCESS;
	}
	
	public String searchProductListOff()throws Exception{
		String sName=this.getRequest().getParameter("searchName");
		String sNumber=this.getRequest().getParameter("searchNumber");
		String censor=this.getRequest().getParameter("censor");
		Integer supplierId=((Long)SupplierService.getSupplierId()).intValue();
		PageTool pageTool=new PageTool();
		int count=ProductService.getProductSearchCount(supplierId, "off", sName, sNumber,censor);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	
	   	listP=ProductService.getProductSearchList(supplierId, "off", sName, sNumber,censor,page,pageSize);
		for(Product p:listP){
			String pType=ProductTypeService.getProductTypeNameByCode(p.getProductType());
			p.setProductType(pType);
		}
		this.getRequest().setAttribute("searchName", sName);
		this.getRequest().setAttribute("searchNumber", sNumber);
		this.getRequest().setAttribute("censor", censor);
		return SUCCESS;
	}
	
//管理员方法
	
	public String toAllProductList()throws Exception{
		String searchName=this.getRequest().getParameter("searchName");
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
	
		int count=ProductService.getAllProductCount(supplierId1, supplierName, null, searchName, searchId1, censor1,null);
		PageTool pageTool=new PageTool();
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	
	   	listP=ProductService.getAllProductList(supplierId1, supplierName, null, searchName, searchId1, censor1,null, page, pageSize,null);
		for(Product p:listP){
			String detail=p.getProductDetail();
			String d=splitAndFilterString(detail,50);
			p.setProductDetail(d);
		}
		this.getRequest().setAttribute("searchName", searchName);
		this.getRequest().setAttribute("searchId", searchId);
		this.getRequest().setAttribute("supplierId", supplierId);
		this.getRequest().setAttribute("supplierName", supplierName);
		this.getRequest().setAttribute("censor", censor);
		return SUCCESS;
		
	}
	
	public String setProductCensor()throws Exception{
		String ids=this.getRequest().getParameter("productIds");
		String doCensor=this.getRequest().getParameter("doCensor");
		Integer censor1=Integer.valueOf(doCensor);
		String[] strings=ids.split(",");
		ProductService.setProductCensor(strings,censor1);
		return SUCCESS;
	}
	
	public void checkProduct()throws Exception{
		String productId=this.getRequest().getParameter("productId");
		Product p=ProductService.getProductById(productId);
		String picPath=p.getSmallPicPath();
		if(picPath==null){
			picPath="pic/product/snopic.jpg";
		}
		String picPath1=p.getSmallPicPath1();
		if(picPath1==null){
			picPath1="pic/product/snopic.jpg";
		}
		String picPath2=p.getSmallPicPath2();
		if(picPath2==null){
			picPath2="pic/product/snopic.jpg";
		}
		String picPath3=p.getSmallPicPath3();
		if(picPath3==null){
			picPath3="pic/product/snopic.jpg";
		}
		String title=p.getProductName();
		if(title==null){
			title="";
		}
		String number=p.getProductNumber();
		if(number==null){
			number="";
		}
		String detail=p.getProductDetail();
		if(detail==null){
			detail="";
		}
		String wd=p.getWholesaleDetail();
		if(wd==null){
			wd="";
		}
		String td=p.getTransportDetail();
		if(td==null){
			td="";
		}
		
		print(picPath+"}@"+picPath1+"}@"+picPath2+"}@"+picPath3+"}@"+title+"}@"+number+"}@"+detail+"}@"+wd+"}@"+td);
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
	
	//product权限控制
	private boolean validateProduct(Product product,Integer supplierId){
		Integer id=product.getSupplierId();
		if(id.equals(supplierId)){
			return true;
		}
		return false;
	}
}
