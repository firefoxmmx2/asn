package com.bornsoft.asn.service.idmaker;

import org.apache.log4j.Logger;

import com.bornsoft.asn.dao.idmaker.IdMakerDAO;


/**
 * Entity ID Maker
 * */
public class IdMakerService {
	/**
	 * Make a new Id with given entity name
	 * @param entityType Any type name, case insensitive
	 * @return
	 */
	public static Long newId(String entityType) {
		long ret=0;
		try{
			ret=IdMakerDAO.newId(entityType);
		}catch (Exception e) {
			Logger log = Logger.getLogger("IdMakerService");
			log.info("Error on making new ID", e);
		}
		return ret;
	}
	
}
