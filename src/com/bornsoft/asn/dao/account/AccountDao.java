package com.bornsoft.asn.dao.account;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.account.Account;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class AccountDao {
	private static final Logger log=Logger.getLogger(AccountDao.class);
	@SuppressWarnings("unchecked")
	public static List<Account> get(Map<String, Object> map){
		List<Account> lst=new ArrayList<Account>();
		try {
			lst=sqlMapFactory.getSqlMap().queryForList("account.get", map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e);
		}
		return lst;
	}
	
	public static void insert(Account account) {
		try {
			sqlMapFactory.getSqlMap().insert("account.insert", account);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e);
		}
	}
	
	public static void update(Account account){
		try {
			sqlMapFactory.getSqlMap().update("account.update", account);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e);
		}
	}
	
	public static Account getById(Long accountId){
		Account account=null;
		try {
			account=(Account) sqlMapFactory.getSqlMap().queryForObject("account.getById", accountId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e);
		}
		return account;
	}
	
	
	
	 //取得账单LIST记录数
	public static int count(Map<String,Object> mm){
		int count = 0;
		try {
			 count = (Integer)sqlMapFactory.getSqlMap().queryForObject("account.count",mm);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e);
		}
		return count;
	}
	
}
