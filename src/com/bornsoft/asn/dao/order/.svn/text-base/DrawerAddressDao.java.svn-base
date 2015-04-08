package com.bornsoft.asn.dao.order;

import java.sql.SQLException;
import java.util.List;

import com.bornsoft.asn.bean.order.DrawerAddress;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class DrawerAddressDao {
    
	
	/***
	 * 保存地址
	 * 2010-4-19
	 * @author yuwenqiang
	 * @param address
	 */
	public static void saveDrawerAddress(DrawerAddress address){
		try {
			sqlMapFactory.getSqlMap().insert("insertAddress", address);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 根据会员的ID查询该会员所拥有的收货人地址
	 * 2010-4-19
	 * @author yuwenqiang
	 * @param memberId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static List<DrawerAddress> getAddressByMember(Long memberId){
		List<DrawerAddress> list=null; 
		try {
			list=(List<DrawerAddress>)sqlMapFactory.getSqlMap().queryForList("selectAddress", memberId);
		    return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	     return null;	
	}
	
	/**
	 * 
	 * 2010-4-22
	 * @author yuwenqiang
	 * @param addID
	 * @return
	 */
	public static DrawerAddress findAddressInfo(Long addID){
		DrawerAddress address=null;
		try {
			address=(DrawerAddress)sqlMapFactory.getSqlMap().queryForObject("findAddressInfo",addID);
			return address;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public static void deleteAddressInfo(Long addID){
		try {
			sqlMapFactory.getSqlMap().delete("deleteAddressInfo", addID);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/***
	 * 修改地址
	 * 2010-4-19
	 * @author yuwenqiang
	 * @param address
	 */
	public static void updateDrawerAddress(DrawerAddress address){
		try {
			sqlMapFactory.getSqlMap().insert("updateAddressInfo", address);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}
