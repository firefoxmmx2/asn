package com.bornsoft.asn.action.order;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import com.alipay.config.*;
import com.alipay.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.account.Account;
import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.bean.order.DrawerAddress;
import com.bornsoft.asn.bean.order.Order;
import com.bornsoft.asn.bean.order.OrderItem;
import com.bornsoft.asn.bean.product.Product;
import com.bornsoft.asn.bean.ship.Delivery;
import com.bornsoft.asn.bean.ship.Logistics;
import com.bornsoft.asn.bean.shoppingCart.Cart;
import com.bornsoft.asn.bean.shoppingCart.CartItem;
import com.bornsoft.asn.bean.shoppingCart.ShoppingCart;
import com.bornsoft.asn.exception.ActionException;
import com.bornsoft.asn.service.account.AccountService;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.service.order.OrderService;
import com.bornsoft.asn.service.product.DisplayProductService;
import com.bornsoft.asn.service.product.ProductService;
import com.bornsoft.asn.service.ship.DeliveryService;
import com.bornsoft.asn.service.storage.StorageService;
import com.bornsoft.asn.service.tradeReview.TradeReviewService;
import com.bornsoft.asn.utils.common.PageTool;
import com.bornsoft.asn.utils.common.PageUtil;
import com.bornsoft.asn.utils.common.WebContext;
import com.opensymphony.xwork2.ActionContext;

public class FrontOrderAction extends BaseAction {
	private static final long serialVersionUID = 7830412547693712881L;
	private String flag;
   	/**收货人姓名*/
   	private String drawerName; //---------管理员订单查询条件
	/** 城市 */
   	private String area;
    /**详细地址*/
   	private String detailAddress; //---------管理员订单查询条件
   	/**邮政编码*/
    private String zipCode;
    /**联系电话(固定电话)*/
    private String drawerNumber;
    /**联系电话(移动电话)*/
    private String mobileNumber; //---------管理员订单查询条件
	/**特殊说明*/
    private String[] specialExplain;
    /**付款方式*/
    private String paymentMethod;
	/**供应商ID*/
    private Long supplierId;
    /**数量*/
    private int quantity;
    /**商品的ID*/
    private Long productId;
	/**邮递费用*/
    private List<List<String>> postFree;
	/**总的费用*/
    private String totalFree;
	private List<ShoppingCart> orderProductList;
	/**订单状态*/
	private String orderStatus;
	/**订单编号*/
	private Long orderId; //---------管理员订单查询条件
	/**前台订单信息*/
	private List<Order> orderList;
	/**前台选择的产品信息的展示*/
	private Hashtable<Long, Hashtable<Long, CartItem>> newListInfo;
	
	private Hashtable<Long, Hashtable<Long, CartItem>> hash;
	/**收货人的地址*/
	private List<DrawerAddress> listAddresses;  
	/**订单信息*/
	private Order order;
	/**地址ID*/
	private Long addressId;
	/**被选择的产品的ID集合*/
	private String proIds;
	/**交易标识(买/卖)*/
	private String transactionFlag;	
	
	private Member member;
	
	private String beginDate;
	private String endDate;
	private String productName;
	private String supplierName;
	
	//前台定制模板名称
	private String template = "";
	
	private List<Logistics> logisticsList; 
	private Delivery delivery;
	
	
	public List<Logistics> getLogisticsList() {
		return logisticsList;
	}
	public void setLogisticsList(List<Logistics> logisticsList) {
		this.logisticsList = logisticsList;
	}
	
	public Delivery getDelivery() {
		return delivery;
	}
	public void setDelivery(Delivery delivery) {
		this.delivery = delivery;
	}
	/**
	 * @return the template
	 */
	public String getTemplate()
	{
		return template;
	}
	/**
	 * @param template the template to set
	 */
	public void setTemplate(String template)
	{
		this.template = template;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	private List<Order> listOrder; //此次完成的所有的订单，一便在支付界面使用
	
	private List<OrderItem> orderItem; //订单下的产品
	
	public List<OrderItem> getOrderItem() {
		return orderItem;
	}
	public void setOrderItem(List<OrderItem> orderItem) {
		this.orderItem = orderItem;
	}
	public List<Order> getListOrder() {
		return listOrder;
	}
	public void setListOrder(List<Order> listOrder) {
		this.listOrder = listOrder;
	}
	private Float paymentMoney; //支付金额

	public Float getPaymentMoney() {
		return paymentMoney;
	}
	public void setPaymentMoney(Float paymentMoney) {
		this.paymentMoney = paymentMoney;
	}
	//评价控制
	// 0 可以评价 1 已经评价 2 不能评价自己 3 不显示
	private int reviewed[];
	
	//页面上选择了的产品信息
	private Long[] productIds;
	
	public Long[] getProductIds() {
		return productIds;
	}
	public void setProductIds(Long[] productIds) {
		this.productIds = productIds;
	}

	public int pages=1;
	public int pagesize=5;
	public String pageBar ;
	public String formId;
	public PageUtil page = new PageUtil(); 
    
	
	public String getTransactionFlag() {
		return transactionFlag;
	}
	public void setTransactionFlag(String transactionFlag) {
		this.transactionFlag = transactionFlag;
	}
	public String getProIds() {
		return proIds;
	}
	public void setProIds(String proIds) {
		this.proIds = proIds;
	}
	public Long getAddressId() {
		return addressId;
	}
	public void setAddressId(Long addressId) {
		this.addressId = addressId;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
    public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
    public Long getProductId() {
		return productId;
	}
	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public List<List<String>> getPostFree() {
		return postFree;
	}
	public void setPostFree(List<List<String>> postFree) {
		this.postFree = postFree;
	}
	public String getTotalFree() {
		return totalFree;
	}
	public void setTotalFree(String totalFree) {
		this.totalFree = totalFree;
	}
	public List<DrawerAddress> getListAddresses() {
		return listAddresses;
	}
	public void setListAddresses(List<DrawerAddress> listAddresses) {
		this.listAddresses = listAddresses;
	}
	public Long getOrderId() {
		return orderId;
	}
	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	public Hashtable<Long, Hashtable<Long, CartItem>> getNewListInfo() {
		return newListInfo;
	}
	public void setNewListInfo(
			Hashtable<Long, Hashtable<Long, CartItem>> newListInfo) {
		this.newListInfo = newListInfo;
	}
	public int getPages() {
		return pages;
	}
	public void setPages(int pages) {
		this.pages = pages;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public String getPageBar() {
		return pageBar;
	}
	public void setPageBar(String pageBar) {
		this.pageBar = pageBar;
	}
	public String getFormId() {
		return formId;
	}
	public void setFormId(String formId) {
		this.formId = formId;
	}
	public PageUtil getPage() {
		return page;
	}
	public void setPage(PageUtil page) {
		this.page = page;
	}
	public List<Order> getOrderList() {
		return orderList;
	}
	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}
	public Hashtable<Long, Hashtable<Long, CartItem>> getHash() {
		return hash;
	}
	public void setHash(Hashtable<Long, Hashtable<Long, CartItem>> hash) {
		this.hash = hash;
	}
	public Long getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(Long supplierId) {
		this.supplierId = supplierId;
	}
	
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getDrawerName() {
		return drawerName;
	}
	public void setDrawerName(String drawerName) {
		this.drawerName = drawerName;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getDrawerNumber() {
		return drawerNumber;
	}
	public void setDrawerNumber(String drawerNumber) {
		this.drawerNumber = drawerNumber;
	}
	
	public String[] getSpecialExplain() {
		return specialExplain;
	}
	public void setSpecialExplain(String[] specialExplain) {
		this.specialExplain = specialExplain;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	
	public String getFlag() {
		return flag;
	}


	public void setFlag(String flag) {
		this.flag = flag;
	}

	
	public List<ShoppingCart> getOrderProductList() {
		return orderProductList;
	}


	public void setOrderProductList(List<ShoppingCart> orderProductList) {
		this.orderProductList = orderProductList;
	}


	public String addOrderInfo(){
		return SUCCESS;
	}

    public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	
	
	/**
	 * 转到订单确认页面
	 * 2010-3-4
	 * @author yuwenqiang
	 * @return
	 * @throws SQLException 
	 * @throws SQLException 
	 * @throws IOException 
	 */
	public String toConfirmInfoPage(){
		hash= this.loadCart().getValue();
		return SUCCESS;
	}
	
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
     * 创建订单信息
     * 2010-3-16
     * @author yuwenqiang
     * @throws Exception 
     * @throws Exception 
     * @return5
     */
    @SuppressWarnings("unchecked")
	public String saveOrderInfo() throws Exception{
//    	Long[] _s_id = productIds;
    	Hashtable<Long, Hashtable<Long, CartItem>> list = this.loadCart().getValue();
//    	newListInfo=new Hashtable<Long, Hashtable<Long, CartItem>>();
//    	Hashtable<Long, CartItem> new_list_info=new Hashtable<Long, CartItem>();
//    	Hashtable<Long, CartItem> old_list_info=table.get(supplierId);
//    	for(int i=0;i<_s_id.length;i++){
//        	for(Iterator it=old_list_info.keySet().iterator();it.hasNext();){
//        		Long _key=(Long)it.next();
//        		if(_key.compareTo(_s_id[i])==0){
//        			CartItem item=old_list_info.get(_key);
//        			new_list_info.put(supplierId, item);
//        		}
//        	}
//    	}
//    	newListInfo.put(supplierId, new_list_info);
    	
    	newListInfo = (Hashtable<Long, Hashtable<Long, CartItem>>)this.session("newConfirmListInfo");
    	
    	//判断库存是否足够
    	for (Iterator it = newListInfo.keySet().iterator(); it.hasNext();) { 
    		Long key = (Long) it.next();
    		Hashtable<Long, CartItem> value = (Hashtable<Long, CartItem>) list.get(key); //每条订单信息
    		for(Iterator itr = value.keySet().iterator(); itr.hasNext();) {   
    			CartItem item=(CartItem)value.get((Long)itr.next());
    			Product product = ProductService.findProductById(item.getProductId());
    			if((product.getWareCount() - item.getQuantity()) <0 || product.getWareCount() == 0){
    				this.request("productName_wareCount", item.getName());
    				return "fail";
    			}
    		}
    	}
    	
    	if(addressId==-1){
    		listOrder = OrderService.saveOrderInfo(newListInfo,specialExplain,drawerName,area,null,detailAddress,
				           zipCode,drawerNumber,mobileNumber,postFree,totalFree);

    	}else{
    		DrawerAddress address=OrderService.findDrawerAddressById(addressId);
    		listOrder = OrderService.saveOrderInfo(newListInfo,specialExplain,address.getDrawerName(),address.getCity(),address.getAreaCode(),address.getDetailAddress(),
						address.getZipCode(),address.getDrawerNumber(),address.getMobileNumber(),postFree,totalFree);
    	}
    	//订单创建成功之后要对之前session中的数据进行清除
    	//productIds是选择的商品的ID
         
    	List<Long> listKey = new ArrayList<Long>();
    	for(Iterator it = list.keySet().iterator(); it.hasNext();) {
            Long key=(Long)it.next();  //供应商ID
            listKey.add(key);
    	}
    	for(int i=0; i<listKey.size();i++){
            try {
         	   for(Long pro_id:productIds)
     		    {
     			  this.loadCart().setQuantity(listKey.get(i), pro_id, 0);
 				}
 			} catch (Exception e) {
 				throw new ActionException(e);
 			}
    	}
         
   	    return SUCCESS;
    }
    
    /**
     * 信息确认
     * 2010-4-6
     * @author yuwenqiang
     * @return
     */
    public String infoConfirm(){
    	Hashtable<Long, Hashtable<Long, CartItem>> list = this.loadCart().getValue();
    	newListInfo=new Hashtable<Long, Hashtable<Long, CartItem>>();
        String[] pIds=proIds.split(",");
//        Hashtable<Long, CartItem> n_list=list.get(supplierId);
//        Hashtable<Long, CartItem> s=new Hashtable<Long, CartItem>();
//        for(int i=0;i<pIds.length;i++){
//        	  s.put(Long.parseLong(pIds[i]),n_list.get(Long.parseLong(pIds[i])));
//        	}
//    	newListInfo.put(supplierId, s);
    	
    	for(Iterator it = list.keySet().iterator(); it.hasNext();) {
            Long key=(Long)it.next();  //供应商ID
            if(((Hashtable<Long, CartItem>)list.get(key)).size()>0){
            	Hashtable<Long, CartItem>   value   = (Hashtable<Long, CartItem>)list.get(key);
            	Hashtable<Long, CartItem> s=new Hashtable<Long, CartItem>();
                for(Iterator itr = value.keySet().iterator(); itr.hasNext();) {
                     Long  key1   =   (Long)itr.next(); // 产品ID
                     for(int i=0;i<pIds.length;i++){
                    	 if(Long.parseLong(pIds[i]) == key1){                    		 
                    		 s.put(Long.parseLong(pIds[i]),value.get(key1));
                    		 break;
                    	 }
                     }
                }
                if(s.size() >0){
               	 newListInfo.put(key, s);
                }
            }
    	}
    	this.session("newConfirmListInfo", newListInfo);
    	listAddresses=OrderService.getAddresses(MemberService.getMemberId());
    	return SUCCESS;
    }
    

    
    /**在该系统中一个会员即可以是买家也可以是卖家,
     * 在一个会员查询他自己的订单的时候就要分自己已经买了商品和自己要卖的商品**/
    
     /**
       *会员在前台查询自己买了的商品信息
       * 2010-3-31
       * @author yuwenqiang
       * @return
       */
    @SuppressWarnings("unchecked")
	public String queryBuyOrder(){
    	int count=0;    	
    	try {
    		long memberId=MemberService.getMemberId();
    		page.setCurPage(pages);
    	   	page.setPageSize(pagesize);
    	   	count = OrderService.findBuyOrderCount(memberId,orderStatus,orderId,supplierName,productName,beginDate,endDate);
    	   	page.setTotalRow(count);
    	   	page.setFormid(0);
    	   	pageBar = page.getToolsMenu();
    	   	orderList=OrderService.findFrontOrderList(memberId,orderStatus,page.getStart(),page.getEnd(),orderId,supplierName,productName,beginDate,endDate);
    	   	//评价 
    	   	//
    	   	if(orderList != null && orderList.size() > 0){
    	   	//	orderStatus != null && orderStatus.equals("JYC") &&
    	   	reviewed = new int[orderList.size()];
    	   	for(int i=0; i<orderList.size();i++){
    	   		if(orderList.get(i).getOrderStatus().equals("JYC")){
    	   		List l = TradeReviewService.getTradeReview(memberId	, orderList.get(i).getId());
        	   	if(l != null && l.size() > 0){
        	   		reviewed[i] = 1;
        	   	}
        	   	else if(memberId == orderList.get(i).getSupplierId()){
        	   		reviewed[i] = 2;
        	   	}
        	   	else {
        	   		reviewed[i] = 0;
        	   	}
    	   	}else{
    	   		reviewed[i] = -1;
    	   	}
    	   		}
    	   	}

		} catch (SQLException e) {
		    throw new ActionException("前台订单查询失败",e);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ActionException("前台订单查询失败",e);
		}
			return SUCCESS;
    }
    
    
    /**
     *会员在前台查询自己将要卖的商品信息
     * 2010-3-31
     * @author yuwenqiang
     * @return
     */
  public String querySoldOrder(){
		int count = 0;
		try {
			long memberId = MemberService.getMemberId();
			page.setCurPage(pages);
			page.setPageSize(pagesize);
			count = OrderService.findSoldOrderCount(memberId,orderStatus,orderId,supplierName,productName,beginDate,endDate);
			page.setTotalRow(count);
			page.setFormid(0);
			pageBar = page.getToolsMenu();
			orderList = OrderService.findSoldOrderList(memberId,orderStatus,page.getStart(),page.getEnd(),orderId,supplierName,productName,beginDate,endDate);
			
		} catch (SQLException e) {
			throw new ActionException("前台订单查询失败", e);
		}
		return SUCCESS;
  }
    
    
    
    
    	
    /**
     * 前台主信息
     * 2010-4-12
     * @author yuwenqiang
     * @return
     */
    public String queryOrderIndex(){
    	return SUCCESS;
    }
    
    
    /**
     *改变订单的状态
     * 2010-4-7
     * @author yuwenqiang
     * @return
     * @throws Exception 
     */
    public String changeOrderStatus() throws Exception{
    	OrderService.updateOrderStatus(orderId, orderStatus);
    	
    	if(orderStatus != null && (orderStatus.equals("YGB") || orderStatus.equals("YQX"))){ //关闭或取消订单后，产品库存加回去
    		List<OrderItem> items= OrderService.findOrderItemByOrderId(orderId);
    		for(int i=0; i<items.size(); i++){
    			OrderItem itm = items.get(i);
    			ProductService.updateProductAmount(itm.getQuantity(), itm.getItemProductId(), "add");
    		}
    	}
    	this.findAllOrder(null);
    	return SUCCESS;
    }
    
    
    
    private void findAllOrder(String orderStatus){
    	this.orderStatus=orderStatus;
    	this.queryBuyOrder();
    }
    
    
    
    /**
     * 得到当前订单状态的上一个状态
     * 2010-4-24
     * @author yuwenqiang
     * @return
     */
    @SuppressWarnings("unused")
	private String getPrevOrderStatus(String status){
    	String newSta=null;
    	if(status.equals("YFK")|| status.equals("YGB")){
    		newSta="WFK";
    	}
    	//已发货状态
    	else if(status.equals("YFH")){
    		newSta="YFK";
    	}else if(status.equals("JYC")){
    		newSta="YFH";
    	}
    	return newSta;
    }
    
    
    /**
     * 根据订单ID查询订单的详细信息
     * 2010-4-14
     * @author yuwenqiang
     * @return
     */
    public String findOrderById()throws Exception{
    	order=OrderService.findOrderById(orderId);
    	//订单状态为Y时表示是查询卖家的详细信息
    	//不为Y的时候表示是查询买家的详细信息
    	delivery = DeliveryService.getDeliveryByOrderId(orderId); //物流查询
    	if(orderStatus.equals("Y")){
    		return SUCCESS;
    	}else{
    		return INPUT;	
    	}
    	
    }
	public int[] getReviewed() {
		return reviewed;
	}
	public void setReviewed(int[] reviewed) {
		this.reviewed = reviewed;
	}
     
	
	/**
	 * 再次将存在的商品放入购物车里面
	 * 2010-5-13
	 * @author yuwenqiang
	 * @return
	 */
	public String  onceAgainPutShopCart() throws Exception{
		
//		if(supplierId==null || supplierId<1){
//    		Product productInfo=DisplayProductService.findProductInfo(productId);
//    		supplierId=new Long(productInfo.getSupplierId());
//    	}
//	     Cart cart=loadCart();
//	     CartItem item=new CartItem(productId,supplierId,count);
//	     cart.addItem(item);   
//	     //将新的信息放入session之中去
//	     saveCart(cart);

		List<OrderItem>  items=OrderService.findOrderItemByOrderId(orderId);
		for(int i=0;i<items.size();i++){
			Cart cart=loadCart();
			Product productInfo=DisplayProductService.findProductInfo(items.get(i).getItemProductId());
			CartItem item=new CartItem(new Long(productInfo.getProductId()),new Long(productInfo.getSupplierId()),items.get(i).getQuantity());
			cart.addItem(item);
			this.session("storeList", cart);
		}
		hash= this.loadCart().getValue();
		return SUCCESS;
	}
	
	/**
	 * 合并订单付款
	 * 2010-7-28
	 * @author cl
	 * @return
	 */
    public String mergeOrderPay()throws Exception{
    	String orderIds = this.request("proIds");
    	String[] orderArray = orderIds.split(",");
    	List<Order> list = new ArrayList<Order>();
		for (int i = 0; i < orderArray.length; i++){
			order=OrderService.findOrderById(new Long(orderArray[i]));
			List<OrderItem> items = OrderService.findOrderItemByOrderId(new Long(order.getId()));
			String strOrderProductName = "";
			for (int j = 0; j < items.size(); j++) {
				OrderItem oi = items.get(j);
				
				strOrderProductName += " "+oi.getItemProductName();
			}
			order.setProductName(strOrderProductName);
			
			list.add(order);
		}
    	this.setListOrder(list);
    	return SUCCESS;
    }
    
    /**
	 * 确认发货信息
	 * 2010-7-29
	 * @author cl
	 * @return
	 */
    public String shipConfim()throws Exception{
    	order = OrderService.findOrderById(orderId);
    	orderItem = OrderService.findOrderItemByOrderId(orderId);
    	logisticsList = DeliveryService.getLogistics();
    	return SUCCESS;
    }
    
    
    /**
     *发货成功
     * 2010-7-30
     * @author 陈陵
     * @return
     */
    public String shipOver()throws Exception{
    	orderStatus = "YFH";
    	OrderService.updateOrderStatus(orderId, orderStatus);
    	order = OrderService.findOrderById(orderId);
    	orderItem = OrderService.findOrderItemByOrderId(orderId);
    	
    	delivery = DeliveryService.saveDelivery(orderId,delivery);
    	
    	for(int i=0; i <orderItem.size(); i++){ //库存管理
			OrderItem item = orderItem.get(i);
			StorageService.insertOrderProduct(Integer.parseInt(String.valueOf(item.getItemProductId())), 
					Integer.parseInt(String.valueOf(order.getSupplierId())), 
					"O",
					item.getQuantity());
		}
    	return SUCCESS;
    }
    
    /**
     *付款成功
     * 2010-7-30
     * @author 陈陵
     * @return
     */
    public String paymentOrder()throws Exception{
    	HttpServletRequest request = ServletActionContext.getRequest();
    	String key = AlipayConfig.key;
    	//获取支付宝GET过来反馈信息
    	Map params = new HashMap();
    	Map requestParams = request.getParameterMap();
    	
    	
    	for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
    		String name = (String) iter.next();
    		String[] values = (String[]) requestParams.get(name);
    		String valueStr = "";
    		for (int i = 0; i < values.length; i++) {
    			valueStr = (i == values.length - 1) ? valueStr + values[i]
    					: valueStr + values[i] + ",";
    		}
    		//乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
    		valueStr = new String(valueStr.getBytes("ISO-8859-1"), "UTF-8");
    		params.put(name, valueStr);
    	}
    	
    	//判断responsetTxt是否为ture，生成的签名结果mysign与获得的签名结果sign是否一致
    	//responsetTxt的结果不是true，与服务器设置问题、合作身份者ID、notify_id一分钟失效有关
    	//mysign与sign不等，与安全校验码、请求时的参数格式（如：带自定义参数等）、编码格式有关
    	String mysign = AlipayNotify.GetMysign(params,key);
    	String responseTxt = AlipayNotify.Verify(request.getParameter("notify_id"));
    	String sign = request.getParameter("sign");
    	
    	//写日志记录（若要调试，请取消下面两行注释）
    	//String sWord = "responseTxt=" + responseTxt + "\n return_url_log:sign=" + sign + "&mysign=" + mysign + "\n return回来的参数：" + AlipayFunction.CreateLinkString(params);
    	//AlipayFunction.LogResult(sWord);
    	
    	//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
    	
    	String trade_no = request.getParameter("trade_no");				//支付宝交易号
    	String order_no = request.getParameter("out_trade_no");	        //获取订单号
    	String total_fee = request.getParameter("total_fee");	        //获取总金额
    	String subject = new String(request.getParameter("subject").getBytes("ISO-8859-1"),"UTF-8");//商品名称、订单名称
    	String body = "";
    	if(request.getParameter("body") != null){
    		body = new String(request.getParameter("body").getBytes("ISO-8859-1"), "UTF-8");//商品描述、订单备注、描述
    	}
    	String buyer_email = request.getParameter("buyer_email");		//买家支付宝账号
    	String trade_status = request.getParameter("trade_status");		//交易状态
    	//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
		HttpServletResponse response=WebContext.getResponse();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = null;
		out=response.getWriter();
		if(mysign.equals(sign) && responseTxt.equals("true")){//验证成功
			//////////////////////////////////////////////////////////////////////////////////////////
			//请在这里加上商户的业务逻辑程序代码

			//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
			Logger log = Logger.getLogger("");
			log.error("\nnotify_url~~~test..start..	\n");
			if(trade_status.equals("TRADE_FINISHED") || trade_status.equals("TRADE_SUCCESS")){
				//判断该笔订单是否在商户网站中已经做过处理（可参考“集成教程”中“3.4返回数据处理”）
					//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
					//如果有做过处理，不执行商户的业务程序
				
				
				if(order_no != null){
					log.error("\nnotify_url~~~order_no ..["+order_no+"]..	\n");
					List<Order> list = OrderService.findOrderByBatchNumber(order_no);
					log.error("\n notify_url~~~ List<Order> list size:["+list.size()+"]");
					for(int i=0; i<list.size(); i++){
						Order order = list.get(i);
						log.error("\nnotify_url~~~order ..["+order.getId()+"].. SET STATUS BEFORE	\n");
			    		OrderService.updateOrderStatus(new Long(order.getId()), "YFK"); //修改订单状态为“已付款”
			    		log.error("\nnotify_url~~~order ..["+order.getId()+"].. SET STATUS END	\n");
			    		Account account = new Account();
			    		account.setCreateTime(new Date());
			    		account.setId(IdMakerService.newId("tbl_account"));
			    		account.setExpenditure(0.0f);
			    		account.setDescription(order.getProductName());
			    		account.setIncome(order.getTotalAmount().floatValue());
			    		account.setMemberId(order.getMemberId());
			    		account.setOrderId(order.getId());
			    		account.setPayType(order.getPaymentMethod());
			    		AccountService.addAccount(account); //付款记录插入
			    		log.error("\nnotify_url~~~order ..["+order.getId()+"]..OK	\n");
			    	}
				}
				log.error("\nnotify_url~~~test..end..	\n");
				out.println("success");	//请不要修改或删除
			} else {
				out.println("success");	//请不要修改或删除
			}
			//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

			//////////////////////////////////////////////////////////////////////////////////////////
		}else{//验证失败
			out.println("fail");
		}
		
		
		out.close();
		return null;
//    	return SUCCESS;
    }
    
    
    /**
     * 管理员订单查询（坐席人员查询客户咨询订单用的）
     * add cl
     * 2010-10-09
     * */
    public String queryOrderAll()throws Exception{
    	
    	String searchType = this.request("searchType");    	
    	if(searchType != null && searchType.equals("search")){
    		this.request("searchType", searchType);        	
        	return SUCCESS;
    	}else{
	    	Map<String,Object> m = new HashMap<String,Object>();
	    	m.put("ssoAccount", member.getSsoAccount());
	    	m.put("fullName", member.getFullName());
	    	m.put("email", member.getEmail());
	    	m.put("mobileNumber", mobileNumber); //电话为收货人电话
	    	m.put("certId", member.getCertId());
	    	m.put("orderId", orderId);
	    	m.put("drawerName",drawerName);
	    	m.put("detailAddress", detailAddress);
	    	
	    	if(searchType != null && searchType.equals("sub")){
				pages = 1;	
				pagesize = 10;
			}
	    	
//			PageTool pageTool=new PageTool();
//			int startCount=(pages-1)*pagesize+1;
//			int endCount=pages*pagesize;
//			m.put("startCount", startCount);
//			m.put("endCount", endCount);
//			
//			int count = OrderService.searchAdminOrderCount(m);
//			pageTool.setCurrentPage(pages);
//			pageTool.setPageSize(pagesize);
//			pageTool.setTotalRow(count);
//		   	pageBar = pageTool.getPageBar();
//		   	orderList = OrderService.searchAdminOrder(m); 
	
			
		   	page.setCurPage(pages);
	  	   	page.setPageSize(pagesize);
	  	   	int count = OrderService.searchAdminOrderCount(m);
	  	   	page.setTotalRow(count);
	  	   	page.setFormid(0);
	  	   	pageBar = page.getToolsMenu();
	  	   	m.put("startCount", page.getStart());
			m.put("endCount", page.getEnd());
	  	   	orderList = OrderService.searchAdminOrder(m);
		   	
		   	this.request("searchType", searchType);
	    	
	    	return SUCCESS;
    	}
    }
    
    
    /********
     * 秀山专用最新订单查询 
     * cl
     * 2010-10-22
     * *****/
    public String newOrderByAreaCode()throws Exception{
    	String areaCode  = this.request("areaCode");
    	orderList = OrderService.getSucOrderList(areaCode); // 最近交易订单
    	return SUCCESS;
    }
    
}

