/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bornsoft.asn.service.quotation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.quotation.QuotationMarket;
import com.bornsoft.asn.dao.quotation.QuotationMarketDAO;
import com.bornsoft.asn.exception.ActionException;
import com.bornsoft.asn.utils.common.sqlMapFactory;

/**
 * @author hooxin
 */
@SuppressWarnings({ "unchecked", "rawtypes" })
public class QuotationMarketService
{
	/***
	 * 添加行情市场
	 * 
	 * @param qm
	 *            需要添加行情市场
	 */
	public static void addMarket(QuotationMarket qm) throws Exception
	{
		try
		{
			sqlMapFactory.getSqlMap().startTransaction();
			QuotationMarketDAO.insert(qm);
			sqlMapFactory.getSqlMap().commitTransaction();
		}
		catch (Exception e)
		{
			Logger log = Logger.getLogger(QuotationService.class);
			log.error("添加行情市场 出错 SERVICE", e);
			throw e;
		}
		finally
		{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}

	/**
	 * 修改行情市场信息
	 * 
	 * @param qm
	 *            需要修改的行情市场信息
	 * @throws Exception
	 */
	public static void modMarket(QuotationMarket qm) throws Exception
	{
		try
		{
			sqlMapFactory.getSqlMap().startTransaction();
			QuotationMarketDAO.update(qm);
			sqlMapFactory.getSqlMap().commitTransaction();
		}
		catch (Exception e)
		{
			Logger log = Logger.getLogger(QuotationService.class);
			log.error("添加行情市场 出错 SERVICE", e);
			throw e;
		}
		finally
		{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}

	/**
	 * 删除市场信息
	 * 
	 * @param qm
	 *            需要删除的市场信息
	 * @throws Exception
	 */
	public static void delMarket(int qmcd) throws Exception
	{
		try
		{
			sqlMapFactory.getSqlMap().startTransaction();
			QuotationMarketDAO.delete(qmcd);
			sqlMapFactory.getSqlMap().commitTransaction();
		}
		catch (Exception e)
		{
			Logger log = Logger.getLogger(QuotationService.class);
			log.error("删除市场信息 出错 SERVICE", e);
			throw e;
		}
		finally
		{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}

	/**
	 * 获取市场信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public static List<QuotationMarket> getMarket() throws Exception
	{
		Map m = new HashMap();
		try
		{
			return QuotationMarketDAO.get(m);
		}
		catch (Exception e)
		{
			Logger log = Logger.getLogger(QuotationService.class);
			log.error("获取市场信息 出错 SERVICE", e);
			throw e;
		}
	}

	public static QuotationMarket getMarket(Integer marketCode)
			throws Exception
	{
		Map m = new HashMap();
		try
		{
			if (marketCode == null)
				throw new ActionException("行情市场编号为空");
			else
				m.put("marketCode", marketCode);
			return QuotationMarketDAO.get(m).get(0);
		}
		catch (Exception e)
		{
			Logger log = Logger.getLogger(QuotationMarketService.class);
			log.error("获取市场信息 出错 SERVICE");
			throw e;
		}
	}

	/**
	 * 根据条件查找
	 * 
	 * @param marketCode
	 *            市场编号
	 * @param marketName
	 *            市场名称
	 * @param area
	 *            地区
	 * @return
	 */
	public static List<QuotationMarket> findMarket(
			Integer start, Integer end, Integer marketCode, String marketName,
			String area) throws Exception
	{

		Map m = new HashMap();

		try
		{
			if (start != null)
				m.put("start", start);

			if (end != null)
				m.put("end", end);

			if (marketCode != null)
				m.put("marketCode", marketCode);
			if (marketName != null)
				m.put("marketName", marketName);
			if (area != null)
				m.put("area", area);

			return QuotationMarketDAO.get(m);
		}
		catch (Exception e)
		{
			Logger log = Logger.getLogger(QuotationProductService.class);
			log.error(e);
			throw e;
		}
	}

	/**
	 * 获得查询记录数
	 * 
	 * @param marketCode
	 *            市场编号
	 * @param marketName
	 *            市场名称
	 * @param area
	 *            地区
	 * @return
	 * @throws Exception
	 */
	public static Integer findMarketCount(
			Integer marketCode, String marketName, String area)
			throws Exception
	{
		Map m = new HashMap();

		try
		{
			if (marketCode != null)
				m.put("marketCode", marketCode);
			if (marketName != null)
				m.put("marketName", marketName);
			if (area != null)
				m.put("area", area);
			return QuotationMarketDAO.count(m);
		}
		catch (Exception e)
		{
			Logger log = Logger.getLogger(QuotationMarketDAO.class);
			log.error(e);
			throw e;
		}
	}
}
