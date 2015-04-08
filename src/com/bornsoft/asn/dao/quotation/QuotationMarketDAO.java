/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bornsoft.asn.dao.quotation;

import com.bornsoft.asn.bean.quotation.QuotationMarket;
import com.bornsoft.asn.utils.common.sqlMapFactory;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;

/**
 * 行情市场
 * @author hooxin
 */
@SuppressWarnings({"unchecked","rawtypes"})
public class QuotationMarketDAO {
    public static void insert(QuotationMarket qm) throws Exception{
        try{
            sqlMapFactory.getSqlMap().insert("addMarket", qm);
        }catch(Exception e){
            Logger log = Logger.getLogger(QuotationMarketDAO.class);
            log.error("行情市场 添加出错 DAO", e);
            throw e;
        }
    }

    public static void delete(int marketCode) throws Exception{
        try{
            sqlMapFactory.getSqlMap().delete("delMarket", marketCode);
        }catch(Exception e){
            Logger log = Logger.getLogger(QuotationMarketDAO.class);
            log.error("行情市场 删除出错 DAO", e);
            throw e;
        }
    }

    public static void update(QuotationMarket qm) throws Exception {
        try{
            sqlMapFactory.getSqlMap().update("updateMarket", qm);
        }catch(Exception e){
            Logger log = Logger.getLogger(QuotationMarketDAO.class);
            log.error("行情市场 修改出错 DAO", e);
            throw e;
        }
    }

    public static List<QuotationMarket> get(Map m) throws Exception {
        try{
            return sqlMapFactory.getSqlMap().queryForList("getMarket", m);
        }catch(Exception e){
            Logger log = Logger.getLogger(QuotationMarketDAO.class);
            log.error("行情市场 获取列表出错 DAO", e);
            throw e;
        }
    }
    
    public static Integer count(Map m) throws Exception{
    	try {
			return (Integer)sqlMapFactory.getSqlMap().queryForObject("getMarketCount", m);
		} catch (Exception e) {
			Logger log = Logger.getLogger(QuotationMarketDAO.class);
			log.error(e);
			throw e;
		}
    }
}
