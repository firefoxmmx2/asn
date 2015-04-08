package com.bornsoft.asn.bean.product;

import java.io.Serializable;
import java.util.Date;

public class ProductSupply implements Serializable {
	private Integer productId;
	private Integer supplierId;
	private String supplyTitle;
	private String productName;
	private String productStatus;
	private String smallPicPath;
	private String bigPicPath;
	private String productType;
	private String webOrder;
	private Double price;
	private String priceUnit;
	private String startOrder;
	private String startOrderUnit;
	private String maxSupply;
	private String maxSupplyUnit;
	private String productDetail;
	private String wholeSaleDetail;//批发说明
	private String transportDetail;//运费说明
	private String tradeType;//交易方式
	private String infoValidity;//信息有效期
	private Date productStartDate;//产品发布日期
	private Date productModifyDate;//产品修改日期
	private Date productEndDate;//产品过期日期，下架
	private String ipAddress;
	private String facade;//立面
	
	///非数据库映射字段////
//	private String area; 
//	private Byte customerType;
//	private String supName;
	
//	public String getSupName() {
//		return supName;
//	}
//
//	public void setSupName(String supName) {
//		this.supName = supName;
//	}
//
//	public Byte getCustomerType() {
//		return customerType;
//	}
//
//	public void setCustomerType(Byte customerType) {
//		this.customerType = customerType;
//	}
//
//	public String getArea() {
//		return area;
//	}
//
//	public void setArea(String area) {
//		this.area = area;
//	}

	public ProductSupply() {
		super();
	}

	public ProductSupply(Integer productId, Integer supplierId,
			String supplyTitle, String productName, String productStatus,
			String smallPicPath, String bigPicPath, String productType,
			String webOrder, Double price, String priceUnit, String startOrder,
			String startOrderUnit, String maxSupply, String maxSupplyUnit,
			String productDetail, String wholeSaleDetail,
			String transportDetail, String tradeType, String infoValidity,
			Date productStartDate, Date productModifyDate, Date productEndDate,
			String ipAddress, String facade) {
		super();
		this.productId = productId;
		this.supplierId = supplierId;
		this.supplyTitle = supplyTitle;
		this.productName = productName;
		this.productStatus = productStatus;
		this.smallPicPath = smallPicPath;
		this.bigPicPath = bigPicPath;
		this.productType = productType;
		this.webOrder = webOrder;
		this.price = price;
		this.priceUnit = priceUnit;
		this.startOrder = startOrder;
		this.startOrderUnit = startOrderUnit;
		this.maxSupply = maxSupply;
		this.maxSupplyUnit = maxSupplyUnit;
		this.productDetail = productDetail;
		this.wholeSaleDetail = wholeSaleDetail;
		this.transportDetail = transportDetail;
		this.tradeType = tradeType;
		this.infoValidity = infoValidity;
		this.productStartDate = productStartDate;
		this.productModifyDate = productModifyDate;
		this.productEndDate = productEndDate;
		this.ipAddress = ipAddress;
		this.facade = facade;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Integer getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
	}

	public String getSupplyTitle() {
		return supplyTitle;
	}

	public void setSupplyTitle(String supplyTitle) {
		this.supplyTitle = supplyTitle;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}

	public String getSmallPicPath() {
		return smallPicPath;
	}

	public void setSmallPicPath(String smallPicPath) {
		this.smallPicPath = smallPicPath;
	}

	public String getBigPicPath() {
		return bigPicPath;
	}

	public void setBigPicPath(String bigPicPath) {
		this.bigPicPath = bigPicPath;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getWebOrder() {
		return webOrder;
	}

	public void setWebOrder(String webOrder) {
		this.webOrder = webOrder;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getPriceUnit() {
		return priceUnit;
	}

	public void setPriceUnit(String priceUnit) {
		this.priceUnit = priceUnit;
	}

	public String getStartOrder() {
		return startOrder;
	}

	public void setStartOrder(String startOrder) {
		this.startOrder = startOrder;
	}

	public String getStartOrderUnit() {
		return startOrderUnit;
	}

	public void setStartOrderUnit(String startOrderUnit) {
		this.startOrderUnit = startOrderUnit;
	}

	public String getMaxSupply() {
		return maxSupply;
	}

	public void setMaxSupply(String maxSupply) {
		this.maxSupply = maxSupply;
	}

	public String getMaxSupplyUnit() {
		return maxSupplyUnit;
	}

	public void setMaxSupplyUnit(String maxSupplyUnit) {
		this.maxSupplyUnit = maxSupplyUnit;
	}

	public String getProductDetail() {
		return productDetail;
	}

	public void setProductDetail(String productDetail) {
		this.productDetail = productDetail;
	}

	public String getWholeSaleDetail() {
		return wholeSaleDetail;
	}

	public void setWholeSaleDetail(String wholeSaleDetail) {
		this.wholeSaleDetail = wholeSaleDetail;
	}

	public String getTransportDetail() {
		return transportDetail;
	}

	public void setTransportDetail(String transportDetail) {
		this.transportDetail = transportDetail;
	}

	public String getTradeType() {
		return tradeType;
	}

	public void setTradeType(String tradeType) {
		this.tradeType = tradeType;
	}

	public String getInfoValidity() {
		return infoValidity;
	}

	public void setInfoValidity(String infoValidity) {
		this.infoValidity = infoValidity;
	}

	public Date getProductStartDate() {
		return productStartDate;
	}

	public void setProductStartDate(Date productStartDate) {
		this.productStartDate = productStartDate;
	}

	public Date getProductModifyDate() {
		return productModifyDate;
	}

	public void setProductModifyDate(Date productModifyDate) {
		this.productModifyDate = productModifyDate;
	}

	public Date getProductEndDate() {
		return productEndDate;
	}

	public void setProductEndDate(Date productEndDate) {
		this.productEndDate = productEndDate;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public String getFacade() {
		return facade;
	}

	public void setFacade(String facade) {
		this.facade = facade;
	}

	
	
}
