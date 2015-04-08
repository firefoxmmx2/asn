package com.bornsoft.asn.action.productType;

import java.util.List;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.productType.ProductType;
import com.bornsoft.asn.service.productType.ProductTypeService;
import com.bornsoft.asn.utils.json.Json;

public class ProductTypeAction extends BaseAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8017312731442595431L;
	
	private List<ProductType> firstType;
	public List<ProductType> getFirstType() {
		return firstType;
	}

	public void setFirstType(List<ProductType> firstType) {
		this.firstType = firstType;
	}


	private List<ProductType> secondType;
	private List<ProductType> thridType;
	
	public List<ProductType> getSecondType() {
		return secondType;
	}

	public void setSecondType(List<ProductType> secondType) {
		this.secondType = secondType;
	}

	public List<ProductType> getThridType() {
		return thridType;
	}

	public void setThridType(List<ProductType> thridType) {
		this.thridType = thridType;
	}

	public String getAllType() throws Exception{
		firstType = ProductTypeService.getFirstProductType();
		secondType = ProductTypeService.getSecondProductType();
		thridType = ProductTypeService.getThirdProductType();
		return "success";
	}
	public String productType() throws Exception{
		firstType = ProductTypeService.getFirstProductType();
		
		return SUCCESS;
	}
	
	public String getSonType() throws Exception{
		firstType = ProductTypeService.getFirstProductType();
		secondType = ProductTypeService.getSecondProductType();
		thridType = ProductTypeService.getThirdProductType();
		
		Object[] supArray = {firstType,secondType,thridType}; 
		
		print(Json.getString(supArray, "class"));
		return null;
	}
	
	public String getThirdType() throws Exception{
		thridType = ProductTypeService.getThirdProductType();
		print(Json.getString(thridType, "class"));
		return null;
	}

}
