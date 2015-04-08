package com.bornsoft.asn.test.product.action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.bornsoft.asn.bean.product.ProductNavigator;
import com.bornsoft.asn.utils.common.AsnConstLib;
import com.bornsoft.asn.utils.common.PropertyFactory;
import com.bornsoft.asn.utils.common.WebContext;

public class ProductNavigatorService {

	/**
	 * 得到导航栏的HTML代码
	 * 
	 * @param url
	 *            指定基本的URL 使用~/代表主机域（如）
	 * @param typeCode
	 *            分类编号
	 * @param facade
	 *            立面值<立面定义编号::立面名称>
	 * @param userPara
	 *            用户自定义参数（即用户自己需要传递的参数）
	 * @return HTML代码
	 */
	public static String getProductNavigator(String url, String typeCode,
			String facade, String userPara) {
		ProductNavigator pn = new ProductNavigator();
		if (url == null || url.equals(""))
			url = WebContext.fullUrl(PropertyFactory.getDefaultProperty()
					.getProperty("asn.product.searchUrl"));
		pn.setUrl(url);
		pn.setTypeCode(typeCode);
		pn.setUserPara(userPara);

		if (facade != null && !facade.equals("")) {
			try {
				facade = URLDecoder.decode(facade, "UTF-8");
				facade = URLDecoder.decode(facade, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
				System.err.println("无法支持UTF-8编码");
			}
			pn = pn.parseFacades(facade);
		}

		WebContext.getRequest().setAttribute("pn", pn.toString());
		return pn.toString();
	}

	/**
	 * 生成url（用urlencoding编码2次过的）
	 * 
	 * @param url
	 *            url基本
	 * @param para
	 *            自定义参数
	 *            ("type=0001-0002","facade=12::红茶#;12::绿茶#;","userPara=userPara"
	 *            )可以接多个
	 * @return 编码过的url
	 */
	public static String getUrl(String url, String... para) {
		String s = url;
		if(para.length == 0){
			s+="1=1";
			return s;
		}
		if (para.length > 0)
			s += "?";
		String arg2 = "";
		Pattern regex = Pattern.compile("([^##]{1,})=([^##]{1,})",
				Pattern.DOTALL | Pattern.MULTILINE);
		for (int i = 0; i < para.length; i++) {
			if (para[i] != null && !para.equals("")) {
				Matcher regexMatcher = regex.matcher(para[i]);
				if (regexMatcher.find()) {
					try {
						String tmp = regexMatcher.group(2);
						tmp = URLEncoder.encode(tmp, "UTF-8");
						tmp = URLEncoder.encode(tmp, "UTF-8");
						arg2 += regexMatcher.group(1)+ "=" + tmp + "&";
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
						System.err.println("无法支持UTF-8编码");
					}
				}
			}
		}
		arg2 = arg2.substring(0, arg2.length() - 1);
		s += arg2;

		return s;
	}

	/**
	 * 得到导航分类
	 * 
	 * @param name
	 *            导航分类名称（1级:0,2级:1,3级:2等,详情参考asnConstLib类）
	 * @return 导航分类
	 */
	public static ProductTypeIf getNaviType(String name) {
		if (name == null)
			return null;
		if (name.equals(AsnConstLib.NavigatorLevel0))
			return new ProductNaviTypeRoot();
		else if (name.equals(AsnConstLib.NavigatorLevel1))
			return new ProductNaviTypeFirst();
		else if (name.equals(AsnConstLib.NavigatorLevel2))
			return new ProductNaviTypeSec();
		else if (name.equals(AsnConstLib.NavigatorLevel3))
			return new ProductNaviTypeFac();
		return null;
	}
}
