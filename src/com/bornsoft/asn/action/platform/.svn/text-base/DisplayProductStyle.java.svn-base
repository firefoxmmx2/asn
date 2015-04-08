/**
 * 
 */
package com.bornsoft.asn.action.platform;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.product.SpecialProduct;
import com.bornsoft.asn.service.order.OrderService;
import com.bornsoft.asn.service.product.ProductService;
import com.bornsoft.asn.service.product.SpecialProductService;
import com.bornsoft.asn.service.supplier.SupplierService;

/**
 * @author liujunwei (liujunwei.cq@163.com)
 * company:重庆市博恩软件公司 
 *    duty:project manager
 *    name:刘军伟
 *    time:2010-9-19
 */
public class DisplayProductStyle extends BaseAction
{

	private List<SpecialProduct> specialProduct; //推荐
	private List<SpecialProduct> specialPriceProduct; //特价
	
	
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

	public String displaySpecialProduct()throws Exception
	{
		specialProduct = SpecialProductService.getSpecialProductList("", "tuijian", "", 1, 10,null);//推荐产品
		
		return SUCCESS;
	}
	
	public String displaySpecialPriceProduct()throws Exception
	{
		specialPriceProduct = SpecialProductService.getSpecialProductList("", "tejia", "", 1, 12,null);//特价产品
		
		return SUCCESS;
	}
	
	/***
	 * 公共的产品展示嵌入显示
	 * **/
	public String displayProduct() throws Exception{
		String type = this.request("displayType");
		String startCount = this.request("startCount");
		String endCount = this.request("endCount");
		if(type == null || type == ""){
			type = "tuijian";
		}
		if(startCount == null || startCount == ""){
			startCount = "1";
		}
		if(endCount == null || endCount == ""){
			endCount = "10";
		}
		
		specialProduct = SpecialProductService.getSpecialProductList("", type, "", 
				Integer.parseInt(startCount), Integer.parseInt(endCount),null);//特价产品
		
		return SUCCESS;
	}
	
	
}
