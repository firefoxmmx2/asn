package com.bornsoft.asn.filter;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bornsoft.asn.bean.common.MessagePage;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.service.member.Permission;
import com.bornsoft.asn.service.supplier.SupplierService;
import com.bornsoft.asn.utils.common.AsnConstLib;
import com.bornsoft.asn.utils.common.PropertyFactory;
import com.bornsoft.asn.utils.common.TimeDebug;
import com.bornsoft.asn.utils.common.WebContext;
import com.bornsoft.sso.util.Validate;



/**
 * Servlet Filter implementation class SecurityFilter
 */
public class SecurityFilter implements Filter {

	private static Properties sp=PropertyFactory.getSecurityProperties();
	private static Pattern memberPattern = Pattern.compile(sp.getProperty("member_access_regexp"));
	private static Pattern frontPattern = Pattern.compile("/front/.*?(?<!_(mod|imp))\\.jsp");
	private static Properties permissions=PropertyFactory.getPropertiesByFileName("member.permission.properties");
	private static Set<Object> urls=permissions.keySet();
	public static boolean useStubSso=sp.getProperty("sso_is_stub").equals("true");

    /**
     * Default constructor. 
     */
    public SecurityFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		TimeDebug.reset();
		boolean contiune=true;
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse res=(HttpServletResponse)response;
		// get url path
		String path=req.getServletPath().replace(req.getContextPath(), "");
		
		//2010-09-27 liujunwei fixed 处理来源页面地址
		req.setCharacterEncoding("utf-8");
		String mainSite = req.getParameter("mainSite");
		if(mainSite!=null && mainSite.trim().length()>0 && !"null".equals(mainSite))
		{
			//req.setAttribute("mainSite", mainSite);
			req.getSession().setAttribute("mainSite", mainSite);
			//System.out.println("mainSite1>>" + mainSite);
		}
		else
		{
			//System.out.println("mainSite2>>" + mainSite);
			mainSite = (String)req.getSession().getAttribute("mainSite");
			//System.out.println("mainSite3>>" + mainSite);
		}
		
		// check for member control
        if (memberPattern.matcher(path).find()) {
        	// check login
        	boolean validated=useStubSso ? 
        			stubValidate(req) : (Validate.checkLogin(req)  && MemberService.isLogin(req));
    		if(validated){
    			// system admin shoudl be redirected /admin/index.jsp
    			if(path.equals("/do/index.jsp")){
    				Permission perm=new Permission(req);
    				if(perm.systemAdmin()&&request.getParameter("nr")==null){
    					path="/admin/index.jsp?mainSite="+mainSite;
    	    			contiune=false;
    					res.sendRedirect(WebContext.fullUrl(req, "~"+path));
    				}
    			}else{
        			// check member
        			long memberId=MemberService.getMemberId(req.getSession());
        			if(memberId<1){  // did not set member information
        				// set 
        			}
        			// check permission
        			outerloop: for(Object key: urls){
        				String exp=key.toString();
        				if(Pattern.compile(exp).matcher(path).find()){
            				String[] roles=permissions.getProperty(exp).split("\\|");
            				boolean hasRole=false;
            				String newUrl=null;
            				for(int i=0; i<roles.length; i++){
            					String role=roles[i];
            					if(role.equals("member")){
            						newUrl=MemberService.checkState(req);
            						hasRole=(newUrl==null);
            					}else if(role.equals("supplier")){
            						newUrl=SupplierService.checkState(req);
            						hasRole=(newUrl==null);
            					}else{
                					hasRole=MemberService.isRole(req, roles[i]);
            					}
            					if(hasRole) break outerloop;
            				}
            				if(!hasRole){
            					contiune=false;
            					if(newUrl==null){
                					// make a Message Page
                					String s="";
                    				for(int i=0; i<roles.length; i++){
                    					String role=roles[i];
                    					if(i>0) s+="/";
                    					s+=sp.getProperty("admin_roles_"+role);
                    				}
                					MessagePage mp=new MessagePage(AsnConstLib.MessageType.Warn,
                							"权限不足，需要 "+s+" 权限。");
                					req.setAttribute("messagePage", mp);
                					mp.addLink("重新登录", loginAndBackUrl(req, WebContext.fullUrl(req, "~"+path)), "_top", 10);
                	    			req.getRequestDispatcher("/plain/message/show.jsp").forward(req, res);
            					}else{
            						res.sendRedirect(newUrl);
            					}
            				}
        				}
        			}
    			}
    		}else{  // not login
    			// redirect to login page
    			contiune=false;
    			res.sendRedirect(loginAndBackUrl(req));
    			
    		}

        }

		if(contiune){
			chain.doFilter(request, response);
		}
	}
	
	
	public static String loginUrl(HttpServletRequest req){
		return useStubSso? WebContext.fullUrl(req, sp.getProperty("sso_login_url_stub")) : sp.getProperty("sso_login_url");
	}
	
	public static String loginAndBackUrl(HttpServletRequest req, String path){
		return loginAndBackUrl(req)+"?forward="+path;
	}
	
	public static String loginAndBackUrl(HttpServletRequest req){
		return String.format("%s?backPath=%s", 
				loginUrl(req), WebContext.fullUrl(req, sp.getProperty("sso_back_url")));
	}
	
	
	/**
	 * stub Validate
	 * @param request
	 * @return
	 */
	private boolean stubValidate(HttpServletRequest request){
		Map info=MemberService.getSsoInfo(request.getSession());
		return info!=null && info.get("account")!=null;
	}
	
	/**
	 * check if current user is logged in, if not, return login url
	 * @param request
	 * @return login url
	 * @throws IOException
	 * @throws ServletException
	 */
	public static String checkLogin(HttpServletRequest request) throws IOException, ServletException{
		String ret=null;
		if(!MemberService.isLogin(request)){
			String thisUrl=(String)request.getAttribute("javax.servlet.include.request_uri");
			if(thisUrl==null) thisUrl=request.getServletPath();
			thisUrl="%3Fforward="+URLEncoder.encode(URLEncoder.encode(WebContext.fullUrl(request, "~"+thisUrl), "utf-8"), "utf-8");
			String loginUrl=SecurityFilter.loginUrl(request);
			ret=String.format("%s?backPath=%s%s", 
					loginUrl, WebContext.fullUrl(request, sp.getProperty("sso_back_url")), thisUrl);
			System.out.println(ret);
		}
		return ret;
	}
	
	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
