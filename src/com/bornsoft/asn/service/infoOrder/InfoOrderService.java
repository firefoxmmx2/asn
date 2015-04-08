package com.bornsoft.asn.service.infoOrder;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.bornsoft.asn.bean.infoOrder.InfoOrder;
import com.bornsoft.asn.bean.infoOrder.InfoOrderMan;
import com.bornsoft.asn.bean.infoOrder.InfoOrderType;
import com.bornsoft.asn.dao.infoOrder.InfoOrderDao;
import com.bornsoft.asn.dao.infoOrder.InfoOrderManDao;
import com.bornsoft.asn.dao.infoOrder.InfoOrderTypeDao;
import com.bornsoft.asn.vo.InfoOrderManAll;

public class InfoOrderService {
	public static List<InfoOrderMan> getInfoOrderManByMemberId(Long l)throws Exception{
		return InfoOrderManDao.getInfoOrderManByMemberId(l);
	}
	
	public static List<InfoOrderType> getInfoOrderType()throws Exception{
		return InfoOrderTypeDao.getInfoOrderType();
	}
	
	public static void insertInfoOrderMan(InfoOrderMan infoOrderMan)throws Exception{
		InfoOrderManDao.insertInfoOrderMan(infoOrderMan);
	}
	
	public static void setInfoOrderManCancel(Long id,String cancel)throws Exception{
		HashMap m=new HashMap();
		m.put("cancel",cancel);
		m.put("id", id);
		m.put("modifyTime", new Date());
		InfoOrderManDao.setInfoOrderManCancel(m);
	}
	
	public static void setInfoOrderManAllCancel(Long memberId,String cancel)throws Exception{
		HashMap m=new HashMap();
		m.put("cancel",cancel);
		m.put("memberId", memberId);
		m.put("modifyTime", new Date());
		InfoOrderManDao.setInfoOrderManAllCancel(m);
	}
	
	public static void setInfoOrderManEmail(Long memberId,String email)throws Exception{
		HashMap m=new HashMap();
		m.put("memberId", memberId);
		m.put("email", email);
		InfoOrderManDao.setInfoOrderManEmail(m);
	}
	
	public static List<InfoOrderManAll> getInfoOrderManAll(String fullName,String cancel,String infoTypeId,int startCount,int endCount)throws Exception{
		HashMap m=new HashMap();
		if(fullName!=null&&!fullName.trim().equals("")){
			m.put("fullName", fullName);
		}
		if(cancel!=null&&!cancel.trim().equals("")){
			m.put("cancel", cancel);
		}
		if(infoTypeId!=null&&!infoTypeId.trim().equals("")){
			m.put("infoTypeId", infoTypeId);
		}
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		return InfoOrderManDao.getInfoOrderManAll(m);
	}
	
	public static Integer getInfoOrderManAllCount(String fullName,String cancel,String infoTypeId)throws Exception{
		HashMap m=new HashMap();
		if(fullName!=null&&!fullName.trim().equals("")){
			m.put("fullName", fullName);
		}
		if(cancel!=null&&!cancel.trim().equals("")){
			m.put("cancel", cancel);
		}
		if(infoTypeId!=null&&!infoTypeId.trim().equals("")){
			m.put("infoTypeId", infoTypeId);
		}
		return InfoOrderManDao.getInfoOrderManAllCount(m);
	}
	
	public static List<InfoOrder> getInfoOrderList(String infoName,String infoTypeId,String receiveEmail,int start,int end)throws Exception{
		HashMap m=new HashMap();
		if(infoName!=null&&!infoName.trim().equals("")){
			m.put("infoName", infoName);
		}
		if(infoTypeId!=null&&!infoTypeId.trim().equals("")){
			m.put("infoTypeId", infoTypeId);
		}
		if(receiveEmail!=null&&!receiveEmail.trim().equals("")){
			m.put("receiveEmail",receiveEmail);
		}
		m.put("startCount", start);
		m.put("endCount", end);
		return InfoOrderDao.getInfoOrderList(m);
	}
	
	public static Integer getInfoOrderListCount(String infoName,String infoTypeId,String receiveEmail)throws Exception{
		HashMap m=new HashMap();
		if(infoName!=null&&!infoName.trim().equals("")){
			m.put("infoName", infoName);
		}
		if(infoTypeId!=null&&!infoTypeId.trim().equals("")){
			m.put("infoTypeId", infoTypeId);
		}
		if(receiveEmail!=null&&!receiveEmail.trim().equals("")){
			m.put("receiveEmail",receiveEmail);
		}
		
		return InfoOrderDao.getInfoOrderListCount(m);
	}
	
	public static InfoOrder getInfo(String id)throws Exception{
		return InfoOrderDao.getInfo(id);
	}
}
