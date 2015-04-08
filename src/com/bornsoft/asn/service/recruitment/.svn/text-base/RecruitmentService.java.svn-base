package com.bornsoft.asn.service.recruitment;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.recruitment.Recruitment;
import com.bornsoft.asn.dao.information.InfoDao;
import com.bornsoft.asn.dao.recruitment.RecruitmentDao;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class RecruitmentService {
	public static void insertRecruitment(Recruitment r)throws Exception{
		RecruitmentDao.insertRecruitment(r);
	}
	public static Integer getRecruitmentListCount(String jobName,Integer belongTo,String status)throws Exception{
		HashMap m=new HashMap();
		if(jobName!=null&&!jobName.trim().equals("")){
			m.put("jobName", jobName);
		}
		if(belongTo!=null){
			m.put("belongTo", belongTo);
		}
		if(status!=null&&!status.trim().equals("")){
			m.put("status", status);
		}
		return RecruitmentDao.getRecruitmentListCount(m);
	}
	public static List<Recruitment> getRecruitmentList(String jobName,Integer belongTo,String status,int startCount,int endCount)throws Exception{
		HashMap m=new HashMap();
		if(jobName!=null&&!jobName.trim().equals("")){
			m.put("jobName", jobName);
		}
		if(belongTo!=null){
			m.put("belongTo", belongTo);
		}
		if(status!=null&&!status.trim().equals("")){
			m.put("status", status);
		}
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		return RecruitmentDao.getRecruitmentList(m);
	}
	
	public static void setRecruitmentStatus(String[] ids,String status)throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			if(status!=null&&status.trim().equals("1")){
				HashMap m=new HashMap();
				m.put("status", status);
				for(String id:ids){
					m.put("id", id);
					m.put("publishedTime", new Date());
					RecruitmentDao.setRecruitmentStatus(m);
					RecruitmentDao.setRecruitmentPublishedTime(m);
				}	
			}else{
				HashMap m=new HashMap();
				m.put("status", status);
				for(String id:ids){
					m.put("id", id);
					RecruitmentDao.setRecruitmentStatus(m);
				}	
			}
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			Logger log = Logger.getLogger("RecruitmentService");
			log.info("setRecruitmentStatus出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	public static Recruitment getRecruitmentById(String id) throws Exception {
		return RecruitmentDao.getRecruitmentById(id);
	}
	public static void updateRecruitment(Recruitment recruitment) throws Exception {
		RecruitmentDao.updateRecruitment(recruitment);
	}
}
