package com.bornsoft.asn.dao.shoppingCart;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.bean.shoppingCart.ShoppingCart;
import com.bornsoft.asn.utils.common.sqlMapFactory;
import com.ibatis.sqlmap.client.SqlMapClient;

public class ShoppingCartDao {
	static SqlMapClient smc=sqlMapFactory.getSqlMap();
    /**
     * 会员选择产品之后判断该会员购物车中是否已经存在了该产品
     * 2010-2-24
     * @author yuwenqiang
     * @param 
     * @return
     */
	@SuppressWarnings("unchecked")
	public static boolean isProductExist(long procId,long memberId){
        Map<String,Long> map=new HashMap<String,Long>();
        List list=null;
        map.put("productId", procId);
        map.put("memberId", memberId);
        try {
        	 list=smc.queryForList("isExistProductInShopCart", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(list.size()>0&&list!=null)
		{
			if(list.get(0).equals(0))
				return false;
			else
				return true;
		}
		else{
			return false;
		}
	}
	
	/**
	 * 向购车中保存商品信息
	 * 2010-2-26
	 * @author yuwenqiang
	 * @return
	 */
	public static Object saveShopProductInfo(ShoppingCart cartInfo){
		try {
			smc.startTransaction();
			smc.insert("insertShoppingCart",cartInfo);
			smc.commitTransaction();
			smc.endTransaction();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	    return null;
	}
	
	/**
	 * 查询会员的购车中的所有的数据信息
	 * 2010-2-26
	 * @author yuwenqiang
	 * @param memberId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static List<ShoppingCart> findShoppingCartInfo(long memberId){
		try {
			return smc.queryForList("usefulShoppingCartInfo", memberId);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	
	/**
	 * 更改购物车中某个商品的购买数量
	 * 2010-2-26
	 * @author yuwenqiang
	 * @param map
	 */
	public static void updateShoppingCartInfo(Map map){
		try {
			smc.update("updateCountProductInfo", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	 
	/**
	 * 删除购物车中的商品信息
	 * 2010-3-1
	 * @author yuwenqiang
	 * @param map
	 */
	public static void deleteShoppingCartInfo(long shoppingCartId){
		try {
			smc.delete("logicalDeleteProduct", shoppingCartId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
