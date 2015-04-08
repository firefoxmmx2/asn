package com.bornsoft.asn.service.advert;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.advert.Advert;
import com.bornsoft.asn.bean.advert.proposerAdvert;
import com.bornsoft.asn.dao.advert.AdvertDao;
import com.bornsoft.asn.dao.advert.ProposerAdvertDao;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class ProposerAdvertService {
	public static final Logger log = Logger.getLogger(ProposerAdvertService.class);
	/****
	 * search list
	 * **/
	public static List<Advert> listAdvert(Map m)throws Exception{
		log.debug("listAdvert starts ....");
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			List<Advert> list = ProposerAdvertDao.listAdvert(m);
			sqlMapFactory.getSqlMap().commitTransaction();
			
			log.debug("listAdvert finished ...");
			return list;
		}catch(Exception e){
			log.error("search advert list error", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	/****
	 * count
	 * **/
	public static Integer getAdvertCount(Map m) throws Exception{
		int count;
		log.debug("getAdvertCount starts ....");
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			count = ProposerAdvertDao.getAdvertCount(m);
			sqlMapFactory.getSqlMap().commitTransaction();
			
			log.debug("getAdvertCount finished ....");
			return count;
		}catch(Exception e){
			log.error("search advert count error", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	} 
	
	/****
	 * insert
	 * **/
	public static void insertProposerAdvert(proposerAdvert p)throws Exception{
		log.debug("insertProposerAdvert starts ....");
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			ProposerAdvertDao.insertProposerAdvert(p);
			sqlMapFactory.getSqlMap().commitTransaction();
			
			log.debug("insertProposerAdvert finished ....");
		}catch(Exception e){
			log.error("search advert list error", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	/****
	 * update status
	 * **/
	public static void updateStatus(Map m)throws Exception{
		log.debug("updateStatus starts ....");
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			ProposerAdvertDao.updateStatus(m);
			sqlMapFactory.getSqlMap().commitTransaction();
			
			log.debug("updateStatus finished ....");
		}catch(Exception e){
			log.error("update proposeradvert status error", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	/****
	 * update status
	 * **/
	public static proposerAdvert getProposerAdvertById(Map m)throws Exception{
		log.debug("getProposerAdvertById starts .....");
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			proposerAdvert pro = ProposerAdvertDao.getProposerAdvertById(m);
			sqlMapFactory.getSqlMap().commitTransaction();
			
			log.debug("getProposerAdvertById finished ....");
			return pro;
		}catch(Exception e){
			log.error("get proposeradvert status error", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}

}
