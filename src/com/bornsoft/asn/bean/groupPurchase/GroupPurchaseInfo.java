package com.bornsoft.asn.bean.groupPurchase;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@SuppressWarnings("serial")
public class GroupPurchaseInfo implements Serializable {
	private Long id;
	private String title;
	private String content;
	// 保留 ;
	private Long productId;
	private String productName;;
	private Integer lowerLimit;
	private Integer upperLimit;
	private Integer currentUsers;
	private Integer totalCount;
	private String isTimeLimit;
	private Date startTime;
	private Date stopTime;
	private String goodsCenter;
	private String pageAddress;
	private String status;

	//关联扩展
	private List<GroupPurchaseDetail> details;
	//关联团购成员
	private List<GroupPurchaseMember> groupMembers;

	public Long getId() {
		return id;
	}

	public String getTitle() {
		return title;
	}

	public Long getProductId() {
		return productId;
	}

	public String getProductName() {
		return productName;
	}

	public Integer getLowerLimit() {
		return lowerLimit;
	}

	public Integer getUpperLimit() {
		return upperLimit;
	}

	public Integer getCurrentUsers() {
		return currentUsers;
	}

	public Integer getTotalCount() {
		return totalCount;
	}


	public Date getStartTime() {
		return startTime;
	}

	public Date getStopTime() {
		return stopTime;
	}

	public String getGoodsCenter() {
		return goodsCenter;
	}

	public String getPageAddress() {
		return pageAddress;
	}

	public String getStatus() {
		return status;
	}

	public List<GroupPurchaseDetail> getDetails() {
		return details;
	}

	public List<GroupPurchaseMember> getGroupMembers() {
		return groupMembers;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public void setLowerLimit(Integer lowerLimit) {
		this.lowerLimit = lowerLimit;
	}

	public void setUpperLimit(Integer upperLimit) {
		this.upperLimit = upperLimit;
	}

	public void setCurrentUsers(Integer currentUsers) {
		this.currentUsers = currentUsers;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public void setStopTime(Date stopTime) {
		this.stopTime = stopTime;
	}

	public void setGoodsCenter(String goodsCenter) {
		this.goodsCenter = goodsCenter;
	}

	public void setPageAddress(String pageAddress) {
		this.pageAddress = pageAddress;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setDetails(List<GroupPurchaseDetail> details) {
		this.details = details;
	}

	public void setGroupMembers(List<GroupPurchaseMember> groupMembers) {
		this.groupMembers = groupMembers;
	}

	public GroupPurchaseInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GroupPurchaseInfo(Long id, String title, String content, Long productId,
			String productName, Integer lowerLimit, Integer upperLimit,
			Integer currentUsers, Integer totalCount, Boolean isTimeLimit,
			Date startTime, Date stopTime, String goodsCenter,
			String pageAddress, String status,
			List<GroupPurchaseDetail> details,
			List<GroupPurchaseMember> groupMembers) {
		super();
		this.id = id;
		this.title = title;
		this.productId = productId;
		this.productName = productName;
		this.lowerLimit = lowerLimit;
		this.upperLimit = upperLimit;
		this.currentUsers = currentUsers;
		this.totalCount = totalCount;
		this.startTime = startTime;
		this.stopTime = stopTime;
		this.goodsCenter = goodsCenter;
		this.pageAddress = pageAddress;
		this.status = status;
		this.details = details;
		this.groupMembers = groupMembers;
		this.content = content;
	}

	public String getIsTimeLimit() {
		return isTimeLimit;
	}

	public void setIsTimeLimit(String isTimeLimit) {
		this.isTimeLimit = isTimeLimit;
	}

	/**
	 * @return the content
	 */
	public String getContent()
	{
		return content;
	}

	/**
	 * @param content the content to set
	 */
	public void setContent(String content)
	{
		this.content = content;
	}
	
}
