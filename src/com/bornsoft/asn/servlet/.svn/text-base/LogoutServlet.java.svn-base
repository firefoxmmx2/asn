package com.bornsoft.asn.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bornsoft.asn.bean.common.MessagePage;
import com.bornsoft.asn.utils.common.AsnConstLib;
import com.bornsoft.asn.utils.common.PropertyFactory;
import com.bornsoft.asn.utils.common.WebContext;

/**
 * Servlet implementation class LogoutServlet
 */
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String retry=request.getParameter("retry");
		request.getSession().invalidate();
		String quitUrl=PropertyFactory.getSecurityProperties().getProperty("sso_quit_url");
		String backUrl="";
		if(retry!=null && retry.equals("yes")){
			backUrl=WebContext.fullUrl(request, "~/do");
		}else{
			//backUrl=WebContext.fullUrl(request, "~/front/cate0");	//20100927 liujunwei fixed
			backUrl = request.getParameter("mainSite");
			if(backUrl==null||backUrl.trim().length()<=0)
				backUrl=WebContext.fullUrl(request, "~/front/cate0");
			
		}
		System.out.println(String.format("%s?typecode=zxzx&backPath=%s", quitUrl, backUrl));
		response.sendRedirect(String.format("%s?typecode=zxzx&backPath=%s", quitUrl, backUrl));
	}

}
