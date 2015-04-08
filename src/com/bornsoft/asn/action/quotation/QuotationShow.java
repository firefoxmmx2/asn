package com.bornsoft.asn.action.quotation;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.bornsoft.asn.bean.quotation.QuotationInfo;
import com.bornsoft.asn.bean.quotation.QuotationInfoStat;
import com.bornsoft.asn.service.quotation.QuotationService;
import com.opensymphony.xwork2.ActionSupport;

public class QuotationShow extends ActionSupport{
	private int qcd;
	private QuotationInfo quoInfo;
	
	
	public String execute() throws Exception {
		if(qcd <= 0)
			return INPUT;
		quoInfo = QuotationService.getQuotation(qcd);
		// for test
//		quoInfo = new QuotationInfo();
//		quoInfo.setQuotationCode(1);
//		quoInfo.setQuotationContent("赛考虑到附加苏联的开发就");
//		quoInfo.setQuotationName("重庆市大渡口菜市行情");
//		quoInfo.setReleaseDate("2010-3-2");
//		quoInfo.setSource("重庆食品网");
//		quoInfo.setReleasePerson("上帝");
//		
//		List<QuotationInfoStat> l = new ArrayList<QuotationInfoStat>();
//		for(int i=0;i<5;i++){
//			QuotationInfoStat qis = new QuotationInfoStat();
//			qis.setAvgPrice(11.1F);
//			qis.setComments("aa");
//			qis.setHighestPrice(22.2f);
//			qis.setLowestPrice(8f);
//			qis.setMarketName("大渡口");
//			qis.setMeasureUnit("公斤");
//			qis.setPriceUnit("元");
//			qis.setProductName("白菜");
//			l.add(qis);
//		}
//		quoInfo.setQuoInfoStat(l);
		//test end;
		
		if(quoInfo == null){
			this.addActionError("该主题不存在!!");
			return ERROR;
		}
		return SUCCESS;
	}

	public void setQcd(int qcd) {
		this.qcd = qcd;
	}

	public int getQcd() {
		return qcd;
	}

	public QuotationInfo getQuoInfo()
	{
		return quoInfo;
	}

	public void setQuoInfo(QuotationInfo quoInfo)
	{
		this.quoInfo = quoInfo;
	}
}
