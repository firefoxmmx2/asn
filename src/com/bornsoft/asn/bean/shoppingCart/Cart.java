package com.bornsoft.asn.bean.shoppingCart;

import java.io.Serializable;
import java.util.Hashtable;
import com.bornsoft.asn.bean.product.Product;
import com.bornsoft.asn.service.accounting.AccountingService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.service.product.ProductService;
import com.bornsoft.asn.utils.json.Json;


/**
 * Cart
 * @author Ken Liu Kunyun
 */
public class Cart implements Serializable{
	
	private static final long serialVersionUID = 1L;
	// 购物车总集合
	private Hashtable<Long, Hashtable<Long, CartItem>> list=new Hashtable<Long, Hashtable<Long, CartItem>>();
	
	/**
	 * 添加项目
	 * @throws Exception 
	 */
	public void addItem(CartItem item) throws Exception{
		// 取得已有的个别供应商项目的集合
		Hashtable<Long, CartItem> listBySupplier=list.get(item.getSupplierId());
		// 如果没有本供应商的集合，就新建一个
		if(listBySupplier==null) {
			listBySupplier=new Hashtable<Long, CartItem>();
			list.put(item.getSupplierId(), listBySupplier);
		}
		// 克隆出新的项目
		CartItem newItem=item.clone(); 		
		// 取得已经存在的商品项目
		//CartItem oldItem=listBySupplier.get(item.getProductId());
		// 如果有老项目，数量累加到新项目上
		//if(oldItem!=null) newItem.setQuantity(newItem.getQuantity()+oldItem.getQuantity());
		// 设置附加信息
		Product p=ProductService.findProductById(newItem.getProductId());
		if(p!=null){
			newItem.setName(p.getProductName());
			newItem.setImage(p.getSmallPicPath());
			newItem.setUnit(p.getProductUnit());
			newItem.setPriceOriginal(p.getPrice1());
			newItem.setPrice(AccountingService.getPrice(newItem.getProductId(), newItem.getQuantity()));
			newItem.setSupplierName(MemberService.getMember(newItem.getSupplierId()).getShortName());
			newItem.setPostType(p.getPostType());
			// 将新项目加入供应商拥有的项目集合
			listBySupplier.put(item.getProductId(), newItem);
		}
	}
	
	/**
	 * 设置特定购物车中商品的数量
	 * @param supplierId
	 * @param productId
	 * @param quantity
	 * @throws Exception 
	 */
	public void setQuantity(Long supplierId, Long productId, int quantity) throws Exception{
		// 取得已有的个别供应商项目的集合
		Hashtable<Long, CartItem> listBySupplier=list.get(supplierId);
		// 如果有本供应商的集合
		if(listBySupplier!=null){
			// 取得已经存在的商品项目
			CartItem oldItem=listBySupplier.get(productId);
			// 如果有项目
			if(oldItem!=null) {
				if(quantity==0){
					// 删除
					listBySupplier.remove(productId);
					//要是一个供应商下面没有了商品就要将该供应商也要从session中移除
					if(listBySupplier.size()==0){
						list.remove(supplierId);
					}
				}else{
					// 修改数量
					oldItem.setQuantity(quantity);
					// 修改价格
					oldItem.setPrice(AccountingService.getPrice(oldItem.getProductId(), oldItem.getQuantity()));
				}
			}
		}
	}
	
	/**
	 * 清空购物车
	 */
	public void clear(){
		list.clear();
	}
	
	/**
	 * 生成JSON格式的数据，供浏览器端显示
	 * @return
	 */
	public String toJson(){
		return Json.getString(list, "class");
	}
	
	/**
	 * 得到信息
	 * 2010-4-2
	 * @author yuwenqiang
	 * @return
	 */
	public Hashtable<Long, Hashtable<Long, CartItem>> getValue(){
		return list;
	}

}

