/**
 * 
 */
package com.bornsoft.asn.action.channel;

import java.util.List;

import org.apache.log4j.Logger;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.product.Product;
import com.bornsoft.asn.bean.product.SpecialProduct;
import com.bornsoft.asn.service.product.DisplayProductService;
import com.bornsoft.asn.service.product.ProductService;
import com.bornsoft.asn.service.product.SpecialProductService;

/**
 * @author liujunwei (liujunwei.cq@163.com)
 * company:重庆市博恩软件公司 
 *    duty:project manager
 *    name:刘军伟
 *    time:2010-9-24
 * @description 金吉果首页数据集合处理
 */
public class JjgAction extends BaseAction
{

	//最新上架鲜果
	private List<Product> newFruit;
	
	//原装进口鲜果
	private List<Product> importFruit;
	
	//国产精选鲜果
	private List<Product> originalFruit;
	
	//推荐商品
	private List<SpecialProduct> recommendFruit;

	//鲜果礼盒
	private List<Product> boxFruit;
	
	//水果礼篮
	private List<Product> basketFruit;

	public List<Product> getNewFruit() {
		return newFruit;
	}

	public void setNewFruit(List<Product> newFruit) {
		this.newFruit = newFruit;
	}

	public List<Product> getImportFruit() {
		return importFruit;
	}

	public void setImportFruit(List<Product> importFruit) {
		this.importFruit = importFruit;
	}

	public List<Product> getOriginalFruit() {
		return originalFruit;
	}

	public void setOriginalFruit(List<Product> originalFruit) {
		this.originalFruit = originalFruit;
	}

	public List<SpecialProduct> getRecommendFruit() {
		return recommendFruit;
	}

	public void setRecommendFruit(List<SpecialProduct> recommendFruit) {
		this.recommendFruit = recommendFruit;
	}

	public List<Product> getBoxFruit() {
		return boxFruit;
	}

	public void setBoxFruit(List<Product> boxFruit) {
		this.boxFruit = boxFruit;
	}

	public List<Product> getBasketFruit() {
		return basketFruit;
	}

	public void setBasketFruit(List<Product> basketFruit) {
		this.basketFruit = basketFruit;
	}
	
	
	//########
	
	
	/**
	 * @description 金吉果首页 最新上架产品
	 * @return
	 * @throws Exception
	 */
	public String newFruit()throws Exception{
		newFruit=ProductService.getAllProductList(7, null,"on", null, null, null, "pass", 1, 10,null);
		return SUCCESS;
	}
	
	/**
	 * @description 金吉果首页 进口水果
	 * @return
	 * @throws Exception
	 */
	public String importFruit()throws Exception{
		importFruit=ProductService.getAllProductList(7, null, "on", null, null, null, "pass", 1, 10, "0011-0001");
		return SUCCESS;
	}
	
	/**
	 * @description 金吉果首页 国产精品水果
	 * @return
	 * @throws Exception
	 */
	public String originalFruit()throws Exception{
		originalFruit=ProductService.getAllProductList(7, null, "on", null, null, null, "pass", 1, 10, "0011-0002");
		return SUCCESS;
	}
	
	/**
	 * @description 金吉果首页 推荐水果
	 * @return
	 * @throws Exception
	 */
	public String recommendFruit()throws Exception{
		recommendFruit=SpecialProductService.getSpecialProductList(null, "tuijian", null, 1, 5, 7+"");
		return SUCCESS;
	}
	
	/**
	 * @description 金吉果菜单 进口水果
	 * @return
	 * @throws Exception
	 */
	public String importMenuFruit()throws Exception{
		importFruit=ProductService.getAllProductList(7, null, "on", null, null, null, "pass", 1, 10, "0011-0001");
		return SUCCESS;
	}
	
	/**
	 * @description 金吉果菜单 国产水果
	 * @return
	 * @throws Exception
	 */
	public String originalMenuFruit()throws Exception{
		originalFruit=ProductService.getAllProductList(7, null, "on", null, null, null, "pass", 1, 15, "0011-0002");
		return SUCCESS;
	}
	
	/**
	 * @description 金吉果菜单 水果礼盒
	 * @return
	 * @throws Exception
	 */
	public String boxMenuFruit()throws Exception{
		boxFruit=ProductService.getAllProductList(7, null, "on", null, null, null, "pass", 1, 10, "0011-0003");
		return SUCCESS;
	}
	
	/**
	 * @description 金吉果菜单 水果礼篮
	 * @return
	 * @throws Exception
	 */
	public String basketMenuFruit()throws Exception{
		basketFruit=ProductService.getAllProductList(7, null, "on", null, null, null, "pass", 1, 15, "0011-0004");
		return SUCCESS;
	} 

}
