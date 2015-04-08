package com.bornsoft.asn.dao.license;

import java.sql.SQLException;
import java.util.List;

import com.bornsoft.asn.bean.license.License;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class LicenseDao {
	
	public static void insertLicense(License license) throws SQLException{
		sqlMapFactory.getSqlMap().insert("addLicense", license);
	}
	
	/*****
	 * @author cl
	 * @discription 根据memberID查询 证件信息
	 * @date 2010-03-08 
	 * ***/
	public static List<License> getLicenseByid(long memberID)throws SQLException{
		return sqlMapFactory.getSqlMap().queryForList("getLicenseById",memberID);
	}
	/*****
	 * @author cl
	 * @discription 修改证件信息
	 * @date 2010-03-08 
	 * ***/
	public static void updateLicense(License license)throws SQLException{
		sqlMapFactory.getSqlMap().update("updateLicense", license);
	}
	
	/*****
	 * @author cl
	 * @discription 根据ID 删除证件信息
	 * @date 2010-03-11 
	 * ***/
	public static void delLicenseById(long licenseid)throws Exception{
		sqlMapFactory.getSqlMap().delete("delLicenseById",licenseid);
	}
	
	/*****
	 * @author cl
	 * @discription 根据会员ID 删除证件信息
	 * @date 2010-03-11 
	 * ***/
	public static void delLicenseByMemberId(long memberid)throws Exception{
		sqlMapFactory.getSqlMap().delete("delLicense",memberid);
	}
}
