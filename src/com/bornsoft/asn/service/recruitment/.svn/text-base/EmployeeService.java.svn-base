package com.bornsoft.asn.service.recruitment;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.recruitment.Edu;
import com.bornsoft.asn.bean.recruitment.Employee;
import com.bornsoft.asn.bean.recruitment.Experience;
import com.bornsoft.asn.bean.recruitment.Purpose;
import com.bornsoft.asn.dao.recruitment.EduDao;
import com.bornsoft.asn.dao.recruitment.EmployeeDao;
import com.bornsoft.asn.dao.recruitment.ExperienceDao;
import com.bornsoft.asn.dao.recruitment.PurposeDao;
import com.bornsoft.asn.dao.recruitment.RecruitmentDao;
import com.bornsoft.asn.utils.common.ImageSize;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class EmployeeService {
	public static void insertEmployee(Employee em,Edu ed,Experience ex,Purpose p)throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			EmployeeDao.insertEmployee(em);
			EduDao.insertEmployee(ed);
			ExperienceDao.insertExperience(ex);
			PurposeDao.insertPurpose(p);
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			Logger log = Logger.getLogger("EmployeeService");
			log.info("insertEmployee出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	public static void insertEmployee(Employee em,Edu ed,Experience ex,Purpose p,File photo)throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			if(photo!=null){
				String path=ImageSize.drawOriginalPic(photo, "asn.recruitment.picPath");
				em.setPhotoPath(path);
			}
			EmployeeDao.insertEmployee(em);
			EduDao.insertEmployee(ed);
			ExperienceDao.insertExperience(ex);
			PurposeDao.insertPurpose(p);
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			Logger log = Logger.getLogger("EmployeeService");
			log.info("insertEmployee出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	public static List<Employee> getEmployeeList(String jobId,int startCount,int endCount,String status)throws Exception{
		HashMap m=new HashMap();
		m.put("jobId", jobId);
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		m.put("isUse", status);
		return EmployeeDao.getEmployeeList(m);
	}
	
	public static Integer getEmployeeListCount(String jobId,String status)throws Exception{
		HashMap m=new HashMap();
		m.put("jobId", jobId);
		m.put("isUse", status);
		return EmployeeDao.getEmployeeListCount(m);
	}

	public static void deleteEmployee(String[] strings) throws Exception {
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			for(String id:strings){
				EduDao.deleteEduByEid(id);
				ExperienceDao.deleteExperienceByEid(id);
				PurposeDao.deletePurposeByEid(id);
				EmployeeDao.deleteEmployeeById(id);
			}
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			Logger log = Logger.getLogger("EmployeeService");
			log.info("deleteEmployee出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
		
	}

	public static Map<String,Object> getEmployById(String eid)throws Exception {
		Map<String,Object> m=new HashMap<String,Object>();
		Employee e=EmployeeDao.getEmployeeById(eid);
		Edu edu=EduDao.getEduByEid(eid);
		Experience ex=ExperienceDao.getExperienceByEid(eid);
		Purpose p=PurposeDao.getPurposeByEid(eid);
		m.put("Employee", e);
		m.put("Edu", edu);
		m.put("Experience", ex);
		m.put("Purpose", p);
		return m;
	}
	
	public static void setEmployeeUse(String id,String status)throws Exception{
		HashMap m=new HashMap();
		m.put("id", id);
		m.put("isUse", status);
		EmployeeDao.setEmployeeUse(m);
	}
}
