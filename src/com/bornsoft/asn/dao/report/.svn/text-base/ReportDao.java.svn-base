package com.bornsoft.asn.dao.report;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.bean.report.ReportClick;
import com.bornsoft.asn.bean.report.ReportMember;
import com.bornsoft.asn.bean.report.ReportTrade;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class ReportDao {
   
	
	/**
	 * 会员
	 * 2010-4-28
	 * @author yuwenqiang
	 * @return
	 */
	public  static  List<ReportMember> find0(Map<String,Object> map){
		try {
			return  sqlMapFactory.getSqlMap().queryForList("report_member_result",map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
    
	/**
	 * 产品点击率
	 * 2010-4-28
	 * @author yuwenqiang
	 * @return
	 */
	public  static  List<ReportClick> find1(Map<String,Object> map){
		try {
			return sqlMapFactory.getSqlMap().queryForList("report_click_result",map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 产品交易
	 * 2010-4-28
	 * @author yuwenqiang
	 * @return
	 */
	public  static  List<ReportTrade> find2(Map<String,Object> map){
		try {
		 return	sqlMapFactory.getSqlMap().queryForList("report_trade_result",map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	public static int findCount0(Map<String,Object> map){
		try {
			 return	(Integer)sqlMapFactory.getSqlMap().queryForObject("report_member_count",map);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return 0;
	}
	
	public static int findCount1(Map<String,Object> map){
		try {
			 return	(Integer)sqlMapFactory.getSqlMap().queryForObject("report_click_count",map);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return 0;
	}
	
	public static int findCount2(Map<String,Object> map){
		try {
			 return	(Integer)sqlMapFactory.getSqlMap().queryForObject("report_trade_count",map);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return 0;
	}
}
