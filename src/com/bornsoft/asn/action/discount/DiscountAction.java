package com.bornsoft.asn.action.discount;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.discount.Discount;
import com.bornsoft.asn.bean.discount.Discount2product;
import com.bornsoft.asn.bean.discount.DiscountBean;
import com.bornsoft.asn.bean.product.Product;
import com.bornsoft.asn.service.discount.DiscountService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.service.product.ProductService;
import com.bornsoft.asn.utils.common.PageTool;

public class DiscountAction extends BaseAction {	
	private static final long serialVersionUID = 1L;
	
	private Discount discount;
	private DiscountBean discountbean;
	private int page=1;
    private int pageSize=10 ;
    private String pageBar ;
    private List<Product> listProduct;    
    private Discount2product d2product;
    private String activityId;
	private String productId;
	private String productedId;	
	private String supplierId;
	private List list;
	
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public String getActivityId() {
		return activityId;
	}
	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductedId() {
		return productedId;
	}
	public void setProductedId(String productedId) {
		this.productedId = productedId;
	}
	public String getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}
	
	public Discount2product getD2product() {
		return d2product;
	}

	public void setD2product(Discount2product d2product) {
		this.d2product = d2product;
	}

	public List<Product> getListProduct() {
		return listProduct;
	}

	public void setListProduct(List<Product> listProduct) {
		this.listProduct = listProduct;
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

	public DiscountBean getDiscountbean() {
		return discountbean;
	}

	public void setDiscountbean(DiscountBean discountbean) {
		this.discountbean = discountbean;
	}

	public Discount getDiscount() {
		return discount;
	}

	public void setDiscount(Discount discount) {
		this.discount = discount;
	}

	/**
	 * @author chenl
	 * @date 2010-04-07
	 * @discription 查询所有活动
	 * */
	public String listDiscount() throws Exception{
		String pageType = this.request("pageType"); //如果是查询按钮的提交，就把页数值为初始值
//		String supplierActivity = this.request("supplierActivity");  //供应商查看参数
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
		if(discountbean != null){
			if(discountbean.getDiscountName().length() >0){
				para.put("discountName", discountbean.getDiscountName());
			}
			if(discountbean.getBeginDate().length() >0){
				para.put("beginTime", discountbean.getBeginDate());
			}
			if(discountbean.getEndDate().length() >0){
				para.put("endTime", discountbean.getEndDate());
			}
		}
		
//		if(supplierActivity != null){ //供应查看，只能看到活动正在和还没有开始的
			SimpleDateFormat dateformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String getDate =  dateformat.format(new Date());
			para.put("getDate",getDate);
			this.request("getDate", getDate);
//		}
		
		int count = DiscountService.getDiscountCount(para).intValue();
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	
	   	List<Discount> list=DiscountService.listDiscount(para);
		this.request("discountList", list);
//		if(supplierActivity != null){
//			this.request("supplierActivity", supplierActivity);
//			return "supplierActivity";
//		}
		return SUCCESS;
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-07
	 * @discription 查询所有活动
	 * */
	public String listAdminDiscount() throws Exception{
		String pageType = this.request("pageType"); //如果是查询按钮的提交，就把页数值为初始值
//		String supplierActivity = this.request("supplierActivity");  //供应商查看参数
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
		if(discountbean != null){
			if(discountbean.getDiscountName().length() >0){
				para.put("discountName", discountbean.getDiscountName());
			}
			if(discountbean.getBeginDate().length() >0){
				para.put("beginTime", discountbean.getBeginDate());
			}
			if(discountbean.getEndDate().length() >0){
				para.put("endTime", discountbean.getEndDate());
			}
		}
		
//		if(supplierActivity != null){ //供应查看，只能看到活动正在和还没有开始的
//			SimpleDateFormat dateformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//			String getDate =  dateformat.format(new Date());
//			para.put("getDate",getDate);
//			this.request("getDate", getDate);
//		}
		
		int count = DiscountService.getDiscountCount(para).intValue();
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	
	   	List<Discount> list=DiscountService.listDiscount(para);
		this.request("discountList", list);
//		if(supplierActivity != null){
//			this.request("supplierActivity", supplierActivity);
//			return "supplierActivity";
//		}
		return SUCCESS;
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-07
	 * @discription 新增活动
	 * */
	public String insertAdminDiscount() throws Exception{
		String begintime = discountbean.getBeginDate().replace(".", "-") +" "+discountbean.getBeginTime()+":00";
		String endtime = discountbean.getEndDate().replace(".", "-")+" "+discountbean.getEndTime()+":00";
		discount = new Discount();
		discount.setActivityId(discountbean.getActivityId());
		discount.setDiscountName(discountbean.getDiscountName());
		discount.setBeginTime(Timestamp.valueOf(begintime));
		discount.setEndTime(Timestamp.valueOf(endtime));
		discount.setDiscountType(discountbean.getDiscountType());
		
		DiscountService.insertDiscount(discount);
		this.request("discount_msg","新增成功");
		return SUCCESS;
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-08
	 * @discription 删除
	 * */
	public String delAdminDiscount() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String discountIdset = request.getParameter("discountIdset"); 
		String[] arrayDiscount = discountIdset.split(",");
		
		for(int i=0; i<arrayDiscount.length;i++){
			DiscountService.delDiscount(new Long(arrayDiscount[i]));
		}
		return SUCCESS;
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-08
	 * @discription 初始化修改
	 * */
	public String toUpdateAdminDiscount()throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String activityId = request.getParameter("activityId");
		discount = DiscountService.getDiscountById(new Long(activityId));
		
		return SUCCESS;
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-08
	 * @discription 修改
	 * */
	public String updateAdminDiscount()throws Exception{
		String begintime = discountbean.getBeginDate().replace(".", "-") +" "+discountbean.getBeginTime()+":00";
		String endtime = discountbean.getEndDate().replace(".", "-")+" "+discountbean.getEndTime()+":00";
		discount = new Discount();
		discount.setActivityId(discountbean.getActivityId());
		discount.setDiscountName(discountbean.getDiscountName());
		discount.setBeginTime(Timestamp.valueOf(begintime));
		discount.setEndTime(Timestamp.valueOf(endtime));
		discount.setDiscountType(discountbean.getDiscountType());
		
		DiscountService.updateDiscount(discount);
		this.request("discount_msg", "修改成功");
		return SUCCESS;
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-09
	 * @discription 初始化参与活动
	 * */
	public String toJoinDiscount() throws Exception{
		String activityId = this.request("activityId");
		long supplierId =  MemberService.getMember().getMemberId();
		Map<String, Object> m=new HashMap<String, Object>();
		m.put("activityId", activityId);
		m.put("supplierId", supplierId);
		list = DiscountService.getExistProduct(m);
		discount = DiscountService.getDiscountById(new Long(activityId));
		
		listProduct = ProductService.getProductListChenL(MemberService.getMember().getMemberId().intValue());
		for(int i=0;i<list.size();i++){
			Map<String, Object> m2=new HashMap<String, Object>();
			m2 = (Map)list.get(i);
			for(int j =0;j<listProduct.size();j++){
				Product product = listProduct.get(j); 
				if(m2.get("productId").toString().trim().equals(product.getProductId().toString().trim())){
					listProduct.remove(j);
				}
			}
		}
		
		return SUCCESS;
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-09
	 * @discription 新增参与活动
	 * */
	public String joinDiscount()throws Exception{
		String type = this.request("type");
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("supplierId", MemberService.getMember().getMemberId());
		m.put("activityId", this.getActivityId());		
		DiscountService.delselfDiscount(m);//删除该折扣活动所有产品
		
		if(this.getProductedId() != null){  //先删除，后插入已经参与的产品
			d2product = new Discount2product();
			d2product.setActivityId(new Integer(this.getActivityId()));
			d2product.setSupplierId(MemberService.getMember().getMemberId().intValue());
			String[] arrayproduct = this.getProductedId().split(",");
			for(int i = 0; i < arrayproduct.length; i++){
				d2product.setProductId(Integer.parseInt(arrayproduct[i].trim()));
				DiscountService.insertD2product(d2product);
			}
		}
		if(this.getProductId() != null){  //插入新参与的产品
			d2product = new Discount2product();
			d2product.setActivityId(new Integer(this.getActivityId()));
			d2product.setSupplierId(MemberService.getMember().getMemberId().intValue());
			String[] arrayproduct = this.getProductId().split(",");
			for(int i = 0; i < arrayproduct.length; i++){
				d2product.setProductId(Integer.parseInt(arrayproduct[i].trim()));
				DiscountService.insertD2product(d2product);
			}
		}		
		if(type == null) type = "success";
		if(type.equals("all")){
			return "all";
		}else if(type.equals("self")){
			return "self";
		}
		return type;
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-09
	 * @discription 查询自己参与的活动
	 * */
	public String listSelfDiscount()throws Exception{
		String pageType = this.request("pageType"); //如果是查询按钮的提交，就把页数值为初始值
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
		para.put("supplierId", MemberService.getMember().getMemberId());
		if(discountbean != null){
			if(discountbean.getDiscountName().length() >0){
				para.put("discountName", discountbean.getDiscountName());
			}
			if(discountbean.getBeginDate().length() >0){
				para.put("beginTime", discountbean.getBeginDate());
			}
			if(discountbean.getEndDate().length() >0){
				para.put("endTime", discountbean.getEndDate());
			}
		}
		int count = DiscountService.getSelfActivityCount(para).intValue();
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
		list = DiscountService.getSelfActivity(para);
		return SUCCESS;
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-13
	 * @discription 删除自己参与的活动
	 * */
	public String delselfDiscount()throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String discountIdset = request.getParameter("discountIdset"); 
		String[] arrayDiscount = discountIdset.split(",");
		
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("supplierId", MemberService.getMember().getMemberId());
		
		for(int i=0; i<arrayDiscount.length;i++){
			m.put("activityId", arrayDiscount[i]);
			DiscountService.delselfDiscount(m);
		}
		return SUCCESS;
	}
	
	/**
	 * @author chenl
	 * @date 2010-04-13
	 * @discription 查看供应商参与活动信息
	 * */
	public String listAdminSupplierJoinInfo()throws Exception{
		String pageType = this.request("pageType"); //如果是查询按钮的提交，就把页数值为初始值
		String activityId = this.request("activityId");
		if(pageType != null){
			page = 1;
			pageSize = 10;
		}		
		
		discount = DiscountService.getDiscountById(new Long(activityId));
		
		PageTool pageTool=new PageTool();
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;
		Map<String, Object> para=new HashMap<String, Object>();
		para.put("activityId",activityId);
		para.put("startCount", startCount);
		para.put("endCount", endCount);
		para.put("supplierId", MemberService.getMember().getMemberId());
		if(discountbean != null){
			if(discountbean.getDiscountName().length() >0){
				para.put("supplierName", discountbean.getDiscountName());
			}
//			if(discountbean.getBeginDate().length() >0){
//				para.put("beginTime", discountbean.getBeginDate());
//			}
//			if(discountbean.getEndDate().length() >0){
//				para.put("endTime", discountbean.getEndDate());
//			}
		}
		int count = DiscountService.getJoinSupplierCount(para).intValue();
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	
		list = DiscountService.checkjoinSupplier(para);
		return SUCCESS;
	}
	
}
