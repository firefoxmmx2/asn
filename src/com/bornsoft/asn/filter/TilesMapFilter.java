package com.bornsoft.asn.filter;

import java.io.IOException;
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
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import org.apache.tiles.Attribute;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.TilesContainer;
import org.apache.tiles.TilesException;
import org.apache.tiles.access.TilesAccess;

import com.bornsoft.asn.utils.common.PropertyFactory;

/**
 * Servlet Filter implementation class TilesMapFilter
 * 
 * @author liukunyun
 * @author hooxin
 */
public class TilesMapFilter implements Filter
{

	/**
	 * Default constructor.
	 */
	public TilesMapFilter()
	{
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy()
	{
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public
			void doFilter(
					ServletRequest request, ServletResponse response,
					FilterChain chain) throws IOException, ServletException
	{
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		// get url path
		String path = req.getServletPath().replace(req.getContextPath(), "");
		System.out.format("%15s requests %s", req.getRemoteAddr(), path);
		String tileRender = PropertyFactory.getDefaultProperty().getProperty("tiles_render_url");
		//target page path
		String tilesPathKey=PropertyFactory.getDefaultProperty().getProperty("tiles_target_path");
		req.setAttribute(tilesPathKey, path);
		req.getRequestDispatcher(tileRender).forward(req, res);
		// pass the request along the filter chain
		//chain.doFilter(request, response);

	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException
	{
	}

}
