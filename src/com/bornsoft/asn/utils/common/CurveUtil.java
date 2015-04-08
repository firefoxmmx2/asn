package com.bornsoft.asn.utils.common;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.bean.quotation.QuotationInfoStat;

public class CurveUtil
{
	public static List<Map<String,Object>> convertToListMap(
			List<QuotationInfoStat> quotationStatList)
	{
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();

		if (quotationStatList == null || quotationStatList.isEmpty())
			return null;

		for (QuotationInfoStat qis : quotationStatList)
		{
			Map<String,Object> map = new HashMap<String,Object>();

			map.put(
					CurveGenerator.VALUE,
					Double.parseDouble(qis.getAvgPrice().toString()));

			map.put(CurveGenerator.SERISE, qis
					.getQuotationProduct()
					.getQuotationPName());
			map.put(CurveGenerator.TYPE, new SimpleDateFormat("yyyy-MM-dd")
					.format(qis.getStatDate()));

			list.add(map);
		}
		return list;
	}
}
