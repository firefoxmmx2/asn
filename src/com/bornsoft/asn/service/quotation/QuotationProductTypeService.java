/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bornsoft.asn.service.quotation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.quotation.QuotationProductType;
import com.bornsoft.asn.dao.quotation.QuotationProductTypeDAO;
import com.bornsoft.asn.exception.ActionException;
import com.bornsoft.asn.utils.common.sqlMapFactory;

/**
 *
 * @author hooxin
 */
public class QuotationProductTypeService {

    /**
     * 添加行情产品类型
     * @param pt 需要添加的行情产品类型
     * @throws Exception
     */
    public static void addQuoPType(QuotationProductType pt) throws Exception {
        try {
            sqlMapFactory.getSqlMap().startTransaction();
            QuotationProductTypeDAO.insert(pt);
            sqlMapFactory.getSqlMap().commitTransaction();
        } catch (Exception e) {
            Logger log = Logger.getLogger(QuotationService.class);
            log.error("添加行情产品类型 出错 SERVICE", e);
            throw e;
        } finally {
            sqlMapFactory.getSqlMap().endTransaction();
        }
    }

    /**
     * 修改行情产品类型
     * @param pt 需要修改的行情产品类型
     * @throws Exception
     */
    public static void modQuoPType(QuotationProductType pt) throws Exception {
        try {
            sqlMapFactory.getSqlMap().startTransaction();
            QuotationProductTypeDAO.update(pt);
            sqlMapFactory.getSqlMap().commitTransaction();
        } catch (Exception e) {
            Logger log = Logger.getLogger(QuotationService.class);
            log.error("修改行情产品类型 出错 SERVICE", e);
            throw e;
        } finally {
            sqlMapFactory.getSqlMap().endTransaction();
        }
    }

    /**
     * 删除行情产品类型
     * @param quotationPTCode 需要删除的行情产品类型编号
     * @throws Exception
     */
    public static void delQuoPType(int quotationPTCode) throws Exception{
        try {
            sqlMapFactory.getSqlMap().startTransaction();
            QuotationProductTypeDAO.delete(quotationPTCode);
            sqlMapFactory.getSqlMap().commitTransaction();
        } catch (Exception e) {
            Logger log = Logger.getLogger(QuotationService.class);
            log.error("删除行情产品类型 出错 SERVICE", e);
            throw e;
        } finally {
            sqlMapFactory.getSqlMap().endTransaction();
        }
    }

    /**
     * 获取所有行情产品类型
     * @return
     * @throws Exception
     */
    public static List<QuotationProductType> getQuoPType() throws Exception{
    	Map<String,Object> m = new HashMap<String,Object>();
        try{
            return QuotationProductTypeDAO.get(m);
        }catch(Exception e){
            Logger log = Logger.getLogger(QuotationService.class);
            log.error("获取所有行情产品类型 出错 SERVICE", e);
            throw e;
        }
    }

    /**
     * 获取行情产品类型通过类型名称
     * @param quoPTName 类型名称
     * @return
     * @throws Exception
     */
    public static QuotationProductType getQuoPType(String quoPTName) throws Exception{
    	Map<String,Object> m = new HashMap<String,Object>();

        try{
            if(quoPTName == null || quoPTName.trim().length() == 0)
                throw new NullPointerException("行情产品类型名称为空");
            else
                m.put("quotationPTName", m);
            return QuotationProductTypeDAO.get(m).get(0);
        }catch(Exception e){
            Logger log = Logger.getLogger(QuotationService.class);
            log.error("获取行情产品类型通过类型名称 出错 SERVICE", e);
            throw e;
        }
    }


	/**
	 * 获取行情产品类型通过产品类型编号
	 * @param quotationPTypeCode 产品类型编号
	 * @return
	 */
	public static QuotationProductType getQuoPType(Integer quotationPTypeCode) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object> m = new HashMap<String,Object>();
		try {
			if(quotationPTypeCode == null)
				throw new ActionException("行情产品类型编号为空");
			else
				m.put("quotationPTypeCode", quotationPTypeCode);
			return QuotationProductTypeDAO.get(m).get(0);
		} catch (Exception e) {
			Logger log = Logger.getLogger(QuotationProductTypeService.class);
			log.error("获取行情产品类型通过产品类型编号 出错 SERVICE",e);
			throw e;
		}
	}

	/**
	 * 
	 * 查询行情产品类型
	 * @param quoPTypeCode 行情产品类型编号
	 * @param quoPTName 行情产品类型名称
	 * @return
	 * @throws Exception
	 */
	public static List<QuotationProductType> findQuoPdtType(int quoPTypeCode,String quoPTName) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		
		try
		{
			if(quoPTypeCode == 0x0)
				map.put("quotationPTypeCode",quoPTypeCode);
			if(quoPTName != null)
				map.put("quotationPTName",quoPTName);
			
			return QuotationProductTypeDAO.get(map);
		}
		catch (Exception e)
		{
			// TODO: handle exception
			Logger log = Logger.getLogger(QuotationProductTypeService.class);
			log.error(e);
			throw e;
		}
	}
}
