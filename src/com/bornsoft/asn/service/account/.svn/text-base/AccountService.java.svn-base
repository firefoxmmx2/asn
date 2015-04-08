package com.bornsoft.asn.service.account;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.account.Account;
import com.bornsoft.asn.dao.account.AccountDao;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class AccountService {
	public static final Logger log = Logger.getLogger(AccountService.class);

	/**
	 * 查询账单
	 * 
	 * @param id 账目ID
	 * @param createTimeStart 起始时间
	 * @param createTimeEnd 结束时间
	 * @param orderId 订单号
	 * @return
	 */
	public static List<Account> findAccount(Integer startCount,Integer endCount,Long id,Date createTimeStart,Date  createTimeEnd,Long orderId) throws Exception{
		Map<String , Object> map = new HashMap<String, Object>();
		List<Account> lst=null;
		
		if(startCount!= null && startCount>0)
			map.put("startCount", startCount);
		if(endCount !=null && endCount>0)
			map.put("endCount", endCount);
		if(id!=null && id>0)
			map.put("id", id);
		if(createTimeStart != null)
			map.put("createTimeStart", createTimeStart);
		if(createTimeEnd!=null)
			map.put("createTimeEnd", createTimeEnd);
		if(orderId !=null)
			map.put("orderId", orderId);
		
		log.debug("findAccount starts.....");
		try {
			lst=AccountDao.get(map);			
			log.debug("findAccount finished.....");
		} catch (RuntimeException e) {
			log.error("search account error.....",e);
			throw e ;
		}		
		return lst;
	}
	
	/**
	 * 查询账单记录数
	 * @param id 账目ID
	 * @param createTimeStart 起始时间
	 * @param createTimeEnd 结束时间
	 * @param orderId 订单号
	 * @return
	 */
	public static int findAccountCount(Long id,Date createTimeStart,Date  createTimeEnd,Long orderId)throws Exception{
		int count = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(id!=null && id>0)
			map.put("id", id);
		if(createTimeStart != null)
			map.put("createTimeStart", createTimeStart);
		if(createTimeEnd!=null)
			map.put("createTimeEnd", createTimeEnd);
		if(orderId !=null)
			map.put("orderId", orderId);
		
		log.debug("findAccountCount starts .......");
		try {
			count = AccountDao.count(map);			
			log.debug("findAccountCount finished .......");
		} catch (RuntimeException e) {
			log.error("search account count error",e);
			throw e;
		}
		return count;
	}

	/**
	 * 查询已支付未转帐的账单，当支付类型为担保支付的时候，财务需要把已收入的账款 减去 佣金，剩下的部分转载给供应商账户 （也就是说这里只需要查询出
	 * 支付类型为担保支付，收取了账款还没有支付给供应商的账单。）
	 * 
	 * @return
	 */
	public static List<Account> findNotTransferAccount() {
		return null;
	}

	/**
	 * 新增账单信息
	 * 
	 * @param account
	 */
	public static void addAccount(Account account) throws Exception{
		log.debug("addAccount starts .....");
		try {
			sqlMapFactory.getSqlMap().startTransaction();
			AccountDao.insert(account);
			sqlMapFactory.getSqlMap().commitTransaction();
			
			log.debug("addAccount finished ......");
		} catch (SQLException e) {
			log.error("insert account error",e);
			throw e;
		} finally {			
				sqlMapFactory.getSqlMap().endTransaction();
		}

	}

	/**
	 * 修改账单信息
	 * 
	 * @param account
	 */
	public static void updateAccount(Account account)throws Exception {
		log.debug("updateAccount starts .....");
		try {
			sqlMapFactory.getSqlMap().startTransaction();
			AccountDao.update(account);
			sqlMapFactory.getSqlMap().commitTransaction();

			log.debug("updateAccount starts .....");
		} catch (SQLException e) {
			log.error("update account error .....", e);
			throw e;
		} finally {			
			sqlMapFactory.getSqlMap().endTransaction();
		}

	}
	
	public static Float getBalance(){
		Float theBalance=0f;
		try {
			
		} catch (RuntimeException e) {

		}
		return theBalance;
	}
}
