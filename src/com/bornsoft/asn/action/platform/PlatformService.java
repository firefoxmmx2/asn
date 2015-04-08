/**
 * 
 */
package com.bornsoft.asn.action.platform;

import java.util.ArrayList;
import java.util.List;

import com.bornsoft.asn.action.BaseAction;

/**
 * @author liujunwei (liujunwei.cq@163.com)
 * company:重庆市博恩软件公司 
 *    duty:project manager
 *    name:刘军伟
 *    time:2010-9-8
 * @description 服务平台（嵌入电子商务模块），构建服务平台中的商品信息和供求信息
 * @URL /front/serviceInfo.do
 */
public class PlatformService extends BaseAction
{
	/**
	 * long
	 * field-description:
	 */
	private static final long serialVersionUID = 1L;
	
	//推荐产品列表（默认取8个带图的产品出来）
	private List recproductList = new ArrayList();
	
	//产品分类（农副产品、农资、再生资源、烟花爆竹、日用品、保健品、药品、商业服务）
	private List productCategoryList = new ArrayList();
	
	//推荐企业
	private List recommendedCompanyList = new ArrayList();
	
	//供应信息（默认取20条有效地发布出来的信息）
	private List suplyInfoList = new ArrayList();

	//求购信息（默认取20条有效地发布出来的信息）
	private List purchaseInfoList = new ArrayList();

	/**
	 * @return the recproductList
	 */
	public List getRecproductList()
	{
		return recproductList;
	}

	/**
	 * @param recproductList the recproductList to set
	 */
	public void setRecproductList(List recproductList)
	{
		this.recproductList = recproductList;
	}

	/**
	 * @return the productCategoryList
	 */
	public List getProductCategoryList()
	{
		return productCategoryList;
	}

	/**
	 * @param productCategoryList the productCategoryList to set
	 */
	public void setProductCategoryList(List productCategoryList)
	{
		this.productCategoryList = productCategoryList;
	}

	/**
	 * @return the recommendedCompanyList
	 */
	public List getRecommendedCompanyList()
	{
		return recommendedCompanyList;
	}

	/**
	 * @param recommendedCompanyList the recommendedCompanyList to set
	 */
	public void setRecommendedCompanyList(List recommendedCompanyList)
	{
		this.recommendedCompanyList = recommendedCompanyList;
	}

	/**
	 * @return the suplyInfoList
	 */
	public List getSuplyInfoList()
	{
		return suplyInfoList;
	}

	/**
	 * @param suplyInfoList the suplyInfoList to set
	 */
	public void setSuplyInfoList(List suplyInfoList)
	{
		this.suplyInfoList = suplyInfoList;
	}

	/**
	 * @return the purchaseInfoList
	 */
	public List getPurchaseInfoList()
	{
		return purchaseInfoList;
	}

	/**
	 * @param purchaseInfoList the purchaseInfoList to set
	 */
	public void setPurchaseInfoList(List purchaseInfoList)
	{
		this.purchaseInfoList = purchaseInfoList;
	}
	
	
	
}
