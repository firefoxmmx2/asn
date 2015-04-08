package com.bornsoft.asn.action.productType;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import com.bornsoft.asn.bean.productType.ProductType;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.productType.ProductTypeService;
import com.bornsoft.asn.utils.common.AsnConstLib;
import com.bornsoft.asn.utils.common.WebContext;
import com.bornsoft.asn.utils.common.productNavi.ProductNavigatorService;
import com.bornsoft.asn.utils.common.productNavi.ProductTypeIf;
import com.opensymphony.xwork2.ActionSupport;


public class ProductTypeManageAction extends ActionSupport{
	private ProductType pt;
	private String type;
	private String url;
	private String async;
	
	/**
	 * 初始化 所有分类
	 * @return
	 * @throws Exception
	 */
	public String toView() throws Exception {
		url = "./toView";
		ProductTypeIf ptif = ProductNavigatorService.getNaviType(AsnConstLib.NavigatorLevel0);
		ptif.init(getUrl(), type, new String[]{"1=1"});
		if(async != null && async.equals("true") )
			return "async";
		return "success";
	}
	
	/**
	 * 初始化产品类型修改页面
	 * @return
	 * @throws Exception
	 */
	public String toUpdate() throws Exception{
		if(type == null){
			new Exception("产品类型编号为空");
			return "toUpdate";
		}
		pt = ProductTypeService.getProductTypeByCode2(type);
		
		return "toUpdate";
	}
	/**
	 * 执行 新增 产品类型
	 * @return
	 * @throws Exception
	 */
	public String doNew() throws Exception {
		HttpServletResponse res = WebContext.getResponse();
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		int ptid = IdMakerService.newId(AsnConstLib.ptIdType).intValue();
		pt.setPtid(ptid);
		if(ProductTypeService.getProductTypeByCode2(pt.getPtcode()) != null){
			out.print("error::产品分类编号重复");
			return null;
		}
		else if(pt.getPttypeName() == null || pt.getPttypeName().trim().length() == 0){
			out.print("error::请输入产品分类名称");
		}
		else if(pt.getPtparentid() == 0){
			out.print("error::请输入上级分类ID");
		}
			ProductTypeService.insertType(pt);
			out.print("yes");
			out.close();
		return null;
	}
	
	/**
	 * 执行 修改 产品类型
	 * @return
	 * @throws Exception
	 */
	public String doUpdate() throws Exception {
		HttpServletResponse res = WebContext.getResponse();
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		if( type.equals(pt.getPtcode()) == false &&  ProductTypeService.getProductTypeByCode2(pt.getPtcode()) != null){
			out.print("error::不能修改一个产品分类编号为一个已存在的编号");
			return null;
		}
		else if(pt.getPttypeName() == null || pt.getPttypeName().trim().length() == 0){
			out.print("error::请输入产品分类名称");
		}
		else if(pt.getPtparentid() == 0){
			out.print("error::请输入上级分类ID");
		}
		ProductTypeService.updateType(pt);
		out.print("yes");
		out.close();
		return null;
	}
	
	/**
	 * 执行 删除 产品类型
	 * @return
	 * @throws Exception
	 */
	public String doDelete() throws Exception {
		HttpServletResponse res = WebContext.getResponse();
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		ProductTypeService.deleteType(pt.getPtid());
		out.print("yes");
		out.close();
		return null;
	}

	public void setPt(ProductType pt) {
		this.pt = pt;
	}

	public ProductType getPt() {
		return pt;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getType() {
		return type;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUrl() {
		return url;
	}

	public void setAsync(String async) {
		this.async = async;
	}

	public String getAsync() {
		return async;
	}
}
