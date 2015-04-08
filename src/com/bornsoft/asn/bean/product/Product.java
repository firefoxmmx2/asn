package com.bornsoft.asn.bean.product;

import java.io.Serializable;
import java.util.Date;

public class Product implements Serializable {
	private Integer productId;
	private Integer supplierId;
	private String productName;
	private String productNumber;//产品的供应商自编号
	private String productStatus;
	private String productUnit;
	private Double price1;
	private Double price2;
	private Double price3;
	private Integer price1Range;
	private Integer price2Range;
	private Integer price3Range;
	private String productType;
	private String smallPicPath;
	private String bigPicPath;
	private String smallPicPath1;
	private String bigPicPath1;
	private String smallPicPath2;
	private String bigPicPath2;
	private String smallPicPath3;
	private String bigPicPath3;
	private String webOrder;//是否支持网上订购
	private Integer startOrderCount;//起订量
	private Integer wareCount;//库存量
	private Integer reservedCount=0;//预订量
	private Integer saleCount=0;//销售量
	private String productDetail;
	private String wholesaleDetail;//批发说明
	private String transportDetail;//运费说明
	private String tradeType;//交易方式
	private Date productStartDate;//产品发布日期
	private Date productModifyDate;//产品修改日期
	private Date productEndDate;//产品删除日期
	private String ipAddress;
	private String facade;//立面
	private Date lastViewTime;//最近点击时间
	private Integer viewCount=0;//点击量
	private Integer censor;//审核状态
	private Integer postType;//运费支付方式，0：卖家承担，1：联系卖家，2：买家承担
	private Double marketPrice;
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product(Integer productId, Integer supplierId, String productName,
			String productNumber, String productStatus, String productUnit,
			Double price1, Double price2, Double price3, Integer price1Range,
			Integer price2Range, Integer price3Range, String productType,
			String smallPicPath, String bigPicPath, String smallPicPath1,
			String bigPicPath1, String smallPicPath2, String bigPicPath2,
			String smallPicPath3, String bigPicPath3, String webOrder,
			Integer startOrderCount, Integer wareCount, Integer reservedCount,
			Integer saleCount, String productDetail, String wholesaleDetail,
			String transportDetail, String tradeType, Date productStartDate,
			Date productModifyDate, Date productEndDate, String ipAddress,
			String facade, Date lastViewTime, Integer viewCount,
			Integer censor, Integer postType) {
		super();
		this.productId = productId;
		this.supplierId = supplierId;
		this.productName = productName;
		this.productNumber = productNumber;
		this.productStatus = productStatus;
		this.productUnit = productUnit;
		this.price1 = price1;
		this.price2 = price2;
		this.price3 = price3;
		this.price1Range = price1Range;
		this.price2Range = price2Range;
		this.price3Range = price3Range;
		this.productType = productType;
		this.smallPicPath = smallPicPath;
		this.bigPicPath = bigPicPath;
		this.smallPicPath1 = smallPicPath1;
		this.bigPicPath1 = bigPicPath1;
		this.smallPicPath2 = smallPicPath2;
		this.bigPicPath2 = bigPicPath2;
		this.smallPicPath3 = smallPicPath3;
		this.bigPicPath3 = bigPicPath3;
		this.webOrder = webOrder;
		this.startOrderCount = startOrderCount;
		this.wareCount = wareCount;
		this.reservedCount = reservedCount;
		this.saleCount = saleCount;
		this.productDetail = productDetail;
		this.wholesaleDetail = wholesaleDetail;
		this.transportDetail = transportDetail;
		this.tradeType = tradeType;
		this.productStartDate = productStartDate;
		this.productModifyDate = productModifyDate;
		this.productEndDate = productEndDate;
		this.ipAddress = ipAddress;
		this.facade = facade;
		this.lastViewTime = lastViewTime;
		this.viewCount = viewCount;
		this.censor = censor;
		this.postType = postType;
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
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductNumber() {
		return productNumber;
	}
	public void setProductNumber(String productNumber) {
		this.productNumber = productNumber;
	}
	public String getProductStatus() {
		return productStatus;
	}
	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}
	public String getProductUnit() {
		return productUnit;
	}
	public void setProductUnit(String productUnit) {
		this.productUnit = productUnit;
	}
	public Double getPrice1() {
		return price1;
	}
	public void setPrice1(Double price1) {
		this.price1 = price1;
	}
	public Double getPrice2() {
		return price2;
	}
	public void setPrice2(Double price2) {
		this.price2 = price2;
	}
	public Double getPrice3() {
		return price3;
	}
	public void setPrice3(Double price3) {
		this.price3 = price3;
	}
	public Integer getPrice1Range() {
		return price1Range;
	}
	public void setPrice1Range(Integer price1Range) {
		this.price1Range = price1Range;
	}
	public Integer getPrice2Range() {
		return price2Range;
	}
	public void setPrice2Range(Integer price2Range) {
		this.price2Range = price2Range;
	}
	public Integer getPrice3Range() {
		return price3Range;
	}
	public void setPrice3Range(Integer price3Range) {
		this.price3Range = price3Range;
	}
	public String getProductType() {
		return productType;
	}
	public void setProductType(String productType) {
		this.productType = productType;
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
	public String getSmallPicPath1() {
		return smallPicPath1;
	}
	public void setSmallPicPath1(String smallPicPath1) {
		this.smallPicPath1 = smallPicPath1;
	}
	public String getBigPicPath1() {
		return bigPicPath1;
	}
	public void setBigPicPath1(String bigPicPath1) {
		this.bigPicPath1 = bigPicPath1;
	}
	public String getSmallPicPath2() {
		return smallPicPath2;
	}
	public void setSmallPicPath2(String smallPicPath2) {
		this.smallPicPath2 = smallPicPath2;
	}
	public String getBigPicPath2() {
		return bigPicPath2;
	}
	public void setBigPicPath2(String bigPicPath2) {
		this.bigPicPath2 = bigPicPath2;
	}
	public String getSmallPicPath3() {
		return smallPicPath3;
	}
	public void setSmallPicPath3(String smallPicPath3) {
		this.smallPicPath3 = smallPicPath3;
	}
	public String getBigPicPath3() {
		return bigPicPath3;
	}
	public void setBigPicPath3(String bigPicPath3) {
		this.bigPicPath3 = bigPicPath3;
	}
	public String getWebOrder() {
		return webOrder;
	}
	public void setWebOrder(String webOrder) {
		this.webOrder = webOrder;
	}
	public Integer getStartOrderCount() {
		return startOrderCount;
	}
	public void setStartOrderCount(Integer startOrderCount) {
		this.startOrderCount = startOrderCount;
	}
	public Integer getWareCount() {
		return wareCount;
	}
	public void setWareCount(Integer wareCount) {
		this.wareCount = wareCount;
	}
	public Integer getReservedCount() {
		return reservedCount;
	}
	public void setReservedCount(Integer reservedCount) {
		this.reservedCount = reservedCount;
	}
	public Integer getSaleCount() {
		return saleCount;
	}
	public void setSaleCount(Integer saleCount) {
		this.saleCount = saleCount;
	}
	public String getProductDetail() {
		return productDetail;
	}
	public void setProductDetail(String productDetail) {
		this.productDetail = productDetail;
	}
	public String getWholesaleDetail() {
		return wholesaleDetail;
	}
	public void setWholesaleDetail(String wholesaleDetail) {
		this.wholesaleDetail = wholesaleDetail;
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
	public Date getLastViewTime() {
		return lastViewTime;
	}
	public void setLastViewTime(Date lastViewTime) {
		this.lastViewTime = lastViewTime;
	}
	public Integer getViewCount() {
		return viewCount;
	}
	public void setViewCount(Integer viewCount) {
		this.viewCount = viewCount;
	}
	public Integer getCensor() {
		return censor;
	}
	public void setCensor(Integer censor) {
		this.censor = censor;
	}
	public Integer getPostType() {
		return postType;
	}
	public void setPostType(Integer postType) {
		this.postType = postType;
	}
	public Double getMarketPrice() {
		return marketPrice;
	}
	public void setMarketPrice(Double marketPrice) {
		this.marketPrice = marketPrice;
	}
	
	
	
	
	
	
}
