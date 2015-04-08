/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bornsoft.asn.action.quotation;

import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.bean.quotation.QuotationMarket;
import com.bornsoft.asn.bean.quotation.QuotationProduct;
import com.bornsoft.asn.bean.quotation.QuotationProductType;
import com.bornsoft.asn.exception.ActionException;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.service.quotation.QuotationMarketService;
import com.bornsoft.asn.service.quotation.QuotationProductService;
import com.bornsoft.asn.service.quotation.QuotationProductTypeService;
import com.bornsoft.asn.utils.common.AsnConstLib;
import com.bornsoft.asn.utils.common.PageAjaxTool;
import com.bornsoft.asn.utils.common.PageCreator;
import com.bornsoft.asn.utils.common.WebContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author hooxin
 */
@SuppressWarnings({ "serial", "unchecked", "rawtypes" })
public class QuotationProductControlAction extends ActionSupport
{

	private List<QuotationProduct>		quoPList;
	private String						productNameOrAlias;
	private QuotationProduct			qp;
	private List<QuotationMarket>		marketList;
	private List<QuotationProductType>	quoPTList;
	private Integer[]					codes;
	private QuotationMarket				qm;
	private String						modMarketAction	= "/admin/quotation/toModMarket";
	private String						formAction		= "/admin/quotation";
	private String						formAction2		= "/admin/quotation";
	private String						authorAction	= "/admin/quotation";
	private Integer						mode;
	private Map							modeStatus;
	private QuotationProductType		qpt;

	// 分页
	private Integer						page			= 1;
	private String						pageBar;

	// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	// >>构造器
	// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	public QuotationProductControlAction(Map modeStatus)
	{
		this.modeStatus = modeStatus;
	}

	public QuotationProductControlAction()
	{
		this.modeStatus = new HashMap();
		modeStatus.put("ADD", 1);
		modeStatus.put("DELETE", 2);
		modeStatus.put("MODIFY", 3);
		modeStatus.put("INITVIEW", 4);
	}

	// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	// >>函数
	// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	public QuotationProductType getQpt()
	{
		return qpt;
	}

	public Integer[] getCodes()
	{
		return codes;
	}

	public void setCodes(Integer[] codes)
	{
		this.codes = codes;
	}

	public void setMode(Integer mode)
	{
		this.mode = mode;
	}

	public Integer getPage()
	{
		return page;
	}

	public String getPageBar()
	{
		return pageBar;
	}

	public void setPage(Integer page)
	{
		this.page = page;
	}

	public void setPageBar(String pageBar)
	{
		this.pageBar = pageBar;
	}

	public void setQpt(QuotationProductType qpt)
	{
		this.qpt = qpt;
	}

	public String getFormAction2()
	{
		return formAction2;
	}

	public void setFormAction(String formAction)
	{
		this.formAction = formAction;
	}

	public void setFormAction2(String formAction2)
	{
		this.formAction2 = formAction2;
	}

	public String getAuthorAction()
	{
		return authorAction;
	}

	public void setAuthorAction(String authorAction)
	{
		this.authorAction = authorAction;
	}

	public Map getModeStatus()
	{
		return modeStatus;
	}

	public void setModeStatus(Map modeStatus)
	{
		this.modeStatus = modeStatus;
	}

	public Integer getMode()
	{
		return mode;
	}

	public String getFormAction()
	{
		return formAction;
	}

	public String getModMarketAction()
	{
		return modMarketAction;
	}

	public void setModMarketAction(String modMarketAction)
	{
		this.modMarketAction = modMarketAction;
	}

	public QuotationMarket getQm()
	{
		return qm;
	}

	public void setQm(QuotationMarket qm)
	{
		this.qm = qm;
	}

	public List<QuotationProductType> getQuoPTList()
	{
		return quoPTList;
	}

	public void setQuoPTList(List<QuotationProductType> quoPTList)
	{
		this.quoPTList = quoPTList;
	}

	public List<QuotationMarket> getMarketList()
	{
		return marketList;
	}

	public void setMarketList(List<QuotationMarket> marketList)
	{
		this.marketList = marketList;
	}

	public QuotationProduct getQp()
	{
		return qp;
	}

	public void setQp(QuotationProduct qp)
	{
		this.qp = qp;
	}

	public String getProductNameOrAlias()
	{
		return productNameOrAlias;
	}

	public void setProductNameOrAlias(String productNameOrAlias)
	{
		this.productNameOrAlias = productNameOrAlias;
	}

	public List<QuotationProduct> getQuoPList()
	{
		return quoPList;
	}

	public void setQuoPList(List<QuotationProduct> quoPList)
	{
		this.quoPList = quoPList;
	}

	// /////////////////////////////////////////////////////
	// 行情产品
	// /////////////////////////////////////////////////////
	/**
	 * 初始化产品选择器
	 * 
	 * @return
	 * @throws Exception
	 */
	public String initProductList() throws Exception
	{
		if (qp == null)
			qp = new QuotationProduct();
		if (qp.getQuotationPT() == null)
			qp.setQuotationPT(new QuotationProductType());
		int count = QuotationProductService.findQuoProductCount(
				qp.getQuotationPCode(),
				qp.getQuotationPName(),
				qp.getQuotationPNameAlias(),
				qp.getQuotationPT().getQuotationPTypeCode());
		PageAjaxTool pc = new PageAjaxTool();
		pc.setTotalRow(count);
		pc.setCurrentPage(page);
		pageBar = pc.getPageBar();

		quoPList = QuotationProductService.findQuoProduct(
				pc.getStartCount(),
				pc.getEndCount(),
				qp.getQuotationPCode(),
				qp.getQuotationPName(),
				qp.getQuotationPNameAlias(),
				qp.getQuotationPT().getQuotationPTypeCode());
		return "产品选择器";
	}

	/**
	 * 查找产品信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String doFindQuoProduct() throws Exception
	{
		if (qp == null)
			qp = new QuotationProduct();
		if (qp.getQuotationPT() == null)
			qp.setQuotationPT(new QuotationProductType());
		if (productNameOrAlias != null && productNameOrAlias.length() > 0)
		{
			qp.setQuotationPName(productNameOrAlias);
			qp.setQuotationPNameAlias(productNameOrAlias);
		}

		int count = QuotationProductService.findQuoProductCount(
				qp.getQuotationPCode(),
				qp.getQuotationPName(),
				qp.getQuotationPNameAlias(),
				qp.getQuotationPT().getQuotationPTypeCode());
		PageAjaxTool pc = new PageAjaxTool();
		pc.setTotalRow(count);
		pc.setCurrentPage(page);
		pageBar = pc.getPageBar();

		quoPList = QuotationProductService.findQuoProduct(
				pc.getStartCount(),
				pc.getEndCount(),
				qp.getQuotationPCode(),
				qp.getQuotationPName(),
				qp.getQuotationPNameAlias(),
				qp.getQuotationPT().getQuotationPTypeCode());

		return "产品选择器";
	}

	/**
	 * 转到行情产品信息快速添加页面
	 * 
	 * @return
	 * @throws Exception
	 */

	public String toAddQuoProduct() throws Exception
	{
		return "添加产品页面";
	}

	/**
	 * 跳转到 行情产品添加页面
	 * 
	 * @return
	 * @throws Exception
	 */
	public String toAddQuoPdt() throws Exception
	{
		mode = (Integer) modeStatus.get("ADD");
		formAction = formAction + "/addQuoPdt";
		qp = new QuotationProduct();
		qp.setQuotationPCode(IdMakerService
				.newId(AsnConstLib.quoPdtIdType)
				.intValue());
		return "产品信息";
	}

	public String addQuoPdt() throws Exception
	{
		QuotationProductService.addQuoProduct(qp);
		toQuoPdtView();
		return "产品列表";
	}

	/**
	 * 跳转到 产品列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public String toQuoPdtView() throws Exception
	{
		mode = (Integer) modeStatus.get("INITVIEW");
		formAction = formAction + "/delQuoPdt";
		formAction2 = formAction2 + "/findQuoPdtView";
		// 初始化A标签地址到产品修改
		authorAction = authorAction + "/toModQuoPdt";

		//分类列表
		quoPTList = QuotationProductTypeService.getQuoPType();
		// 到时候换为分页查询
		Integer count = QuotationProductService.findQuoProductCount(
				null,
				null,
				null,
				null);
		// 分页
		PageCreator pc = new PageCreator();
		pc.setCurrentPage(page);
		pc.setTotalRow(count);
		pageBar = pc.getPageBar();
		quoPList = QuotationProductService.findQuoProduct(
				pc.getStartCount(),
				pc.getEndCount(),
				null,
				null,
				null,
				null);
		return "产品列表";
	}

	public String findQuoPdtView() throws Exception
	{
		mode = (Integer) modeStatus.get("INITVIEW");
		formAction = formAction + "/delQuoPdt";
		formAction2 = formAction2 + "/findQuoPdtView";
		authorAction = authorAction + "/toModQuoPdt";
		
		//分类列表
		quoPTList = QuotationProductTypeService.getQuoPType();
		
		if (qp == null)
			qp = new QuotationProduct();
		if (qpt != null && qpt.getQuotationPTName() != null
				&& qpt.getQuotationPTName().trim().length() > 0)
			qpt = QuotationProductTypeService.getQuoPType(qpt
					.getQuotationPTName());
		else
			qpt = new QuotationProductType();
		Integer count = QuotationProductService.findQuoProductCount(
				qp.getQuotationPCode(),
				qp.getQuotationPName(),
				qp.getQuotationPNameAlias(),
				qpt.getQuotationPTypeCode());
		// 分页
		PageCreator pc = new PageCreator();
		pc.setCurrentPage(page);
		pc.setTotalRow(count);
		pageBar = pc.getPageBar();
		quoPList = QuotationProductService.findQuoProduct(
				pc.getStartCount(),
				pc.getEndCount(),
				qp.getQuotationPCode(),
				qp.getQuotationPName(),
				qp.getQuotationPNameAlias(),
				qpt.getQuotationPTypeCode());
		return "产品列表";
	}

	/**
	 * 跳转到 产品修改
	 * 
	 * @return
	 * @throws Exception
	 */
	public String toModQuoPdt() throws Exception
	{
		mode = (Integer) modeStatus.get("MODIFY");
		formAction = formAction + "/modQuoPdt";
		qp = QuotationProductService.getQuoProduct(qp.getQuotationPCode());
		return "产品信息";
	}

	/**
	 * 修改产品
	 * 
	 * @return
	 * @throws Exception
	 */
	public String modQuoPdt() throws Exception
	{
		QuotationProductService.modQuoProduct(qp);
		toQuoPdtView();
		return "产品列表";
	}

	/**
	 * 删除产品
	 * 
	 * @return
	 * @throws Exception
	 */
	public String delQuoPdt() throws Exception
	{
		// 所选择的产品编号
		if (codes == null || codes.length == 0)
			throw new ActionException("选择的产品编号为空，请至少选择一条产品记录");
		for (Integer code : codes)
			QuotationProductService.delQuoProduct(code);
		toQuoPdtView();
		return "产品列表";
	}

	/**
	 * 添加行情产品信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String doAddQuoProduct() throws Exception
	{
		WebContext.getResponse().setContentType("text/html; charset=UTF-8");
		PrintWriter out = WebContext.getResponse().getWriter();

		try
		{
			qp
					.setQuotationPCode(IdMakerService
							.newId("quotationPT")
							.intValue());
			QuotationProductService.addQuoProduct(qp);
		}
		catch (Exception e)
		{
			out.print("0::新增产品失败");
			out.close();
			throw e;
		}
		out.print("1::新增产品成功");
		out.close();
		return null;
	}

	// /////////////////////////////////////////////
	// 行情市场
	// /////////////////////////////////////////////
	/**
	 * 初始化市场选择器
	 * 
	 * @return
	 * @throws Exception
	 */
	public String initMarketList() throws Exception
	{
		int count = QuotationMarketService.findMarketCount(null, null, null);

		// 分页
		PageAjaxTool pc = new PageAjaxTool();
		pc.setTotalRow(count);
		pc.setCurrentPage(page);
		pageBar = pc.getPageBar();

		marketList = QuotationMarketService.findMarket(
				pc.getStartCount(),
				pc.getEndCount(),
				null,
				null,
				null);

		return "市场选择器";
	}

	/**
	 * 查找市场
	 * 
	 * @return
	 * @throws Exception
	 */
	public String doFindMarket() throws Exception
	{
		if(qm == null)
			qm = new QuotationMarket();

		Integer count = QuotationMarketService.findMarketCount(
				qm.getMarketCode(),
				qm.getMarketName(),
				qm.getArea());
		// 分页
		PageAjaxTool pc = new PageAjaxTool();
		pc.setTotalRow(count);
		pc.setCurrentPage(page);
		pageBar = pc.getPageBar();

		marketList = QuotationMarketService.findMarket(
				pc.getStartCount(),
				pc.getEndCount(),
				qm.getMarketCode(),
				qm.getMarketName(),
				qm.getArea());
		return "市场选择器";
	}

	public String toAddMarket() throws Exception
	{
		formAction += "/addMarket";
		mode = (Integer) modeStatus.get("ADD");
		qm = new QuotationMarket();
		qm
				.setMarketCode(((Long) IdMakerService
						.newId(AsnConstLib.marketIdType)).intValue());
		return "市场信息";
	}

	public String addMarket() throws Exception
	{
		qm.setUpdatePerson(MemberService.getMemberFullName());
		qm.setUpdateTime(new Date());
		QuotationMarketService.addMarket(qm);
		initMarketList();
		return "市场列表";
	}

	/**
	 * 初始化修改市场信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String toModMarket() throws Exception
	{
		formAction += "/modMarket";
		mode = (Integer) modeStatus.get("MODIFY");
		qm = QuotationMarketService.getMarket(qm.getMarketCode());
		return "市场信息";
	}

	/**
	 * 修改市场信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String modMarket() throws Exception
	{
		qm.setUpdatePerson(MemberService.getMemberFullName());
		qm.setUpdateTime(new Date());
		QuotationMarketService.modMarket(qm);
		initMarketList();
		return "市场列表";
	}

	/**
	 * 删除市场信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String delMarket() throws Exception
	{
		if (codes == null || codes.length == 0)
		{
			throw new ActionException("行情市场编号为空,请至少选择一条行情市场记录");
		}
		for (Integer code : codes)
		{
			QuotationMarketService.delMarket(code);
		}
		initMarketList();
		return "市场列表";
	}

	public String initMarketView() throws Exception
	{
		Integer count = QuotationMarketService
				.findMarketCount(null, null, null);
		// 分页
		PageCreator pc = new PageCreator();
		pc.setCurrentPage(page);
		pc.setTotalRow(count);
		pageBar = pc.getPageBar();
		formAction2 = formAction2 + "/findMarketView";
		marketList = QuotationMarketService.findMarket(
				pc.getStartCount(),
				pc.getEndCount(),
				null,
				null,
				null);
		mode = (Integer) modeStatus.get("INITVIEW");
		return "市场列表";
	}

	/**
	 * 查找市场
	 * 
	 * @return
	 * @throws Exception
	 */
	public String findMarketView() throws Exception
	{
		Integer count = QuotationMarketService.findMarketCount(
				qm.getMarketCode(),
				qm.getMarketName(),
				qm.getArea());
		// 分页
		PageCreator pc = new PageCreator();
		pc.setCurrentPage(page);
		pc.setTotalRow(count);
		pageBar = pc.getPageBar();
		marketList = QuotationMarketService.findMarket(
				pc.getStartCount(),
				pc.getEndCount(),
				qm.getMarketCode(),
				qm.getMarketName(),
				qm.getArea());

		return "市场列表";
	}

	// //////////////////////////////////////////////////
	// 行情产品类型
	// //////////////////////////////////////////////////

	/**
	 * 初始化产品类型选择器
	 * 
	 * @return
	 * @throws Exception
	 */
	public String initPTList() throws Exception
	{
		quoPTList = QuotationProductTypeService.getQuoPType();
		return "产品类型选择器";
	}

	/**
	 * 产品类型选择器查找
	 * 
	 * @return
	 * @throws Exception
	 */
	public String doFindPTList() throws Exception
	{
		quoPTList = QuotationProductTypeService.findQuoPdtType(qpt.getQuotationPTypeCode(),qpt.getQuotationPTName());
		return "产品类型选择器";
	}

	/**
	 * 跳转到 产品类型列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public String toQuoPTView() throws Exception
	{
		quoPTList = QuotationProductTypeService.getQuoPType();
		formAction = formAction + "/delQuoPT";
		authorAction = authorAction + "/toModQuoPT";
		mode = (Integer) modeStatus.get("INITVIEW");
		return "产品类型列表";
	}

	/**
	 * 跳转到新增产品类型
	 * 
	 * @return
	 * @throws Exception
	 */
	public String toAddQuoPT() throws Exception
	{
		mode = (Integer) modeStatus.get("ADD");
		formAction = formAction + "/addQuoPT";
		qpt = new QuotationProductType();
		qpt.setQuotationPTypeCode(IdMakerService
				.newId(AsnConstLib.quoPTIdType)
				.intValue());
		return "产品类型信息";
	}

	/**
	 * 跳转到修改产品类型
	 * 
	 * @return
	 * @throws Exception
	 */
	public String toModQuoPT() throws Exception
	{
		mode = (Integer) modeStatus.get("MODIFY");
		formAction = formAction + "/modQuoPT";
		qpt = QuotationProductTypeService.getQuoPType(qpt
				.getQuotationPTypeCode());
		return "产品类型信息";
	}

	/**
	 * 新增产品类型
	 * 
	 * @return
	 * @throws Exception
	 */
	public String addQuoPT() throws Exception
	{
		QuotationProductTypeService.addQuoPType(qpt);
		toQuoPTView();
		return "产品类型列表";
	}

	/**
	 * 修改产品类型
	 * 
	 * @return
	 * @throws Exception
	 */
	public String modQuoPT() throws Exception
	{
		QuotationProductTypeService.modQuoPType(qpt);
		toQuoPTView();
		return "产品类型列表";
	}

	/**
	 * 删除产类型
	 * 
	 * @return
	 * @throws Exception
	 */
	public String delQuoPT() throws Exception
	{
		// 所选择的产品类型编号
		if (codes == null || codes.length == 0)
			throw new ActionException("产品类型编号为空,请至少选择一条行情产品类型记录");
		for (Integer code : codes)
			QuotationProductTypeService.delQuoPType(code);
		toQuoPTView();
		return "产品类型列表";
	}
}
