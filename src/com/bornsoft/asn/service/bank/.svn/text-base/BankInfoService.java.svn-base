package com.bornsoft.asn.service.bank;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;


import com.bornsoft.asn.bean.advert.Advert;
import com.bornsoft.asn.bean.bank.BankInfo;
import com.bornsoft.asn.dao.advert.AdvertDao;
import com.bornsoft.asn.dao.bank.BankInfoDao;
import com.bornsoft.asn.service.advert.AdvertService;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class BankInfoService {
	public static final Logger log = Logger.getLogger(BankInfoService.class);
	/*****
	 * @author cl
	 * @discription 完善供应商————银行信息
	 * @date 2010-03-04 
	 * ***/
	public static void insertBankInfo(BankInfo bankinfo) throws Exception{
		log.debug("insertBankInfo starts ...");
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			BankInfoDao.insertBankInfo(bankinfo);
			sqlMapFactory.getSqlMap().commitTransaction();
			
			log.debug("insertBankInfo finished ...");
		}catch(Exception e){
			log.error("search advert list error", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	/*****
	 * @author cl
	 * @discription 根据memberID查询 银行信息
	 * @date 2010-03-08 
	 * ***/
	public static BankInfo getBankInfoById(long memberID) throws Exception{
		log.debug("insertBankInfo starts ...");
		try{
			BankInfo bankInfo = BankInfoDao.getBankInfoById(memberID);
			
			log.debug("insertBankInfo finished ...");
			return bankInfo;
		}catch(Exception e){
			log.error("根据memberID查询 银行信息", e);
			throw e;
		}
	}

}
