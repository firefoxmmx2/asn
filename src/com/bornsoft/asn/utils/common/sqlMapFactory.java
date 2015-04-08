package com.bornsoft.asn.utils.common;

import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class sqlMapFactory {
	private static  SqlMapClient sqlmap;
	
	private static final String configPath = "";
	
	static {
		try {
			Reader reader = Resources.getResourceAsReader(configPath + "SqlMapConfig.xml");
			sqlmap = SqlMapClientBuilder.buildSqlMapClient(reader);
			reader.close();
		}catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("Something bad happened while building the SqlMapClient instance." + e, e);
			
		}
	}
	
	public static SqlMapClient getSqlMap() {
		return sqlmap;
	}
}
