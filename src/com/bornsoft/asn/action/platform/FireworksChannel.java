package com.bornsoft.asn.action.platform;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.information.PurchaseInfo;
import com.bornsoft.asn.bean.information.SupplyInfo;
import com.bornsoft.asn.bean.order.Order;
import com.bornsoft.asn.bean.order.OrderItem;
import com.bornsoft.asn.bean.product.Product;
import com.bornsoft.asn.bean.quotation.QuotationInfo;
import com.bornsoft.asn.service.information.InfoService;
import com.bornsoft.asn.service.order.OrderService;
import com.bornsoft.asn.service.product.ProductService;
import com.bornsoft.asn.service.quotation.QuotationService;
import com.bornsoft.asn.service.supplier.SupplierService;

/**
 * @author liujunwei (liujunwei.cq@163.com)
 * company:重庆市博恩软件公司 
 *    duty:project manager
 *    name:刘军伟
 *    time:2010-9-8
 * @description 烟花爆竹频道
 * @URL /front/mall/fireworksChannel.do
 */

public class FireworksChannel extends BaseAction
{

	/**
	 * long
	 * field-description:
	 */
	private static final long serialVersionUID = 1L;
    private List<SupplyInfo> listS1;
    private List<SupplyInfo> listS2;
    private List<SupplyInfo> listS3;
    private List<PurchaseInfo> listP1;
    private List<PurchaseInfo> listP2;
    private List<PurchaseInfo> listP3;
    private List<Product> listProduct;
    private List<Order> listOrder=new ArrayList<Order>();
    private List<OrderItem> listItem=new ArrayList<OrderItem>();
	//分類
    private List<Map<String,Object>> ptype;
    private String ptypeUrl;
	//行情
    private List<QuotationInfo> quoList;
    //最近企業
    private List<Map<String,Object>> recentEnterprises;
    
	public List<SupplyInfo> getListS1() {
		return listS1;
	}

	public void setListS1(List<SupplyInfo> listS1) {
		this.listS1 = listS1;
	}

	public List<SupplyInfo> getListS2() {
		return listS2;
	}

	public void setListS2(List<SupplyInfo> listS2) {
		this.listS2 = listS2;
	}

	public List<SupplyInfo> getListS3() {
		return listS3;
	}

	public void setListS3(List<SupplyInfo> listS3) {
		this.listS3 = listS3;
	}

	public List<PurchaseInfo> getListP1() {
		return listP1;
	}

	public void setListP1(List<PurchaseInfo> listP1) {
		this.listP1 = listP1;
	}

	public List<PurchaseInfo> getListP2() {
		return listP2;
	}

	public void setListP2(List<PurchaseInfo> listP2) {
		this.listP2 = listP2;
	}

	public List<PurchaseInfo> getListP3() {
		return listP3;
	}

	public void setListP3(List<PurchaseInfo> listP3) {
		this.listP3 = listP3;
	}

	public List<Product> getListProduct() {
		return listProduct;
	}

	public void setListProduct(List<Product> listProduct) {
		this.listProduct = listProduct;
	}

	public List<Order> getListOrder() {
		return listOrder;
	}

	public void setListOrder(List<Order> listOrder) {
		this.listOrder = listOrder;
	}

	public List<OrderItem> getListItem() {
		return listItem;
	}

	public void setListItem(List<OrderItem> listItem) {
		this.listItem = listItem;
	}

	@SuppressWarnings("unchecked")
	public String yhbzHome()throws Exception{
		//產品
		getSupplyInfo();
		getPurchaseInfo();
		getProduct();
		getOrder();
		//行情
		quoList = QuotationService.findQuotationwoStatList(1, 10,null ,null , null );
		//最近企業
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("startCount", 1);
		m.put("endCount", 10);
		
		recentEnterprises = SupplierService.searchSupplier(m);
		
		return SUCCESS;
	}
	
	private void getSupplyInfo()throws Exception{
		listS1=InfoService.showSupplyInfoLi(1,7,"0006",null,null,null,null);
		for(SupplyInfo si:listS1){
			String title=si.getTitle();
			if(title.length()>16){
				title=title.substring(0,16)+"...";
				si.setTitle(title);
			}
		}
		listS2=InfoService.showSupplyInfoLi(8,14,"0006",null,null,null,null);
		for(SupplyInfo si:listS2){
			String title=si.getTitle();
			if(title.length()>16){
				title=title.substring(0,16)+"...";
				si.setTitle(title);
			}
		}
		listS3=InfoService.showSupplyInfoLi(15,21,"0006",null,null,null,null);
		for(SupplyInfo si:listS3){
			String title=si.getTitle();
			if(title.length()>16){
				title=title.substring(0,16)+"...";
				si.setTitle(title);
			}
		}
	}
	
	private void getPurchaseInfo()throws Exception{
		listP1=InfoService.showPurchaseInfoLi(1, 7, "0006",null,null,null,null);
		for(PurchaseInfo pi:listP1){
			String title=pi.getTitle();
			if(title.length()>16){
				title=title.substring(0, 16)+"...";
				pi.setTitle(title);
			}
		}
		listP2=InfoService.showPurchaseInfoLi(8, 14, "0006",null,null,null,null);
		for(PurchaseInfo pi:listP2){
			String title=pi.getTitle();
			if(title.length()>16){
				title=title.substring(0, 16)+"...";
				pi.setTitle(title);
			}
		}
		listP3=InfoService.showPurchaseInfoLi(15, 21, "0006",null,null,null,null);
		for(PurchaseInfo pi:listP3){
			String title=pi.getTitle();
			if(title.length()>16){
				title=title.substring(0, 16)+"...";
				pi.setTitle(title);
			}
		}
	}
	
	private void getProduct()throws Exception{
		listProduct=ProductService.getProductListByType("0006", 1, 10);
	}
	
	private void getOrder()throws Exception{
		List<Order> l=OrderService.getSucOrderList(null);		
		if(l.size()>7){
			listOrder.addAll(l.subList(0, 7));
		}else{
			listOrder.addAll(l);
		}

		for(Order o:listOrder){
			List<OrderItem> ll= OrderService.findOrderItemByOrderId(o.getId());
			for(OrderItem oi:ll){
				listItem.add(oi);
			}
		}
		if(listItem.size()>7){
			listItem.addAll(listItem.subList(0, 7));
		}
	}


	public List<Map<String,Object>> getPtype()
	{
		return ptype;
	}

	public String getPtypeUrl()
	{
		return ptypeUrl;
	}

	public void setPtype(List<Map<String,Object>> ptype)
	{
		this.ptype = ptype;
	}

	public void setPtypeUrl(String ptypeUrl)
	{
		this.ptypeUrl = ptypeUrl;
	}

	public List<QuotationInfo> getQuoList()
	{
		return quoList;
	}

	public void setQuoList(List<QuotationInfo> quoList)
	{
		this.quoList = quoList;
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
