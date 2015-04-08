package com.bornsoft.asn.action.receivingAddress;

import java.util.List;

import com.bornsoft.asn.bean.order.DrawerAddress;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.service.order.OrderService;
import com.opensymphony.xwork2.ActionSupport;

public class AddressManagerAction  extends ActionSupport{
	private static final long serialVersionUID = 1L;
	
	private List<DrawerAddress>  addressesInfo;
	/**收货人姓名*/
   	private String drawerName;
	/** 城市 */
   	private String area;
    /**详细地址*/
   	private String detailAddress;
   	/**邮政编码*/
    private String zipCode;
    /**联系电话(固定电话)*/
    private String drawerNumber;
    /**联系电话(移动电话)*/
    private String mobileNumber;

	/**地址ID*/
    private long addId;
    
    /**收货地址POJO*/
    private DrawerAddress address;
    
	
	public DrawerAddress getAddress() {
		return address;
	}
	public void setAddress(DrawerAddress address) {
		this.address = address;
	}
	public long getAddId() {
		return addId;
	}
	public void setAddId(long addId) {
		this.addId = addId;
	}
	public String getDrawerName() {
		return drawerName;
	}
	public void setDrawerName(String drawerName) {
		this.drawerName = drawerName;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getDrawerNumber() {
		return drawerNumber;
	}
	public void setDrawerNumber(String drawerNumber) {
		this.drawerNumber = drawerNumber;
	}
	public List<DrawerAddress> getAddressesInfo() {
		return addressesInfo;
	}
	public void setAddressesInfo(List<DrawerAddress> addressesInfo) {
		this.addressesInfo = addressesInfo;
	}
	
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	
	/**
	 * 会员查询自己地址管理栏
	 * 2010-5-11
	 * @author yuwenqiang
	 * @return
	 */
	public String findAddressInfo(){
		addressesInfo=OrderService.getAddresses(MemberService.getMemberId());
		return SUCCESS;
	}
	
	
	/**
	 * 修改已经存在的收货地址
	 * 2010-5-11
	 * @author yuwenqiang
	 * @return
	 */
	public String updateAddressInfo(){
		OrderService.updateDrawerAddress(drawerName, area, detailAddress, zipCode, drawerNumber, addId);
		addressesInfo=OrderService.getAddresses(MemberService.getMemberId());
		return SUCCESS;
	}
	
	
	/**
	 * 根据地址的ID查询该地址的详细信息
	 * 2010-5-11
	 * @author yuwenqiang
	 * @return
	 */
	public String findAddressById(){
		addressesInfo=OrderService.getAddresses(MemberService.getMemberId());
		address=OrderService.findDrawerAddressById(addId);
		return SUCCESS;
	}
	
	
	/**
	 * 删除存在的收货地址
	 * 2010-5-11
	 * @author yuwenqiang
	 * @return
	 */
	public String deleteAddressInfo(){
		OrderService.deleteAddressById(addId);
		addressesInfo=OrderService.getAddresses(MemberService.getMemberId());
		return SUCCESS;
	}
	
	
	/**
	 * 保存地址
	 * 2010-5-11
	 * @author yuwenqiang
	 * @return
	 */
	public String saveAddressInfo(){
		OrderService.saveDrawerAddress(drawerName, area, detailAddress, zipCode, drawerNumber,mobileNumber,MemberService.getMemberId());
		addressesInfo=OrderService.getAddresses(MemberService.getMemberId());
		return SUCCESS;
	}
	

}
