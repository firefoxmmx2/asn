package com.bornsoft.asn.action.channel;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.bean.product.Delivery;
import com.bornsoft.asn.bean.product.Product;
import com.bornsoft.asn.bean.product.SpecialProduct;
import com.bornsoft.asn.dao.channel.NcpDao;
import com.bornsoft.asn.dao.order.OrderDao;
import com.bornsoft.asn.service.channel.NcpService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.service.product.DeliveryService;
import com.bornsoft.asn.service.product.DisplayProductService;
import com.bornsoft.asn.service.product.ProductService;
import com.bornsoft.asn.service.product.SpecialProductService;
import com.bornsoft.asn.service.productType.ProductTypeService;
import com.bornsoft.asn.service.supplier.SupplierService;
import com.bornsoft.asn.utils.common.AsnConstLib;
import com.bornsoft.asn.utils.common.HToken;
import com.bornsoft.asn.utils.common.PageCreator;
import com.bornsoft.asn.utils.common.PageTool;
import com.bornsoft.asn.utils.common.WebContext;

public class NcpAction extends BaseAction {

	/**
	 * cl
	 * 农产品集团
	 */
	
	private List<Object> ncplist;
	private List<Object> bjplist;
	private List<Object> swfwlist;
	public List<Product> hotNcpProduct;	
	public List<Product> hotBjpProduct;	
	public List<Product> hotSwfwProduct;
	private List<Product> listProduct;
	private List<SpecialProduct> specialPriceProduct; //特价
	private Product product;
	private Delivery dalivery; //买家承担 运费时，运费查询
	private Member member;
	/**同类别的其它产品*/
	private List<Product> otherTypeProduct;
	private String searchkey; 
	
	private int page=1;
    private int pageSize=12 ;
    private String pageBar ;
    
    
  //产品分类
	private List<Map<String,Object> > ptype;
    

	public List<Map<String, Object>> getPtype() {
		return ptype;
	}

	public void setPtype(List<Map<String, Object>> ptype) {
		this.ptype = ptype;
	}

	public String getSearchkey() {
		return searchkey;
	}

	public void setSearchkey(String searchkey) {
		this.searchkey = searchkey;
	}

	public List<Product> getOtherTypeProduct() {
		return otherTypeProduct;
	}

	public void setOtherTypeProduct(List<Product> otherTypeProduct) {
		this.otherTypeProduct = otherTypeProduct;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Delivery getDalivery() {
		return dalivery;
	}

	public void setDalivery(Delivery dalivery) {
		this.dalivery = dalivery;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public List<Product> getListProduct() {
		return listProduct;
	}

	public void setListProduct(List<Product> listProduct) {
		this.listProduct = listProduct;
	}

	public List<SpecialProduct> getSpecialPriceProduct() {
		return specialPriceProduct;
	}

	public void setSpecialPriceProduct(List<SpecialProduct> specialPriceProduct) {
		this.specialPriceProduct = specialPriceProduct;
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

	public List<Product> getHotNcpProduct() {
		return hotNcpProduct;
	}

	public void setHotNcpProduct(List<Product> hotNcpProduct) {
		this.hotNcpProduct = hotNcpProduct;
	}

	public List<Product> getHotBjpProduct() {
		return hotBjpProduct;
	}

	public void setHotBjpProduct(List<Product> hotBjpProduct) {
		this.hotBjpProduct = hotBjpProduct;
	}

	public List<Product> getHotSwfwProduct() {
		return hotSwfwProduct;
	}

	public void setHotSwfwProduct(List<Product> hotSwfwProduct) {
		this.hotSwfwProduct = hotSwfwProduct;
	}

	public List<Object> getNcplist() {
		return ncplist;
	}

	public void setNcplist(List<Object> ncplist) {
		this.ncplist = ncplist;
	}

	public List<Object> getBjplist() {
		return bjplist;
	}

	public void setBjplist(List<Object> bjplist) {
		this.bjplist = bjplist;
	}

	public List<Object> getSwfwlist() {
		return swfwlist;
	}

	public void setSwfwlist(List<Object> swfwlist) {
		this.swfwlist = swfwlist;
	}

	private static final long serialVersionUID = 1L;
	
	public String ncpIndex()throws Exception{
		String[] arrProductType = {"0004","0008","0010"}; 
		ptype = ProductTypeService.getNewProductType(arrProductType); //分类
		
		ncplist =DisplayProductService.findProductByCode(1, 7,"0004", ""); //农产品
		bjplist =DisplayProductService.findProductByCode(1, 7,"0008", ""); //保健品
		swfwlist =DisplayProductService.findProductByCode(1, 7,"0010", ""); //商务服务
		
		hotNcpProduct = DisplayProductService.getFrontHotProduct("0004",1,10); //农产品热卖产品
		hotBjpProduct = DisplayProductService.getFrontHotProduct("0008",1,10); //保健品热卖产品
		hotSwfwProduct = DisplayProductService.getFrontHotProduct("0010",1,10); //商务服务热卖产品
		
		this.session("ncpMenuType", "male");
		return SUCCESS;
	}
	
	public String listNcp() throws Exception{		
		String type = this.request("type");
		String code = this.request("ptypeCode");
		if (code == null) {
			if (type == null) {
				code = "0004";
			} else if (type.equals("ncp")) { // 农产品
				code = "0004";
			} else if (type.equals("bjp")) { // 保健品
				code = "0008";
			} else if (type.equals("syfw")) {// 商业服务
				code = "0010";
			}
		}else{
			String[] arryCode = code.split("-"); 
			if(arryCode[0].equals("0004")){
				type = "ncp";
			}else if(arryCode[0].equals("0008")){
				type = "bjp";
			}else if(arryCode[0].equals("0010")){
				type = "syfw";
			}
		}
		int count = DisplayProductService.getCount(null,code,null,null,null,null,null,searchkey);
		PageCreator pc=new PageCreator();
		pc.setPageSize(pageSize);
		pc.setCurrentPage(page);
		pc.setTotalRow(count);
		
		
		pageBar=pc.getPageBar();
		int startCount=(page-1)*pc.getPageSize()+1;
		int endCount=page*pc.getPageSize();	
		
		ncplist =DisplayProductService.findProductByCode(startCount, endCount,code, searchkey); //农产品
		hotNcpProduct = DisplayProductService.getFrontHotProduct("0004",1,12); //农产品热卖产品
		specialPriceProduct = SpecialProductService.getSpecialProductList("", "tejia", "", 1, 12,null);//特价产品
		
		String[] arrProductType = {"0004","0008","0010"}; 
		ptype = ProductTypeService.getNewProductType(arrProductType); //分类
		
		this.session("count", count);
		if(searchkey == null){
			this.session("ncpMenuType", type);
		}else{
			this.session("searchkey", searchkey);
			this.session("ncpMenuType", "search");
		}
		this.session("ptypeCode",code);
		return SUCCESS;
	}
	
	public String hotNcp()throws Exception{		
		String type = this.request("type");
		String code = this.request("ptypeCode");
		
		if(code == null){
			code = "0004";
		}
		
		int count = NcpService.getNcpHotProductCount(code);
		PageCreator pc=new PageCreator();
		pc.setPageSize(pageSize);
		pc.setCurrentPage(page);
		pc.setTotalRow(count);
		
		pageBar=pc.getPageBar();
		int startCount=(page-1)*pc.getPageSize()+1;
		int endCount=page*pc.getPageSize();
		
		listProduct = NcpService.ncpHotProduct(startCount,endCount,code);
		hotNcpProduct = DisplayProductService.getFrontHotProduct("0004",1,12); //农产品热卖产品
		specialPriceProduct = SpecialProductService.getSpecialProductList("", "tejia", "", 1, 12,null);//特价产品
		
		String[] arrProductType = {"0004","0008","0010"}; 
		ptype = ProductTypeService.getNewProductType(arrProductType); //分类
		
		this.session("count", count);
		this.session("ncpMenuType", type);
		return SUCCESS;
	}
	
	public String detailInfo()throws Exception{	
		String productId = this.request("productId");
		String[] arrProductType = {"0004","0008","0010"}; 
		ptype = ProductTypeService.getNewProductType(arrProductType); //分类
		
		hotNcpProduct = DisplayProductService.getFrontHotProduct("0004",1,12); //农产品热卖产品
		specialPriceProduct = SpecialProductService.getSpecialProductList("", "tejia", "", 1, 12,null);//特价产品
		
		product=DisplayProductService.findProductInfo(new Long(productId));
		
		dalivery = DeliveryService.getDelivery(new Long(productId).intValue());
//		
//		//产品的销售数量
//		//product.setSaleCount(10);
		product.setSaleCount(OrderDao.getSoldCount(new Long(productId)));
//		//产品的预订数量
		product.setReservedCount(OrderDao.getPredeterCount(new Long(productId)));
//		//+++ 添加图片前缀 by hooxin
		String contextPath = WebContext.getRequest().getContextPath();
		product.setBigPicPath(contextPath+product.getBigPicPath());
		product.setSmallPicPath(contextPath+product.getSmallPicPath());
		if(product.getBigPicPath1() != null && product.getBigPicPath1().equals("") == false){
			product.setSmallPicPath1(contextPath+product.getSmallPicPath1());
			product.setBigPicPath1(contextPath+product.getBigPicPath1());
		}
		if(product.getBigPicPath2() != null && product.getBigPicPath2().equals("") == false){
			product.setSmallPicPath2(contextPath + product.getSmallPicPath2());
			product.setBigPicPath2(contextPath + product.getBigPicPath2()); 
		}
		if(product.getBigPicPath3() != null && product.getBigPicPath3().equals("") == false){
			product.setSmallPicPath3(contextPath + product.getSmallPicPath3());
			product.setBigPicPath3(contextPath + product.getBigPicPath3());
		}
		
		try {
			member=MemberService.getMember(product.getSupplierId());
			String newArea= member.getArea().substring(member.getArea().indexOf("|")+1);
			member.setArea(newArea);
			//+++添加商品点击率 by hooxin
			HttpServletRequest req = WebContext.getRequest();
			HToken ht = HToken.getHToken("pdtInfo_"+product.getProductId()+"_"+req.getRemoteAddr(), 4000, req);
				if(ht.isAvailable())
					ProductService.addPdtClick(new Long(productId));
			
			/////////////
			otherTypeProduct=DisplayProductService.findOtherProByType(product.getProductType(), new Long(productId));
			
//			supOtherProduct=DisplayProductService.queryOtherProBySupp(product.getSupplierId(), new Long(productId));
			//显示供应商评价
//			supplier = SupplierService.getSupplier(product.getSupplierId());
			
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return SUCCESS;
	} 

}
