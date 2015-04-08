package com.bornsoft.asn.service.product;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Iterator;

import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.bean.product.Product;
import com.bornsoft.asn.dao.member.MemberDao;
import com.bornsoft.asn.dao.product.ProductDao;
import com.bornsoft.asn.dao.product.SaleProductDao;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.vo.ProductBean;


public class DisplayProductService {
	
	/**
	 * 根据页面选择的产品的类型查询出所有的详细产品 （不带立面）
	 * @param 
	 * @return
	 * @author hooxin
	 */
	public static List<Object> findProductByCode(int pageStart,int pageEnd,String code,
		    String startPrice,String endPrice,String quantityBegin,String postTime,
		    String priceOrder,String areaCode,String productName){
		return findProductByCode(pageStart,pageEnd,null,code,startPrice,endPrice,
				quantityBegin,postTime,priceOrder,areaCode,productName);
	}
	/**
	 * 根据页面选择的产品的类型查询出所有的详细产品
	 * 2010-2-25
	 * @author yuwenqiang
	 * @param 
	 * @return
	 */
	//+++ 添加立面查询支持 by hooxin
	@SuppressWarnings("unchecked")
	public static List<Object> findProductByCode(int pageStart,int pageEnd,String[] facade,String code,
			    String startPrice,String endPrice,String quantityBegin,String postTime,
			    String priceOrder,String areaCode,String productName)
	   {
		//+++添加立面查询支持 by hooxin
		Map<String,Object> map=assemblingCondition (pageStart,pageEnd,facade,code,
			    startPrice,endPrice,quantityBegin,postTime,
			    priceOrder,areaCode,productName);
		
		List<Object> list = null;
		List newList = new ArrayList();
		
		//2010-10-21 liujunwei fixed 修改逻辑处理
		try 
		{
			list=SaleProductDao.getAllProduct(map);
			
			for(Iterator<Object> items=list.iterator();items.hasNext();)
			{
				Product tmpProduct = (Product)items.next();
				
				Member tmpMember = MemberService.getMember(tmpProduct.getSupplierId());	//获取供应商信息
				
				ProductBean ps=new ProductBean();
				 ps.setArea(tmpMember.getArea().substring(tmpMember.getArea().lastIndexOf("|")+1));
				 ps.setCustomerType(tmpMember.getMemberType());
				 //+++供应商名称（supName）显示简称更好些 4 by hooxin
//				 ps.setSupName(((Member)members.get(i)).getFullName());
				 ps.setSupName(tmpMember.getShortName());
				 //---
				 //+++ 商家名称点击转到商家页面 3 by hooxin
				 ps.setSupId(tmpMember.getMemberId().toString());
				 //---
				 ps.setProduct(tmpProduct);
				 ps.setProductUnit(tmpProduct.getProductUnit());	//产品的单位
				 ps.setMarketPrice(tmpProduct.getMarketPrice());	//liujunwe 20110108 fixed 增加市场价
				 newList.add(ps);
			}
			
			/*
			List ll=new ArrayList();
			for(int i=0;i<list.size();i++){
			    ll.add(((Product)list.get(i)).getSupplierId());
			}
			if(ll.size()>0){
				List members=MemberDao.getMemberList(ll);
				newList=new ArrayList(list.size());
				for(int i=0;i<members.size();i++){
					 for(int j=0;j<list.size();j++){
						 if(String.valueOf(((Product)list.get(j)).getSupplierId()).equals(String.valueOf(((Member)members.get(i)).getMemberId()))){
							 ProductBean ps=new ProductBean();
							 ps.setArea(((Member)members.get(i)).getArea().substring(((Member)members.get(i)).getArea().lastIndexOf("|")+1));
							 ps.setCustomerType(((Member)members.get(i)).getMemberType());
							 //+++供应商名称（supName）显示简称更好些 4 by hooxin
//							 ps.setSupName(((Member)members.get(i)).getFullName());
							 ps.setSupName(((Member)members.get(i)).getShortName());
							 //---
							 //+++ 商家名称点击转到商家页面 3 by hooxin
							 ps.setSupId(((Member)members.get(i)).getMemberId().toString());
							 //---
							 ps.setProduct((Product)list.get(j));
							 newList.add(ps);
						 }
					 }
					
				}
			}
			*/
			
			
		} catch (Exception e) {
			list=new ArrayList<Object>();
			e.printStackTrace();
		}
		return newList;
	}
	
	/**
	 * 根据页面选择的产品的类型查询出所有的详细产品
	 * @param pageStart 其实页数
	 * @param pageEnd 结束页数
	 * @param code 分类代码
	 * @param productName 产品名称
	 * @return 产品列表
	 * @throws Exception
	 */
	public static List<Object> findProductByCode(int pageStart,int pageEnd,String code,String productName) throws Exception{
		return (List<Object>)findProductByCode(pageStart,pageEnd,null,code,
			    null,null,null,null,null,null,productName);
	}
	/**
	 * 页面选择一个详细的产品之后显示详细的产品信息
	 * 2010-2-25
	 * @author yuwenqiang
	 * @param proId---产品的ID
	 * @return
	 */
	public static Product findProductInfo(long proId){
		Product por=null;
		try {
			por=ProductDao.getProductById(Integer.parseInt(String.valueOf(proId)));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return por;
	}
	
	/**
	 * 根据产品的类型查询商品
	 * 2010-4-22
	 * @author yuwenqiang
	 * @return
	 */
	public static List<Product> findOtherProByType(String typeCode,Long proId){
		Map<String, Object> map=new HashMap<String, Object>(2);
		map.put("typeCode", typeCode);
		map.put("proId", proId);
		return SaleProductDao.randomProduct(map);
	}
	
	
	/**
	 * 根据供应商的id查询供应商的其他商品
	 * 2010-4-22
	 * @author yuwenqiang
	 * @param suId
	 * @return
	 */
	public static List<Product> queryOtherProBySupp(int suId,Long proId){
		Map<String, Object> map=new HashMap<String, Object>(2);
		map.put("supplierId",Long.parseLong(String.valueOf(suId)));
		map.put("proId", proId);
		return SaleProductDao.otherProductBySupp(map);
	}
	
	/**
	 * 得到产品的数量条数
	 * 2010-2-26
	 * @author yuwenqiang
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static int getCount(String code,String startPrice,String endPrice,String quantityBegin,String postTime,String areaCode,String productName){
		Map map =new HashMap();
		if(code!=null){
			if(!code.equals(""))
		      map.put("code", code);
			else
				map.put("code", 00);	
		 }else{
			 map.put("code", 00);	 
		 }
		
		if(startPrice!=null){
	   		if(!startPrice.equals(""))
	   		  map.put("startPrice",Double.parseDouble(startPrice));
	   		else
	   		  map.put("startPrice",null);	
	   	}else{
	   	     map.put("startPrice",null);
	   	}
	   	
		if(endPrice!=null){
			if(!endPrice.equals(""))
			  map.put("endPrice",Double.parseDouble(endPrice));
			else
			  map.put("endPrice",null);	
	   	}else{
	   	      map.put("startPrice",null);
	   	}
		
		if(quantityBegin!=null){
	   		if(!quantityBegin.equals(""))
	   		  map.put("startOrder",quantityBegin);
	   		else
	   		  map.put("startOrder",null);	
	   	}else{
	   	     map.put("startOrder",null);
	   	}
	   	
		if(!postTime.equals("")){
			map.put("postTime", postTime);
		}else{
			map.put("postTime", null);
		}
		
		if(areaCode!=null){
	   		if(!areaCode.equals(""))
	   			if(areaCode.trim().substring(2,6).equals("0000")){
	   				map.put("areaCode",areaCode.trim().substring(0,2));
	   			}else{
	   				map.put("areaCode",areaCode.trim());
	   			}
	   		else
	   		  map.put("areaCode",null);	
	   	}else{
	   	     map.put("areaCode",null);
	   	}
		
		if(productName!=null){
	   		if(!productName.equals(""))
	   		  map.put("productName",productName.trim());
	   		else
	   		  map.put("productName",null);	
	   	}else{
	   	     map.put("productName",null);
	   	}
		
		return SaleProductDao.getCount(map);
	}
	
	/**
	 * 得到产品的数量条数
	 * @param facade 立面值
	 * @param code 类型代码
	 * @param startPrice
	 * @param endPrice
	 * @param quantityBegin
	 * @param postTime
	 * @param areaCode
	 * @param productName
	 * @author hooxin
	 * @data 10-4-14
	 * @return
	 */
	public static int getCount(String[] facade, String code,String startPrice,String endPrice,String quantityBegin,String postTime,String areaCode,String productName){
		Map map =new HashMap();
		if(code!=null){
			if(!code.equals(""))
		      map.put("code", code);
			else
				map.put("code", 00);	
		 }else{
			 map.put("code", 00);	 
		 }
		if(facade != null && facade.length != 0)
			map.put("facade", facade);
		if(startPrice!=null){
	   		if(!startPrice.equals(""))
	   		  map.put("startPrice",Double.parseDouble(startPrice));
	   		else
	   		  map.put("startPrice",null);	
	   	}else{
	   	     map.put("startPrice",null);
	   	}
	   	
		if(endPrice!=null){
			if(!endPrice.equals(""))
			  map.put("endPrice",Double.parseDouble(endPrice));
			else
			  map.put("endPrice",null);	
	   	}else{
	   	      map.put("startPrice",null);
	   	}
		
		if(quantityBegin!=null){
	   		if(!quantityBegin.equals(""))
	   		  map.put("startOrder",quantityBegin);
	   		else
	   		  map.put("startOrder",null);	
	   	}else{
	   	     map.put("startOrder",null);
	   	}
	   	
		if(postTime != null && !postTime.equals("")){
			map.put("postTime", postTime);
		}else{
			map.put("postTime", null);
		}
		
		if(areaCode!=null){
	   		if(!areaCode.equals("")){
	   			if(areaCode.trim().substring(2,6).equals("0000")){
	   				map.put("areaCode",areaCode.trim().substring(0,2));
	   			}else{
	   				map.put("areaCode",areaCode.trim());
	   			}
	   		}
	   		else
	   		  map.put("areaCode",null);	
	   	}else{
	   	     map.put("areaCode",null);
	   	}
		
		if(productName!=null){
	   		if(!productName.equals(""))
	   		  map.put("productName",productName.trim());
	   		else
	   		  map.put("productName",null);	
	   	}else{
	   	     map.put("productName",null);
	   	}
		
		return SaleProductDao.getCount(map);
	}
	
	/**
	 * 得到热卖商品列表
	 * 2010-3-17
	 * @author yuwenqiang
	 * @return
	 */
	public static List<Product> getHotProduct(){
		return SaleProductDao.findHotProduct();
	}
	
	public static List<Product> getFrontHotProduct(String productType,int startCount,int endCount){
		Map<String,Object> m = new  HashMap<String,Object>();
		m.put("productType", productType);
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		return SaleProductDao.findFrontHotProduct(m);
	}
	
	public static List<Product> getFrontHotProduct(String productType,int startCount,int endCount,String areaCode){
		Map<String,Object> m = new  HashMap<String,Object>();
		m.put("productType", productType);
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		if(areaCode != null && areaCode.length()>=6 && !areaCode.substring(2, 6).equals("0000")){//2010-10-21 chenl add length>=6
			m.put("areaCode", areaCode);
		}
		return SaleProductDao.findFrontHotProduct(m);
	}
	
	public static List<Product> getFrontNewProduct(int startCount,int endCount){
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		return SaleProductDao.findFrontNewProduct(m);
	}
	

	/**
	 * @author liujunwei 首页根据分类获取5个产品
	 * @param areaCode
	 * @param productType
	 * @param startCount
	 * @param endCount
	 * @return
	 */
	public static List<Product> getFrontNewProduct(String areaCode, String productType, int startCount,int endCount){
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("productType", productType);
		m.put("areaCode", areaCode);
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		return SaleProductDao.findFrontProduct(m);
	}

	/**
	 * @author liujunwei 首页根据分类获取5个产品
	 * @param areaCode
	 * @param productType
	 * @param startCount
	 * @param endCount
	 * @return
	 */
	public static List<Product> getFrontNewProducty(String areaCode, String productType, int startCount,int endCount){
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("productType", productType);
		m.put("areaCode", areaCode);
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		return SaleProductDao.findFrontProducty(m);
	}
	
	
	/**
	 * 组装页面条件
	 * 2010-3-25
	 * @author yuwenqiang
	 * @param pageStart
	 * @param pageEnd
	 * @param code
	 * @param startPrice
	 * @param endPrice
	 * @param quantityBegin
	 * @param postTime
	 * @param priceOrder
	 * @param areaCode
	 * @param productName
	 * @return
	 */
	//+++ 添加立面支持
	private static Map<String,Object> assemblingCondition(int pageStart,int pageEnd,String[] facade,String code,
		    String startPrice,String endPrice,String quantityBegin,String postTime,
		    String priceOrder,String areaCode,String productName){
		Map<String,Object> map = new HashMap<String,Object>(6);
		map.put("start", pageStart);
	   	map.put("end", pageEnd);
	   	if(code==null){
	   			map.put("code", 00);
	   	}else{
	   		if(code.equals(""))
	   		  map.put("code", 00);
	   		else
	   		  map.put("code", code);
	   	}
	   	
	   	map.put("priceOrder", priceOrder);
	   	///+++ 添加立面支持
		if(facade != null && facade.length != 0)
			map.put("facade", facade);
	   	if(startPrice!=null){
	   		if(!startPrice.equals(""))
	   		  map.put("startPrice",Double.parseDouble(startPrice));
	   		else
	   		  map.put("startPrice",null);	
	   	}else{
	   	     map.put("startPrice",null);
	   	}
	   	
		if(endPrice!=null){
			if(!endPrice.equals(""))
			  map.put("endPrice",Double.parseDouble(endPrice));
			else
			  map.put("endPrice",null);	
	   	}else{
	   	      map.put("startPrice",null);
	   	}
		
		if(quantityBegin!=null){
	   		if(!quantityBegin.equals(""))
	   		  map.put("startOrder",quantityBegin);
	   		else
	   		  map.put("startOrder",null);	
	   	}else{
	   	     map.put("startOrder",null);
	   	}
	   	
		if( postTime != null && !postTime.equals("")){
			map.put("postTime", postTime);
		}else{
			map.put("postTime", null);
		}
		
		
		if(priceOrder!=null){
	   		if(!priceOrder.equals(""))
	   		  map.put("priceOrder",priceOrder.trim());
	   		else
	   		  map.put("priceOrder",null);	
	   	}else{
	   	     map.put("priceOrder",null);
	   	}
		
		
		if(areaCode!=null){
	   		if(!areaCode.equals("")){
	   			if(areaCode.trim().substring(2,6).equals("0000")){
	   				map.put("areaCode",areaCode.trim().substring(0,2));
	   			}else{
	   				map.put("areaCode",areaCode.trim());
	   			}
	   		}	   		  
	   		else
	   		  map.put("areaCode",null);	
	   	}else{
	   	     map.put("areaCode",null);
	   	}
        
		if(productName!=null){
	   		if(!productName.equals(""))
	   		  map.put("productName",productName.trim());
	   		else
	   		  map.put("productName",null);	
	   	}else{
	   	     map.put("productName",null);
	   	}
	   return map;
	}

}


