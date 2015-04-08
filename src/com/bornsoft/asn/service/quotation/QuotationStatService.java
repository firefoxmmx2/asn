package com.bornsoft.asn.service.quotation;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.quotation.QuotationInfoStat;
import com.bornsoft.asn.dao.quotation.QuotationStatDAO;

/**
 * 统计信息
 * @author hooxin
 *
 */
public class QuotationStatService
{
	/**
	 * 获取统计信息
	 * @param quoPdtCode 产品编号
	 * @param quoMarketCode 市场编号
	 * @param startDate 起始时间
	 * @param endDate 结束时间
	 * @return 统计信息
	 * @throws Exception
	 */
	public static List<QuotationInfoStat> getQuotationStat(Integer quoPdtCode,Integer quoMarketCode,Date startDate,Date endDate) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		
		try
		{
			if(quoPdtCode != null)
				map.put("quotation_product_code",quoPdtCode);
			if(quoMarketCode!=null)
				map.put("quotation_market_code",quoMarketCode);
			if(startDate != null )
				map.put("start_date",startDate);
			if(endDate != null)
				map.put("end_date",endDate);
			
			return QuotationStatDAO.get(map);
		}
		catch (Exception e)
		{
			// TODO: handle exception
			Logger log = Logger.getLogger(QuotationStatService.class);
			log.error(e);
			throw e;
		}
	}
}
