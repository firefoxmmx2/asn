package com.bornsoft.asn.bean.crm;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.bornsoft.asn.bean.member.Member;

/**
 * 
 * 客户服务排程
 * @author hooxin
 *
 */
public class CrmServicePlan implements Serializable
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -8018147951364049706L;
	/**
	 * 
	 */
	private Long				id;
	private String				title;
	private String				content;
	//關聯的客戶
	private List<Member>		customer = new ArrayList<Member>();
	private String				type;
	private String				sendType;
	private String				excuteType;
	private Date				createTime;
	private String				createMan;
	private String				timing;
	private Date				sendTime;
	private String				status;

	public CrmServicePlan()
	{
		super();
		// TODO Auto-generated constructor stub
	}

	public Long getId()
	{
		return id;
	}

	public String getTitle()
	{
		return title;
	}

	public String getContent()
	{
		return content;
	}

	public List<Member> getCustomer()
	{
		return customer;
	}

	public String getType()
	{
		return type;
	}

	public String getSendType()
	{
		return sendType;
	}

	public String getExcuteType()
	{
		return excuteType;
	}

	public Date getCreateTime()
	{
		return createTime;
	}

	public String getCreateMan()
	{
		return createMan;
	}

	public String getTiming()
	{
		return timing;
	}

	public Date getSendTime()
	{
		return sendTime;
	}

	public String getStatus()
	{
		return status;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public void setCustomer(List<Member> customer)
	{
		this.customer = customer;
	}

	public void setType(String type)
	{
		this.type = type;
	}

	public void setSendType(String sendType)
	{
		this.sendType = sendType;
	}

	public void setExcuteType(String excuteType)
	{
		this.excuteType = excuteType;
	}

	public void setCreateTime(Date createTime)
	{
		this.createTime = createTime;
	}

	public void setCreateMan(String createMan)
	{
		this.createMan = createMan;
	}

	public void setTiming(String timing)
	{
		this.timing = timing;
	}

	public void setSendTime(Date sendTime)
	{
		this.sendTime = sendTime;
	}

	public void setStatus(String status)
	{
		this.status = status;
	}

	
}
