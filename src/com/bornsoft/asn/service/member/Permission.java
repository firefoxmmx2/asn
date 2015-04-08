/**
 * 
 */
package com.bornsoft.asn.service.member;

import javax.servlet.http.HttpServletRequest;

import com.bornsoft.asn.utils.common.AsnConstLib;
import com.bornsoft.asn.utils.common.WebContext;

/**
 * Permission
 * @author Ken Liu Kunyun 
 *
 */
public class Permission {
	private HttpServletRequest request;
	
	public Permission(){
		this.request=WebContext.getRequest();
	}
	
	public Permission(HttpServletRequest request){
		this.request=request;
	}
	/**
	 * 是否有权进行会员管理
	 * @return
	 */
	public Boolean memberAdmin(){
		return MemberService.isRole(request, AsnConstLib.AdminRoles.AsnMemberAdmin);
	}
	/**
	 * 是否有权进行行情管理
	 * @return
	 */
	public Boolean quotationAdmin(){
		return MemberService.isRole(request, AsnConstLib.AdminRoles.AsnQuotationAdmin);
	}
	/**
	 * 是否有权进行供应商管理
	 * @return
	 */
	public Boolean supplierAdmin(){
		return MemberService.isRole(request, AsnConstLib.AdminRoles.AsnSupplierAdmin);
	}
	/**
	 * 是否有权进行系统管理
	 * @return
	 */
	public Boolean systemAdmin(){
		return MemberService.isRole(request, AsnConstLib.AdminRoles.AsnSystemAdmin);
	}
}
