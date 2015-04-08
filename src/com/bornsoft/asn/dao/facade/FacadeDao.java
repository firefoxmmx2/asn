package com.bornsoft.asn.dao.facade;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.bean.facade.ProductFacade;
import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.dao.CommonDAO;
import com.bornsoft.asn.utils.common.sqlMapFactory;


/**
 * Member DAO
 * @author Ken Liu Kunyun
 * created on Mar 11, 2010
 * */
public class FacadeDao extends CommonDAO {
	
	/**
	 * get facade define by product type code 
	 * @param memberId
	 * @return
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public List<ProductFacade> listFacadeDefineByPt(String productType) throws SQLException{
		Object list=this.queryForList("queryFacadeDefineByPt", productType);
		return (List<ProductFacade>)list;
	}
	
}
