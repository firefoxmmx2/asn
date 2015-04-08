package com.bornsoft.asn.bean.order;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 订单的POJO
 * @author yuwenqiang
 * 2010-2-25
 */
public class Order implements Serializable{

	private static final long serialVersionUID = -8751613391988079181L;
	/**订单主键*/
	private long id;
	/**城市*/
	private String city;
	/**地址编码 */
    private String areaCode;
	/**详细地址*/
    private String detailAddress;
	/**收货人姓名*/
    private String drawerName;
    /**收取人联系电话*/
    private String drawerNumber;
    /**邮编*/
    private String zipCode;
    /**备注*/
    private String specialExplain;
    /**付款方式*/
    private String paymentMethod;
    /**订单状态*/
    private String orderStatus;
    /**发布商品会员ID*/
    private long supplierId;
    /**创建时间*/
    private Date createTime;
    /** 会员的ID*/
    private long memberId;
	/**订单操作人*/
    private long operatorId;
    /**操作时间*/
    private Date operatorTime; 
    /**邮递费用*/
    private BigDecimal postFee; 
    /**订单的总金额*/
    private BigDecimal totalAmount;
    
    private String productName; //只用于支付页面的订单展示产品的名称,不需要存入数据库
    
    private String isPayed;//平台是否向被担保商户付款
    private Date payedTime;//平台向被担保商户付款时间
    
    
	public String getIsPayed() {
		return isPayed;
	}
	public void setIsPayed(String isPayed) {
		this.isPayed = isPayed;
	}
	public Date getPayedTime() {
		return payedTime;
	}
	public void setPayedTime(Date payedTime) {
		this.payedTime = payedTime;
	}
	/**卖家留言*/
    //private String leaveWord;
    
    
//    public String getLeaveWord() {
//		return leaveWord;
//	}
//	public void setLeaveWord(String leaveWord) {
//		this.leaveWord = leaveWord;
//	}
    public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public BigDecimal getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(BigDecimal totalAmount) {
		this.totalAmount = totalAmount;
	}
	public BigDecimal getPostFee() {
		return postFee;
	}
	public void setPostFee(BigDecimal postFee) {
		this.postFee = postFee;
	}

   
 
    
    public String getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public long getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(long supplierId) {
		this.supplierId = supplierId;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getDrawerName() {
		return drawerName;
	}
	public void setDrawerName(String drawerName) {
		this.drawerName = drawerName;
	}
	public String getDrawerNumber() {
		return drawerNumber;
	}
	public void setDrawerNumber(String drawerNumber) {
		this.drawerNumber = drawerNumber;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getSpecialExplain() {
		return specialExplain;
	}
	public void setSpecialExplain(String specialExplain) {
		this.specialExplain = specialExplain;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public long getMemberId() {
		return memberId;
	}
	public void setMemberId(long memberId) {
		this.memberId = memberId;
	}
	public long getOperatorId() {
		return operatorId;
	}
	public void setOperatorId(long operatorId) {
		this.operatorId = operatorId;
	}
	public Date getOperatorTime() {
		return operatorTime;
	}
	public void setOperatorTime(Date operatorTime) {
		this.operatorTime = operatorTime;
	}
}
