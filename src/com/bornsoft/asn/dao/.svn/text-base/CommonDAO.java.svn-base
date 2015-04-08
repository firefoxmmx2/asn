package com.bornsoft.asn.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.utils.common.sqlMapFactory;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.event.RowHandler;

/**
 * 包含基本操作的通用DAO
 * @author Ken Liu Kunyun on Feb 24, 2010
 *
 */
public class CommonDAO {
	
	protected SqlMapClient smc;
	
	public CommonDAO() {
		smc=sqlMapFactory.getSqlMap();
	}

	public Object insert(String sqlFunctionID, Object object) throws SQLException {
		return smc.insert(sqlFunctionID, object);
	}

	public int delete(String sqlFunctionID, Object parameterObject) throws SQLException {
		return smc.delete(sqlFunctionID, parameterObject);
	}
	
	public int update(String sqlFunctionID, Object parameterObject) throws SQLException {
		return smc.update(sqlFunctionID, parameterObject);
	}
	
	public void queryWithRowHandler(String sqlFunctionID, Object parameterObject, RowHandler rowHandler) throws SQLException {
		smc.queryWithRowHandler(sqlFunctionID, parameterObject, rowHandler);
	}
	
	public Object queryForObject(String sqlFunctionID, Object parameterObject) throws SQLException {
		return smc.queryForObject(sqlFunctionID, parameterObject);
	}

	public Object queryForObject(String sqlFunctionID, Object parameterObject, Object resultObject) throws SQLException {
		return smc.queryForObject(sqlFunctionID, parameterObject, resultObject);
	}

	@SuppressWarnings("unchecked")
	public List<Object> queryForList(String sqlFunctionID, Object parameterObject) throws SQLException {
		return smc.queryForList(sqlFunctionID, parameterObject);
	}

	@SuppressWarnings("unchecked")
	public List<Object> queryForList(String sqlFunctionID, Object parameterObject, int skipResults, int maxResults) throws SQLException {
		return smc.queryForList(sqlFunctionID, parameterObject, skipResults, maxResults);
	}

	@SuppressWarnings("unchecked")
	public Map<Object, Object> queryForMap(String sqlFunctionID, Object parameterObject, String keyProperty) throws SQLException {
		return smc.queryForMap(sqlFunctionID, parameterObject, keyProperty);
	}

	@SuppressWarnings("unchecked")
	public Map<Object, Object> queryForMap(String sqlFunctionID, Object parameterObject, String keyProperty, String valueProperty) throws SQLException {
		return smc.queryForMap(sqlFunctionID, parameterObject, keyProperty, valueProperty);
	}

}
