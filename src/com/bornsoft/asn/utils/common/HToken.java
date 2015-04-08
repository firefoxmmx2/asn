package com.bornsoft.asn.utils.common;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

public class HToken{
	/**
	 * 
	 */
	private int timeout;
	private String key;
	private long token;
	public HttpServletRequest req;
	
	public HToken(String key, int timeout, HttpServletRequest req){
		this.key = key;
		this.req = req;
		this.timeout = timeout;
		this.token = new Date().getTime();
		req.getSession().setAttribute(key, this);
	}
	
	public synchronized static HToken getHToken(String key,int timeout, HttpServletRequest req){
		HToken ht = null;
		if(req.getSession().getAttribute(key) == null)
			ht = new HToken(key, timeout ,req);
		else {
			ht = (HToken)req.getSession().getAttribute(key);
			ht.req = req;
		}
		return ht;
	}
	
	
	public synchronized boolean isAvailable(){
//		if(req.getSession().getAttribute(key) == null)
//			return true;
//		else
//			return false;
		boolean ret = false;
		Calendar cl = Calendar.getInstance();
		Calendar nowCl = Calendar.getInstance();

		nowCl.setTime(new Date());
		cl.setTime(new Date(this.token));
		cl.add(Calendar.MILLISECOND, timeout);
		
		if(cl.compareTo(nowCl) > 0)
			ret = false;
		else{
			ret = true;
			try{
				if(req.getSession().getAttribute(key) != null)
					req.getSession().removeAttribute(key);
			}catch (Exception e) {
				
			}
		}
		
		return ret;
	} 
}