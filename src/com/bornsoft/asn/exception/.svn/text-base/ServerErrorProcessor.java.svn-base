package com.bornsoft.asn.exception;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 500 error processor
 * @author hooxin
 *
 */
public class ServerErrorProcessor implements ErrorProcessor {
	private String id;//id 
	private String code;// error code ,like 404,500.. 
	
	
	/* (non-Javadoc)
	 * 
	 * @see com.bornsoft.asn.exception.ErrorProcessor#process(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public void process(HttpServletRequest request, HttpServletResponse response) {
//		String exceptionName=(String)request.getAttribute("javax.servlet.error.servlet_name");
		
		request.setAttribute("title", "操作错误");
		request.setAttribute("message", "系统发生异常请联系管理员");
		Map<String, Object> map=new HashMap<String, Object>();
		Map<String, Object> attributeMap=new HashMap<String, Object>();
		attributeMap.put("title", "操作错误");
		attributeMap.put("message", "系统发生异常请联系管理员");
		map.put("error",attributeMap );
		request.setAttribute("tiles", map);
		request.setAttribute("forward", "/error.jsp");
	}

	public String getId() {
		return id;
	}



	public String getCode() {
		return code;
	}



	public void setId(String id) {
		this.id = id;
	}



	public void setCode(String code) {
		this.code = code;
	}

}
