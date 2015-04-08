package com.bornsoft.asn.service.productType;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.productType.ProductType;
import com.bornsoft.asn.dao.productType.ProductTypeDao;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class ProductTypeService
{
	public static List<ProductType> getFirstProductType() throws Exception
	{
		try
		{
			return ProductTypeDao.getFirstProductType();
		}
		catch (Exception e)
		{
			Logger log = Logger.getLogger("ProductTypeService");
			log.info("", e);
			throw e;
		}
	}

	public static List<ProductType> getSecondProductType() throws Exception
	{
		try
		{
			return ProductTypeDao.getSecondProductType();
		}
		catch (Exception e)
		{
			Logger log = Logger.getLogger("ProductTypeService");
			log.info("", e);
			throw e;
		}
	}

	public static List<ProductType> getThirdProductType() throws Exception
	{
		try
		{
			return ProductTypeDao.getThirdProductType();
		}
		catch (Exception e)
		{
			Logger log = Logger.getLogger("ProductTypeService");
			log.info("", e);
			throw e;
		}
	}

	public static String getProductTypeByCode(String productTypeCode)
			throws Exception
	{
		try
		{
			ProductType pt = ProductTypeDao
					.getProductTypeByCode(productTypeCode);
			return pt.getPttypeName();
		}
		catch (Exception e)
		{
			Logger log = Logger.getLogger("ProductTypeService");
			log.info("", e);
			throw e;
		}
	}

	public static String getProductTypeNameByCode(String productTypeCode3)
			throws Exception
	{
		try
		{
			String rs = "";
			if (productTypeCode3 != null && !productTypeCode3.equals(""))
			{
				String[] strings = productTypeCode3.split("-");
				if (strings.length == 3)
				{
					String s1 = strings[0];
					String s2 = strings[0] + "-" + strings[1];
					ProductType pt1 = ProductTypeDao.getProductTypeByCode(s1);
					ProductType pt2 = ProductTypeDao.getProductTypeByCode(s2);
					ProductType pt3 = ProductTypeDao
							.getProductTypeByCode(productTypeCode3);
					rs = pt1.getPttypeName() + "-" + pt2.getPttypeName() + "-"
							+ pt3.getPttypeName();
				}
				else if (strings.length == 2)
				{
					String s1 = strings[0];
					String s2 = strings[0] + "-" + strings[1];
					ProductType pt1 = ProductTypeDao.getProductTypeByCode(s1);
					ProductType pt2 = ProductTypeDao.getProductTypeByCode(s2);
					rs = pt1.getPttypeName() + "-" + pt2.getPttypeName();
				}
				else
				{
					ProductType pt3 = ProductTypeDao
							.getProductTypeByCode(productTypeCode3);
					rs = pt3.getPttypeName();
				}
			}
			else
			{
				rs = "所有分类";
			}

			return rs;
		}
		catch (Exception e)
		{
			Logger log = Logger
					.getLogger("ProductTypeService-getProductTypeNameByCode");
			log.info("", e);
			throw e;
		}
	}

	public static List<ProductType> getProductTypeByFatherId(String id)
			throws Exception
	{
		return ProductTypeDao.getProductTypeByFatherId(id);
	}

	public static String getProductTypeNameById(String id) throws Exception
	{
		ProductType p = ProductTypeDao.getProductTypeById(id);
		return p.getPttypeName();
	}

	public static ProductType getProductTypeById(String id) throws Exception
	{
		ProductType p = ProductTypeDao.getProductTypeById(id);
		return p;
	}

	/**
	 * 获取指定编号的产品类型
	 * 
	 * @param typeCode
	 *            产品类型编号
	 * @return 产品类型
	 * @throws Exception
	 * @author hooxin
	 */
	public static ProductType getProductTypeByCode2(String typeCode)
			throws Exception
	{
		try
		{
			ProductType pt = ProductTypeDao.getProductTypeByCode(typeCode);
			return pt;
		}
		catch (Exception e)
		{
			Logger log = Logger.getLogger("ProductTypeService");
			log.info("获取指定编号产品类型2 出错~~ service", e);
			throw e;
		}
	}

	// add by hooxin -- 10.3.24
	/**
	 * 按照优先级获得一级分类
	 * 
	 * @param priority
	 *            优先级
	 * @return
	 * @throws Exception
	 */
	public static List<ProductType> getFirstProductTypeByPriority(int priority)
			throws Exception
	{
		try
		{
			return ProductTypeDao.getFirstProductTypeByPriority(priority);
		}
		catch (Exception e)
		{
			Logger log = Logger.getLogger("ProductTypeService");
			log.info("按照优先级获得一级分类 出错 service", e);
			throw e;
		}
	}

	// +++ add by hooxin -- 10.3.24
	/**
	 * 按照优先级获得二级分类
	 * 
	 * @param priority
	 *            优先级
	 * @return
	 * @throws Exception
	 */
	public static
			List<ProductType> getSecondProductTypeByPriority(int priority)
					throws Exception
	{
		try
		{
			return ProductTypeDao.getSecondProductTypeByPriority(priority);
		}
		catch (Exception e)
		{
			Logger log = Logger.getLogger("ProductTypeService");
			log.info("按照优先级获得二级分类 出错! service", e);
			throw e;
		}
	}

	/**
	 * 获取三级分类 通过优先级
	 * 
	 * @param priority
	 *            优先级
	 * @return
	 * @throws Exception
	 */
	public static List<ProductType> getThirdProductTypeByPriority(int priority)
			throws Exception
	{
		try
		{
			return ProductTypeDao.getThirdProductTypeByPriority(priority);
		}
		catch (Exception e)
		{
			Logger log = Logger.getLogger("ProductTypeService");
			log.info("获取三级分类 通过优先级 出错 ！ serivce", e);
			throw e;
		}
	}

	// --- end by hooxin

	// +++ add by hooxin -- 3.29
	/**
	 * 新增一个 产品类型
	 * 
	 * @param pt
	 *            需要添加的产品类型
	 * @throws Exception
	 */
	public static void insertType(ProductType pt) throws Exception
	{
		try
		{
			sqlMapFactory.getSqlMap().startTransaction();
			ProductTypeDao.insert(pt);
			sqlMapFactory.getSqlMap().commitTransaction();
		}
		catch (Exception e)
		{
			Logger log = Logger.getLogger(ProductTypeService.class.getName());
			log.info("插入产品类型出错 service", e);
			throw e;
		}
		finally
		{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}

	/**
	 * 修改 一个产品类型
	 * 
	 * @param pt
	 *            产品类型
	 * @throws Exception
	 */
	public static void updateType(ProductType pt) throws Exception
	{
		try
		{
			sqlMapFactory.getSqlMap().startTransaction();
			ProductTypeDao.update(pt);
			sqlMapFactory.getSqlMap().commitTransaction();
		}
		catch (Exception e)
		{
			Logger log = Logger.getLogger(ProductTypeService.class.getName());
			log.info("修改类型出错 ! service", e);
			throw e;
		}
		finally
		{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}

	/**
	 * 删除一个产品类型
	 * 
	 * @param ptid
	 *            产品类型ID
	 * @throws Exception
	 */
	public static void deleteType(int ptid) throws Exception
	{
		try
		{
			sqlMapFactory.getSqlMap().startTransaction();
			ProductTypeDao.delete(ptid);
			sqlMapFactory.getSqlMap().commitTransaction();
		}
		catch (Exception e)
		{
			Logger log = Logger.getLogger(ProductTypeService.class.getName());
			log.info("删除类型出错! service", e);
			throw e;
		}
		finally
		{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}

	// --- end

	/**
	 * 得到新的分类
	 * 
	 * @param inlude
	 *            需要显示的分类代码
	 * @return
	 * @throws Exception
	 */
	public static List<Map<String,Object>> getNewProductType(String[] include)
			throws Exception
	{

		List<Map<String,Object>> showList = new ArrayList<Map<String,Object>>();

		List<ProductType> realFirst = new ArrayList<ProductType>();
		List<ProductType> firstType = getFirstProductType();
		List<ProductType> secondType = getSecondProductType();
		List<ProductType> thirdType = getThirdProductType();

		// 指定显示分类
		if (include != null && include.length > 0)
			for (int i = 0; i < firstType.size(); i++)
			{

				for (String j :  include)
				{
					if (firstType.get(i).getPtcode().equals(j))
						realFirst.add(firstType.get(i));
				}

			}
		else
			realFirst = firstType;
		
		for (ProductType first : realFirst)
		{
			Map<String,Object> showMap = new HashMap<String,Object>();
			List<Map<String,Object>> secList = new ArrayList<Map<String,Object>>();

			// 添加显示的一级分类信息
			showMap.put("cur", first);
			showMap.put("sub", secList);
			showList.add(showMap);

			for (ProductType sec : secondType)
			{
				Map<String,Object> secMap = new HashMap<String,Object>();
				List<Map<String,Object>> thirdList = new ArrayList<Map<String,Object>>();

				secMap.put("cur", sec);
				secMap.put("sub", thirdList);

				if (first.getPtid() == sec.getPtparentid())
				{
					// 添加显示的二级分类信息
					secList.add(secMap);

					for (ProductType third : thirdType)
					{
						Map<String,Object> thirdMap = new HashMap<String,Object>();
						thirdMap.put("cur", third);

						if (sec.getPtid() == third.getPtparentid())
						{
							thirdList.add(thirdMap);
						}
					}
				}
			}
		}
		return showList;
	}
}
