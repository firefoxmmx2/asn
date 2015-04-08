package com.bornsoft.asn.servlet;

import java.io.IOException;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.tiles.Attribute;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.TilesContainer;
import org.apache.tiles.TilesException;
import org.apache.tiles.access.TilesAccess;

import com.bornsoft.asn.utils.common.PropertyFactory;

/**
 * Servlet implementation class TilesRenderServlet
 */
public class TilesRenderServlet extends HttpServlet
{
	private static final long	serialVersionUID	= 1L;
	private Properties			tilesMap			= PropertyFactory
															.getPropertiesByFileName("tiles.map.properties");
	private Set<String>			tilesNames			= PropertyFactory
															.getPropertiesByFileName(
																	"tiles.map.properties")
															.stringPropertyNames();
	private static final Logger log=Logger.getLogger(TilesRenderServlet.class);
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TilesRenderServlet()
	{
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(
			HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		// get url path
		String tilesPathKey = PropertyFactory.getDefaultProperty().getProperty(
				"tiles_target_path");
		String path = (String) req.getAttribute(tilesPathKey);

		if (path == null || path.trim().length() == 0)
			path = "xxx";
		// pass the request along the filter chain
		// add by hooxin
		Map<String, Object> defineMap=(Map<String, Object>) req.getAttribute("tiles");
		String template = "";
		String defaultTemplate = PropertyFactory
				.getDefaultProperty()
				.getProperty("default_template");
		template = (String) req.getParameter("template");
		if ((template == null || template.trim().length() == 0) && defineMap==null)
			// load tiles implementation
			for (String tilesName : tilesNames)
			{
				if (Pattern
						.compile(tilesMap.getProperty(tilesName))
						.matcher(path)
						.find())
				{
					template = tilesName;
					break;
				}
			}
		else if((template == null || template.trim().length() == 0) && defineMap!=null){
			template=(String) defineMap.keySet().toArray()[0];
		}
		else
		{
			boolean isCorrect = false;
			for (String tilesName : tilesNames)
			{
				if (template.equals(tilesName))
				{
					isCorrect = true;
					break;
				}

			}

			if (!isCorrect)
				template = defaultTemplate;

		}
		// add by hooxin
		//get a tile container
		TilesContainer tc = TilesAccess.getContainer(
		        request.getSession().getServletContext());
		log.info("\t(" + template + ")");
		// forward target page.

		if (template != null && template.trim().length() > 0)
			try
			{
				//open the container attribute context
				AttributeContext attributeContext = tc.startContext(request,
				        response);
				
				if(defineMap==null && path!=null){
					attributeContext.putAttribute("body", new Attribute(path));
					attributeContext.putAttribute("content", new Attribute(path));
				}
				else{
					Map<String, Object> attributeMap=(Map<String, Object>) defineMap.get(template);
					if(attributeMap!=null && attributeMap.isEmpty()==false)
						for(String key:attributeMap.keySet()){
							attributeContext.putAttribute(key, new Attribute(attributeMap.get(key)));
						}
				}
				tc.render(template, req, res);
				tc.endContext(request, response);
			}
			catch (TilesException e)
			{
				log.error(e);
			}
		else
		{
			req.getRequestDispatcher(path).forward(req, res);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(
			HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		doGet(request, response);
	}

}
