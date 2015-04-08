package com.bornsoft.asn.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.common.Logger;

import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.utils.common.PropertyFactory;
import com.bornsoft.asn.utils.common.WebContext;
import com.bornsoft.asn.utils.common.AsnConstLib.MemberApproveState;
import com.bornsoft.asn.utils.common.AsnConstLib.MemberLockState;
import com.bornsoft.sso.util.Validate;

/**
 * Servlet implementation class LoginCallbackServlet
 */
public class LoginCallbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCallbackServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isLogin = MemberService.isLogin(request);
		if(isLogin){
			try {
				navigate(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				Logger log = Logger.getLogger(LoginCallbackServlet.class);
				log.error("登录失败",e);
			}
		} else{
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("登录失败！");
		}
	}
	
	public static void navigate(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String url=request.getParameter("forward");
		if(url!=null){
			url=URLDecoder.decode(URLDecoder.decode(request.getParameter("forward"), "utf-8"), "utf-8");
		}
		// check member lock state
		MemberLockState lockState=MemberService.getLockState(request);
		if(lockState.equals(MemberLockState.Locked)){
			// go locked page
			url=PropertyFactory.getSecurityProperties().getProperty("member_locked_url");
		}
		// redirect to ulr according to member state
		if(url==null){
			url=PropertyFactory.getSecurityProperties().getProperty("member_home");
		}
		url=WebContext.fullUrl(request, url);
		response.sendRedirect(url);

	}

}
