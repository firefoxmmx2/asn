package com.bornsoft.asn.service.advert;

import java.io.File;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.advert.Advert;
import com.bornsoft.asn.bean.advert.proposerAdvert;
import com.bornsoft.asn.dao.advert.AdvertDao;
import com.bornsoft.asn.dao.advert.ProposerAdvertDao;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.utils.common.ImageSize;
import com.bornsoft.asn.utils.common.sqlMapFactory;
import com.bornsoft.asn.utils.common.AsnConstLib.advertHandleStatus;
import com.bornsoft.asn.utils.common.AsnConstLib.advertStatus;

public class AdvertService {
	public static final Logger log = Logger.getLogger(AdvertService.class);
	public static String insertAdvert(Advert advert,File advertPic)throws Exception{
		String[] picPaths = new String[]{"",""};
		if(advertPic != null){
			picPaths=ImageSize.drawImage(advertPic);
		}
		
		log.debug("insertAdvert starts ...");
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			
			advert.setAdvertId(IdMakerService.newId("advertId"));
			advert.setPicPath(picPaths[1]);
			advert.setCreateName(MemberService.getMember().getFullName());
			advert.setCreateTime(new Date());
			advert.setStatus(advertStatus.N);
			advert.setHandleStatus(advertHandleStatus.N);
			
			AdvertDao.insertAdvert(advert);
			sqlMapFactory.getSqlMap().commitTransaction();
			log.debug("insertAdvert finished ...");
			return "success";
		}catch(Exception e){
			log.error("insert advert error", e);
			throw e;			
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	/****
	 * search list
	 * **/
	public static List<Advert> listAdvert(Map m)throws Exception{
		log.debug("listAdvert starts ...");
		try{
			List<Advert> list = AdvertDao.listAdvert(m);
			
			log.debug("listAdvert finished ...");
			return list;
		}catch(Exception e){
			log.error("search advert list error", e);
			throw e;
		}
	}
	
	/****
	 * count
	 * **/
	public static Integer getAdvertCount(Map m) throws Exception{
		int count;
		log.debug("getAdvertCount starts ...");
		try{
			count = AdvertDao.getAdvertCount(m);
			
			log.debug("getAdvertCount finished ...");
			return count;
		}catch(Exception e){
			log.error("search advert count error", e);
			throw e;
		}
	} 
	
	/****
	 * update status
	 * **/
	public static void updAdvertStatus(Map m) throws Exception{
		log.debug("updAdvertCount starts ...");
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			AdvertDao.updAdvertStatus(m);
			sqlMapFactory.getSqlMap().commitTransaction();
			
			log.debug("updAdvertCount finished ...");
		}catch(Exception e){
			log.error("update advert's status error", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}	
	}
	
	/****
	 * update status
	 * **/
	public static void updAdvertHandleStatus(Map m) throws Exception{
		log.debug("updAdvertHandleStatus starts ...");
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			AdvertDao.updateAdvertHandleStatus(m);
			sqlMapFactory.getSqlMap().commitTransaction();
			
			log.debug("updAdvertHandleStatus finished ...");
		}catch(Exception e){
			log.error("update advert's status error", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}	
	}
	
	/****
	 * update status
	 * **/
	public static Advert getAdvertById(Long id) throws Exception{
		log.debug("getAdvertById starts ...");
		try{
			Advert advert = AdvertDao.getAdvertById(id);
			
			log.debug("getAdvertById finished ...");
			return advert;
		}catch(Exception e){
			log.error("update advert's status error", e);
			throw e;
		}
	}
	
	
	/****
	 * update status
	 * **/
	public static List<proposerAdvert> getPropoerAdvertById(Long id) throws Exception{
		log.debug("getPropoerAdvertById starts ....");
		try{
			List<proposerAdvert> pro = ProposerAdvertDao.getProposerAdvertById(id);
			
			log.debug("getPropoerAdvertById finished ....");
			return pro;
		}catch(Exception e){
			log.error("update advert's status error", e);
			throw e;
		}
	}

	public static String updateAdvert(Advert advert,File advertPic)throws Exception{
		String[] picPaths = new String[]{"",""};
		if(advertPic != null){
			picPaths=ImageSize.drawImage(advertPic);
		}
		
		log.debug("updateAdvert starts ....");
		try{
			sqlMapFactory.getSqlMap().startTransaction();			
			
			advert.setPicPath(picPaths[1]);			
			AdvertDao.updateAdvert(advert);
			sqlMapFactory.getSqlMap().commitTransaction();
			
			log.debug("updateAdvert finifshed ....");
			return "success";
		}catch(Exception e){
			log.error("insert advert error", e);
			throw e;			
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
}
