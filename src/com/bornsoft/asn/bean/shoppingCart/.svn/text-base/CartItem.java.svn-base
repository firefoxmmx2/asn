/**
 * 
 */
package com.bornsoft.asn.bean.shoppingCart;

import java.io.Serializable;

/**
 * Cart item
 * @author Ken Liu Kunyun
 *
 */
public class CartItem implements Serializable {
	private Long productId;  	// 商品编号(*)
	private Long supplierId;  	// 供应商编号(*)
	private Integer quantity;  	// 数量(*)
	private String name;		// 商品名称
	private String image;		// 图片路径
	private Double price;	// 价格
	private Double priceOriginal;	// 原有价格
	private String supplierName;	// 供应商名称
	private String unit;		// 计价单位
	private Integer postType;    // 运费说明 cl 2010-07-20 add
	
	

	public CartItem(Long productId, Long supplierId, Integer quantity){
		this.productId=productId;
		this.supplierId=supplierId;
		this.quantity=quantity;
	}

	/**
	 * 克隆本项目
	 */
	public CartItem clone(){
		return new CartItem(productId, supplierId, quantity);
	}
	
	public Long getProductId() {
		return productId;
	}
	public void setProductId(Long productId) {
		this.productId = productId;
	}
	public Long getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(Long supplierId) {
		this.supplierId = supplierId;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public Double getPriceOriginal() {
		return priceOriginal;
	}

	public void setPriceOriginal(Double priceOriginal) {
		this.priceOriginal = priceOriginal;
	}
	
	public Integer getPostType() {
		return postType;
	}

	public void setPostType(Integer postType) {
		this.postType = postType;
	}
	
	
}
