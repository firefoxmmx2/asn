package com.bornsoft.asn.bean.groupPurchase;

public class GroupPurchaseMemDetail {
	private Long id;
	private Long sepcId;
	private float buySum;
	private float costSum;
	private Long parentId;

	private float groupPurchasePrice;
	private float fee;
	private GroupPurchaseDetail productDetail;
	
	public Long getId() {
		return id;
	}
	public Long getSepcId() {
		return sepcId;
	}
	public float getBuySum() {
		return buySum;
	}
	public float getCostSum() {
		return costSum;
	}
	public Long getParentId() {
		return parentId;
	}
	public float getGroupPurchasePrice() {
		return groupPurchasePrice;
	}
	public float getFee() {
		return fee;
	}
	public GroupPurchaseDetail getProductDetail() {
		return productDetail;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public void setSepcId(Long sepcId) {
		this.sepcId = sepcId;
	}
	public void setBuySum(float buySum) {
		this.buySum = buySum;
	}
	public void setCostSum(float costSum) {
		this.costSum = costSum;
	}
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	public void setGroupPurchasePrice(float groupPurchasePrice) {
		this.groupPurchasePrice = groupPurchasePrice;
	}
	public void setFee(float fee) {
		this.fee = fee;
	}
	public void setProductDetail(GroupPurchaseDetail productDetail) {
		this.productDetail = productDetail;
	}
	public GroupPurchaseMemDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GroupPurchaseMemDetail(Long id, Long sepcId, float buySum,
			float costSum, Long parentId, float groupPurchasePrice, float fee,
			GroupPurchaseDetail productDetail) {
		super();
		this.id = id;
		this.sepcId = sepcId;
		this.buySum = buySum;
		this.costSum = costSum;
		this.parentId = parentId;
		this.groupPurchasePrice = groupPurchasePrice;
		this.fee = fee;
		this.productDetail = productDetail;
	}

	

}
