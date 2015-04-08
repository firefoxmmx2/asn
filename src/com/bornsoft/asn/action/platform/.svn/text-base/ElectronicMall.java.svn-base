/**
 * 
 */
package com.bornsoft.asn.action.platform;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.order.Order;
import com.bornsoft.asn.bean.product.Product;
import com.bornsoft.asn.bean.product.SpecialProduct;
import com.bornsoft.asn.service.order.OrderService;
import com.bornsoft.asn.service.product.DisplayProductService;
import com.bornsoft.asn.service.product.ProductService;
import com.bornsoft.asn.service.product.SpecialProductService;
import com.bornsoft.asn.service.productType.ProductTypeService;
import com.bornsoft.asn.service.supplier.SupplierService;
import com.bornsoft.asn.utils.common.AsnConstLib;

/**
 * @author liujunwei (liujunwei.cq@163.com)
 *         company:重庆市博恩软件公司
 *         duty:project manager
 *         name:刘军伟
 *         time:2010-9-8
 * @description 电子商城首页
 * @URL /front/mall/electMall.do
 */
public class ElectronicMall extends BaseAction
{
	/** 首页热卖商品 */
	public List<Product>			hotProduct;
	public List<SpecialProduct>			newProduct; //新品
	private List<SpecialProduct>	specialProduct;		// 推荐
	private List<SpecialProduct>	specialPriceProduct;	// 特价
	private List<Order>				sucOrderInfo;
	private List					nearlist;				// 查询最近加入的供应商
	public List<Product>			viewProduct;

	public List<Product> getViewProduct()
	{
		return viewProduct;
	}

	public void setViewProduct(List<Product> viewProduct)
	{
		this.viewProduct = viewProduct;
	}

	public List getNearlist()
	{
		return nearlist;
	}

	public void setNearlist(List nearlist)
	{
		this.nearlist = nearlist;
	}

	public List<SpecialProduct> getSpecialPriceProduct()
	{
		return specialPriceProduct;
	}

	public
			void
			setSpecialPriceProduct(List<SpecialProduct> specialPriceProduct)
	{
		this.specialPriceProduct = specialPriceProduct;
	}

	public List<Order> getSucOrderInfo()
	{
		return sucOrderInfo;
	}

	public void setSucOrderInfo(List<Order> sucOrderInfo)
	{
		this.sucOrderInfo = sucOrderInfo;
	}

	public List<SpecialProduct> getSpecialProduct()
	{
		return specialProduct;
	}

	public void setSpecialProduct(List<SpecialProduct> specialProduct)
	{
		this.specialProduct = specialProduct;
	}

	public List<Product> getHotProduct()
	{
		return hotProduct;
	}

	public void setHotProduct(List<Product> hotProduct)
	{
		this.hotProduct = hotProduct;
	}

	public List<SpecialProduct> getNewProduct()
	{
		return newProduct;
	}

	public void setNewProduct(List<SpecialProduct> newProduct)
	{
		this.newProduct = newProduct;
	}

	/**
	 * long
	 * field-description:
	 */
	private static final long			serialVersionUID	= 1L;

	// 产品分类
	private List<Map<String,Object>>	ptype;
	private String						ptypeUrl;

	public String mallIndex() throws Exception
	{
		ptype = ProductTypeService.getNewProductType(AsnConstLib.HOME_PT);
		// 設置分類鏈接動作
		//ptypeUrl = "/front/cate1";
		ptypeUrl = "/front/mall/product/searchProduct-1";
		hotProduct = DisplayProductService.getFrontHotProduct(null, 1, 10); // 热卖产品
		newProduct = SpecialProductService.getSpecialProductList("","xinpin","",1,	8,null);//DisplayProductService.getFrontNewProduct(1, 8); // 新品上市
		specialProduct = SpecialProductService.getSpecialProductList("","tuijian","",1,	8,null);// 推荐产品
		specialPriceProduct = SpecialProductService.getSpecialProductList("","tejia","",1,12,null);// 特价产品
		sucOrderInfo = OrderService.getSucOrderList(null); // 最近交易订单

		/******* 查询最近加入的供应商 *********/
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("startCount", 1);
		m.put("endCount", 6);
		nearlist = SupplierService.searchSupplier(m);

		viewProduct = ProductService.getProductListOrderByView(1, 10);

		return SUCCESS;
	}

	public List<Map<String,Object>> getPtype()
	{
		return ptype;
	}

	public void setPtype(List<Map<String,Object>> ptype)
	{
		this.ptype = ptype;
	}

	public String getPtypeUrl()
	{
		return ptypeUrl;
	}

	public void setPtypeUrl(String ptypeUrl)
	{
		this.ptypeUrl = ptypeUrl;
	}

}
