package com.bornsoft.asn.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
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

/**
 * Servlet implementation class SsoStubServlet
 */
public class SsoStubServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SsoStubServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isLogin = true;
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse res=(HttpServletResponse)response;
		if(isLogin){
			Map propertyMap = (Map)new HashMap();
			// propertyMap包含下列Key
			//登录者账号	account
			propertyMap.put("account", req.getParameter("account"));
			//登录者姓名	userName
			propertyMap.put("userName", req.getParameter("userName"));
			//登录者邮箱	email
			propertyMap.put("email", req.getParameter("email"));
			req.getSession().setAttribute("ssoInfo", propertyMap);
			
			MemberService.getApproveState(req.getSession());
			try {
				MemberService.getLockState(req);
				
				LoginCallbackServlet.navigate(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				Logger log = Logger.getLogger(SsoStubServlet.class);
				log.error("登录失败",e);
			}
			
//			String url="/";
//			url=PropertyFactory.getSecurityProperties().getProperty("member_home");
//			url=WebContext.fullUrl(req, url);
//			res.sendRedirect(url);
			
		} else{
			res.setCharacterEncoding("utf-8");
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out=res.getWriter();
			out.println("登录失败！");
		}
	}

}
