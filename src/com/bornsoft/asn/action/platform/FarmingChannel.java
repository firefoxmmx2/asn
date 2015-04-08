/**
 * 
 */
package com.bornsoft.asn.action.platform;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.information.PurchaseInfo;
import com.bornsoft.asn.bean.information.SupplyInfo;
import com.bornsoft.asn.bean.product.Product;
import com.bornsoft.asn.bean.quotation.QuotationInfo;
import com.bornsoft.asn.service.information.InfoService;
import com.bornsoft.asn.service.product.ProductService;
import com.bornsoft.asn.service.productType.ProductTypeService;
import com.bornsoft.asn.service.quotation.QuotationService;
import com.bornsoft.asn.service.supplier.SupplierService;
import com.bornsoft.asn.utils.common.AsnConstLib;

/**
 * @author liujunwei (liujunwei.cq@163.com)
 *         company:重庆市博恩软件公司
 *         duty:project manager
 *         name:刘军伟
 *         time:2010-9-8
 * @description 农业频道（包括农资、农副产品、日用品）
 * @URL /front/mall/farmingChannel.do
 */
public class FarmingChannel extends BaseAction
{
	// 分類
	private List<Map<String,Object>>	ptype;
	private String						ptypeUrl;
	// 最近加入企業
	private List<Map<String,Object>>	recentEnterprises;
	private List<QuotationInfo>			quoList;
	private List<SupplyInfo>			listS1;
	private List<SupplyInfo>			listS2;
	private List<SupplyInfo>			listS3;
	private List<PurchaseInfo>			listP1;
	private List<PurchaseInfo>			listP2;
	private List<PurchaseInfo>			listP3;
	private List<Product>				listProduct;
	/**
	 * long
	 * field-description:
	 */
	private static final long			serialVersionUID	= 1L;

	@SuppressWarnings("unchecked")
	public String nzHome() throws Exception
	{
		// 分類
		ptype = ProductTypeService.getNewProductType(AsnConstLib.NZ_PT);
		ptypeUrl = "/front/mall/product/searchProduct-1";
		// 行情
		quoList = QuotationService.findQuotationwoStatList(
				0,
				10,
				null,
				null,
				null);
		// 最近加入企業
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("startCount", 1);
		m.put("endCount", 10);

		recentEnterprises = SupplierService.searchSupplier(m);
		//產品
		getSupplyInfo();
		getPurchaseInfo();
		getProduct();
		return SUCCESS;
	}

	public List<Map<String,Object>> getPtype()
	{
		return ptype;
	}

	public FarmingChannel()
	{
		super();
		// TODO Auto-generated constructor stub
	}

	public void setPtype(List<Map<String,Object>> ptype)
	{
		this.ptype = ptype;
	}

	public List<QuotationInfo> getQuoList()
	{
		return quoList;
	}

	public void setQuoList(List<QuotationInfo> quoList)
	{
		this.quoList = quoList;
	}

	public List<SupplyInfo> getListS1()
	{
		return listS1;
	}

	public void setListS1(List<SupplyInfo> listS1)
	{
		this.listS1 = listS1;
	}

	public List<SupplyInfo> getListS2()
	{
		return listS2;
	}

	public void setListS2(List<SupplyInfo> listS2)
	{
		this.listS2 = listS2;
	}

	public List<SupplyInfo> getListS3()
	{
		return listS3;
	}

	public void setListS3(List<SupplyInfo> listS3)
	{
		this.listS3 = listS3;
	}

	public List<PurchaseInfo> getListP1()
	{
		return listP1;
	}

	public void setListP1(List<PurchaseInfo> listP1)
	{
		this.listP1 = listP1;
	}

	public List<PurchaseInfo> getListP2()
	{
		return listP2;
	}

	public void setListP2(List<PurchaseInfo> listP2)
	{
		this.listP2 = listP2;
	}

	public List<PurchaseInfo> getListP3()
	{
		return listP3;
	}

	public void setListP3(List<PurchaseInfo> listP3)
	{
		this.listP3 = listP3;
	}

	public List<Product> getListProduct()
	{
		return listProduct;
	}

	public void setListProduct(List<Product> listProduct)
	{
		this.listProduct = listProduct;
	}

	private void getSupplyInfo() throws Exception
	{
		listS1 = InfoService.showSupplyInfoLi(1, 7, "0002", null, null, null,null);
		for (SupplyInfo si : listS1)
		{
			String title = si.getTitle();
			if (title.length() > 16)
			{
				title = title.substring(0, 16) + "...";
				si.setTitle(title);
			}
		}
		listS2 = InfoService.showSupplyInfoLi(8, 14, "0002", null, null, null,null);
		for (SupplyInfo si : listS2)
		{
			String title = si.getTitle();
			if (title.length() > 16)
			{
				title = title.substring(0, 16) + "...";
				si.setTitle(title);
			}
		}
		listS3 = InfoService.showSupplyInfoLi(15, 21, "0002", null, null, null,null);
		for (SupplyInfo si : listS3)
		{
			String title = si.getTitle();
			if (title.length() > 16)
			{
				title = title.substring(0, 16) + "...";
				si.setTitle(title);
			}
		}
	}

	private void getPurchaseInfo() throws Exception
	{
		listP1 = InfoService.showPurchaseInfoLi(1, 7, "0002", null, null, null,null);
		for (PurchaseInfo pi : listP1)
		{
			String title = pi.getTitle();
			if (title.length() > 16)
			{
				title = title.substring(0, 16) + "...";
				pi.setTitle(title);
			}
		}
		listP2 = InfoService
				.showPurchaseInfoLi(8, 14, "0002", null, null, null,null);
		for (PurchaseInfo pi : listP2)
		{
			String title = pi.getTitle();
			if (title.length() > 16)
			{
				title = title.substring(0, 16) + "...";
				pi.setTitle(title);
			}
		}
		listP3 = InfoService.showPurchaseInfoLi(
				15,
				21,
				"0002",
				null,
				null,
				null,null);
		for (PurchaseInfo pi : listP3)
		{
			String title = pi.getTitle();
			if (title.length() > 16)
			{
				title = title.substring(0, 16) + "...";
				pi.setTitle(title);
			}
		}
	}

	private void getProduct() throws Exception
	{
		listProduct = ProductService.getProductListByType("0002", 1, 10);
	}

	public String getPtypeUrl()
	{
		return ptypeUrl;
	}

	public void setPtypeUrl(String ptypeUrl)
	{
		this.ptypeUrl = ptypeUrl;
	}

	public List<Map<String,Object>> getRecentEnterprises()
	{
		return recentEnterprises;
	}

	public void setRecentEnterprises(List<Map<String,Object>> recentEnterprises)
	{
		this.recentEnterprises = recentEnterprises;
	}
}
