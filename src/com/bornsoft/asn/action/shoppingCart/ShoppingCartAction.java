package com.bornsoft.asn.action.shoppingCart;

import java.sql.SQLException;
import java.util.List;
import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.bean.product.Product;
import com.bornsoft.asn.bean.shoppingCart.Cart;
import com.bornsoft.asn.bean.shoppingCart.CartItem;
import com.bornsoft.asn.bean.shoppingCart.ShoppingCart;
import com.bornsoft.asn.exception.ActionException;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.service.product.DisplayProductService;
import com.bornsoft.asn.service.product.ProductService;
import com.bornsoft.asn.service.shoppingCart.ShoppingCartService;

public class ShoppingCartAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	/**购物车信息*/
	private ShoppingCart cartInfo;
	/**产品的ID*/
	private long productId;
	/**产品的数量*/
	private int count;
	/**购物车中的产品列表信息*/
	private List<ShoppingCart> productInfoList;
	/**当前登录的会员*/
   	Member member=null;
	/**购物车的ID*/
   	private String shoppingCartId;
   	/**产品供应商id*/
   	private Long supplierId;
    
   	/**
   	 * 从session中取出信息
   	 * 2010-4-2
   	 * @author yuwenqiang
   	 * @return
   	 */
   	private Cart loadCart(){
	     Cart cart=null;
	     Object obj=this.session("storeList");
	     if(obj==null){
	    	 cart =new Cart();
	     }else{
	    	 cart=(Cart)obj;
	     }
	     return cart;
  	}
    
   	/**
   	 * 将新的信息放入session之中
   	 * 2010-4-2
   	 * @author yuwenqiang
   	 * @param cart
   	 */
   	private void saveCart(Cart cart){
   		this.session("storeList", cart);
  	}

	/**
	 * 向购物车中添加商品信息
	 * 2010-2-23
	 * @author yuwenqiang
	 * @return
	 * @throws Exception 
	 */
    public String saveShoppingCartInfo() throws Exception{
    	//查询产品的信息
    	if(supplierId==null || supplierId<1){
    		Product productInfo=DisplayProductService.findProductInfo(productId);
    		supplierId=new Long(productInfo.getSupplierId());
    	}
	     Cart cart=loadCart();
	     CartItem item=new CartItem(productId,supplierId,count);
	     cart.addItem(item);
	     
	     //将新的信息放入session之中去
	     saveCart(cart);	
		 return null;
    }
    
    /**
     * 会员查询自己购物车中商品信息
     * 2010-2-23
     * @author yuwenqiang
     * @return
     */
    @Deprecated
    public String searchSelfShoppingCart()throws Exception{
    	Member member=null;
    	try {
    		member=	MemberService.getMember();
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	productInfoList=ShoppingCartService.findShoppingCartInfo(member.getMemberId());
    	return SUCCESS;
    }
    
    /**
     * 删除购物车中的商品信息
     * 2010-2-23
     * @author yuwenqiang
     * @return
     */
    @Deprecated
    public String deleteaShoppingCartInfo(){
    	Member member=null;
    	try {
    		member=new Member();
    		member.setMemberId(22222L);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ShoppingCartService.deleteShoppingCartInfo(Long.parseLong(shoppingCartId));
    	//删除了之后再查询里面的信息
    	productInfoList=ShoppingCartService.findShoppingCartInfo(member.getMemberId());
    	return SUCCESS;
    }
    
    /**
     * 更改购物车中的商品信息
     * 在这样的情况下一般是更改产品的数量
     * 2010-2-23
     * @author yuwenqiang
     * @return
     * @throws Exception 
     */
    public String setQuantity() throws Exception{
    	Cart cart=loadCart();
	    cart.setQuantity(supplierId, productId, count);
	    saveCart(cart);
    	return SUCCESS;
    }
    
    /**
     * 清空购物车中的信息,其实就是清除session中的信息
     * 2010-3-30
     * @author yuwenqiang
     * @return
     */
    public String flushCart(){
    	this.getRequest().getSession().removeAttribute("storeList");
    	
    	return NONE;
    }
    
    /**
     * 获取购物车列表
     * @return
     */
    public String listCart(){
    	print(loadCart().toJson());
    	return NONE;
    }

    /**
     * 是否可以更改数量到指定的值
     * @return
     * @throws Exception 
     */
    public String canSetQuantity() {
    	boolean ret=true;  // 是否可订购
    	Product pro=null;
    	try {
			pro= ProductService.findProductById(productId);
		} catch (Exception e) {
			throw new ActionException("查询产品数量失败");
		}
		int minCount=pro.getStartOrderCount();    // 起订量
		int maxCount=pro.getWareCount()-pro.getReservedCount();  // 最大可定量
		ret=count==0 || (count>=minCount) && (count<=maxCount);  // 0 和范围内均是合法数量
    	//print(String.format("{\"result\":\"%s\", \"min\":%d, \"max\": %d}", ret? "yes":"no", minCount, maxCount));
    	print(String.format("{'result': %s, 'min': %d, 'max': %d}", ret? "true":"false", minCount, maxCount)
    			.replaceAll("'", "\""));
    	return NONE;
    }

	public String getShoppingCartId() {
		return shoppingCartId;
	}

	public void setShoppingCartId(String shoppingCartId) {
		this.shoppingCartId = shoppingCartId;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	public List<ShoppingCart> getProductInfoList() {
		return productInfoList;
	}

	public void setProductInfoList(List<ShoppingCart> productInfoList) {
		this.productInfoList = productInfoList;
	}

	public long getProductId() {
		return productId;
	}

	public void setProductId(long productId) {
		this.productId = productId;
	}

	public ShoppingCart getCartInfo() {
		return cartInfo;
	}

	public void setCartInfo(ShoppingCart cartInfo) {
		this.cartInfo = cartInfo;
	}

	
	public Long getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(Long supplierId) {
		this.supplierId = supplierId;
	}
}
