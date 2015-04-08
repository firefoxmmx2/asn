package com.bornsoft.asn.action;

import com.bornsoft.asn.utils.common.CensorTool;
import com.bornsoft.asn.utils.common.KeywordTool;

public class CensorAndKeywordAction extends BaseAction{
	private String censorword;
	private String keyword;
	
	public String getCensorword() {
		return censorword;
	}

	public void setCensorword(String censorword) {
		this.censorword = censorword;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String toCensorTable()throws Exception{
		censorword=CensorTool.getInstance().getData();
		censorword=censorword.trim();
		return SUCCESS;
	}
	
	public String toKeywordTable() throws Exception{
		keyword=KeywordTool.getInstatnce().getData();
		keyword=keyword.trim();
		return SUCCESS;
	}
	
	public String updateCensorword()throws Exception{
		censorword=censorword.trim();
		CensorTool.getInstance().setData(censorword);
		this.getRequest().setAttribute("tip", "更新成功");
		return SUCCESS;
	}
	
	public String updateKeyword()throws Exception{
		keyword=keyword.trim();
		KeywordTool.getInstatnce().setData(keyword);
		this.getRequest().setAttribute("tip", "更新成功");
		return SUCCESS;
	}
}
