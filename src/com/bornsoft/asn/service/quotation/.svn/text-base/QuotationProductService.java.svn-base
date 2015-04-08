/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bornsoft.asn.service.quotation;

import com.bornsoft.asn.bean.quotation.QuotationProduct;
import com.bornsoft.asn.dao.quotation.QuotationProductDAO;
import com.bornsoft.asn.exception.ActionException;
import com.bornsoft.asn.utils.common.sqlMapFactory;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;

/**
 * 
 * @author hooxin
 */
@SuppressWarnings({ "unchecked", "rawtypes" })
public class QuotationProductService {
	/**
	 * 添加行情统计产品信息
	 * 
	 * @param qp
	 *            需要添加的行情统计产品信息
	 * @throws Exception
	 */
	public static void addQuoProduct(QuotationProduct qp) throws Exception {
		try {
			sqlMapFactory.getSqlMap().startTransaction();
			QuotationProductDAO.insert(qp);
			sqlMapFactory.getSqlMap().commitTransaction();
		} catch (Exception e) {
			Logger log = Logger.getLogger(QuotationService.class);
			log.error("添加行情统计产品信息 出错 SERVICE", e);
			throw e;
		} finally {
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}

	/**
	 * 修改行情统计产品信息
	 * 
	 * @param qp
	 *            需要修改的行情统计产品信息
	 * @throws Exception
	 */
	public static void modQuoProduct(QuotationProduct qp) throws Exception {
		try {
			sqlMapFactory.getSqlMap().startTransaction();
			QuotationProductDAO.update(qp);
			sqlMapFactory.getSqlMap().commitTransaction();
		} catch (Exception e) {
			Logger log = Logger.getLogger(QuotationService.class);
			log.error("修改行情统计产品信息 出错 SERVICE", e);
			throw e;
		} finally {
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}

	/**
	 * 删除行情统计产品信息
	 * 
	 * @param qp
	 *            需要删除的行情统计产品信息
	 * @throws Exception
	 */
	public static void delQuoProduct(int qpCode) throws Exception {
		try {
			sqlMapFactory.getSqlMap().startTransaction();
			QuotationProductDAO.delete(qpCode);
			sqlMapFactory.getSqlMap().commitTransaction();
		} catch (Exception e) {
			Logger log = Logger.getLogger(QuotationService.class);
			log.error("删除行情统计产品信息 出错 SERVICE", e);
			throw e;
		} finally {
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}

	/**
	 * 获取所有产品(默认按照使用率排序)
	 * 
	 * @return
	 * @throws Exception
	 */
	public static List<QuotationProduct> getQuoProduct() throws Exception {
		Map m = new HashMap();
		try {
			return QuotationProductDAO.get(m);
		} catch (Exception e) {
			Logger log = Logger.getLogger(QuotationProductService.class);
			log.error("获取行情产品  出错 SERVICE ", e);
			throw e;
		}
	}

	/**
	 * 获取行情产品通过产品名称或者别名
	 * 
	 * @param pNameOrAlias
	 *            产品名称或者别名
	 * @return
	 * @throws Exception
	 */
	public static List<QuotationProduct> findQuoProduct(String pNameOrAlias)
			throws Exception {
		Map m = new HashMap();
		try {
			if (pNameOrAlias == null || pNameOrAlias.trim().length() == 0)
				throw new ActionException("行情产品名称或者别名为空");
			else {
				m.put("quotationPName", pNameOrAlias);
				m.put("quotationPNameAlias", pNameOrAlias);
			}
			return QuotationProductDAO.get(m);
		} catch (Exception e) {
			Logger log = Logger.getLogger(QuotationService.class);
			log.error("获取行情产品通过产品名称或者别名 出错 SERVICE", e);
			throw e;
		}
	}

	/**
	 * 
	 * 查找行情产品
	 * @param start 起始记录数	
	 * @param end 终止记录数
	 * @param qProductCode 行情产品编号
	 * @param qProductName 行情产品名称
	 * @param qProductAlias 行情产品别名
	 * @param qPTCode 行情产品类型编号
	 * @return
	 * @throws Exception
	 */
	public static List<QuotationProduct> findQuoProduct(Integer start,
			Integer end, Integer qProductCode, String qProductName,
			String qProductAlias, Integer qPTCode) throws Exception {
		Map m = new HashMap();
		try {
			if (start == null)
				throw new ActionException("起始记录数为空");
			else
				m.put("start", start);
			if (end == null)
				throw new ActionException("终止记录数为空");
			else
				m.put("end", end);
			if (qProductCode != null)
				m.put("quotationPCode", qProductCode);
			if (qProductName != null)
				m.put("quotationPName", qProductName);
			if (qProductAlias != null)
				m.put("quotationPNameAlias", qProductAlias);
			if (qPTCode != null)
				m.put("quotationPTCode", qPTCode);
			return QuotationProductDAO.get(m);
		} catch (Exception e) {
			Logger log = Logger.getLogger(QuotationProductService.class);
			log.error(e);
			throw e;
		}
	}

	/**
	 * 
	 * 获得查找行情产品的记录数
	 * @param qProductCode 行情产品编号
	 * @param qProductName 行情产品名称
	 * @param qProductAlias 行情产品别名
	 * @param qPTCode 行情产品类型编号
	 * @return
	 * @throws Exception
	 */
	public static Integer findQuoProductCount(Integer qProductCode,
			String qProductName, String qProductAlias, Integer qPTCode)
			throws Exception {
		Map m = new HashMap();
		try {
			if (qProductCode != null)
				m.put("quotationPCode", qProductCode);
			if (qProductName != null)
				m.put("quotationPName", qProductName);
			if (qProductAlias != null)
				m.put("quotationPNameAlias", qProductAlias);
			if (qPTCode != null)
				m.put("quotationPTCode", qPTCode);
			return QuotationProductDAO.count(m);
		} catch (Exception e) {
			Logger log = Logger.getLogger(QuotationProductService.class);
			log.error(e);
			throw e;
		}
	}

	/**
	 * 获取行情产品通过产品编号
	 * 
	 * @param quoProdutCode
	 *            行情产品编号
	 * @return
	 * @throws Exception
	 */
	public static QuotationProduct getQuoProduct(Integer quoProdutCode)
			throws Exception {
		Map m = new HashMap();
		try {
			if (quoProdutCode == null)
				throw new ActionException("行情产品编号为空");
			else
				m.put("quotationPCode", quoProdutCode);
			return QuotationProductDAO.get(m).get(0);
		} catch (Exception e) {
			Logger log = Logger.getLogger(QuotationProduct.class);
			log.error("获取行情产品通过产品编号 出错 SERVICE", e);
			throw e;
		}
	}
}
