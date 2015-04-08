package com.bornsoft.asn.exception;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import java.util.Set;
import java.util.regex.Pattern;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.bornsoft.asn.utils.common.ImageSize;
import com.bornsoft.asn.utils.common.PropertyFactory;

public class NotFoundImgErrorProcessor implements ErrorProcessor {
	private String id;
	private String code;
	private static final Logger log = Logger
			.getLogger(NotFoundImgErrorProcessor.class);
	private static final long serialVersionUID = 1L;
	private static Properties notFoundMap = PropertyFactory
			.getDefaultProperty();
	private static Set<Object> urls = notFoundMap.keySet();

	public void process(HttpServletRequest request, HttpServletResponse response) {
		String url = (String) request
				.getAttribute("javax.servlet.error.request_uri");
		if (url != null) {
			boolean handled = false;
			// check for alternative url
			for (Object key : urls) {
				String exp = key.toString();
				if (Pattern.compile(exp).matcher(url).find()) {
					handled = true;
					String newurl = notFoundMap.getProperty(exp);

					// 安裝指定尺寸生成不存在的图片
					if (exp.indexOf(".[0-9]+x[0-9]+") != -1) {
						try {
							newurl = gen404Image(url, request);
						} catch (NumberFormatException e) {
							log.error(e);
						} catch (Exception e) {
							log.error(e);
						}
						if (newurl == null) {
							handled = false;
							break;
						}
						ServletOutputStream out;
						try {
							out = response.getOutputStream();
							BufferedInputStream in = new BufferedInputStream(
									new FileInputStream(newurl));
							byte[] buf = new byte[1024];
							int len = in.read(buf);
							while (len > 0) {
								out.write(buf, 0, len);
								len = in.read(buf);
							}
							out.flush();
							out.close();
						} catch (IOException e) {
							log.error(e);
						}
						request.removeAttribute("forward");
						break;
					}
					
					Cookie c = new Cookie("404-" + url, "1");
					c.setPath("/");
					response.addCookie(c);
					log.info("404 ALT=" + newurl);
					request.setAttribute("forward", newurl);
					request.setAttribute("break", true);
					break;
				}

			}
		}

	}

	/**
	 * 安裝指定尺寸生成不存在的普通
	 * 
	 * @throws Exception
	 * @throws NumberFormatException
	 */
	public String gen404Image(String url, HttpServletRequest request)
			throws NumberFormatException, Exception {
		String newurl = null;
		String orgFilePath = null;
		String newFilePath = null;
		File pic = null;
		String url_pre = url.substring(url.lastIndexOf("/") + 1, url.length());
		if (url_pre != null && url_pre.split("\\.").length != 3) {
			return newFilePath;
		}

		orgFilePath = request.getSession().getServletContext().getRealPath("/")
				+ url.substring(url.indexOf("/", 1), url.lastIndexOf("/"))
				+ "/" + url_pre.split("\\.")[0] + "." + url_pre.split("\\.")[1];
		newFilePath = request.getSession().getServletContext().getRealPath("/")
				+ url.substring(url.indexOf("/", 1), url.lastIndexOf("/"))
				+ "/" + url_pre;

		pic = new File(orgFilePath);
		if (pic.exists() == false) {
			// 当目标图片不存在的时候，配置404配置文件里面设定的
			newurl = url.substring(0, url.lastIndexOf("/")) + "/" + url_pre;
			for (Object key : urls) {
				String exp = key.toString();
				if (Pattern.compile(exp).matcher(newurl).find()) {
					newurl = notFoundMap.getProperty(exp);
					break;
				}
			}
			// 重值newFilePath
			newFilePath = request.getSession().getServletContext()
					.getRealPath("/")
					+ newurl;
		} else {
			// 目标图片文件存在的时候，生成指定尺寸的缩略图
			newurl = url.substring(url.indexOf("/", 1), url.lastIndexOf("/"))
					+ "/" + url_pre;
			ImageSize.drawImage(orgFilePath, newFilePath,
					Integer.parseInt(url_pre.split("\\.")[2].split("x")[0]),
					Integer.parseInt(url_pre.split("\\.")[2].split("x")[1]),
					'*');
		}
		return newFilePath;
	}
	
	public String getId() {
		return id;
	}

	public String getCode() {
		return code;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setCode(String code) {
		this.code = code;
	}

}
