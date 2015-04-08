/**
 * 
 */
package com.bornsoft.asn.utils.common;

import org.apache.log4j.Logger;


/**
 * @author liujunwei (liujunwei.cq@163.com)
 * company:重庆市博恩软件公司 
 *    duty:project manager
 *    name:刘军伟
 *    time:2010-9-9
 */
public class SmsMobileType
{
	private static Logger logger = Logger.getLogger(SmsMobileType.class);
	
	private static String mobileSectionsYd = "134(0-8),135,136,137,138,139,147,150,151,152,157,158,159,187,188";
	private static String mobileSectionsLt = "130,131,132,155,156,185,186";
	private static String mobileSectionsDx = "133,153,180,189";
	
	/**
	 * @description 根据手机号码获取所属段
	 * @param mobileNo
	 * @return
	 */
	public static String getMobileType(String mobileNo)
	{
		String retValue = "E";
		
		try
		{
			if(mobileNo==null || mobileNo.trim().length()!=11 || Long.parseLong(mobileNo)<=0)
			{
				logger.error("非法手机号码！"+mobileNo);
				return retValue;
			}
			
			String tmpNo = mobileNo.substring(0, 3);
					
			//检查号码是否属于移动段
			String[] nos = mobileSectionsYd.split(",");
			if(nos!=null&&nos.length>0)
			{
				int len = nos.length;
				for(int i=0;i<len;i++)
				{
					if(tmpNo.equalsIgnoreCase(nos[i]))
					{
						retValue="Y";
						return retValue;
					}
				}
			}
	
			//检查号码是否属于联通段
			nos = mobileSectionsLt.split(",");
			if(nos!=null&&nos.length>0)
			{
				int len = nos.length;
				for(int i=0;i<len;i++)
				{
					if(tmpNo.equalsIgnoreCase(nos[i]))
					{
						retValue="L";
						return retValue;
					}
				}
			}
	
			//检查号码是否属于电信段
			nos = mobileSectionsDx.split(",");
			if(nos!=null&&nos.length>0)
			{
				int len = nos.length;
				for(int i=0;i<len;i++)
				{
					if(tmpNo.equalsIgnoreCase(nos[i]))
					{
						retValue="D";
						return retValue;
					}
				}
			}
		}catch(Exception e)
		{
			logger.error("获取手机号码段失败！"+mobileNo);
			retValue = "E";
		}
		
		return retValue;
	}
	
	/**
	 * @param args
	 */
	public static void main(String[] args)
	{
		System.out.println(">>" + getMobileType("13883088505"));
		System.out.println(">>" + getMobileType("测试122"));
	}
	
}
