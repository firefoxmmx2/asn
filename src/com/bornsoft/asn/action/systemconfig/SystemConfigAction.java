package com.bornsoft.asn.action.systemconfig;

import java.util.List;

import com.bornsoft.asn.bean.systemconfig.SystemConfig;
import com.bornsoft.asn.service.systemconfig.SystemConfigService;
import com.bornsoft.asn.utils.common.WebContext;
import com.opensymphony.xwork2.ActionSupport;

public class SystemConfigAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8274680113213041525L;
	//配置列表
	private List<SystemConfig> configList;
	//需操作系统配置信息
	private SystemConfig config;
	//action路径前缀
	private String actionPath = "/admin/sysConfig";
	//页面form路径
	private String formPath = actionPath + "/toView";
	//页面a标签路径
	private String authorPath = null;
	
	public SystemConfigAction(){
		
	}
	public String getAuthorPath() {
		return authorPath;
	}

	public void setAuthorPath(String authorPath) {
		this.authorPath = authorPath;
	}

	public String getFormPath() {
		return formPath;
	}

	public void setFormPath(String formPath) {
		this.formPath = formPath;
	}

	public List<SystemConfig> getConfigList() {
		return configList;
	}

	public void setConfigList(List<SystemConfig> configList) {
		this.configList = configList;
	}

	public String getActionPath() {
		return actionPath;
	}

	public void setActionPath(String actionPath) {
		this.actionPath = actionPath;
	}

	public SystemConfig getConfig() {
		return config;
	}

	public void setConfig(SystemConfig config) {
		this.config = config;
	}

	/**
	 * 更新页面
	 * @return
	 * @throws Exception
	 */
	public String toUpdate() throws Exception {
		config = SystemConfigService.getSystemConfigByID(config.getConfigId());
		formPath = WebContext.getRequest().getContextPath() + actionPath + "/doUpdate";
		return "toUpdate";
	}
	
	/**
	 * 执行更新
	 * @return
	 * @throws Exception
	 */
	public String doUpdate() throws Exception {
		SystemConfigService.update(config);
		return toView();
	}
	
	/**
	 * 展现
	 * @return
	 * @throws Exception
	 */
	public String toView() throws Exception {
		authorPath = WebContext.getRequest().getContextPath() + 
		actionPath + "/toUpdate.action";
		configList = SystemConfigService.getAllSystemConfig();	
		return "toView";
	}
}
