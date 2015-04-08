package com.bornsoft.asn.utils.common;

import java.util.HashMap;
import java.io.IOException;
import java.util.Map;
import java.util.Properties;

import com.ibatis.common.resources.Resources;

/**
 * 
 * 系统统一常量配置获取器。通过JAVA Properties,我们可以将系统常量放到外部property文件中，
 * 如果常量值需要变动，则不需要改源码
 * @author hooxin
 *
 */
public class PropertyFactory {

	public static Properties defaultProperty;
	public static String defPropertyLoc = "default_property.properties";
	
	private static Map<String, Properties> cacheMap=new HashMap<String, Properties>(); // 缓冲
	
	public static Properties getDefaultProperty() {
		if(defaultProperty == null){
			defaultProperty = new Properties();
			try {
//				defaultProperty.load(PropertyFactory.class.getClassLoader().getResourceAsStream(defPropertyLoc));
				defaultProperty.load(Resources.getResourceAsStream(defPropertyLoc));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.exit(0);
			}
		}
		
		return defaultProperty;
	}
	
	/**
	 * Get a properties by file name
	 * @param fileName
	 * @return
	 */
	public static Properties getPropertiesByFileName(String fileName) {
		Properties ret=cacheMap.get(fileName.toLowerCase());
		if(ret == null){
			ret = new Properties();
			try {
				ret.load(Resources.getResourceAsStream(fileName));
			} catch (IOException e) {
				e.printStackTrace();
			}
			cacheMap.put(fileName.toLowerCase(), ret);
		}
		
		return ret;
	}

	/**
	 * get property
	 * @param fileName
	 * @param key
	 * @return
	 */
	public static String getProperty(String fileName, String key) {
		return getPropertiesByFileName(fileName).getProperty(key);
	}
	

	public static Properties getSecurityProperties() {
		return getPropertiesByFileName("security.properties");
	}
	
}
