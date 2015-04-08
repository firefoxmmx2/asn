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

public class NotFoundErrorProcessor implements ErrorProcessor {
	private static final Logger log = Logger
			.getLogger(NotFoundErrorProcessor.class);
	private static final long serialVersionUID = 1L;
	private static Properties notFoundMap = PropertyFactory
			.getDefaultProperty();
	private static Set<Object> urls = notFoundMap.keySet();

	private String id;
	private String code;

	public void process(HttpServletRequest request, HttpServletResponse response) {
		// 取得要访问的网址
		String url = (String) request
				.getAttribute("javax.servlet.error.request_uri");
		if (url != null) {
			// check for alternative url
			Cookie c = new Cookie("404-" + url, "1");
			c.setPath("/");
			response.addCookie(c);
			request.setAttribute("title", "链接不存在");
			request.setAttribute("message", url+" >> 该链接无存在");
			request.setAttribute("forward", "/error.jsp");
		}

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
