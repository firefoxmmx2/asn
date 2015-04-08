/**
 * 
 */
package com.bornsoft.asn.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.StrutsStatics;
import org.apache.struts2.dispatcher.StrutsResultSupport;

import com.bornsoft.asn.utils.common.PropertyFactory;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;

/**
 * @author kunyun
 *
 */
public class TilesMap extends StrutsResultSupport {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doExecute(String path, ActionInvocation invocation)
			throws Exception {
		ActionContext actionContext = invocation.getInvocationContext();
	       
        HttpServletResponse res = (HttpServletResponse) actionContext
        .get(StrutsStatics.HTTP_RESPONSE);
        
        HttpServletRequest req = (HttpServletRequest) actionContext
        .get(StrutsStatics.HTTP_REQUEST);
        
		if(path==null) path="xxx";
		System.out.format("%15s requests(s2) %s", req.getRemoteAddr(), path);
		// load tiles implementation
		// get url path
		String tileRender = PropertyFactory.getDefaultProperty().getProperty("tiles_render_url");
		//target page path
		String tilesPathKey=PropertyFactory.getDefaultProperty().getProperty("tiles_target_path");
		req.setAttribute(tilesPathKey, path);
		req.getRequestDispatcher(tileRender).forward(req, res);
		
	}
	
	

}
