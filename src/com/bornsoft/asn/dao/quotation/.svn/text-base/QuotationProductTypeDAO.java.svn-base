/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bornsoft.asn.dao.quotation;

import com.bornsoft.asn.bean.quotation.QuotationProduct;
import com.bornsoft.asn.bean.quotation.QuotationProductType;
import com.bornsoft.asn.utils.common.sqlMapFactory;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;

/**
 * 行情产品类型DAO
 * @author hooxin
 */
@SuppressWarnings({"unchecked"})
public class QuotationProductTypeDAO {
    public static List<QuotationProductType> get(Map m) throws Exception {
        try{
            return sqlMapFactory.getSqlMap().queryForList("getQuoPT", m);
        }catch(Exception e){
            Logger log = Logger.getLogger(QuotationProductTypeDAO.class);
            log.error("行情产品类型 获取列表出错 DAO", e);
            throw e;
        }
    }

    public static void insert(QuotationProductType qp) throws Exception {
        try{
            sqlMapFactory.getSqlMap().insert("addQuoPT", qp);
        }catch(Exception e){
            Logger log = Logger.getLogger(QuotationProductTypeDAO.class);
            log.error("行情产品类型 插入出错 DAO", e);
            throw e;
        }
    }

    public static void update(QuotationProductType qp) throws Exception {
        try{
            sqlMapFactory.getSqlMap().update("updateQuoPT", qp);
        }catch(Exception e){
            Logger log = Logger.getLogger(QuotationProductDAO.class);
            log.error("行情产品类型 修改出错 DAO", e);
            throw e;
        }
    }

    public static void delete(int quotationPTCode) throws Exception {
        try{
            sqlMapFactory.getSqlMap().delete("delQuoPT", quotationPTCode);
        }catch(Exception e){
            Logger log = Logger.getLogger(QuotationProductTypeDAO.class);
            log.error("行情产品类型 删除出错 DAO", e);
            throw e;
        }
    }
}
