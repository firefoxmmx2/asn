package com.bornsoft.asn.service.shoppingCart;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.bean.product.Product;
import com.bornsoft.asn.bean.product.ProductSupply;
import com.bornsoft.asn.bean.shoppingCart.ShoppingCart;
import com.bornsoft.asn.dao.product.ProductSupplyDao;
import com.bornsoft.asn.dao.shoppingCart.ShoppingCartDao;
import com.bornsoft.asn.service.idmaker.IdMakerService;
public class ShoppingCartService {
	/**
	 * 查询会员购物车的产品信息
	 * 2010-3-1
	 * @author yuwenqiang
	 * @return
	 */
	public static List<ShoppingCart> findShoppingCartInfo(long memberId){
		Map<String,Long> map=new HashMap<String, Long>(1);
		map.put("memberId", memberId);
		return ShoppingCartDao.findShoppingCartInfo(memberId);
	}
     
	/**
	 * 删除购物车中商品
	 * 2010-3-1
	 * @param--memberId--会员的ID
	 * @param--proId--要删除的产品的ID
	 * @author yuwenqiang
	 */
	public static void deleteShoppingCartInfo(long shoppingCartId){
		ShoppingCartDao.deleteShoppingCartInfo(shoppingCartId);
	}
	
	/**
	 * 更改购物车中商品的数量
	 * 2010-3-1
	 * @author yuwenqiang
	 * @param memberId  ---会员的ID
	 * @param proId     ---商品的ID
	 * @param count     ---商品的数量
	 */
	public static void updateShoppingCartInfo(long memberId,long proId,int count){
		Map<String, Object> map =new HashMap<String,Object>(3);
		map.put("memberId", memberId);
		map.put("productId", proId);
		map.put("count", count);
		ShoppingCartDao.updateShoppingCartInfo(map);
	}
	
	/**
	 * 根据会员的ID和产品的ID判断购物车中是否已经存在了该商品
	 * 2010-3-1
	 * @author yuwenqiang
	 * @param proId
	 * @param memberId
	 * @return
	 */
	 private static boolean judgeProductById(long proId,long memberId){
		return ShoppingCartDao.isProductExist(proId, memberId);
	}
	
	 /**
	  * 在选择了商品之后向购物车中添加信息
	  * 2010-3-1
	  * @author yuwenqiang
	  * @param proId
	  * @param memberId
	  */
	public static void addShoppingCartInfo(long proId,long memberId){
	   boolean flag=judgeProductById(proId, memberId);
	   //要是flag要是true,就向购物车中该商品的数量增加1
	   if(flag){
		   updateShoppingCartInfo(memberId, proId, 1);
	   }else{
	      //新增
	      ShoppingCart cartInfo=new ShoppingCart();
	      long id=IdMakerService.newId("shopCart");
	      ProductSupply pro=null;
	      try {
	    	  pro= ProductSupplyDao.getProductSupply(new Integer(String.valueOf(proId)));
		   } catch (Exception e) {
			  e.printStackTrace();
		   }
		  cartInfo.setId(id);
		  cartInfo.setCount(1);
		  cartInfo.setIsdelete("Y");
		  cartInfo.setMemberId(memberId);
		 //cartInfo.setPrice(Float.valueOf(String.valueOf(pro.getPrice())));
		  cartInfo.setProductId(pro.getProductId());
		  cartInfo.setProductName(pro.getProductName());
		  cartInfo.setPutInDate(new Date());
		  cartInfo.setIsbargain("N");
		  ShoppingCartDao.saveShopProductInfo(cartInfo);
	   }
	}
	
	
	/**
	 * 检查判断集合中是否有该信息
	 * 2010-3-29
	 * @author yuwenqiang
	 * @return
	 */
	public boolean checkInfo(List<Long> list,Long id){
		boolean flag=false;
		for(Long lo:list){
			if(lo.equals(id))
				flag=true;
				break;
		}
		return flag;
	}
	
	/**
	 * 从session中删除被选中的信息
	 * 2010-3-29
	 * @author yuwenqiang
	 * @param list
	 * @param id
	 * @return
	 */
	 public List deleteInfo(List list,Long id){
		 
		 return null;
	 }
}
