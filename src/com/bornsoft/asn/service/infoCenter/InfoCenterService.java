package com.bornsoft.asn.service.infoCenter;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.infoCenter.InfoCenter;
import com.bornsoft.asn.dao.infoCenter.InfoCenterDao;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class InfoCenterService {
	
	public static void insertInfoCenter(InfoCenter info)throws Exception{
		InfoCenterDao.insertInfoCenter(info);
	}
	
	public static void deleteInfoCenter(String[] ids)throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			for(String id:ids){
				InfoCenterDao.deleteInfoCenterById(id);
			}	
			sqlMapFactory.getSqlMap().commitTransaction();
			}catch (Exception e) {
				Logger log = Logger.getLogger("InfoCenterService");
				log.info("deleteInfoCenter出错", e);
				sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
				throw e;
			}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	public static void updateInfoCenter(InfoCenter info)throws Exception{
		InfoCenterDao.updateInfoCenter(info);
	}
	
	public static InfoCenter getInfoCenterById(String id)throws Exception{
		return InfoCenterDao.getInfoCenterById(id);
	}
	
	public static List<InfoCenter> getInfoCenterList(String title,String status,String type,Long createMan,int startCount,int endCount)throws Exception{
		HashMap m=new HashMap();
		if(title!=null&&!title.trim().equals("")){
			m.put("title", title);
		}
		if(status!=null&&!status.trim().equals("")){
			m.put("status", status);
		}
		if(type!=null&&!type.trim().equals("")){
			m.put("type", type);
		}
		if(createMan!=null){
			m.put("createMan", createMan);
		}
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		return InfoCenterDao.getInfoList(m);
	}
	
	public static Integer getInfoListCount (String title,String status,String type,Long createMan)throws Exception{
		HashMap m=new HashMap();
		if(title!=null&&!title.trim().equals("")){
			m.put("title", title);
		}
		if(status!=null&&!status.trim().equals("")){
			m.put("status", status);
		}
		if(type!=null&&!type.trim().equals("")){
			m.put("type", type);
		}
		if(createMan!=null){
			m.put("createMan", createMan);
		}
		return InfoCenterDao.getInfoListCount(m);
	}
	
	public static void setInfoCenterStatus(String[] ids,String status)throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			HashMap m=new HashMap();
			if(status!=null&&!status.trim().equals("")){
				m.put("status", status);
				for(String id:ids){
					m.put("id", id);
					InfoCenterDao.setInfoCenterStatus(m);
				}
			}
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			Logger log = Logger.getLogger("InfoCenterService");
			log.info("setInfoCenterStatus出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
}
