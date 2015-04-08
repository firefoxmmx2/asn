/**
 * 
 */
package com.bornsoft.asn.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


/**
 * base action
 * @author Ken Liu Kunyun
 * Created on Feb 25, 2010
 */
@SuppressWarnings("serial")
public class BaseAction extends ActionSupport {
	
	private PrintWriter out;  // response writer
	
	/**
	 * get session value
	 * @param key
	 * @return
	 */
	protected Object session(String name){
		return ActionContext.getContext().getSession().get(name);
	}
	
	/**
	 * set session attribute
	 * @param name
	 * @param value
	 */
	protected void session(String name, Object value){
		ActionContext.getContext().getSession().put(name, value);
	}
	
	/**
	 * get request
	 * @return
	 */
	protected HttpServletRequest getRequest(){
		HttpServletRequest request=(HttpServletRequest)ActionContext.getContext().get(StrutsStatics.HTTP_REQUEST);
		return request;
	}
	
	/**
	 * get response
	 * @return
	 */
	protected HttpServletResponse getResponse(){
		HttpServletResponse request=(HttpServletResponse)ActionContext.getContext().get(StrutsStatics.HTTP_RESPONSE);
		return request;
	}
	
	/**
	 * get response out writer
	 * @return
	 * @throws IOException
	 */
	protected PrintWriter getOut() throws IOException{
		if(out==null) {
			getResponse().setCharacterEncoding("utf-8");
			getResponse().setContentType("text/html; charset=UTF-8");
			out=getResponse().getWriter();
		}
		return out;
	}
	
	/**
	 * get request parameter
	 * @param name
	 * @return
	 */
	protected String request(String name){
		return getRequest().getParameter(name);
	}

	/**
	 * set request attribute
	 * @param name
	 * @param value
	 * @return
	 */
	protected void request(String name, Object value){
		getRequest().setAttribute(name, value);
	}

	/**
	 * write string to client
	 * @param s
	 * @throws IOException
	 */
	protected void print(Object s){
		try {
			getOut().print(s);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	protected void printf(String format, Object ... args){
		try {
			getOut().printf(format, args);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
}
