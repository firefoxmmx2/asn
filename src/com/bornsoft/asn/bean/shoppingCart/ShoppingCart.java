package com.bornsoft.asn.bean.shoppingCart;

import java.io.Serializable;
import java.util.Date;

/**
 * 购物车POJO
 * @author yuwenqiang
 * 2010-2-22
 */
public class ShoppingCart implements Serializable{
	
	private static final long serialVersionUID = 1L;
	/**主键ID*/
	private long id;
	/**产品ID*/
	private long productId;
	/**产品名称*/
	private String productName;
	/**产品单价*/
    private float price;
    /**产品数量*/
    private int count;
    /**总的产品价格*/
    private float totalPrice;
	/**是否删除*/
	private String isdelete;
	/**放入购物车时间*/
	private Date putInDate;
	/**会员ID*/
	private long memberId;
	/**产品是否成交*/
	private String isbargain;  //购物车中的商品产生了订单
	/**产品供应商的ID*/
	private String supplierId;


	//	/**会员等级*/
//	private String memberRank;  //留来做扩张使用
//	/**会员优惠价格*/
//	private BigDecimal favorablePrice;
//	
//	public BigDecimal getFavorablePrice() {
//		return favorablePrice;
//	}
//	public void setFavorablePrice(BigDecimal favorablePrice) {
//		this.favorablePrice = favorablePrice;
//	}
//	public String getMemberRank() {
//	return memberRank;
//}
//  public void setMemberRank(String memberRank) {
//	this.memberRank = memberRank;
//}
	 
	public long getMemberId() {
		return memberId;
	}
	public void setMemberId(long memberId) {
		this.memberId = memberId;
	}
	
	public Date getPutInDate() {
		return putInDate;
	}
	public void setPutInDate(Date putInDate) {
		this.putInDate = putInDate;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getProductId() {
		return productId;
	}
	public void setProductId(long productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public float getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getIsdelete() {
		return isdelete;
	}
	public void setIsdelete(String isdelete) {
		this.isdelete = isdelete;
	}
	public String getIsbargain() {
		return isbargain;
	}
	public void setIsbargain(String isbargain) {
		this.isbargain = isbargain;
	}
	
	public String getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}


}

