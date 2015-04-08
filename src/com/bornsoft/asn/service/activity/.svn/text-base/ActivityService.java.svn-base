package com.bornsoft.asn.service.activity;

import java.util.List;

import org.apache.log4j.Logger;

import com.bornsoft.asn.dao.activity.ActivityDao;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class ActivityService { 
	public static final Logger log=Logger.getLogger(ActivityService.class);
	public static List getSecKillActivity() throws Exception{
		log.debug("getSecKillActivity start..");
		try {
			List list = ActivityDao.getSecKillActivity();
			
			log.debug("getSecKillActivity finished..");
			return list;
		} catch(Exception e){
			log.error("search Activity error", e);
			throw e;			
		}
	}

}
