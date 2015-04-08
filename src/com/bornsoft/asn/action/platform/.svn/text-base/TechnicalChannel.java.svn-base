/**
 * 
 */
package com.bornsoft.asn.action.platform;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.information.PurchaseInfo;
import com.bornsoft.asn.bean.information.SupplyInfo;
import com.bornsoft.asn.bean.product.Product;
import com.bornsoft.asn.bean.quotation.QuotationInfo;
import com.bornsoft.asn.service.information.InfoService;
import com.bornsoft.asn.service.product.DisplayProductService;
import com.bornsoft.asn.service.product.ProductService;
import com.bornsoft.asn.service.productType.ProductTypeService;
import com.bornsoft.asn.service.quotation.QuotationService;
import com.bornsoft.asn.service.supplier.SupplierService;
import com.bornsoft.asn.utils.common.AsnConstLib;

/**
 * @author liujunwei (liujunwei.cq@163.com)
 * company:重庆市博恩软件公司 
 *    duty:project manager
 *    name:刘军伟
 *    time:2010-9-8
 *  @description 专业社频道
 *  @URL /front/mall/technicalChannel.do
 */

@SuppressWarnings("serial")
public class TechnicalChannel extends BaseAction
{

	//分類
	private List<Map<String,Object>> ptype;
	private String ptypeUrl;
	//行情
	private List<QuotationInfo> quoList;
	//最近企業
	private List<Map<String,Object>> recentEnterprises;
	private List<SupplyInfo> listS;
	private List<PurchaseInfo> listP;
	private List<Product> listProduct;
	private List<Product> listHotProduct;
	private List<Product> listLianjia;
	public TechnicalChannel()
	{
		super();
		// TODO Auto-generated constructor stub
	}




	
	/**
	 * 专业社首页
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String zysHome() throws Exception{
		//分类
		ptype = ProductTypeService.getNewProductType(AsnConstLib.ZYS_PT);
		ptypeUrl = "/front/mall/product/searchProduct-1";
		//行情
		quoList = QuotationService.findQuotationwoStatList(0, 10,null ,null , null );
		//最近企業
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("startCount", 1);
		m.put("endCount", 12);
		
		recentEnterprises = SupplierService.searchSupplier(m);
		//產品相關
		getSupplyInfo();
		getPurchaseInfo();
		getProduct();
		getHotProduct();
		getLianjiaProduct();
		return SUCCESS;
	}
	
	private void getSupplyInfo()throws Exception{
		listS=InfoService.showSupplyInfoLi(1,11,"0001",null,null,null,null);
		for(SupplyInfo si:listS){
			String title=si.getTitle();
			if(title.length()>12){
				title=title.substring(0,12)+"...";
				si.setTitle(title);
			}
		}
	}

	private void getPurchaseInfo()throws Exception{
		listP=InfoService.showPurchaseInfoLi(1, 11, "0001",null,null,null,null);
		for(PurchaseInfo pi:listP){
			String title=pi.getTitle();
			if(title.length()>12){
				title=title.substring(0, 12)+"...";
				pi.setTitle(title);
			}
		}
	}
	private void getProduct()throws Exception{
		listProduct=ProductService.getProductListByType("0001", 1, 4);
		for(Product p:listProduct){
			if(p.getProductName().length()>11){
				p.setProductName(p.getProductName().substring(0, 11));
			}
		}
	}
	private void getHotProduct()throws Exception{
		listHotProduct=DisplayProductService.getFrontHotProduct("001", 1, 4);
		for(Product p:listHotProduct){
			if(p.getProductName().length()>11){
				p.setProductName(p.getProductName().substring(0, 11));
			}
		}
	}

	private void getLianjiaProduct()throws Exception{
		listLianjia=ProductService.getAllProductList(338, null, "on", null, null, null, "pass", 1, 12,null);
		for(Product p:listLianjia){
			if(p.getProductName().length()>11){
				p.setProductName(p.getProductName().substring(0, 11));
			}
		}
	}
	
	public List<Map<String,Object>> getPtype()
	{
		return ptype;
	}


	public List<QuotationInfo> getQuoList()
	{
		return quoList;
	}


	public void setPtype(List<Map<String,Object>> ptype)
	{
		this.ptype = ptype;
	}


	public void setQuoList(List<QuotationInfo> quoList)
	{
		this.quoList = quoList;
	}


	public List<SupplyInfo> getListS() {
		return listS;
	}


	public void setListS(List<SupplyInfo> listS) {
		this.listS = listS;
	}


	public List<PurchaseInfo> getListP() {
		return listP;
	}


	public void setListP(List<PurchaseInfo> listP) {
		this.listP = listP;
	}


	public List<Product> getListProduct() {
		return listProduct;
	}


	public void setListProduct(List<Product> listProduct) {
		this.listProduct = listProduct;
	}

	public List<Product> getListHotProduct() {
		return listHotProduct;
	}

	public void setListHotProduct(List<Product> listHotProduct) {
		this.listHotProduct = listHotProduct;
	}

	public List<Product> getListLianjia() {
		return listLianjia;
	}

	public void setListLianjia(List<Product> listLianjia) {
		this.listLianjia = listLianjia;
	}





	public String getPtypeUrl()
	{
		return ptypeUrl;
	}





	public void setPtypeUrl(String ptypeUrl)
	{
		this.ptypeUrl = ptypeUrl;
	}





	public List<Map<String,Object>> getRecentEnterprises()
	{
		return recentEnterprises;
	}





	public void setRecentEnterprises(List<Map<String,Object>> recentEnterprises)
	{
		this.recentEnterprises = recentEnterprises;
	}
	
	
}
