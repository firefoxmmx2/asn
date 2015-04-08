package com.bornsoft.asn.utils.common;

/**
 * @author liujunwei (liujunwei.cq@163.com)
 * company:重庆市博恩软件公司 
 *    duty:project manager
 *    name:刘军伟
 *    time:2010-10-22
 */
public class NavigatorUtils
{
	/**
	 * @description 后台根据页面进入方式，在弹出的窗口中增加模板套用
	 * @param siteString
	 */
	public static String getNavigatorName(String siteString)
	{
		String retStr = "";
		if(siteString!=null&&siteString.trim().length()>0)
		{
			if(retStr.indexOf("www.cqncp.com")>0)
				retStr = "platform";
			else if(retStr.indexOf("mall.cqapg.com")>0)
				retStr = "ncp";
			else if(retStr.indexOf("xs.cqncp.com")>0)
				retStr = "xs";
		}	
		
		return retStr;
	}
}
