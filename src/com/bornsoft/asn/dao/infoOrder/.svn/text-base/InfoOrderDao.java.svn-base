package com.bornsoft.asn.dao.infoOrder;

import java.util.HashMap;
import java.util.List;

import com.bornsoft.asn.bean.infoOrder.InfoOrder;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class InfoOrderDao {
	public static List<InfoOrder> getInfoOrderList(HashMap m)throws Exception{
		return sqlMapFactory.getSqlMap().queryForList("getInfoOrderList",m);
	}
	
	public static Integer getInfoOrderListCount(HashMap m)throws Exception{
		return (Integer) sqlMapFactory.getSqlMap().queryForObject("getInfoOrderListCount", m);
	}
	
	public static InfoOrder getInfo(String id)throws Exception{
		return (InfoOrder) sqlMapFactory.getSqlMap().queryForObject("getInfo", id);
	}
}
