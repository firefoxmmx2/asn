/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bornsoft.asn.bean.quotation;

import java.io.Serializable;

/**
 *行情产品类型
 * @author hooxin
 */
public class QuotationProductType implements Serializable{

    /**
	 * 
	 */
	private static final long	serialVersionUID	= -1408170459272678030L;
	private Integer quotationPTypeCode;
    private String quotationPTName;
    private Integer quotationPTSort;

    public Integer getQuotationPTSort() {
        return quotationPTSort;
    }

    public void setQuotationPTSort(Integer quotationPTSort) {
        this.quotationPTSort = quotationPTSort;
    }

    public String getQuotationPTName() {
        return quotationPTName;
    }

    public void setQuotationPTName(String quotationPTName) {
        this.quotationPTName = quotationPTName;
    }
    
    public Integer getQuotationPTypeCode() {
        return quotationPTypeCode;
    }

    public void setQuotationPTypeCode(Integer quotationPTypeCode) {
        this.quotationPTypeCode = quotationPTypeCode;
    }

}
