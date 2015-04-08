package com.bornsoft.sms.bean;

/**
 * @author liujunwei (liujunwei.cq@163.com)
 * company:重庆市博恩软件公司 
 *    duty:project manager
 *    name:刘军伟
 *    time:2010-8-30
 */
public class SmsReceive 
{
	private Long id;
	//手机号码
	private String mobileNo;
	//回复内容
	private String replyContent;
	//扩展码
	private Long extNumber;
	//是否处理过
	private String isHandled="N";
	//创建时间
	private String createTime;
	//发送时间
	private String handleTime;
	
	/**
	 * @return the id
	 */
	public Long getId()
	{
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(Long id)
	{
		this.id = id;
	}
	/**
	 * @return the mobileNo
	 */
	public String getMobileNo()
	{
		return mobileNo;
	}
	/**
	 * @param mobileNo the mobileNo to set
	 */
	public void setMobileNo(String mobileNo)
	{
		this.mobileNo = mobileNo;
	}
	/**
	 * @return the replyContent
	 */
	public String getReplyContent()
	{
		return replyContent;
	}
	/**
	 * @param replyContent the replyContent to set
	 */
	public void setReplyContent(String replyContent)
	{
		this.replyContent = replyContent;
	}
	/**
	 * @return the extNumber
	 */
	public Long getExtNumber()
	{
		return extNumber;
	}
	/**
	 * @param extNumber the extNumber to set
	 */
	public void setExtNumber(Long extNumber)
	{
		this.extNumber = extNumber;
	}
	/**
	 * @return the isHandled
	 */
	public String getIsHandled()
	{
		return isHandled;
	}
	/**
	 * @param isHandled the isHandled to set
	 */
	public void setIsHandled(String isHandled)
	{
		this.isHandled = isHandled;
	}
	/**
	 * @return the createTime
	 */
	public String getCreateTime()
	{
		return createTime;
	}
	/**
	 * @param createTime the createTime to set
	 */
	public void setCreateTime(String createTime)
	{
		this.createTime = createTime;
	}
	/**
	 * @return the handleTime
	 */
	public String getHandleTime()
	{
		return handleTime;
	}
	/**
	 * @param handleTime the handleTime to set
	 */
	public void setHandleTime(String handleTime)
	{
		this.handleTime = handleTime;
	}
	
}
