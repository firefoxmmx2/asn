package com.bornsoft.asn.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bornsoft.asn.exception.ActionException;
import com.bornsoft.asn.utils.common.PropertyFactory;
import com.bornsoft.asn.utils.common.ServletTool;
import com.bornsoft.asn.utils.common.Str;

/**
 * Servlet implementation class ErrorRuntimeExceptionServlet
 */
public class ErrorRuntimeExceptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ErrorRuntimeExceptionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("runtimeException done");
		String url = (String) request.getAttribute("javax.servlet.error.request_uri");
		String errorName=(String)request.getAttribute("javax.servlet.error.message");
		Exception errorException = (Exception)request.getAttribute("javax.servlet.error.exception");
		Class errorType=(Class)request.getAttribute("javax.servlet.error.exception_type");
		Properties excepProperty = PropertyFactory.getPropertiesByFileName("exceptmsg.properties");
		
		String errorHTML="";
		if(errorException instanceof ActionException){
			errorHTML = excepProperty.getProperty("asn.exceptmsg.temple.action_except");
			errorHTML = Str.parseString(errorHTML, new Object[] {errorException.getMessage(), errorException.getCause().toString()});
		}
		if(errorException instanceof SQLException){
			errorHTML = excepProperty.getProperty("asn.exceptmsg.temple.default_except");
			errorHTML = Str.parseString(errorHTML, new Object[] {url,errorException.getCause()});
		}
		else{
			errorHTML = excepProperty.getProperty("asn.exceptmsg.temple.default_except");
			errorHTML = Str.parseString(errorHTML, new Object[] {url});
		}
		ServletTool.showError(request, response, "错误",errorHTML);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
