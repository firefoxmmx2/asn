package com.bornsoft.asn.exception;

public class ActionException extends RuntimeException{

	/**
	 * Action层对异常的处理
	 */
	private static final long serialVersionUID = 1L;
	
	
	public ActionException(String msg){
		super(msg);
	}
	
	public ActionException(Throwable cause){
	   super(cause);	
	}
	
	public ActionException(String msg,Throwable cause){
		super(msg, cause);
	}

}
