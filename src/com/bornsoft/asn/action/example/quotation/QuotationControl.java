package com.bornsoft.asn.action.example.quotation;

import com.opensymphony.xwork2.ActionSupport;

/**
 * package的命名规则 com.bornsoft.asn.分成名称或者工具名词.模块名
 * */
public class QuotationControl extends ActionSupport {
	
	public String execute() throws Exception {
		return "toViewlist";
	}
	
	public String toNew() throws Exception {
		return "toNew";
	}
	
	public String toUpdate() throws Exception {
		return "toUpdate";
	}
	
	public String toNews() throws Exception {
		return "toNews";
	}
	
	public String delete() throws Exception {
		return "delete";
	}
}
