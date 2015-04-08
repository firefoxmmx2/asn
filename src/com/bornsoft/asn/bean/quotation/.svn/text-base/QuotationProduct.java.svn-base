/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bornsoft.asn.bean.quotation;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * 行情产品
 * @author hooxin
 */
public class QuotationProduct implements Serializable{
    /**
	 * 
	 */
	private static final long	serialVersionUID	= 1343488712742006625L;
	//行情产品编号
    private Integer quotationPCode;
    //原始行情产品别名 用于数据存储
    private String quotationPNameAlias;
    //行情产品别名
    private List<String> quotationPNameAliases;
    //行情产品类型
    private QuotationProductType quotationPT;
    // 行情产品名称
    private String quotationPName;

    public String getQuotationPName() {
        return quotationPName;
    }

    public void setQuotationPName(String quotationPName) {
        this.quotationPName = quotationPName;
    }


    public List<String> getQuotationPNameAliases() {
        if(quotationPNameAliases == null && quotationPNameAlias != null){
            quotationPNameAliases = new ArrayList<String>();
            quotationPNameAliases.addAll(Arrays.asList(quotationPNameAlias.split(",")));
        }
        return quotationPNameAliases;
    }

    public void setQuotationPNameAliases(List<String> quotationPNameAliases) {
        this.quotationPNameAliases = quotationPNameAliases;
        StringBuffer pnames = new StringBuffer();
        for(String s : quotationPNameAliases){
            pnames.append(s);
            pnames.append(",");
        }
        pnames.setLength(pnames.length()-1);
        quotationPNameAlias = pnames.toString();
    }
    
    public Integer getQuotationPCode() {
        return quotationPCode;
    }

    public void setQuotationPCode(Integer quotationPCode) {
        this.quotationPCode = quotationPCode;
    }

    public QuotationProductType getQuotationPT() {
        return quotationPT;
    }

    public void setQuotationPT(QuotationProductType quotationPT) {
        this.quotationPT = quotationPT;
    }

	public String getQuotationPNameAlias() {
		return quotationPNameAlias;
	}

	public void setQuotationPNameAlias(String quotationPNameAlias) {
		this.quotationPNameAlias = quotationPNameAlias;
	}
    
    
}
