package com.bornsoft.asn.service.order;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.infoOrder.InfoOrder;
import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.bean.order.DrawerAddress;
import com.bornsoft.asn.bean.order.Order;
import com.bornsoft.asn.bean.order.OrderItem;
import com.bornsoft.asn.bean.order.OrderOperateLog;
import com.bornsoft.asn.bean.shoppingCart.CartItem;
import com.bornsoft.asn.dao.order.DrawerAddressDao;
import com.bornsoft.asn.dao.order.OrderDao;
import com.bornsoft.asn.dao.order.OrderOperLoDao;
import com.bornsoft.asn.service.discount.DiscountService;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.service.product.ProductService;
import com.bornsoft.asn.utils.common.AsnConstLib;
import com.bornsoft.asn.utils.common.CheckSum;
import com.bornsoft.asn.utils.common.PropertyFactory;
import com.bornsoft.asn.utils.common.Str;
import com.bornsoft.asn.utils.common.sqlMapFactory;
import com.bornsoft.sms.service.SmsService;

/**
 * 订单处理类
 * @author yuwenqiang
 * 2010-4-21
 */
public class OrderService {

	public static final Logger log = Logger.getLogger(OrderService.class);
	
	/**保存订单信息
	 * 2010-3-16
	 * @author yuwenqiang
	 * @throws Exception 
	 */
	@SuppressWarnings("unchecked")
	public static List<Order> saveOrderInfo(Hashtable<Long, Hashtable<Long, CartItem>> list,String[] specialExplain,
			                         String drawerName,String areaInfo,String str,String detailAddress,String zipCode,
			                         String drawerNumber,String mobileNumber,List<List<String>> postFree,String totalFree) throws Exception{
		double supplierPriceTotal = 0.0; //每个供应商订单总价
		
		List<Order> listOrder = new ArrayList();
    	
		log.debug("saveOrderInfo starts ........");
    	try {
			sqlMapFactory.getSqlMap().startTransaction(); 
			
			long memberId=MemberService.getMemberId();
			//如果str不为空的话,说明是使用以前记录过的地址.
			//只有str为空的时候才进行保存地址
			int m = 0;
			Double supTotalpostFree = 0.0; //总邮费的声明
			String supplierMessage = PropertyFactory.getProperty("member.properties", "supplierMessage"); //获取对供应商的评价的初始值
			String StrProductName = "";//订单中所有产品名称串成的字符串 声明
			
			SmsService sms = new SmsService();
			String strSendContent = "";
			
			for (Iterator it = list.keySet().iterator(); it.hasNext();) {
				Long key = (Long) it.next();
				Order order = new Order();
				long id = IdMakerService.newId("order");
				// 生成订单编号: 规则是时间格式(yyyyMMdd)+订单顺序号+验证码
				order.setId(createOrderCode(id));
				
				if (str == null) {
					order.setCity(areaInfo.substring(areaInfo.indexOf("|") + 1));
					order.setAreaCode(areaInfo.substring(0, areaInfo.indexOf("|")));
				} else {
					order.setCity(areaInfo);
					order.setAreaCode(str);
				}

				Hashtable<Long, CartItem> value = (Hashtable<Long, CartItem>) list.get(key); //每条订单信息
				if (str == null) {
					saveDrawerAddress(drawerName, areaInfo, detailAddress, zipCode, drawerNumber, mobileNumber, memberId);
				}
				
				saveOrderItem(value, createOrderCode(id),postFree.get(m));// 保存订单细项
				
				/****所有产品名称串成的字符串*****/
				for(Iterator itr = value.keySet().iterator(); itr.hasNext();) {
					CartItem item=(CartItem)value.get((Long)itr.next());
					supplierPriceTotal += item.getPrice()*item.getQuantity();
					StrProductName = StrProductName+"  "+item.getQuantity()+item.getUnit()+item.getName();
				}

				/****保存订单*****/
				order.setDrawerName(drawerName);
				order.setDetailAddress(detailAddress);
				order.setDrawerNumber(drawerNumber);
				order.setPaymentMethod("1");
				
				if(!supplierMessage.equals(specialExplain[m])){//对该订单的留言给供应商
					order.setSpecialExplain(specialExplain[m]);
				}else{
					order.setSpecialExplain("");
				}
				order.setZipCode(zipCode);
				order.setOrderStatus("WFK"); // 为付款状态
				order.setCreateTime(new Date());
				order.setMemberId(memberId);
				order.setSupplierId(key);
				order.setTotalAmount(new BigDecimal(supplierPriceTotal));
				
				for(int i=0;i<postFree.get(m).size();i++){ //订单邮费的总的计算
					Double free = Double.parseDouble(postFree.get(m).get(i));
					if(free != -1 && free != -2){
						supTotalpostFree += Double.parseDouble(postFree.get(m).get(i));
					}
				}
				order.setPostFee(new BigDecimal(supTotalpostFree));
				OrderDao.saveOrderInfo(order); //保存订单操作
				
				order.setProductName(StrProductName);
				StrProductName = ""; //清空产品名称字符串
				supplierPriceTotal = 0.0;//清空合计价格
				listOrder.add(order);
				sqlMapFactory.getSqlMap().commitTransaction();
				
				log.debug("saveOrderInfo finished ........");
				
				/********发送短信*************************/
				if(AsnConstLib.smsSendSettingMap.get("orderSucc").toString().equals("Y")){
					try{
						strSendContent = PropertyFactory.getDefaultProperty().getProperty("asn.smsSend.orderSucc");
						strSendContent = Str.parseString(strSendContent, new Object[]{drawerName,String.valueOf(order.getId())});
						sms.sendSms(mobileNumber, strSendContent, "N"); 
					}catch(Exception esms){
						log.error("发送短信出错", esms);
						throw esms;
					}
				}
				/********发送短信********/
				
				m++;
			}
//            return order;
        }
        catch (Exception e) {
			log.error("保存订单出错", e);
			throw e;
		}
        finally{
			sqlMapFactory.getSqlMap().endTransaction();
        }
		return listOrder;
    }
	
   
	
	
	/**
	 * 保存订单细项信息,就是保存订单下面的产品信息
	 * 2010-3-31
	 * @author yuwenqiang
	 * @throws Exception 
	 */
	@SuppressWarnings("unchecked")
	private static  void saveOrderItem(Hashtable<Long, CartItem>   value,long id,List<String> postFree) throws Exception{
		  int i = 0;
		  for(Iterator itr = value.keySet().iterator(); itr.hasNext();) {
	             CartItem item=(CartItem)value.get((Long)itr.next());
	             OrderItem orderItem=new OrderItem();
	             long itemId=IdMakerService.newId("orderitem");
	             orderItem.setId(itemId);
	             orderItem.setItemProductId(item.getProductId());
	             orderItem.setItemProductName(item.getName());
	             orderItem.setPicPath(item.getImage());
	             orderItem.setOrderId(id);
	             orderItem.setProPrice(Float.parseFloat(String.valueOf(item.getPrice())));
	             orderItem.setQuantity(item.getQuantity());
	             orderItem.setPostFree(Double.parseDouble(postFree.get(i)));
	     		 OrderDao.saveOrderItem(orderItem);
	     		i++;
	     		
	     		///////订单成功，产品库存量减少 2011-01-05 cl
	     		ProductService.updateProductAmount(item.getQuantity(), item.getProductId(),"lower");
	     		
	        }
		  return ;
	} 
	
   
	
	/**
	 * 生成订单的编号
	 * 2010-4-21
	 * @author yuwenqiang
	 * @return
	 */
	private static Long createOrderCode(long id){
	   StringBuilder sb=new StringBuilder();
	   sb.append(new SimpleDateFormat("yyMMdd").format(new Date())).append(id);
	   sb.append(CheckSum.checkSum2d(sb.toString()));
	   return Long.parseLong(sb.toString());
	}
    
	
	
	/**
	 * 查询会员已经买了的商品的订单列表
	 * 2010-4-7
	 * @author yuwenqiang
	 * @return
	 * @throws SQLException 
	 */
	public static List<Order> findFrontOrderList(Long memberId, String sta,int pageStart,int pageEnd) throws Exception{
      Map<String,Object> map = new HashMap<String,Object>(2);
	  map.put("memberId", memberId);
	  map.put("start", pageStart);
	  map.put("end", pageEnd);
	  if(sta!=null)
		   if(!sta.equals(""))
	          map.put("orderStatus", sta);
	  log.debug("findFrontOrderList starts ......");
	  try{
		  List<Order> orders= OrderDao.findOrderByMember(map);
		  
		  log.debug("findFrontOrderList finished .........");
		  return orders;
	  }catch(Exception e){
		  log.error("查询会员已经买了的商品的订单列表 错误", e);
		  throw e;
	  }
	  
	}
	
	/**
	 * 查询会员已经买了的商品的订单列表
	 * 2010-4-7
	 * @author yuwenqiang
	 * @return
	 * @throws SQLException 
	 */
	public static List<Order> findFrontOrderList(Long memberId, String sta,int pageStart,int pageEnd,Long orderId,
			String fullName,String productName,String beginDate,String endDate) throws SQLException{
      Map<String,Object> map = new HashMap<String,Object>(2);
	  map.put("memberId", memberId);
	  map.put("startCount", pageStart);
	  map.put("endCount", pageEnd);
	  map.put("orderId",orderId);
	  map.put("fullName",fullName);
	  map.put("productName",productName);
	  map.put("beginDate",beginDate);
	  map.put("endDate",endDate);
	  map.put("orderStatus", sta);
	  
	  List<Order> orders= OrderDao.findOrderByMember(map);  
	  return orders;
	}
	
	/**
	 * 查询会员卖的商品的订单的数量
	 * 2010-4-9
	 * @author yuwenqiang
	 * @return
	 * @throws SQLException 
	 */
	public static int findSoldOrderCount(Long memberId,String orderStatus) throws SQLException{
		Map<String,Object> map=new HashMap<String,Object>(1);
		map.put("memberId", memberId);
		if(orderStatus!=null)
			 if(!orderStatus.equals(""))
		         map.put("orderStatus", orderStatus);
		return OrderDao.getSoldOrderCount(map);
	}	
	public static int findSoldOrderCount(Long memberId,String orderStatus,Long orderId,
			String fullName,String productName,String beginDate,String endDate) throws SQLException{
		Map<String, Object> map = new HashMap<String, Object>(1);
		map.put("memberId", memberId);
		map.put("orderId", orderId);
		map.put("fullName", fullName);
		map.put("productName", productName);
		map.put("beginDate", beginDate);
		map.put("endDate", endDate);
		map.put("orderStatus", orderStatus);
		return OrderDao.getSoldOrderCount(map);
	}
	
	/**
	 * 查询会员买的商品的订单的数量
	 * 2010-4-9
	 * @author yuwenqiang
	 * @return
	 * @throws SQLException 
	 */
	public static int findBuyOrderCount(Long memberId,String orderStatus) throws SQLException{
		Map<String,Object> map=new HashMap<String,Object>(1);
		map.put("memberId", memberId);
		if(orderStatus!=null)
		   {
			   if(!orderStatus.equals(""))
		          {
				    map.put("orderStatus", orderStatus);
				  }
			}
		return OrderDao.getBuyOrderCount(map);
	}
	
	public static int findBuyOrderCount(Long memberId,String orderStatus,Long orderId,
			String fullName,String productName,String beginDate,String endDate) throws SQLException{
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("memberId", memberId);
		map.put("orderId",orderId);
		map.put("fullName",fullName);
		map.put("productName",productName);
		map.put("beginDate",beginDate);
		map.put("endDate",endDate);
		map.put("orderStatus",orderStatus);		
		return OrderDao.getBuyOrderCount(map);
	}
	
	/**
	 *  会员查询自己将要卖的商品信息
	 * 2010-4-9
	 * @author yuwenqiang
	 * @param pageStart
	 * @param pageEnd
	 * @return
	 * @throws SQLException 
	 */
	public static List<Order> findSoldOrderList(Long supplierId,String orderStatus,int pageStart,int pageEnd) throws SQLException{
		Map<String,Object> map=new HashMap<String,Object>(3);
		map.put("supplierId",supplierId);
		map.put("start", pageStart);
		map.put("end", pageEnd);
		if(orderStatus!=null){
			if(!orderStatus.equals("")){
				map.put("orderStatus", orderStatus);
			}else{
				map.put("orderStatus", null);
			}
		}else{
			map.put("orderStatus", null);
		}
		
		return OrderDao.findBackOrderList(map);
	}
	public static List<Order> findSoldOrderList(Long supplierId,String orderStatus,int pageStart,int pageEnd,Long orderId,
			String fullName,String productName,String beginDate,String endDate) throws SQLException{
		Map<String, Object> map = new HashMap<String, Object>(3);
		map.put("supplierId", supplierId);
		map.put("startCount", pageStart);
		map.put("endCount", pageEnd);
		map.put("orderId", orderId);
		map.put("fullName", fullName);
		map.put("productName", productName);
		map.put("beginDate", beginDate);
		map.put("endDate", endDate);
		map.put("orderStatus", orderStatus);
	
		return OrderDao.findBackOrderList(map);
	}
	
	/**
	 * 后台订单查询数量
	 * 2010-4-9
	 * @author yuwenqiang
	 * @return
	 * @throws SQLException 
	 */
	public static int findBackOrderCount(String orderCode,String orderStatus) throws Exception{
		Member member=MemberService.getMember();
		Map<String,Object> map=new HashMap<String,Object>(1);
		map.put("supplierId",member.getMemberId());
		
		if(orderStatus!=null){
			if(!orderStatus.equals("")){
				map.put("orderStatus", orderStatus);
			}else{
				map.put("orderStatus", null);
			}
		}else{
			map.put("orderStatus", null);
		}
		return OrderDao.getBackOrderCount(map);
	}
	
	/**
	 * 前台订单状态的修改
	 * 2010-4-13
	 * @author yuwenqiang
	 */
	public static void updateOrderStatus(Long orderId,String sta){
		Map<String,Object> map=new HashMap<String, Object>(2);
		map.put("orderStatus", sta);
		map.put("id", orderId);
		map.put("sysTime", new Date());
		try {
			sqlMapFactory.getSqlMap().startTransaction();
			OrderDao.updateOrderInfo(map);
//			saveLogInfo(orderId,sta);
			sqlMapFactory.getSqlMap().commitTransaction();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				sqlMapFactory.getSqlMap().endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	
	/**
	 * 根据订单的ID查询订单的信息
	 * 2010-4-14
	 * @author yuwenqiang
	 * @param id
	 * @return
	 */
	public static Order findOrderById(Long id){
		 return OrderDao.findOrderInfoById(id);
	   }
	
	/**
	 * 根据订单的ID查询该订单细项的信息
	 * 2010-4-14
	 * @author yuwenqiang
	 * @return
	 */
	public static List<OrderItem> findOrderItemByOrderId(long orderId){
		return OrderDao.findOrderItems(orderId);
	}
	
	/**
	 * 根据会员的ID查询已经保存过的收货人的地址信息
	 * 2010-4-19
	 * @author yuwenqiang
	 * @param mId
	 * @return
	 */
	public static List<DrawerAddress> getAddresses(Long mId){
		List<DrawerAddress>  addresses=DrawerAddressDao.getAddressByMember(mId);
		return  addresses;
	}
	
	/**
	 * 
	 * 2010-4-22
	 * @author yuwenqiang
	 * @param addId
	 * @return
	 */
	public static DrawerAddress findDrawerAddressById(Long addId){
		return DrawerAddressDao.findAddressInfo(addId);
	}
	
	public static void deleteAddressById(Long addID){
		try {
			sqlMapFactory.getSqlMap().startTransaction();
			DrawerAddressDao.deleteAddressInfo(addID);
			sqlMapFactory.getSqlMap().commitTransaction();
			sqlMapFactory.getSqlMap().endTransaction();
		} catch (SQLException e) {
			e.printStackTrace();
		}

   }
	
	
	
	/**
	 * 保存货物收货人的地址
	 * 2010-4-21
	 * @author yuwenqiang
	 * @param drawerName
	 * @param area
	 * @param detailAddress
	 * @param zipCode
	 */
	public static void saveDrawerAddress(String drawerName,String area,String detailAddress,String zipCode,String drawerNumber,String mobileNumber,Long memberId){
		DrawerAddress address=new DrawerAddress();		
		address.setAreaCode(area.substring(0, area.indexOf("|")));
		address.setCity(area.substring(area.indexOf("|")+1));
		address.setCreateDate(new Date());
		address.setDetailAddress(detailAddress);
		address.setDrawerName(drawerName);
		address.setDrawerNumber(drawerNumber);
		address.setMobileNumber(mobileNumber);
		//生成地址ID
		address.setId(IdMakerService.newId("order"));
		address.setMemberId(memberId);
		address.setZipCode(zipCode);
		DrawerAddressDao.saveDrawerAddress(address);
	}
	
	
	public static void updateDrawerAddress(String drawerName,String area,String detailAddress,String zipCode,String drawerNumber,Long addId){
		DrawerAddress address=new DrawerAddress();		
		address.setAreaCode(area.substring(0, area.indexOf("|")));
		address.setCity(area.substring(area.indexOf("|")+1));
		address.setDetailAddress(detailAddress);
		address.setDrawerName(drawerName);
		address.setDrawerNumber(drawerNumber);
		address.setZipCode(zipCode);
		address.setId(addId);
		DrawerAddressDao.updateDrawerAddress(address);
	}
	
	
	
	/**
	 * 查询最近交易成功的订单
	 * 2010-4-26
	 * @author yuwenqiang
	 * @return
	 */
 	public static List<Order> getSucOrderList(String areaCode){
 		 Map<String,Object> m = new HashMap<String,Object>();
 		 m.put("areaCode", areaCode);
         return OrderDao.getSucessOrderInfo(m);		
	}
 	
 	
 	/**
 	 * 查询该商品已经销售的数量
 	 * 2010-4-29
 	 * @author yuwenqiang
 	 * @param proId
 	 */
 	public static int getSoldProductCount(long proId){
 		return OrderDao.getSoldCount(proId);
 	}
 	
 	/**
 	 * 查询该商品的预订的数量
 	 * 2010-4-29
 	 * @author yuwenqiang
 	 * @param proId
 	 * @return
 	 */
 	public static int getPreProductCount(long proId){
 		return OrderDao.getPredeterCount(proId);
 	}
 	
 	public static List<Order> getDealOrderInfo(long mId){
 		List<Order> list=null;
 		list= OrderDao.getDealOrder(mId);
 		if(list==null)
 			return new ArrayList<Order>(0);
 		return list;
 	}
 	
   

       
 	/**
 	 * 保存订单操作记录
 	 * @param log
 	 */
 	public static void saveLogInfo(Long ordId,String des){
 	   long operaterId=MemberService.getMemberId();
 	   OrderOperateLog log=new OrderOperateLog();
 	   log.setOperaterId(operaterId);
 	   log.setOperateTime(new Date());
 	   log.setOperateDes(des);
 	   log.setOrderId(ordId);
 	   //订单操作记录ID	
 	   log.setLogId(IdMakerService.newId("orderOperLogId"));
 	   OrderOperLoDao.saveLog(log);
 	}
 	
 	/**
     * 管理员订单查询（坐席人员查询客户咨询订单用的）
     * add cl
     * 2010-10-09
     * */
 	public static List<Order> searchAdminOrder(Map m) throws Exception{
 		try{
			sqlMapFactory.getSqlMap().startTransaction();
			List<Order> list = OrderDao.searchAdminOrder(m);
			sqlMapFactory.getSqlMap().commitTransaction();
			return list;
		}catch(Exception e){
			Logger log= Logger.getLogger("OrderService");
			log.info("管理员查询订单信息出错",e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
 	}
 	/**
     * 管理员订单查询（坐席人员查询客户咨询订单用的）
     * add cl
     * 2010-10-09
     * */
 	public static Integer searchAdminOrderCount(Map m) throws Exception{
 		int count = 0;
 		try{
			sqlMapFactory.getSqlMap().startTransaction();
			count = OrderDao.searchAdminOrderCount(m);
			sqlMapFactory.getSqlMap().commitTransaction();
			return count;
		}catch(Exception e){
			Logger log= Logger.getLogger("OrderService");
			log.info("管理员查询订单信息总数出错",e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
 	}
 	
 	/**
 	 * 生成批号
 	 * @param aOrder 订单号数组
 	 * @return 该批订单的批号
 	 */
 	public static String generateOrderBatchNumber(Long[] aOrder){
 		String batchNumber="";
 		Random rad=new Random();
 		rad.nextInt();
 		Date nowDate=new Date();
 		batchNumber=nowDate.getTime()+String.format("%05d", rad.nextInt()*10000+1);
 		if(aOrder==null || aOrder.length==0)
 			throw new RuntimeException("aOrder is null.");
 		for(Long orderId:aOrder){
 			Map<String, Object> map=new HashMap<String, Object>();
 			map.put("order_id", orderId);
 			map.put("batch_num", batchNumber);
 			OrderDao.insertOrderBatchNumber(map);
 		}
 		
 		return batchNumber;
 	}
 	
 	/**
 	 * 查询订单，通过批号
 	 * @param batchNumber 批号
 	 * @return 订单主信息
 	 */
 	public static List<Order> findOrderByBatchNumber(String batchNumber){
 		List<Order>  lst=null;
 		Map<String, Object> map=new HashMap<String, Object>();
 		
 		if(batchNumber ==null || batchNumber.trim().length() == 0)
 			throw new RuntimeException("batchNumber is null");
 		
 		map.put("batch_num", batchNumber);
 		lst=OrderDao.findOrderByBatchNumber(map);
 		return lst;
 	}
 	
}
