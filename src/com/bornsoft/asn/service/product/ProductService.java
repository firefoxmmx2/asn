package com.bornsoft.asn.service.product;

import java.io.File;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.product.Delivery;
import com.bornsoft.asn.bean.product.Product;
import com.bornsoft.asn.bean.product.ProductCustomProperty;
import com.bornsoft.asn.dao.product.DeliveryDao;
import com.bornsoft.asn.dao.product.ProductCustomPropertyDao;
import com.bornsoft.asn.dao.product.ProductDao;
import com.bornsoft.asn.utils.common.AsnConstLib;
import com.bornsoft.asn.utils.common.CensorTool;
import com.bornsoft.asn.utils.common.ImageSize;
import com.bornsoft.asn.utils.common.sqlMapFactory;



public class ProductService {
	public static String checkProductNumber(String supplierId,String productNumber)throws Exception{
		HashMap m=new HashMap();
		m.put("supplierId", supplierId);
		m.put("productNumber", productNumber);
		List<Product> l=ProductDao.getProductBySidAndNum(m);
		if(l.size()>0){ 
			return "no";
		}
		else{
			return "yes";
		}
	}
	
	public static void insertProduct(Product product,List<ProductCustomProperty> list,File originalPic,File originalPic1,File originalPic2,File originalPic3,Delivery delivery)throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			String[] picPaths=new String[]{"",""};
			if(originalPic==null){
				originalPic=originalPic1;
				originalPic1=null;
			}
			if(originalPic==null){
				originalPic=originalPic2;
				originalPic2=null;
			}
			if(originalPic==null){
				originalPic=originalPic3;
				originalPic3=null;
			}
			if(originalPic!=null){
				picPaths=ImageSize.drawImage(originalPic);
			}else{
				picPaths=ImageSize.drawDefaultImage();
			}
			if(product!=null){
				product.setBigPicPath(picPaths[0]);
				product.setSmallPicPath(picPaths[1]);
			}		
			
			if(originalPic1!=null){
				picPaths=ImageSize.drawImage(originalPic1);
			}else{
				picPaths=ImageSize.drawDefaultImage();
			}
			if(product!=null){
				product.setBigPicPath1(picPaths[0]);
				product.setSmallPicPath1(picPaths[1]);
			}	
			
			if(originalPic2!=null){
				picPaths=ImageSize.drawImage(originalPic2);
			}else{
				picPaths=ImageSize.drawDefaultImage();
			}
			if(product!=null){
				product.setBigPicPath2(picPaths[0]);
				product.setSmallPicPath2(picPaths[1]);
			}	
			
			if(originalPic3!=null){
				picPaths=ImageSize.drawImage(originalPic3);
			}else{
				picPaths=ImageSize.drawDefaultImage();
			}
			if(product!=null){
				product.setBigPicPath3(picPaths[0]);
				product.setSmallPicPath3(picPaths[1]);
			}	
			if(product.getProductStatus()!=null){
				String source="";
				if(product.getProductNumber()!=null){
					source+=product.getProductNumber();
				}
				if(product.getProductName()!=null){
					source+=product.getProductName();
				}
				if(product.getProductDetail()!=null){
					source+=product.getProductDetail();
				}
				if(product.getWholesaleDetail()!=null){
					source+=product.getWholesaleDetail();
				}
				if(product.getTransportDetail()!=null){
					source+=product.getTransportDetail();
				}
				boolean b=CensorTool.getInstance().checkCensor(source);
				if(b){
					product.setCensor(AsnConstLib.Censor_BlackWord);
				}else{
					product.setCensor(AsnConstLib.Censor_Pending);
				}
			}
			ProductDao.insertProduct(product);
			
			if(list!=null&&list.size()>0){
				for(ProductCustomProperty pcp:list){
					ProductCustomPropertyDao.insertProductCustomProperty(pcp);
				}
			}
//			if(deliveryType!=null&&!deliveryType.trim().equals("")){
//				String[] strings=deliveryType.split(",");
//				for(String s:strings){
//					String dId=s.trim();
//					Integer deliveryId=Integer.valueOf(dId);
//					PT2DY p=new PT2DY(deliveryId, product.getProductId());
//					PT2DYDao.insertPT2DY(p);
//				}
//			}
			delivery.setProductId(product.getProductId());
			DeliveryDao.insertDelivery(delivery);
			
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			// TODO: handle exception
			Logger log = Logger.getLogger("ProductService");
			log.info("插入Product出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	public static int getProductCount(Integer supplierId,String productStatus)throws Exception{
		HashMap m=new HashMap();
		m.put("supplierId", supplierId);
		m.put("productStatus", productStatus);	
		return ProductDao.getProductCount(m);
	}

	public static List<Product> getProductList(Integer supplierId,String productStatus, int page, int pageSize)throws Exception{
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;
		HashMap m=new HashMap();
		m.put("supplierId", supplierId);
		m.put("productStatus", productStatus);	
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		return ProductDao.getProductList(m); 
	}
	
	public static List<Product> getAllProductList(Integer supplierId,String supplierName,String productStatus,String searchName,Integer searchId,Integer censor1,String censor,int page, int pageSize,String type)throws Exception{
		HashMap m=new HashMap();
		if(supplierId!=null&&(supplierId instanceof Integer)){
			m.put("supplierId", supplierId);
		}
		if(productStatus!=null){
			m.put("productStatus", productStatus);
		}
		if(searchName!=null){
			m.put("searchName", searchName);
		}
		if(searchId!=null&&(searchId instanceof Integer)){
			m.put("searchId", searchId);
		}
		if(supplierName!=null){
			m.put("supplierName", supplierName);
		}
		if(censor1!=null){
			m.put("censor", censor1);
		}
		if(censor!=null&&censor.equals("pass")){
			m.put("pass", censor);
		}
		if(type!=null&&!type.trim().equals("")){
			m.put("productType", type);
		}
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		return ProductDao.getAllProductList(m);
	}
	
	public static int getAllProductCount(Integer supplierId,String supplierName,String productStatus,String searchName,Integer searchId,Integer censor1,String censor)throws Exception{
		HashMap m=new HashMap();
		if(supplierId!=null&&(supplierId instanceof Integer)){
			m.put("supplierId", supplierId);
		}
		if(productStatus!=null){
			m.put("productStatus", productStatus);
		}
		if(searchName!=null){
			m.put("searchName", searchName);
		}
		if(searchId!=null&&(searchId instanceof Integer)){
			m.put("searchId", searchId);
		}
		if(supplierName!=null){
			m.put("supplierName", supplierName);
		}
		if(censor1!=null){
			m.put("censor", censor1);
		}
		if(censor!=null&&censor.equals("pass")){
			m.put("pass", censor);
		}
		return ProductDao.getAllProductCount(m);
	}

	public static Product getProductById(String productId)throws Exception{
		return ProductDao.getProductById(productId);
	}

	/**
	 * 根据产品ID查询产品信息
	 * 2010-4-1
	 * @author yuwenqiang
	 * @return
	 * @throws Exception 
	 */
	public static Product findProductById(long prodId) throws Exception{
		return ProductDao.getProductById(Integer.parseInt(String.valueOf(prodId)));
	}

	public static void updateProduct(Product product,List<ProductCustomProperty> list, File originalPic,File originalPic1,File originalPic2,File originalPic3,Delivery delivery) throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			String[] picPaths=new String[]{"",""};		
			if(originalPic!=null&&product!=null){
				picPaths=ImageSize.drawImage(originalPic);
				product.setBigPicPath(picPaths[0]);
				product.setSmallPicPath(picPaths[1]);
			}	
			if(originalPic1!=null&&product!=null){
				picPaths=ImageSize.drawImage(originalPic1);
				product.setBigPicPath1(picPaths[0]);
				product.setSmallPicPath1(picPaths[1]);
			}	
			if(originalPic2!=null&&product!=null){
				picPaths=ImageSize.drawImage(originalPic2);
				product.setBigPicPath2(picPaths[0]);
				product.setSmallPicPath2(picPaths[1]);
			}	
			if(originalPic3!=null&&product!=null){
				picPaths=ImageSize.drawImage(originalPic3);
				product.setBigPicPath3(picPaths[0]);
				product.setSmallPicPath3(picPaths[1]);
			}	
			if(product.getProductStatus()!=null){
				String source="";
				if(product.getProductNumber()!=null){
					source+=product.getProductNumber();
				}
				if(product.getProductName()!=null){
					source+=product.getProductName();
				}
				if(product.getProductDetail()!=null){
					source+=product.getProductDetail();
				}
				if(product.getWholesaleDetail()!=null){
					source+=product.getWholesaleDetail();
				}
				if(product.getTransportDetail()!=null){
					source+=product.getTransportDetail();
				}
				boolean b=CensorTool.getInstance().checkCensor(source);
				if(b){
					product.setCensor(AsnConstLib.Censor_BlackWord);
				}else{
					product.setCensor(AsnConstLib.Censor_Pending);
				}
			}
			
			ProductDao.updateProduct(product);
			
			ProductCustomPropertyDao.deleteProductCustomPropertyList(product.getProductId());
			if(list!=null&&list.size()>0){
				for(ProductCustomProperty pcp:list){
					ProductCustomPropertyDao.insertProductCustomProperty(pcp);
				}
			}
//			PT2DYDao.deleteList(product.getProductId());
//			if(deliveryType!=null&&!deliveryType.trim().equals("")){
//				String[] strings=deliveryType.split(",");
//				for(String s:strings){
//					String dId=s.trim();
//					Integer deliveryId=Integer.valueOf(dId);
//					PT2DY p=new PT2DY(deliveryId, product.getProductId());
//					PT2DYDao.insertPT2DY(p);
//				}
//			}
			Delivery d=DeliveryDao.getDelivery(product.getProductId());
			if(d!=null){
				DeliveryDao.deleteDelivery(product.getProductId());
				DeliveryDao.insertDelivery(delivery);
			}else{
				DeliveryDao.insertDelivery(delivery);
			}
			
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			// TODO: handle exception
			Logger log = Logger.getLogger("ProductService");
			log.info("修改Product出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	public static int getProductSearchCount(Integer supplierId,String productStatus,String sName,String sNumber,String censor )throws Exception{
		HashMap m=new HashMap();
		m.put("supplierId", supplierId);
		m.put("productStatus", productStatus);
		if(sName!=null&&!sName.trim().equals("")){
			m.put("searchName", sName);
		}
		if(sNumber!=null&&!sNumber.trim().equals("")){
			m.put("searchNumber", sNumber);
		}
		if(censor!=null&&censor.equals("pass")){
			m.put("pass", censor);
		}
		if(censor!=null&&censor.equals("in")){
			m.put("in", censor);
		}
		if(censor!=null&&censor.equals("over")){
			m.put("over", censor);
		}
		return ProductDao.getProductSearchCount(m);
	}
	
	public static List<Product> getProductSearchList(Integer supplierId,String productStatus,String sName,String sNumber,String censor,int page, int pageSize)throws Exception{
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;
		HashMap m=new HashMap();
		m.put("supplierId", supplierId);
		m.put("productStatus", productStatus);
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		if(sName!=null&&!sName.trim().equals("")){
			m.put("searchName", sName);
		}
		if(sNumber!=null&&!sNumber.trim().equals("")){
			m.put("searchNumber", sNumber);
		}
		if(censor!=null&&censor.equals("pass")){
			m.put("pass", censor);
		}
		if(censor!=null&&censor.equals("in")){
			m.put("in", censor);
		}
		if(censor!=null&&censor.equals("over")){
			m.put("over", censor);
		}
		return ProductDao.getProductSearchList(m);
	}

	public static void setProductStatus(String[] strings,String status)throws Exception {
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			HashMap m=new HashMap();
			if(status!=null&&status.equals("del")){
				for(String s:strings){
//					m.put("productId", s);
//					m.put("productStatus", status);
//					ProductDao.setProductStatus(m);
					Product p=ProductDao.getProductById(s);
					p.setProductEndDate(new Date());
					p.setProductStatus(status);
					ProductDao.updateProduct(p);
				}
			}else{
				for(String s:strings){
//					m.put("productId", s);
//					m.put("productStatus", status);
//					ProductDao.setProductStatus(m);
					Product p=ProductDao.getProductById(s);
					p.setProductModifyDate(new Date());
					p.setProductStatus(status);
					ProductDao.updateProduct(p);
				}
			}
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			// TODO: handle exception
			Logger log = Logger.getLogger("ProductService");
			log.info("setProductSatus出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	public static List<Product> getProductListChenL(Integer supplierId)throws Exception{
		return ProductDao.getProductListChenL(supplierId);
	}
	public static List<Product> getProductListBySupplierId(Integer supplierId)throws Exception{
		return ProductDao.getProductListBySupplierId(supplierId);
	}
	public static List<Product> getProductListByType(String type,int startCount,int endCount)throws Exception{
		HashMap m=new HashMap();
		if(type!=null&&!type.trim().equals("")){
			m.put("productType", type);	
		}
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		m.put("pass", "pass");
		m.put("productStatus", "on");
		return ProductDao.getProductListByType(m);
	}
	

	//+++添加商品点击
	/**
	 * 添加商品点击
	 * @throws Exception
	 */
	public static void addPdtClick(long productId) throws Exception {
		try{
				sqlMapFactory.getSqlMap().startTransaction();
				ProductDao.insertPdtClick(productId);
				sqlMapFactory.getSqlMap().commitTransaction();
		}catch(SQLException e){
			Logger log = Logger.getLogger(ProductService.class);
			log.error("添加商品点击 错误 SERVICE", e);
			throw new Exception(e);
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	public static void setProductCensor(String[] strings,Integer censor)throws Exception {
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			HashMap m=new HashMap();
				for(String s:strings){
					m.put("censor", censor);
					m.put("productId", s);
					ProductDao.setProductCensor(m);
				}
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			// TODO: handle exception
			Logger log = Logger.getLogger("ProductService");
			log.info("setProductCensor出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	
	public static List<Product> getProductListOrderByView(Integer start,Integer end)throws Exception{
		Map<String,Object> m=new HashMap<String,Object>();
		m.put("startCount", start);
		m.put("endCount", end);
		return ProductDao.getProductListOrderByView(m);
	}
	
	
	public static void updateProductAmount(Integer stockAmount, Long productId,String type)throws Exception{
		Product product = ProductService.findProductById(productId);
		Map<String,Object> m = new HashMap<String,Object>();		
		m.put("productId", productId);
		
		//type 参数说明:( lower: 库存减少； add: 库存增加 )
		if(type.equals("lower")){
			m.put("stockAmount", product.getWareCount() - stockAmount);
		}else if(type.equals("add")){
			m.put("stockAmount", product.getWareCount() + stockAmount);
		}else{
			m.put("stockAmount", product.getWareCount());
		}
		
		ProductDao.updateProductAmount(m);
	}
	 
	
	
}
