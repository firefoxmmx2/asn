/**
 * 
 */
package com.bornsoft.asn.utils.common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Ken Liu Kunyun
 * 工具类
 */
public class ServletTool {
	/**
	 * 返回信息
	 * @param response
	 * @param title
	 * @param info
	 */
	public static void writeOut(HttpServletRequest request,HttpServletResponse response,String title,String info){
		try {
			response.setCharacterEncoding("UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<html xmlns=\"http://www.w3.org/1999/xhtml\">");
			out.println("<head>");
			out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />");
			out.println("<title>"+title+"</title>");
			out.println("</head>");
			out.println("<body>");
			out.println(info);
			out.println("</body>");
			out.println("</html>");
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 显示错误信息
	 * @param request
	 * @param response
	 * @param title
	 * @param message
	 */
	public static void showError(HttpServletRequest request,HttpServletResponse response,String title,String message){
		try {
			request.setAttribute("title", title);
			request.setAttribute("message", message);
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}


}
