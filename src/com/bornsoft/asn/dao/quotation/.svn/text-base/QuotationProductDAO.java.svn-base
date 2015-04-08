/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bornsoft.asn.dao.quotation;

import com.bornsoft.asn.bean.quotation.QuotationProduct;
import com.bornsoft.asn.utils.common.sqlMapFactory;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;

/**
 * 行情产品
 * @author hooxin
 */
@SuppressWarnings({"unchecked","rawtypes"})
public class QuotationProductDAO {
    public static List<QuotationProduct> get(Map m) throws Exception {
        try{
            return sqlMapFactory.getSqlMap().queryForList("getQuoProduct", m);
        }catch(Exception e){
            Logger log = Logger.getLogger(QuotationProductDAO.class);
            log.error("行情产品 获取列表出错 DAO", e);
            throw e;
        }
    }

    public static Integer count(Map m) throws Exception{
    	try {
			return (Integer)sqlMapFactory.getSqlMap().queryForObject("getQuoProductCount", m);
		} catch (Exception e) {
			Logger log = Logger.getLogger(QuotationProductDAO.class);
			log.error(e);
			throw e;
		}
    }
    
    public static void insert(QuotationProduct qp) throws Exception {
        try{
            sqlMapFactory.getSqlMap().insert("addQuoProduct", qp);
        }catch(Exception e){
            Logger log = Logger.getLogger(QuotationProductDAO.class);
            log.error("行情产品 插入出错 DAO", e);
            throw e;
        }
    }

    public static void update(QuotationProduct qp) throws Exception {
        try{
            sqlMapFactory.getSqlMap().update("updateQuoProduct", qp);
        }catch(Exception e){
            Logger log = Logger.getLogger(QuotationProductDAO.class);
            log.error("行情产品 修改出错 DAO", e);
            throw e;
        }
    }

    public static void delete(int quotationProductCode) throws Exception {
        try{
            sqlMapFactory.getSqlMap().delete("delQuoProduct", quotationProductCode);
        }catch(Exception e){
            Logger log = Logger.getLogger(QuotationProductDAO.class);
            log.error("行情产品 删除出错 DAO", e);
            throw e;
        }
    }
}
