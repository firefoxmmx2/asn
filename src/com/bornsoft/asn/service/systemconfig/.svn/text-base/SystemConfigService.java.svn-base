package com.bornsoft.asn.service.systemconfig;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.systemconfig.SystemConfig;
import com.bornsoft.asn.dao.systemconfig.SystemConfigDAO;
import com.bornsoft.asn.exception.ActionException;
import com.bornsoft.asn.utils.common.sqlMapFactory;

/**
 * 
 * 系统配置服务
 * @author hooxin
 *
 */
public class SystemConfigService {
	/**
	 * 修改一个系统配置
	 * @param config 一个新的配置
	 * @throws Exception
	 */
	public static void update(SystemConfig config) throws Exception{
		try{
			if(config.getConfigId() == null)
				throw new Exception("系统配置ID为空值");
			if(config.getItemName() == null)
				throw new Exception("系统配置名称为空值");
			if(config.getItemValue() == null)
				throw new Exception("系统配置值字段为空值");
			
			sqlMapFactory.getSqlMap().startTransaction();
			SystemConfigDAO.update(config);
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			Logger log = Logger.getLogger(SystemConfigService.class);
			log.error("得到所有系统配置 出错 SERVICE", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	/**
	 * 
	 * 得到所有系统配置
	 * @return
	 * @throws Exception
	 */
	public static List<SystemConfig> getAllSystemConfig() throws Exception {
		try{
			return SystemConfigDAO.get();
		}catch (Exception e) {
			Logger log = Logger.getLogger(SystemConfigService.class);
			log.error("得到所有系统配置 出错 SERVICE", e);
			throw e;
		}
	}
	
	/**
	 * 得到系统配置，通过ID
	 * @param configId 配置ID
	 * @return
	 * @throws Exception
	 */
	public static SystemConfig getSystemConfigByID(String configId) throws Exception {
		try{
			return SystemConfigDAO.get(configId);
		}catch (Exception e) {
			Logger log = Logger.getLogger(SystemConfigService.class);
			log.error("得到系统配置 出错 SERVICE", e);
			throw e;
		}
	}
	@SuppressWarnings("unchecked")
	public static List<SystemConfig> getSystemConfigByGroup(String group) throws Exception{
		Map m = new HashMap();
		if(group == null)
			throw new ActionException("分组名称为空");
		else
			m.put("groupName", group);
		return SystemConfigDAO.get(m);
	}
}
