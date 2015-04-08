package com.bornsoft.asn.action.supplier;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.bank.BankInfo;
import com.bornsoft.asn.bean.common.MessagePage;
import com.bornsoft.asn.bean.license.License;
import com.bornsoft.asn.bean.license.LicenseBean;
import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.bean.product.Product;
import com.bornsoft.asn.bean.product.SpecialProduct;
import com.bornsoft.asn.bean.productType.ProductType;
import com.bornsoft.asn.bean.supplier.Supplier;
import com.bornsoft.asn.dao.supplier.SupplierDao;
import com.bornsoft.asn.service.bank.BankInfoService;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.license.LicenseService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.service.product.DisplayProductService;
import com.bornsoft.asn.service.product.ProductService;
import com.bornsoft.asn.service.product.SpecialProductService;
import com.bornsoft.asn.service.productType.ProductTypeService;
import com.bornsoft.asn.service.supplier.SupplierService;
import com.bornsoft.asn.utils.common.AsnConstLib;
import com.bornsoft.asn.utils.common.PageCreator;
import com.bornsoft.asn.utils.common.PageTool;
import com.bornsoft.asn.utils.common.AsnConstLib.SupplierApproveState;
import com.bornsoft.asn.utils.common.AsnConstLib.SupplierRunState;
import com.bornsoft.asn.utils.common.AsnConstLib.VouchState;
import com.bornsoft.asn.utils.json.Json;

public class SupplierAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	
	private Supplier supplier;
	private BankInfo bankinfo;
	private List<LicenseBean> licensebean;
	private List<License> querylist;	//证件查询结果
	private List searchlist; //供应商查询结果	
	private List nearlist;//查询最近加入的供应商

	private List<Product> productSupply;   //供应商供应产品
	private Member member;
	
	private int page=1;
    private int pageSize=10 ;
    private String pageBar ;
	    
    private String supplierkey;
    private String voucherkey;
    private String area;

	private List<ProductType> secondType;
    private List<ProductType> firstType;
    private String productType;
	
    private String template = "";
    
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

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public List<ProductType> getSecondType() {
		return secondType;
	}

	public void setSecondType(List<ProductType> secondType) {
		this.secondType = secondType;
	}

	public List<ProductType> getFirstType() {
		return firstType;
	}

	public void setFirstType(List<ProductType> firstType) {
		this.firstType = firstType;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}
	
	public List getNearlist() {
		return nearlist;
	}

	public void setNearlist(List nearlist) {
		this.nearlist = nearlist;
	}

	public int getPage() {
		return page;
	}
	
	public String getSupplierkey() {
		return supplierkey;
	}

	public void setSupplierkey(String supplierkey) {
		this.supplierkey = supplierkey;
	}

	public String getVoucherkey() {
		return voucherkey;
	}
	public void setVoucherkey(String voucherkey) {
		this.voucherkey = voucherkey;
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
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public List<Product> getProductSupply() {
		return productSupply;
	}
	public void setProductSupply(List<Product> productSupply) {
		this.productSupply = productSupply;
	}

	private String suppliertype;
	private String searchkey;
	
	public String getSuppliertype() {
		return suppliertype;
	}
	public void setSuppliertype(String suppliertype) {
		this.suppliertype = suppliertype;
	}
	public String getSearchkey() {
		return searchkey;
	}
	public void setSearchkey(String searchkey) {
		this.searchkey = searchkey;
	}
	public List getSearchlist() {
		return searchlist;
	}
	public void setSearchlist(List searchlist) {
		this.searchlist = searchlist;
	}
	public List<LicenseBean> getLicensebean() {
		return licensebean;
	}
	public void setLicensebean(List<LicenseBean> licensebean) {
		this.licensebean = licensebean;
	}
	public List<License> getQuerylist() {
		return querylist;
	}
	public void setQuerylist(List<License> querylist) {
		this.querylist = querylist;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Supplier getSupplier() {
		return supplier;
	}
	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}
	public BankInfo getBankinfo() {
		return bankinfo;
	}
	public void setBankinfo(BankInfo bankinfo) {
		this.bankinfo = bankinfo;
	}
	
	public String supplierOpen() throws Exception {		
		String supplierType = String.valueOf(MemberService.getMember().getMemberType()); //获取供应商类型
		String strforward = "";
		if(supplierType.equals("1")){
				strforward = "guarantee";
		}else if(supplierType.equals("2")){
				strforward = "personal";
		}
		return strforward;		
	}
	
	/*****
	 * @author cl
	 * @discription 修改供应商信息
	 * @date 2010-03-08
	 * ***/
	public String updateSupplier() throws Exception {	

		String supplierType = String.valueOf(MemberService.getMember().getMemberType()); //获取供应商类型
		String strforward = "";
		
		firstType = ProductTypeService.getFirstProductType();
		secondType = ProductTypeService.getSecondProductType();	

		supplier = SupplierService.getSupplier(MemberService.getMemberId());
		
		//如果尚无开通供应商服务，新增供应商记录
		if(supplier == null){  
			supplier=new Supplier();
			supplier.setSupplierId(""+MemberService.getMemberId());
			supplier.setVoucherId("0");
			supplier.setVouchState(VouchState.None);
			supplier.setRunState(SupplierRunState.Opening);
			supplier.setApproveState(SupplierApproveState.None);
			//如果尚无银行记录，创建
			bankinfo = BankInfoService.getBankInfoById(MemberService.getMemberId());
			if(bankinfo==null){
				bankinfo=new BankInfo();
				bankinfo.setBankInfoid(""+IdMakerService.newId("bankinfoid"));
				bankinfo.setMemberid(supplier.getSupplierId());
			}
			if(supplierType.equals("1")){
				enrollGuarantee(); // 添加供应商及其银行信息
			}else if(supplierType.equals("2")){
				enrollPersonal();  // 添加供应商及其银行信息
			}
			supplier = SupplierService.getSupplier(MemberService.getMemberId());
		}
		bankinfo = BankInfoService.getBankInfoById(MemberService.getMemberId());
		
		if(supplierType.equals("1")){
				strforward = "updguarantee";
		}else if(supplierType.equals("2")){
				strforward = "updpersonal";
		}
		querylist = LicenseService.getLicenseById(MemberService.getMemberId());
		
		return strforward;		
	}
	
	/*****
	 * @author cl
	 * @discription 商务开通供应商信息——————个人
	 * @date 2010-03-04 
	 * ***/
	public String enrollPersonal() throws Exception{
		supplier.setSupplierId(String.valueOf(MemberService.getMember().getMemberId()));//supplier ID与member ID相同
		supplier.setSupplierType(String.valueOf(MemberService.getMember().getMemberType())); //供应商类型
		if(supplier.getVoucherId() != null){
			supplier.setVouchState(VouchState.None);
		}
		bankinfo.setMemberid(String.valueOf(MemberService.getMember().getMemberId()));
		
		SupplierService.insertSupplierInfo(supplier,bankinfo); //添加供应商基本信息		
		return SUCCESS;
	}
	
	/*****
	 * @author cl
	 * @discription 商务开通供应商信息——————机构
	 * @date 2010-03-04 
	 * ***/
	public String enrollGuarantee() throws Exception{
		supplier.setSupplierId(String.valueOf(MemberService.getMember().getMemberId()));//supplier ID与member ID相同
		//supplier.setApproveState(SupplierApproveState.ManualVerify);
		supplier.setSupplierType(String.valueOf(MemberService.getMember().getMemberType())); //供应商类型
		
		bankinfo.setMemberid(String.valueOf(MemberService.getMember().getMemberId()));
		
		SupplierService.insertSupplierInfo(supplier, bankinfo, licensebean);
		return SUCCESS;
	}
	
	/*****
	 * @author cl
	 * @discription 修改供应商信息——————机构
	 * @date 2010-03-04 
	 * ***/
	public String updateGuarantee() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		supplier.setSupplierId(String.valueOf(MemberService.getMember().getMemberId()));//supplier ID与member ID相同
		supplier.setSupplierType(String.valueOf(MemberService.getMember().getMemberType())); //供应商类型
		supplier.setApproveState(SupplierApproveState.ManualVerify);//状态
		SupplierDao.checkSupplier(supplier);  // 保存状态
		
		supplier.setVoucherId("0"); //单位供应商的担保默认为 0 update于2010-04-28
		
		bankinfo.setMemberid(String.valueOf(MemberService.getMember().getMemberId()));
		
		SupplierService.updateSupplier(supplier, bankinfo, licensebean);
		
		MessagePage mp=new MessagePage(AsnConstLib.MessageType.Error, "信息已修改成功！")
		.addLink("再次修改", "updateSupplier", "_self", 0);
		request.setAttribute("messagePage", mp);
		return "back-message";
	}
	/*****
	 * @author cl
	 * @discription 修改供应商信息——————个人
	 * @date 2010-03-04 
	 * ***/
	public String updatePersonal() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		supplier.setSupplierType(String.valueOf(MemberService.getMember().getMemberType())); //供应商类型
		SupplierService.updateSupplier(supplier, bankinfo);  // 保存信息

		supplier.setApproveState(SupplierApproveState.ManualVerify);
		SupplierDao.checkSupplier(supplier);  // 保存状态

		MessagePage mp=new MessagePage(AsnConstLib.MessageType.Error, "信息已修改成功！")
		.addLink("再次修改", "updateSupplier", "_self", 0);
		request.setAttribute("messagePage", mp);
		return "back-message";
	}
	
	/*****
	 * @author cl
	 * @discription 删除证件信息
	 * @date 2010-03-11
	 * ***/
	public String delLicense() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String strlicenseid = request.getParameter("licenseid");
		
		if(strlicenseid != null){
			LicenseService.delLicenseById(new Long(strlicenseid));
		}		
		return SUCCESS;
	}
	
	/*****
	 * @author cl
	 * @discription 查询供应商列表
	 * @date 2010-03-18
	 * ***/
	public String listSupplier()throws Exception{
		String pageType = request("pageType");   //如果是查询按钮的提交，就把页数值为初始值
		String approveState = request("approveState");//从管理员后台首页过来的参数
		if(approveState != null){
			supplier = new Supplier();
			supplier.setApproveState(SupplierApproveState.ManualVerify);
		}
		if(pageType != null){
			page = 1; pageSize = 10;
		}		
		PageTool pageTool=new PageTool();
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;
		Map<String, Object> para=new HashMap<String, Object>();
		para.put("startCount", startCount);
		para.put("endCount", endCount);
		if(supplier != null){
			if(supplier.getApproveState() != null){
				para.put("approveState", supplier.getApproveState());
			}
			if(supplier.getSupplierType() != null){
				para.put("supplierType", supplier.getSupplierType());
			}
			if(supplier.getRunState() != null){
				para.put("runState", supplier.getRunState());
			}
		}
		if(member != null){
			if(member.getFullName() != null){
				para.put("fullName", member.getFullName().trim());
			}						
		}
		
		
		long count = SupplierService.getSupplierCount(para);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow((int)count);
	   	pageBar = pageTool.getPageBar();
	   	
		this.searchlist = SupplierService.listSupplier(para);
		return SUCCESS;
	}
	
	
	
	/*****
	 * @author cl
	 * @discription 前台-查询供应商-列表信息
	 * @date 2010-03-11
	 * ***/
	public String searchSupplier() throws Exception{
		//String areaCode = this.request("areaCode");
		String areaCode = this.request("area");			//2010-10-19 liujunwei fixed传入参数区域秀山
		secondType = ProductTypeService.getSecondProductType();	
		
		if(searchkey ==null){
			searchkey = "";
		}
		if(suppliertype == null){
			suppliertype = "";
		}		
		if(productType == null || productType.equals("-1")){
			productType = "";
		}
		/*******查询最近加入的供应商*********/
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("startCount", 1);
		m.put("endCount", 10);
		if(areaCode != null && areaCode.length() >=6 && !areaCode.substring(2, 6).equals("0000")){
			this.setArea(areaCode);
			m.put("area", areaCode);
		}
		nearlist = SupplierService.searchSupplier(m);
		/*******查询最近加入的供应商*********/
		
//		searchkey = new String(searchkey.getBytes("iso8859-1"),"utf-8");
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("suppliertype", suppliertype);
		map.put("searchkey", searchkey.trim());
		map.put("productType",productType);
		if(area != null && area.length() >3){
			if(area.substring(2,6).equals("0000")){
				map.put("area", area.substring(0,3));
			}else{
				map.put("area", area);
			}
		}
		PageCreator pc=new PageCreator();
		pc.setCurrentPage(page);
		pc.setTotalRow((int)SupplierService.searchSupplierCount(map));
		
		pageBar=pc.getPageBar();
		int startCount=(page-1)*pc.getPageSize()+1;
		int endCount=page*pc.getPageSize();		
		map.put("startCount", startCount);
		map.put("endCount", endCount);
		
		searchlist = SupplierService.searchSupplier(map);
		
		//热卖产品
		productSupply = DisplayProductService.getFrontHotProduct(null,1,10,areaCode); 
		
		return SUCCESS;
	}
	
	/*****
	 * @author cl
	 * @discription 前台-查询供应商 -详细信息
	 * @date 2010-03-11
	 * ***/
	public String searchSupplierInfo() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String supplierid = request.getParameter("supplierid");
		if(supplierid != null){
			this.member = MemberService.getMember(new Long(supplierid));
			this.supplier = SupplierService.getSupplier(new Long(supplierid));
			this.bankinfo = BankInfoService.getBankInfoById(new Long(supplierid));
			this.querylist = LicenseService.getLicenseById(new Long(supplierid));
			this.productSupply = ProductService.getProductListBySupplierId(new Integer(supplierid));
		}
		
		return SUCCESS;
	}
	
	 
	/**
	 * @author liujunwei
	 * @description 企业首页信息处理
	 * @return
	 * @throws Exception
	 */
	public String supplierShopSy() throws Exception{

		HttpServletRequest request = ServletActionContext.getRequest();
		String supplierid = request.getParameter("supplierid");
		if(supplierid != null&&supplierid.trim().length()>0&&Long.parseLong(supplierid)>0){
			this.member = MemberService.getMember(new Long(supplierid));
			this.supplier = SupplierService.getSupplier(new Long(supplierid));
			this.bankinfo = BankInfoService.getBankInfoById(new Long(supplierid));
			this.querylist = LicenseService.getLicenseById(new Long(supplierid));
			this.productSupply = ProductService.getProductListBySupplierId(new Integer(supplierid));
		}
		specialProduct = SpecialProductService.getSpecialProductList("", "tuijian", "", 1, 5,null);//推荐产品
		
		return SUCCESS;
	}
	private List<SpecialProduct> specialProduct; //推荐
	/**
	 * @return the specialProduct
	 */
	public List<SpecialProduct> getSpecialProduct()
	{
		return specialProduct;
	}

	/**
	 * @param specialProduct the specialProduct to set
	 */
	public void setSpecialProduct(List<SpecialProduct> specialProduct)
	{
		this.specialProduct = specialProduct;
	}

	/**
	 * @return the specialPriceProduct
	 */
	public List<SpecialProduct> getSpecialPriceProduct()
	{
		return specialPriceProduct;
	}

	/**
	 * @param specialPriceProduct the specialPriceProduct to set
	 */
	public void setSpecialPriceProduct(List<SpecialProduct> specialPriceProduct)
	{
		this.specialPriceProduct = specialPriceProduct;
	}

	private List<SpecialProduct> specialPriceProduct; //特价
	
	 
	/**
	 * @author liujunwei
	 * @description 企业简介信息处理
	 * @return
	 * @throws Exception
	 */
	public String supplierShopGsjj() throws Exception{

		HttpServletRequest request = ServletActionContext.getRequest();
		String supplierid = request.getParameter("supplierid");
		if(supplierid != null&&supplierid.trim().length()>0&&Long.parseLong(supplierid)>0){
			this.member = MemberService.getMember(new Long(supplierid));
			this.supplier = SupplierService.getSupplier(new Long(supplierid));
			this.bankinfo = BankInfoService.getBankInfoById(new Long(supplierid));
			this.querylist = LicenseService.getLicenseById(new Long(supplierid));
			this.productSupply = ProductService.getProductListBySupplierId(new Integer(supplierid));
		}
		
		return SUCCESS;
	}
	 
	/**
	 * @author liujunwei
	 * @description 企业供应产品信息处理
	 * @return
	 * @throws Exception
	 */
	public String supplierShopGycp() throws Exception{

		HttpServletRequest request = ServletActionContext.getRequest();
		String supplierid = request.getParameter("supplierid");
		if(supplierid != null&&supplierid.trim().length()>0&&Long.parseLong(supplierid)>0){
			this.member = MemberService.getMember(new Long(supplierid));
			this.supplier = SupplierService.getSupplier(new Long(supplierid));
			this.bankinfo = BankInfoService.getBankInfoById(new Long(supplierid));
			this.querylist = LicenseService.getLicenseById(new Long(supplierid));
			this.productSupply = ProductService.getProductListBySupplierId(new Integer(supplierid));
		}
		
		return SUCCESS;
	}
	 
	/**
	 * @author liujunwei
	 * @description 企业联系方式信息处理
	 * @return
	 * @throws Exception
	 */
	public String supplierShopLxfs() throws Exception{

		HttpServletRequest request = ServletActionContext.getRequest();
		String supplierid = request.getParameter("supplierid");
		if(supplierid != null&&supplierid.trim().length()>0&&Long.parseLong(supplierid)>0){
			this.member = MemberService.getMember(new Long(supplierid));
			this.supplier = SupplierService.getSupplier(new Long(supplierid));
			this.bankinfo = BankInfoService.getBankInfoById(new Long(supplierid));
			this.querylist = LicenseService.getLicenseById(new Long(supplierid));
			this.productSupply = ProductService.getProductListBySupplierId(new Integer(supplierid));
		}
		
		return SUCCESS;
	}
	 
	/**
	 * @author liujunwei
	 * @description 企业动态信息处理
	 * @return
	 * @throws Exception
	 */
	public String supplierShopQydt() throws Exception{
		
		HttpServletRequest request = ServletActionContext.getRequest();
		String supplierid = request.getParameter("supplierid");
		if(supplierid != null&&supplierid.trim().length()>0&&Long.parseLong(supplierid)>0){
			this.member = MemberService.getMember(new Long(supplierid));
			this.supplier = SupplierService.getSupplier(new Long(supplierid));
			this.bankinfo = BankInfoService.getBankInfoById(new Long(supplierid));
			this.querylist = LicenseService.getLicenseById(new Long(supplierid));
			this.productSupply = ProductService.getProductListBySupplierId(new Integer(supplierid));
		}
		
		return SUCCESS;
	}
	 
	/**
	 * @author liujunwei
	 * @description 企业人才招聘信息处理
	 * @return
	 * @throws Exception
	 */
	public String supplierShopRczp() throws Exception{

		//从职位表中获取数据
		HttpServletRequest request = ServletActionContext.getRequest();
		String supplierid = request.getParameter("supplierid");
		if(supplierid != null&&supplierid.trim().length()>0&&Long.parseLong(supplierid)>0){
			this.member = MemberService.getMember(new Long(supplierid));
			this.supplier = SupplierService.getSupplier(new Long(supplierid));
//			this.bankinfo = BankInfoService.getBankInfoById(new Long(supplierid));
//			this.querylist = LicenseService.getLicenseById(new Long(supplierid));
//			this.productSupply = ProductService.getProductListBySupplierId(new Integer(supplierid));
		}
		
		return SUCCESS;
	}
	
	/**
	 * @author liujunwei
	 * @description 企业资质荣誉信息处理
	 * @return
	 * @throws Exception
	 */
	public String supplierShopZzry() throws Exception{

		HttpServletRequest request = ServletActionContext.getRequest();
		String supplierid = request.getParameter("supplierid");
		if(supplierid != null&&supplierid.trim().length()>0&&Long.parseLong(supplierid)>0){
			this.member = MemberService.getMember(new Long(supplierid));
			this.supplier = SupplierService.getSupplier(new Long(supplierid));
			this.bankinfo = BankInfoService.getBankInfoById(new Long(supplierid));
			this.querylist = LicenseService.getLicenseById(new Long(supplierid));
			this.productSupply = ProductService.getProductListBySupplierId(new Integer(supplierid));
		}
		
		return SUCCESS;
	}
	
	
	/**
	 * @author cl
	 * @discription 管理员审核供应商信息
	 * @date 2010-03-18
	 * */
	public String adminCheckSupplier() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String supplierIdset = request.getParameter("supplierIdset");
		String checktype = request.getParameter("checktype");
		
		String[] supplierIdArray = supplierIdset.split(",");
		
		for (int i = 0; i < supplierIdArray.length; i++) {
//			supplier = new Supplier();
//			supplier.setSupplierId(supplierIdArray[i]);
//			if (checktype.equals("1")) {
//				supplier.setApproveState(SupplierApproveState.Completed);
//			} else if (checktype.equals("2")) {
//				supplier.setApproveState(SupplierApproveState.Rejected);
//			}
			SupplierService.checkSupplier(supplierIdArray[i],checktype);
		}
		
		return SUCCESS;
	}
	
	/**
	 * @author cl
	 * @discription 管理员删除供应商信息
	 * @date 2010-03-18
	 * */
	public String delSupplierInfo() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String supplierIdset = request.getParameter("supplierIdset");		
		String[] supplierIdArray = supplierIdset.split(",");
		
		for (int i = 0; i < supplierIdArray.length; i++) {
			SupplierService.deleteSupplierAllinfo(new Long(supplierIdArray[i]));
		}
		return SUCCESS;
	}
	
	/**
	 * @author cl
	 * @discription 企业供应商 ---查询自己担保的个人供应商
	 * @date 2010-03-26
	 * */
	public String listVoucher()throws Exception{
		Map<String, Object> para=new HashMap<String, Object>();
		
		PageTool pageTool=new PageTool();
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;
		
		para.put("startCount", startCount);
		para.put("endCount", endCount);		
		para.put("memberId",MemberService.getMember().getMemberId());
		
		long count = SupplierService.getVoucherCount(para);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow((int)count);
	   	pageBar = pageTool.getPageBar();
	   	
		searchlist = SupplierService.getVoucherByMemberId(para);
		return SUCCESS;
	}
	
	/**
	 * @author cl
	 * @discription 企业供应商 ---修改自己担保的个人供应商 ---状态
	 * @date 2010-03-29
	 * */
	public String updVouchState() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String vouch = request.getParameter("vouch");
		String supplierId = request.getParameter("supplierId");
		Map<String, Object> m = new HashMap<String, Object>();
		if(vouch.equals("agree")){
			m.put("vouchState",VouchState.Agree);
		}else if(vouch.equals("dis")){
			m.put("vouchState",VouchState.Disagree);
		}
		m.put("supplierId", supplierId);
		
		SupplierService.updateVouchState(m);
		
		return SUCCESS;
	}
	
	/**
	 * @author cl
	 * @discription 管理员---查询所有担保人供应商
	 * @date 2010-03-26
	 * */
	public String listAllVoucher()throws Exception{
		Map<String, Object> para=new HashMap<String, Object>();
		
		PageTool pageTool=new PageTool();
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;
		
		para.put("startCount", startCount);
		para.put("endCount", endCount);		
		para.put("memberId","");
		if(voucherkey != null){
			para.put("voucherkey", voucherkey);
		}
		if(supplierkey != null){
			para.put("supplierkey", supplierkey);
		}
		
		long count = SupplierService.getAllVoucherCount(para);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow((int)count);
	   	pageBar = pageTool.getPageBar();
	   	
		searchlist = SupplierService.getAllVoucher(para);
		return SUCCESS;
	}
	
	/**
	 * @author cl
	 * @discription 查询供应商详细信息
	 * @date 2010-04-01
	 * */
	public String getSupplierById() throws Exception{
		String id = request("id");
		member = MemberService.getMember(Long.parseLong(id));
		supplier = SupplierService.getSupplier(Long.parseLong(id));
		bankinfo = BankInfoService.getBankInfoById(Long.parseLong(id));
		querylist = LicenseService.getLicenseById(Long.parseLong(id));
		
		if(supplier.getSupplierType().equals("2")){
			Member member2 = MemberService.getMember(Long.parseLong(supplier.getVoucherId()));
			if(member2 != null)
			voucherkey = member2.getFullName();
		}
		//Object[] supArray = {supplier,bankinfo,querylist}; 		
		//print(Json.getString(supArray, "class"));
		return SUCCESS;
	}
	
	/**
	 * @author cl
	 * @discription 修改诚信承诺状态
	 * @date 2010-05-11
	 * */
	public String updPromiseState()throws Exception{
		String promisetype = this.request("promisetype");
		String supplierIdset = this.request("supplierIdset");
		
		String[] supplierIdArray = supplierIdset.split(",");
		
		for (int i = 0; i < supplierIdArray.length; i++) {
			SupplierService.updPromiseState(supplierIdArray[i],promisetype);
		}		
		
		return SUCCESS;
	}
	
	/**
	 * @author cl
	 * @discription 冻结和恢复供应商
	 * @date 2010-05-28
	 * */
	public String updSupplierLocked()throws Exception{
		String lock = this.request("lock");
		String supplierIdset = this.request("supplierIdset");
		
		String[] arrySupplierID = supplierIdset.split(",");
		for(int i = 0; i < arrySupplierID.length; i++){
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("supplierId", arrySupplierID[i]);
			m.put("lockState", lock);
			SupplierService.updLockState(m);
		}
		
		return SUCCESS;
	}

}
