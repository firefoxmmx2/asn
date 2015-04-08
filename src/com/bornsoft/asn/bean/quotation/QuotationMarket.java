/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bornsoft.asn.bean.quotation;

import java.io.Serializable;
import java.util.Date;

/**
 * 行情市场
 * @author hooxin
 */
public class QuotationMarket implements Serializable{
    /**
	 * 
	 */
	private static final long	serialVersionUID	= -6822588065416904917L;
	//市场编号
    private Integer marketCode;
    //地区
    private String area;
    //市场名称
    private String marketName;
    //市场维护人
    private String updatePerson;
    //市场更新时间
    private Date updateTime;

    
    public Integer getMarketCode() {
		return marketCode;
	}

	public void setMarketCode(Integer marketCode) {
		this.marketCode = marketCode;
	}

	public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getMarketName() {
        return marketName;
    }

    public void setMarketName(String marketName) {
        this.marketName = marketName;
    }

    public String getUpdatePerson() {
        return updatePerson;
    }

    public void setUpdatePerson(String updatePerson) {
        this.updatePerson = updatePerson;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
    
}
