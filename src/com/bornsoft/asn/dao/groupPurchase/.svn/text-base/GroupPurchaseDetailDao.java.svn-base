package com.bornsoft.asn.dao.groupPurchase;

import java.sql.SQLException;

import com.bornsoft.asn.bean.groupPurchase.GroupPurchaseDetail;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class GroupPurchaseDetailDao {
	public static void insert(GroupPurchaseDetail gpd) throws SQLException{
		sqlMapFactory.getSqlMap().insert("GroupPurchaseDetail.insert", gpd);
	}
	public static void delete(Long id)throws Exception{
		sqlMapFactory.getSqlMap().delete("GroupPurchaseDetail.delete", id);
	}
}
