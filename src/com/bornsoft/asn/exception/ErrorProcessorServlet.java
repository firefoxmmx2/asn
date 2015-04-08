package com.bornsoft.asn.exception;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ErrorProcessorServlet extends HttpServlet {
	

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ErrorProcessorFactory.filePath=request.getRealPath("/")+"/WEB-INF/error.xml";
		List<ErrorProcessor> processorList=ErrorProcessorFactory.getErrorProcessors();

		/*
		 * 		javax.servlet.error.message=/asn/sss
		javax.servlet.error.status_code=404
		javax.servlet.error.servlet_name=default
		javax.servlet.error.request_uri=/asn/sss
		 * */
		String statusCode=request.getAttribute("javax.servlet.error.status_code").toString();
		
		for(ErrorProcessor processor : processorList){
			if(statusCode.equals(processor.getCode()) && request.getAttribute("break")==null)
				processor.process(request, response);
		}
		
		if(request.getAttribute("forward")!=null){
			request.getRequestDispatcher(request.getAttribute("forward").toString()).forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doGet(request,response);
	}

	public ErrorProcessorServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
