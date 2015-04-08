package com.bornsoft.asn.dao.idmaker;

import java.util.HashMap;
import java.util.Map;

import com.bornsoft.asn.utils.common.sqlMapFactory;
import com.ibatis.sqlmap.client.SqlMapClient;


/**
 * ID Maker DAO
 * */
public class IdMakerDAO {
	/**
	 * get new entity id
	 * @param entityType
	 * @return
	 * @throws Exception
	 */
	public static long newId(String entityType) throws Exception {
		//return (Quotation) sqlMapFactory.getSqlMap().queryForObject("getQuotation", quotationCode);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("P_ENTITY_TYPE",entityType);
		map.put("V_RETURN",-1);
		SqlMapClient smc=sqlMapFactory.getSqlMap();
		smc.queryForMap("newEntityId",map, null);
		return (Long)map.get("V_RETURN");
	}
	
}
