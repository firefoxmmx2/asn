package com.bornsoft.asn.service.report;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.bean.report.ReportClick;
import com.bornsoft.asn.bean.report.ReportMember;
import com.bornsoft.asn.bean.report.ReportTrade;
import com.bornsoft.asn.dao.report.ReportDao;
import com.bornsoft.asn.vo.ReportMemberBean;

public class ReportService {
   
	
	//会员
	public static Map<String, ReportMemberBean> get0(Map<String,Object> map){
		List<ReportMember> list=ReportDao.find0(map);		
		Map<String, ReportMemberBean> newMap =new HashMap<String, ReportMemberBean>(list.size());
		ReportMemberBean bean=null;
		for(int i=0;i<list.size();i++){
			if(!newMap.containsKey(list.get(i).getArea())){
				bean=new ReportMemberBean();
				bean.setArea(list.get(i).getArea());
				if(list.get(i).getMemberType().equals("1")){
					bean.setComCount(list.get(i).getCountMember());
				}else{
					bean.setPreCount(list.get(i).getCountMember());
				}
				newMap.put(list.get(i).getArea(), bean);
			}else{
				bean=(ReportMemberBean)newMap.get(list.get(i).getArea());
				if(list.get(i).getMemberType().equals("1")){
					int ck=bean.getComCount();
					int ack=list.get(i).getCountMember();
					bean.setComCount(ck+ack);
				}else{
					int ck=bean.getPreCount();
					int ack=list.get(i).getCountMember();
					bean.setPreCount(ck+ack);
				}
			}
		}
		return newMap;
	}

	//产品点击率
	public static List<ReportClick> get1(Map<String,Object> map){
		return ReportDao.find1(map);
	}
	
	//产品交易
	public static List<ReportTrade> get2(Map<String,Object> map){
		return ReportDao.find2(map);
	}
	

	
	public static int getCount0(Map<String,Object> map){
		return ReportDao.findCount0(map);
	}
	
	public static int getCount1(Map<String,Object> map){
		return ReportDao.findCount1(map);
	}
	
	public static int getCount2(Map<String,Object> map){
		return ReportDao.findCount2(map);
	}
}
