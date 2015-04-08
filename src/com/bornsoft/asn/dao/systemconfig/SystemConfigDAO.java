package com.bornsoft.asn.dao.systemconfig;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.systemconfig.SystemConfig;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class SystemConfigDAO {
	/**
	 * 修改一个系统配置
	 * @param config 要修改的系统配置
	 * @throws SQLException
	 */
	public static void update(SystemConfig config) throws SQLException {
		try{
			sqlMapFactory.getSqlMap().update("updateConfig", config);
		}catch (Exception e) {
			Logger log = Logger.getLogger(SystemConfigDAO.class);
			log.error(" 修改一个系统配置 出错 DAO", e);
			throw new SQLException(" 修改一个系统配置 出错 DAO", e);
		}
	}
	
	/**
	 * 得到所有系统配置
	 * @return
	 * @throws SQLException
	 */
	public static List<SystemConfig> get() throws SQLException {
		try{
			return (List<SystemConfig>)sqlMapFactory.getSqlMap().queryForList("getAllConfigs");
		}catch (Exception e) {
			Logger log = Logger.getLogger(SystemConfigDAO.class);
			log.error("得到系统配置列表出错 DAO", e);
			throw new SQLException("得到系统配置列表出错 DAO", e);
		}
	}
	
	/**
	 * 得到一个系统配置,通过配置ID
	 * @param configId 配置ID
	 * @return
	 * @throws SQLException
	 */
	public static SystemConfig get(String configId) throws SQLException {
		try{
			return (SystemConfig)sqlMapFactory.getSqlMap().queryForObject("getConfigByconfigId", configId);
		}catch (Exception e) {
			Logger log = Logger.getLogger(SystemConfigDAO.class);
			log.error("得到一个系统配置 出错 DAO", e);
			throw new SQLException("得到一个系统配置 出错 DAO", e);
		}
	}
	@SuppressWarnings("unchecked")
	public static List<SystemConfig> get(Map m) throws SQLException {
		return (List<SystemConfig>)sqlMapFactory.getSqlMap().queryForList("getConfigByMAP", m);
	}
	
}
