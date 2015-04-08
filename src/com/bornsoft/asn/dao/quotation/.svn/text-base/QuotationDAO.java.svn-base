package com.bornsoft.asn.dao.quotation;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.quotation.QuotationInfo;
import com.bornsoft.asn.utils.common.sqlMapFactory;

/**
 * package的命名规则 com.bornsoft.asn.分成名称或者工具名词.模块名
 * */
public class QuotationDAO {
	
	/**
	 * 得到行情信息记录数
	 * @param quoName 行情名称
	 * @param relDateSt 起始发布日期
	 * @param relDateEd 结束发布日期
	 * @return
	 * @throws SQLException
	 */
	public static int findQuotationCount(String quoName,String relDateSt,String relDateEd) throws SQLException {
		Map<String,String> m = new HashMap<String, String>();
		if(quoName != null && quoName.trim().length() > 0)
			m.put("quoName", quoName);
		
		if(relDateSt != null && relDateSt.trim().length() > 0){
			if(relDateSt.matches("[1-9][0-9]{3}-[0-9]{2}-[0-9]{2}"))
				m.put("relDateSt", relDateSt);
			else
				new SQLException("起始发布时间 格式不对");
		}
		
		if(relDateEd != null && relDateEd.trim().length() > 0){
			if( relDateEd.matches("[1-9][0-9]{3}-[0-9]{2}-[0-9]{2}"))
				m.put("relDateEd", relDateEd);
			else
				new SQLException("结束发布时间 格式不对");
		}
		try{
			return (Integer)sqlMapFactory.getSqlMap().queryForObject("findQuotationCount",m);
		}catch (Exception e) {
			Logger log = Logger.getLogger(QuotationDAO.class);
			log.error("得到行情信息 数目 出错 DAO", e);
			throw new SQLException(e);
		}
	}
	/**
	 * 查询不带行情统计的行情信息列表 (分页)
	 * @param startCount 起始记录数
	 * @param endCount 结束记录数
	 * @param quoName 行情名称
	 * @param relDateSt 起始发布时间
	 * @param relDateEd 结束发布时间
	 * @return 行情信息列表
	 * @throws SQLException
	 */
	public static List<QuotationInfo> findQuotationwoStatList(int startCount,int endCount,String quoName,String relDateSt,String relDateEd) throws SQLException{
		Map<String,String> m = new HashMap<String, String>();
		if(startCount >=0 && endCount > startCount){
			m.put("startCount", String.valueOf(startCount));
			m.put("endCount", String.valueOf(endCount));
		}
		
		if(quoName != null && quoName.trim().length() > 0)
			m.put("quoName", quoName);
		
		if(relDateSt != null && relDateSt.trim().length() > 0){
			if(relDateSt.matches("[1-9][0-9]{3}-[0-9]{2}-[0-9]{2}"))
				m.put("relDateSt", relDateSt);
			else
				new SQLException("起始发布时间 格式不对");
		}
		
		if(relDateEd != null && relDateEd.trim().length() > 0){
			if( relDateEd.matches("[1-9][0-9]{3}-[0-9]{2}-[0-9]{2}"))
				m.put("relDateEd", relDateEd);
			else
				new SQLException("结束发布时间 格式不对");
		}
		
		
		try{
			return (List<QuotationInfo>)sqlMapFactory.getSqlMap().queryForList("findQuotationwoStatList", m);
		}catch (Exception e) {
			Logger log = Logger.getLogger(QuotationDAO.class);
			log.error("查询行情信息出错 DAO",e );
			throw new SQLException(e);
		}
	}
	
	/**
	 * 插入一个行情信息
	 * @param tt 行情信息
	 * @throws Exception
	 */
	public static void insert(QuotationInfo tt) throws Exception {
		try {
			sqlMapFactory.getSqlMap().insert("insertQuotation", tt);
		}catch (Exception e) {
			Logger log = Logger.getLogger(QuotationDAO.class);
			log.error("行情基本信息 插入出错",e);
			throw new SQLException(e);
		}
	}
	
	/**
	 * 删除一个行情信息
	 * @param quotationCode 行情编号
	 * @throws Exception
	 */
	public static void delete(int quotationCode) throws Exception {
		try {
			sqlMapFactory.getSqlMap().delete("deleteQuotation", quotationCode);
		}catch (Exception e) {
			Logger log = Logger.getLogger(QuotationDAO.class);
			log.error("行情基本信息 插入出错",e);
			throw new SQLException(e);
		}
		
	}
	
	/**
	 * 更改行情信息
	 * @param tt 需要更该的行情信息
	 * @throws Exception
	 */
	public static void update(QuotationInfo tt) throws Exception {
		try {
			sqlMapFactory.getSqlMap().update("updateQuotation", tt);
		}catch (Exception e) {
			Logger log = Logger.getLogger(QuotationDAO.class);
			log.error("行情基本信息 插入出错",e);
			throw new SQLException(e);
		}
	}
	
	/**
	 * 得到一个行情信息
	 * @param quotationCode 行情信息代码
	 * @return
	 * @throws Exception
	 */
	public static QuotationInfo get(int quotationCode) throws Exception {
		try {
			return (QuotationInfo) sqlMapFactory.getSqlMap().queryForObject("getQuotation", quotationCode);
		}catch (Exception e) {
			Logger log = Logger.getLogger(QuotationDAO.class);
			log.error("行情基本信息 单一查询出错",e);
			throw new SQLException(e);
		}
	}
	
	/**
	 * 得到全部行情信息
	 * @return 
	 * @throws Exception
	 */
	public static List<QuotationInfo> getAllList() throws Exception {
		try {
			return sqlMapFactory.getSqlMap().queryForList("getQuotationAllList");
		}catch (Exception e) {
			Logger log = Logger.getLogger(QuotationDAO.class);
			log.error("行情基本信息 全部查询出错",e);
			throw new SQLException(e);
		}
	}
	
	/**
	 * 得到不带行情统计的的行情信息
	 * @return
	 * @throws Exception
	 */
	public static List<QuotationInfo> getAllwoStatList() throws Exception {
		try {
			return sqlMapFactory.getSqlMap().queryForList("getQuotaionAllwoStatList");
		}catch (Exception e) {
			Logger log = Logger.getLogger(QuotationDAO.class);
			log.error("行情基本信息 全部查询（不带统计信息）出错",e);
			throw new SQLException(e);
		}
	}
}
