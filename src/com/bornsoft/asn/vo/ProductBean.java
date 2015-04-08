package com.bornsoft.asn.vo;
import com.bornsoft.asn.bean.product.Product;
/**
 * 前台页面商品展示使用的属性信息
 * @author yuwenqiang
 * 2010-2-26
 */
public class ProductBean{

	private static final long serialVersionUID = 1L;
	/**公司名字*/
	private String supName;
	/**公司ID*/
	private String supId;
	/**产品*/
	private Product product;
	
	private String area; 
	private Byte customerType;
	
	private String productUnit = "";	//liujunwei 2010-10-23 added
	private Double marketPrice;	//liujunwei 2011-01-08 added

	
	/**
	 * @return the productUnit
	 */
	public String getProductUnit()
	{
		return productUnit;
	}
	/**
	 * @param productUnit the productUnit to set
	 */
	public void setProductUnit(String productUnit)
	{
		this.productUnit = productUnit;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public Byte getCustomerType() {
		return customerType;
	}
	public void setCustomerType(Byte customerType) {
		this.customerType = customerType;
	}
	public String getSupName() {
		return supName;
	}
	public void setSupName(String supName) {
		this.supName = supName;
	}
	public String getSupId() {
		return supId;
	}
	public void setSupId(String supId) {
		this.supId = supId;
	}
	/**
	 * @return the marketPrice
	 */
	public Double getMarketPrice()
	{
		return marketPrice;
	}
	/**
	 * @param marketPrice the marketPrice to set
	 */
	public void setMarketPrice(Double marketPrice)
	{
		this.marketPrice = marketPrice;
	}

}

