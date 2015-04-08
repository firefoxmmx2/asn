package com.bornsoft.asn.service.license;

import java.util.List;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.license.License;
import com.bornsoft.asn.dao.license.LicenseDao;
import com.bornsoft.asn.service.advert.AdvertService;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class LicenseService {
	public static final Logger log = Logger.getLogger(LicenseService.class);
	/*****
	 * @author cl
	 * @discription 根据memberID查询 银行信息
	 * @date 2010-03-08 
	 * ***/
	public static List<License> getLicenseById(long memberID) throws Exception{
		log.debug("getLicenseById starts ....");
		try{
			List<License> list = LicenseDao.getLicenseByid(memberID);
			
			log.debug("getLicenseById finished ....");
			return list;
		}catch(Exception e){
			log.error("search error",e);
			throw e;
		}
	}
	/*****
	 * @author cl
	 * @discription 根据ID 删除证件信息
	 * @date 2010-03-11 
	 * ***/
	public static void delLicenseById(long licenseid)throws Exception{
		log.debug("delLicenseById starts ....");
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			LicenseDao.delLicenseById(licenseid);
			sqlMapFactory.getSqlMap().commitTransaction();
			
			log.debug("delLicenseById finished ....");
		}catch(Exception e){
			log.error("删除证件信息出错",e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}

}
