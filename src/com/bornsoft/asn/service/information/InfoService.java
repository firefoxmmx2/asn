package com.bornsoft.asn.service.information;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.information.PurchaseInfo;
import com.bornsoft.asn.bean.information.SupplyInfo;
import com.bornsoft.asn.dao.information.InfoDao;
import com.bornsoft.asn.utils.common.AsnConstLib;
import com.bornsoft.asn.utils.common.CensorTool;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class InfoService {

	public static void insertSupplyInfo(SupplyInfo supplyInfo) throws Exception {
		String source="";
		if(supplyInfo.getTitle()!=null){
			source+=supplyInfo.getTitle();
		}
		if(supplyInfo.getKeyWord()!=null){
			source+=supplyInfo.getKeyWord();
		}
		if(supplyInfo.getDetail()!=null){
			source+=supplyInfo.getDetail();
		}
		boolean b=CensorTool.getInstance().checkCensor(source);
		if(b){
			supplyInfo.setCensor(AsnConstLib.Censor_BlackWord);
		}else{
			supplyInfo.setCensor(AsnConstLib.Censor_Pending);
		}
		InfoDao.insertSupplyInfo(supplyInfo);		
	}
	public static void insertPurchaseInfo(PurchaseInfo purchaseInfo)throws Exception{
		String source="";
		if(purchaseInfo.getTitle()!=null){
			source+=purchaseInfo.getTitle();
		}
		if(purchaseInfo.getKeyWord()!=null){
			source+=purchaseInfo.getKeyWord();
		}
		if(purchaseInfo.getDetail()!=null){
			source+=purchaseInfo.getDetail();
		}
		boolean b=CensorTool.getInstance().checkCensor(source);
		if(b){
			purchaseInfo.setCensor(AsnConstLib.Censor_BlackWord);
		}else{
			purchaseInfo.setCensor(AsnConstLib.Censor_Pending);
		}
		InfoDao.insertPurchaseInfo(purchaseInfo);
	}

	public static int getSupplyInfoCount(Integer supplierId,String infoStatus)throws Exception{
		HashMap m=new HashMap();
		m.put("supplierId", supplierId);
		m.put("infoStatus", infoStatus);
		return InfoDao.getSupplyInfoCount(m);
	}
	public static int getPurchaseInfoCount(Integer memberId,String infoStatus)throws Exception{
		HashMap m=new HashMap();
		m.put("memberId", memberId);
		m.put("infoStatus", infoStatus);
		return InfoDao.getPurchaseInfoCount(m);
	}
	
	public static int getSupplyInfoSearchCount(Integer supplierId,String infoStatus,String searchTitle,String searchWord,String censor)throws Exception{
		HashMap m=new HashMap();
		m.put("supplierId", supplierId);
		m.put("infoStatus", infoStatus);
		m.put("searchTitle", searchTitle);
		m.put("searchWord", searchWord);
		if(censor!=null&&censor.equals("pass")){
			m.put("pass", censor);
		}
		if(censor!=null&&censor.equals("in")){
			m.put("in", censor);
		}
		if(censor!=null&&censor.equals("over")){
			m.put("over", censor);
		}
		return InfoDao.getSupplyInfoCount(m);
	}
	public static int getPurchaseInfoSearchCount(Integer memberId,String infoStatus,String searchTitle,String searchWord,String censor)throws Exception{
		HashMap m=new HashMap();
		m.put("memberId", memberId);
		m.put("infoStatus", infoStatus);
		m.put("searchTitle", searchTitle);
		m.put("searchWord", searchWord);
		if(censor!=null&&censor.equals("pass")){
			m.put("pass", censor);
		}
		if(censor!=null&&censor.equals("in")){
			m.put("in", censor);
		}
		if(censor!=null&&censor.equals("over")){
			m.put("over", censor);
		}
		return InfoDao.getPurchaseInfoCount(m);
	}

	public static List<SupplyInfo> getSupplyInfoList(Integer supplierId,String infoStatus, int page, int pageSize)throws Exception  {
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;		
		HashMap m=new HashMap();
		m.put("supplierId", supplierId);
		m.put("infoStatus", infoStatus);
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		return InfoDao.getSupplyInfoList(m);
	}
	public static List<PurchaseInfo> getPurchaseInfoList(Integer memberId,String infoStatus, int page, int pageSize)throws Exception{
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;		
		HashMap m=new HashMap();
		m.put("memberId", memberId);
		m.put("infoStatus", infoStatus);
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		return InfoDao.getPurchaseInfoList(m);
	}
	
	public static List<SupplyInfo> getSupplyInfoSearchList(Integer supplierId,String infoStatus,String searchTitle,String searchWord, String censor,int page, int pageSize)throws Exception{
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;		
		HashMap m=new HashMap();
		m.put("supplierId", supplierId);
		m.put("infoStatus", infoStatus);
		m.put("searchTitle", searchTitle);
		m.put("searchWord", searchWord);
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		if(censor!=null&&censor.equals("pass")){
			m.put("pass", censor);
		}
		if(censor!=null&&censor.equals("in")){
			m.put("in", censor);
		}
		if(censor!=null&&censor.equals("over")){
			m.put("over", censor);
		}
		return InfoDao.getSupplyInfoList(m);
	}
	public static List<PurchaseInfo> getPurchaseInfoSearchList(Integer memberId,String infoStatus,String searchTitle,String searchWord, String censor,int page, int pageSize)throws Exception{
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;		
		HashMap m=new HashMap();
		m.put("memberId", memberId);
		m.put("infoStatus", infoStatus);
		m.put("searchTitle", searchTitle);
		m.put("searchWord", searchWord);
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		if(censor!=null&&censor.equals("pass")){
			m.put("pass", censor);
		}
		if(censor!=null&&censor.equals("in")){
			m.put("in", censor);
		}
		if(censor!=null&&censor.equals("over")){
			m.put("over", censor);
		}
		return InfoDao.getPurchaseInfoList(m);
	}

	public static void setInfoStatus(String[] strings, String status) throws Exception{
		HashMap m=new HashMap();
		if(status.equals("del")){
			for(String s:strings){
				m.put("delDate", new Date());
				m.put("infoId", s);
				m.put("infoStatus", status);
				InfoDao.setInfoStatus(m);
			}
		}else{
			for(String s:strings){
				m.put("infoId", s);
				m.put("infoStatus", status);
				m.put("modifyDate", new Date());
				InfoDao.setInfoStatus(m);
			}
		}
	}

	public static SupplyInfo getSupplyInfoById(String id) throws Exception {
		return InfoDao.getSupplyInfoById(id);
	}
	public static PurchaseInfo getPurchaseInfoById(String id)throws Exception{
		return InfoDao.getPurchaseInfoById(id);
	}
	
	public static void updateSupplyInfo(SupplyInfo supplyInfo)throws Exception{
		String source="";
		if(supplyInfo.getTitle()!=null){
			source+=supplyInfo.getTitle();
		}
		if(supplyInfo.getKeyWord()!=null){
			source+=supplyInfo.getKeyWord();
		}
		if(supplyInfo.getDetail()!=null){
			source+=supplyInfo.getDetail();
		}
		boolean b=CensorTool.getInstance().checkCensor(source);
		if(b){
			supplyInfo.setCensor(AsnConstLib.Censor_BlackWord);
		}else{
			supplyInfo.setCensor(AsnConstLib.Censor_Pending);
		}
		InfoDao.updateSupplyInfo(supplyInfo);
	}
	public static void updatePurchaseInfo(PurchaseInfo purchaseInfo)throws Exception{
		String source="";
		if(purchaseInfo.getTitle()!=null){
			source+=purchaseInfo.getTitle();
		}
		if(purchaseInfo.getKeyWord()!=null){
			source+=purchaseInfo.getKeyWord();
		}
		if(purchaseInfo.getDetail()!=null){
			source+=purchaseInfo.getDetail();
		}
		boolean b=CensorTool.getInstance().checkCensor(source);
		if(b){
			purchaseInfo.setCensor(AsnConstLib.Censor_BlackWord);
		}else{
			purchaseInfo.setCensor(AsnConstLib.Censor_Pending);
		}
		InfoDao.updatePurchaseInfo(purchaseInfo);
	}
	public static int showSupplyInfoListCount(String type,String searchWord,String area)throws Exception{
		HashMap m=new HashMap();
		m.put("infoStatus","on" );		
		if(type!=null&&!type.trim().equals("")){
			m.put("type",type );
		}
		if(searchWord!=null&&!searchWord.trim().equals("")){
			m.put("keyWord", searchWord);
		}
		if(area!=null&&!area.trim().equals("")){
			m.put("area", area);
		}	
		return InfoDao.showSupplyInfoListCount(m);
	}
	public static int showPurchaseInfoListCount(String type,String searchWord,String area)throws Exception{
		HashMap m=new HashMap();
		m.put("infoStatus","on" );		
		if(type!=null&&!type.trim().equals("")){
			m.put("type",type );
		}
		if(searchWord!=null&&!searchWord.trim().equals("")){
			m.put("keyWord", searchWord);
		}
		if(area!=null&&!area.trim().equals("")){
			m.put("area", area);
		}	
		return InfoDao.showPurchaseInfoListCount(m);
	}
	public static List<SupplyInfo> showSupplyInfoList(int page, int pageSize,String type,String searchWord,String area)throws Exception {
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;		
		HashMap m=new HashMap();
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		m.put("infoStatus","on");
		if(type!=null&&!type.trim().equals("")){
			m.put("type",type );
		}
		if(searchWord!=null&&!searchWord.trim().equals("")){
			m.put("keyWord", searchWord);
		}
		if(area!=null&&!area.trim().equals("")){
			m.put("area", area);
		}
		return InfoDao.showSupplyInfoList(m);
	}
	public static List<PurchaseInfo> showPurchaseInfoList(int page, int pageSize,String type,String searchWord,String area)throws Exception {
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;		
		HashMap m=new HashMap();
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		m.put("infoStatus","on");
		if(type!=null&&!type.trim().equals("")){
			m.put("type",type );
		}
		if(searchWord!=null&&!searchWord.trim().equals("")){
			m.put("keyWord", searchWord);
		}
		if(area!=null&&!area.trim().equals("")){
			m.put("area", area);
		}
		return InfoDao.showPurchaseInfoList(m);
	}
	public static List<SupplyInfo> showSupplyInfoLi(int startCount, int endCount,String type,Integer supplierId,String infoId,String notLong,String area) throws Exception{
		HashMap m=new HashMap();
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		m.put("infoStatus","on");
		m.put("type", type);
		if(supplierId!=null){
			m.put("supplierId", supplierId);
		}
		if(infoId!=null){
			m.put("infoId", infoId);
		}
		if(notLong!=null){
			m.put("notLong", notLong);
		}
		if(area!=null&&!area.trim().equals("")){
			m.put("area", area);
		}
		return InfoDao.showSupplyInfoList(m);
	}
	public static List<PurchaseInfo> showPurchaseInfoLi(int startCount, int endCount,String type,Integer memberId,String infoId,String notLong,String area) throws Exception{
		HashMap m=new HashMap();
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		m.put("infoStatus","on");
		m.put("type", type);
		if(memberId!=null){
			m.put("memberId", memberId);
		}
		if(infoId!=null){
			m.put("infoId", infoId);
		}
		if(notLong!=null){
			m.put("notLong", notLong);
		}
		if(area!=null&&!area.trim().equals("")){
			m.put("area", area);
		}
		return InfoDao.showPurchaseInfoList(m);
	}
	public static List<SupplyInfo> showSupplyInfoLong(int startCount, int endCount,String infoValidity) throws Exception{
		HashMap m=new HashMap();
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		m.put("infoStatus","on");
		m.put("infoValidity", infoValidity);
		return InfoDao.showSupplyInfoList(m);
	}
	public static List<PurchaseInfo> showPurchaseInfoLong(int startCount, int endCount,String infoValidity) throws Exception{
		HashMap m=new HashMap();
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		m.put("infoStatus","on");
		m.put("infoValidity", infoValidity);
		return InfoDao.showPurchaseInfoList(m);
	}
	public static List<SupplyInfo> getAllSupplyInfoList(Integer supplierId,String supplierName,String infoStatus,String searchTitle,Integer searchId,Integer censor,int page, int pageSize)throws Exception{
		HashMap m=new HashMap();
		if(supplierId!=null&&(supplierId instanceof Integer)){
			m.put("supplierId", supplierId);
		}
		if(infoStatus!=null&&!infoStatus.trim().equals("")){
			m.put("infoStatus", infoStatus);
		}
		if(searchTitle!=null&&!searchTitle.trim().equals("")){
			m.put("searchTitle", searchTitle);
		}
		if(searchId!=null&&(searchId instanceof Integer)){
			m.put("searchId", searchId);
		}
		if(supplierName!=null&&!supplierName.trim().equals("")){
			m.put("supplierName", supplierName);
		}
		if(censor!=null){
			m.put("censor", censor);
		}
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		return InfoDao.getAllSupplyInfoList(m);
	}
	public static List<PurchaseInfo> getAllPurchaseInfoList(Integer memberId,String memberName,String infoStatus,String searchTitle,Integer searchId,Integer censor,int page, int pageSize)throws Exception{
		HashMap m=new HashMap();
		if(memberId!=null&&(memberId instanceof Integer)){
			m.put("memberId", memberId);
		}
		if(infoStatus!=null&&!infoStatus.trim().equals("")){
			m.put("infoStatus", infoStatus);
		}
		if(searchTitle!=null&&!searchTitle.trim().equals("")){
			m.put("searchTitle", searchTitle);
		}
		if(searchId!=null&&(searchId instanceof Integer)){
			m.put("searchId", searchId);
		}
		if(memberName!=null&&!memberName.trim().equals("")){
			m.put("memberName", memberName);
		}
		if(censor!=null){
			m.put("censor", censor);
		}
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		return InfoDao.getAllPurchaseInfoList(m);
	}
	public static int getAllSupplyInfoCount(Integer supplierId,String supplierName,String infoStatus,String searchTitle,Integer searchId,Integer censor)throws Exception{
		HashMap m=new HashMap();
		if(supplierId!=null&&(supplierId instanceof Integer)){
			m.put("supplierId", supplierId);
		}
		if(infoStatus!=null&&!infoStatus.trim().equals("")){
			m.put("infoStatus", infoStatus);
		}
		if(searchTitle!=null&&!searchTitle.trim().equals("")){
			m.put("searchTitle", searchTitle);
		}
		if(searchId!=null&&(searchId instanceof Integer)){
			m.put("searchId", searchId);
		}
		if(supplierName!=null&&!supplierName.trim().equals("")){
			m.put("supplierName", supplierName);
		}
		if(censor!=null){
			m.put("censor", censor);
		}
		return InfoDao.getAllSupplyInfoCount(m);
	}
	public static int getAllPurchaseInfoCount(Integer memberId,String memberName,String infoStatus,String searchTitle,Integer searchId,Integer censor)throws Exception{
		HashMap m=new HashMap();
		if(memberId!=null&&(memberId instanceof Integer)){
			m.put("memberId", memberId);
		}
		if(infoStatus!=null&&!infoStatus.trim().equals("")){
			m.put("infoStatus", infoStatus);
		}
		if(searchTitle!=null&&!searchTitle.trim().equals("")){
			m.put("searchTitle", searchTitle);
		}
		if(searchId!=null&&(searchId instanceof Integer)){
			m.put("searchId", searchId);
		}
		if(memberName!=null&&!memberName.trim().equals("")){
			m.put("memberName", memberName);
		}
		if(censor!=null){
			m.put("censor", censor);
		}
		return InfoDao.getAllPurchaseInfoCount(m);
	}
	
	public static void setInfoCensor(String[] strings,Integer censor)throws Exception {
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			HashMap m=new HashMap();
				for(String s:strings){
					m.put("censor", censor);
					m.put("infoId", s);
					InfoDao.setInfoCensor(m);
				}
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch (Exception e) {
			// TODO: handle exception
			Logger log = Logger.getLogger("InfoService");
			log.info("setInfoCensor出错", e);
			sqlMapFactory.getSqlMap().getCurrentConnection().rollback();
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
}
