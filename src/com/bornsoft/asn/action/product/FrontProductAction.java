package com.bornsoft.asn.action.product;


import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsStatics;

import com.bornsoft.asn.action.PageAction;
import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.bean.product.Delivery;
import com.bornsoft.asn.bean.product.Product;
import com.bornsoft.asn.bean.product.ProductCustom;
import com.bornsoft.asn.bean.product.SpecialProduct;
import com.bornsoft.asn.bean.productType.ProductType;
import com.bornsoft.asn.bean.supplier.Supplier;
import com.bornsoft.asn.bean.systemconfig.SystemConfig;
import com.bornsoft.asn.dao.order.OrderDao;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.service.product.DeliveryService;
import com.bornsoft.asn.service.product.DisplayProductService;
import com.bornsoft.asn.service.product.ProductService;
import com.bornsoft.asn.service.product.SpecialProductService;
import com.bornsoft.asn.service.productType.ProductTypeService;
import com.bornsoft.asn.service.supplier.SupplierService;
import com.bornsoft.asn.service.systemconfig.SystemConfigService;
import com.bornsoft.asn.utils.common.AsnConstLib;
import com.bornsoft.asn.utils.common.HToken;
import com.bornsoft.asn.utils.common.PageCreator;
import com.bornsoft.asn.utils.common.WebContext;
import com.bornsoft.asn.utils.common.productNavi.ProductNavigatorService;
import com.bornsoft.asn.utils.common.productNavi.ProductTypeIf;
import com.opensymphony.xwork2.ActionContext;

/**
 * 前台产品展示Action
 * @author yuwenqiang
 * 2010-3-25
 */
public class FrontProductAction  extends PageAction {
   
	private static final long serialVersionUID = 1L;
	
	private List<SpecialProduct>	specialProduct;		// 推荐
	
	/**产品ID*/
    private long productId;
    /**产品POJO*/
    private Product product;
    /**供应商POJO*/
    private Supplier supplier;
    /**会员POJO*/
    private Member member;
    /**价格*/
	private String startPrice;
    private String endPrice;
    /**最大订购量*/
    private String quantityBegin;
    /**产品类别*/
    private List<ProductType> productTypeList;
    /**发布时间*/
    private String postTime="";
    /**产品集合标志*/
    private String flag="Y";
    /**产品自定义属性*/
    private List<ProductCustom> customList;
    /**商品热卖LIST*/
    private List<Product> productSupplies;
    /**地区*/
    private String areaCode;
    /**经营模式*/
    private String operateMode;
    /**价格排序*/
    private String priceOrder;
    /**产品名称*/
    private String productName;
	/**首页热卖商品*/
	public List<Product> hotProduct;
	public List<Product> newProduct;
	
	/**供应商的其它产品信息*/
	public List<Product> supOtherProduct;
	/**同类别的其它产品*/
	public List<Product> otherTypeProduct;
	
	private Delivery dalivery; //买家承担 运费时，运费查询
	
	public Delivery getDalivery() {
		return dalivery;
	}
	public void setDalivery(Delivery dalivery) {
		this.dalivery = dalivery;
	}
	
	private String template = "";
	private String searchType = "";		//指定分类
	
	/**
	 * @return the searchType
	 */
	public String getSearchType()
	{
		return searchType;
	}
	/**
	 * @param searchType the searchType to set
	 */
	public void setSearchType(String searchType)
	{
		this.searchType = searchType;
	}
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

	//+++ 广告栏配置
	public List<SystemConfig> guanggaoConfList;
	
	public List<SystemConfig> getGuanggaoConfList() {
		return guanggaoConfList;
	}
	public void setGuanggaoConfList(List<SystemConfig> guanggaoConfList) {
		this.guanggaoConfList = guanggaoConfList;
	}
	/**全站搜索的关键字*/
	public String searchkey;
	
	
	private int page=1;
    private int pageSize=20 ;
   
    
    
	public List<SpecialProduct> getSpecialProduct() {
		return specialProduct;
	}
	public void setSpecialProduct(List<SpecialProduct> specialProduct) {
		this.specialProduct = specialProduct;
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
	public String getPageBar0() {
		return pageBar0;
	}
	public void setPageBar0(String pageBar0) {
		this.pageBar0 = pageBar0;
	}
	private String pageBar0 ;
	
	public List<Product> getNewProduct() {
		return newProduct;
	}
	public void setNewProduct(List<Product> newProduct) {
		this.newProduct = newProduct;
	}
    
    /////////////////////////////////////////////////////////
	
    public String getSearchkey() {
		return searchkey;
	}
	public void setSearchkey(String searchkey) {
		this.searchkey = searchkey;
	}
	public List<Product> getSupOtherProduct() {
		return supOtherProduct;
	}
	public void setSupOtherProduct(List<Product> supOtherProduct) {
		this.supOtherProduct = supOtherProduct;
	}
	public List<Product> getOtherTypeProduct() {
		return otherTypeProduct;
	}
	public void setOtherTypeProduct(List<Product> otherTypeProduct) {
		this.otherTypeProduct = otherTypeProduct;
	}
	/**产品类别*/
	private String type;
	public String url;
	public String ret;
	/**产品立面信息*/
	public String facade;
	//历史立面信息 add by hooxin
    private String oldfacade;

	public List<Product> getHotProduct() {
		return hotProduct;
	}
	public void setHotProduct(List<Product> hotProduct) {
		this.hotProduct = hotProduct;
	}
	public String getFacade() {
		return facade;
	}
	public void setFacade(String facade) {
		this.facade = facade;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRet() {
		return ret;
	}
	public void setRet(String ret) {
		this.ret = ret;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}
	public String getOperateMode() {
		return operateMode;
	}
	public void setOperateMode(String operateMode) {
		this.operateMode = operateMode;
	}
	public String getPriceOrder() {
		return priceOrder;
	}
	public void setPriceOrder(String priceOrder) {
		this.priceOrder = priceOrder;
	}
	public List<Product> getProductSupplies() {
		return productSupplies;
	}
	public void setProductSupplies(List<Product> productSupplies) {
		this.productSupplies = productSupplies;
	}
	public String getFlag() {
		return flag;
	}
	public String getPostTime() {
		return postTime;
	}
	public void setPostTime(String postTime) {
		this.postTime = postTime;
	}
	public List<ProductCustom> getCustomList() {
		return customList;
	}
	public void setCustomList(List<ProductCustom> customList) {
		this.customList = customList;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getQuantityBegin() {
		return quantityBegin;
	}
	public void setQuantityBegin(String quantityBegin) {
		this.quantityBegin = quantityBegin;
	}
	public String getStartPrice() {
		return startPrice;
	}
	public void setStartPrice(String startPrice) {
		this.startPrice = startPrice;
	}
	public String getEndPrice() {
		return endPrice;
	}
	public List<ProductType> getProductTypeList() {
		return productTypeList;
	}
	public void setProductTypeList(List<ProductType> productTypeList) {
		this.productTypeList = productTypeList;
	}
	public void setEndPrice(String endPrice) {
		this.endPrice = endPrice;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public Product getProduct() {
		return product;
	}

	public void setProductInfo(Product product) {
		this.product = product;
	}

	public long getProductId() {
		return productId;
	}

	public void setProductId(long productId) {
		this.productId = productId;
	}

	
	/**
	 *  根据产品编码显示相关产品
	 * 2010-2-25
	 * @author yuwenqiang
	 * @return
	 * @throws Exception 
	 */
	public String displayProductAllProduct() throws Exception{
		url = "~/front/cate1";
		//+++立面历史信息
		if(oldfacade == null)
			oldfacade = "";
		else{
			oldfacade = URLDecoder.decode(oldfacade, "UTF-8");
			oldfacade = URLDecoder.decode(oldfacade, "UTF-8");
		}
		
		if(facade == null)
			facade = "";
		else {
			facade = URLDecoder.decode(facade, "UTF-8");
			facade = URLDecoder.decode(facade, "UTF-8");
		}
		
		String[] temp = facade.split("::");
		
		
		//如果立面类型包含同一种类，就返回原查询立面
		if(temp.length > 1 && oldfacade.indexOf(temp[0]+"::") == -1)
			facade = oldfacade + facade;
		
		oldfacade = new String(facade);
		
		ProductNavigatorService.getProductNavigator(url, type, facade, null);
		
		if(type == null){
			ProductTypeIf ptif = ProductNavigatorService.getNaviType(AsnConstLib.NavigatorLevel0);
			ptif.init(url, type, new String[]{});
			WebContext.getRequest().setAttribute("typen", AsnConstLib.NavigatorLevel0);
		}
		else if(type.split("-").length == Integer.parseInt(AsnConstLib.NavigatorLevel1)){
			ProductTypeIf ptif = ProductNavigatorService.getNaviType(AsnConstLib.NavigatorLevel1);
			ptif.init(url, type, new String[]{});
			WebContext.getRequest().setAttribute("typen", AsnConstLib.NavigatorLevel1);
		}
		else if(type.split("-").length == Integer.parseInt(AsnConstLib.NavigatorLevel2)){
			ProductTypeIf ptif = ProductNavigatorService.getNaviType(AsnConstLib.NavigatorLevel2);
			ptif.init(url, type, new String[]{});
			WebContext.getRequest().setAttribute("typen", AsnConstLib.NavigatorLevel2);
		}
		// add by hooxin
		else if(type.split("-").length == Integer.parseInt(AsnConstLib.NavigatorLevel3)){
			ProductTypeIf ptif = ProductNavigatorService.getNaviType(AsnConstLib.NavigatorLevel3);
			String[] para = null;
			if(oldfacade==null || oldfacade.equals(""))
				para = new String[]{};
			else
				para = new String[] {"oldfacade="+oldfacade};
			ptif.init(url, type, para);
			WebContext.getRequest().setAttribute("typen", AsnConstLib.NavigatorLevel3);
		}
		else if(facade != null){
			ProductTypeIf ptif = ProductNavigatorService.getNaviType(AsnConstLib.NavigatorLevel3);
			String[] para = null;
			if(oldfacade==null || oldfacade.equals(""))
				para = new String[]{};
			else
				para = new String[] {"oldfacade="+oldfacade};
			ptif.init(url, type, para);
			WebContext.getRequest().setAttribute("typen", AsnConstLib.NavigatorLevel3);
		}
		//~~~~~
		//+++ add by hooxin
		if(facade != null){
			facade = URLDecoder.decode(facade, "UTF-8");
			facade = URLDecoder.decode(facade, "UTF-8");
		}
		//facade 数组
		String facadeA[] = null;
		if(facade != null && facade.equals("") != true){
			facadeA = new String[facade.split("##").length];
			for(int i=0; i< facade.split("##").length; i++)
				facadeA[i] = facade.split("##")[i]+"##";
		}
		
	   	int count = DisplayProductService.getCount(facadeA,type,startPrice,endPrice,quantityBegin,postTime,areaCode,searchkey);
//	   	page.setCurPage(pages);
//	   	page.setPageSize(pagesize);
//	   	page.setTotalRow(count);
//	   	page.setFormid(0);
//	   	pageBar = page.getToolsMenu();
	   	
	   	PageCreator pc=new PageCreator();
	   	HttpServletRequest request=(HttpServletRequest)ActionContext.getContext().get(StrutsStatics.HTTP_REQUEST);
	   	String pageBox=request.getParameter("pageBox");
		if(pageBox!=null&&!pageBox.trim().equals("")){
			page=Integer.parseInt(pageBox);
		}
		pc.setCurrentPage(page);
		pc.setTotalRow(count);
		pageBar0=pc.getPageBar();
		
		//pageBar=pc.getPageBar();
		int startCount=(page-1)*pc.getPageSize()+1;
		int endCount=page*pc.getPageSize();	
	   	
	   	//+++添加立面查询支持 by hooxin
	   	list =DisplayProductService.findProductByCode(startCount,endCount,facadeA,
	   			type,startPrice,endPrice,quantityBegin,postTime,priceOrder,areaCode,searchkey);
	   	
	   	productSupplies=DisplayProductService.getHotProduct();
	   	
	   	if(list==null){
	   		flag="N";
	   	}
	    productTypeList=ProductTypeService.getFirstProductType();
	    //+++ 添加广告栏
	    guanggaoConfList = SystemConfigService.getSystemConfigByGroup("广告");
		return SUCCESS;
	}
	
	
	
	/**
	 * 
	 */
	public String searchProduct() throws Exception{
		//ProductNavigatorService.getProductNavigator("~/front/cate1", "001-001", "", null);		
		
		url = "~/front/mall/product/searchProduct-1";
		//add by hooxin 用户参数
		String userPara = "";

		if(template != null && template.trim().length() > 0)
			userPara += "template="+template+"&";
		if(areaCode != null && areaCode.trim().length() > 0)
			userPara += "areaCode="+areaCode+"&";
		if(userPara.length() > 0)
			userPara = userPara.substring(0,userPara.length()-1);
		
		if(type !=null && type.equals("")){
			type = null;
		}
		//+++立面历史信息
		if(oldfacade == null)
			oldfacade = "";
		else{
			oldfacade = URLDecoder.decode(oldfacade, "UTF-8");
			oldfacade = URLDecoder.decode(oldfacade, "UTF-8");
		}
		
		if(facade == null)
			facade = "";
		else {
			facade = URLDecoder.decode(facade, "UTF-8");
			facade = URLDecoder.decode(facade, "UTF-8");
		}
		
		String[] temp = facade.split("::");
		
		
		//如果立面类型包含同一种类，就返回原查询立面
		if(temp.length > 1 && oldfacade.indexOf(temp[0]+"::") == -1)
			facade = oldfacade + facade;
		
		oldfacade = new String(facade);
		
		ProductNavigatorService.getProductNavigator(url, type, facade, userPara);
		
		if(type == null){
			ProductTypeIf ptif = ProductNavigatorService.getNaviType(AsnConstLib.NavigatorLevel0_only1);
			ptif.init(url, type, userPara.split("&"));
			WebContext.getRequest().setAttribute("typen", AsnConstLib.NavigatorLevel0_only1);
		}
		else if(type.split("-").length == Integer.parseInt(AsnConstLib.NavigatorLevel1)){
			ProductTypeIf ptif = ProductNavigatorService.getNaviType(AsnConstLib.NavigatorLevel1);
			ptif.init(url, type, userPara.split("&"));
			WebContext.getRequest().setAttribute("typen", AsnConstLib.NavigatorLevel1);
		}
		else if(type.split("-").length == Integer.parseInt(AsnConstLib.NavigatorLevel2)){
			ProductTypeIf ptif = ProductNavigatorService.getNaviType(AsnConstLib.NavigatorLevel2);
			ptif.init(url, type, userPara.split("&"));
			WebContext.getRequest().setAttribute("typen", AsnConstLib.NavigatorLevel2);
		}
		// add by hooxin
		else if(type.split("-").length == Integer.parseInt(AsnConstLib.NavigatorLevel3)){
			ProductTypeIf ptif = ProductNavigatorService.getNaviType(AsnConstLib.NavigatorLevel3);
			String[] para = null;
			
//###			if(oldfacade==null || oldfacade.equals(""))
//				para = new String[]{};
//			else
//				para = new String[] {"oldfacade="+oldfacade};
		
			if(oldfacade != null && !oldfacade.equals(""))
				userPara += "&oldfacade="+oldfacade;
			ptif.init(url, type, userPara.split("&"));
			WebContext.getRequest().setAttribute("typen", AsnConstLib.NavigatorLevel3);
		}
		else if(facade != null){
			ProductTypeIf ptif = ProductNavigatorService.getNaviType(AsnConstLib.NavigatorLevel3);
			String[] para = null;
//			if(oldfacade==null || oldfacade.equals(""))
//				para = new String[]{};
//			else
//				para = new String[] {"oldfacade="+oldfacade};
//			ptif.init(url, type, para);
			if(oldfacade != null && !oldfacade.equals(""))
				userPara += "&oldfacade="+oldfacade;
			ptif.init(url, type, userPara.split("&"));
			WebContext.getRequest().setAttribute("typen", AsnConstLib.NavigatorLevel3);
		}
		//~~~~~
		//+++ add by hooxin
		if(facade != null){
			facade = URLDecoder.decode(facade, "UTF-8");
			facade = URLDecoder.decode(facade, "UTF-8");
		}
		//facade 数组
		String facadeA[] = null;
		if(facade != null && facade.equals("") != true){
			facadeA = new String[facade.split("##").length];
			for(int i=0; i< facade.split("##").length; i++)
				facadeA[i] = facade.split("##")[i]+"##";
		}
		
		
	   	int count = DisplayProductService.getCount(new String[0],type,startPrice,endPrice,quantityBegin,postTime,areaCode,searchkey);
//	   	page.setCurPage(pages);
//	   	page.setPageSize(pagesize);
//	   	page.setTotalRow(count);
//	   	page.setFormid(0);
//	   	pageBar = page.getToolsMenu();
	   	
	   	PageCreator pc=new PageCreator();
	   	pc.setPageSize(pageSize);
	   	HttpServletRequest request=(HttpServletRequest)ActionContext.getContext().get(StrutsStatics.HTTP_REQUEST);
	   	String pageBox=request.getParameter("pageBox");
		if(pageBox!=null&&!pageBox.trim().equals("")){
			page=Integer.parseInt(pageBox);
		}
		pc.setCurrentPage(page);
		pc.setTotalRow(count);
		pageBar0=pc.getPageBar();
		
		
		//pageBar=pc.getPageBar();
		int startCount=(page-1)*pc.getPageSize()+1;
		int endCount=page*pc.getPageSize();	
	   	//+++添加立面查询支持 by hooxin
	   	list =DisplayProductService.findProductByCode(startCount,endCount,new String[0],
	   			type,startPrice,endPrice,quantityBegin,postTime,priceOrder,areaCode,searchkey);
	   	
	   	productSupplies=DisplayProductService.getHotProduct();
	   	
	   	if(list==null){
	   		flag="N";
	   	}
	    productTypeList=ProductTypeService.getFirstProductType();
	    
	    
	    specialProduct = SpecialProductService.getSpecialProductList("","tuijian","",1,	3,null,areaCode);// 推荐产品
	    hotProduct = DisplayProductService.getFrontHotProduct(null, 1, 10,areaCode); // 热卖产品
	    
	    request.getSession().setAttribute("productCount", count);
		return SUCCESS;
	}
	
	/**
	 * 显示具体某个产品的详细信息
	 * 2010-2-25
	 * @author yuwenqiang
	 * @return
	 * @throws Exception 
	 */
	public String displayDetailProductInfo() throws Exception{
		product=DisplayProductService.findProductInfo(productId);
		
		dalivery = DeliveryService.getDelivery(new Long(productId).intValue());
		
		//产品的销售数量
		//product.setSaleCount(10);
		product.setSaleCount(OrderDao.getSoldCount(productId));
		//产品的预订数量
		product.setReservedCount(OrderDao.getPredeterCount(productId));
		//+++ 添加图片前缀 by hooxin
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
					ProductService.addPdtClick(productId);
			
			/////////////
			otherTypeProduct=DisplayProductService.findOtherProByType(product.getProductType(), productId);
			
			supOtherProduct=DisplayProductService.queryOtherProBySupp(product.getSupplierId(), productId);
			//显示供应商评价
			supplier = SupplierService.getSupplier(product.getSupplierId());
			
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	    return SUCCESS;
	}
	
	
	/***
	 * 前台热卖产品
	 * 2010-3-25
	 * @author yuwenqiang
	 * @return
	 */
	public String findFrontHotProduct(){
		hotProduct=DisplayProductService.getFrontHotProduct(null,1,10);
		return SUCCESS;
	}
	public void setOldfacade(String oldfacade) {
		this.oldfacade = oldfacade;
	}
	public String getOldfacade() {
		return oldfacade;
	}
	
	
	public String findFrontNewProduct() throws Exception{
		newProduct=DisplayProductService.getFrontNewProduct(1,5);
		return SUCCESS;
	}
	

	/**
	 * @author 刘军伟 liujunwei.cq@163.com
	 * @description 秀山首页定制显示茶叶、猕猴桃、家禽产品
	 * @return
	 * @throws Exception
	 */
	public String findFrontProductForXs() throws Exception
	{
		//区域areaCode,分类productType
		//this.searchType;
		//System.out.println("----1");
		if("0004-0014-0027".equalsIgnoreCase(this.searchType))
			newProduct=DisplayProductService.getFrontNewProducty(this.areaCode, this.searchType, 1, 5);
		else
			newProduct=DisplayProductService.getFrontNewProduct(this.areaCode, this.searchType, 1, 5);
		//System.out.println("----2"+newProduct);
		
		return SUCCESS;
	}
	
}
