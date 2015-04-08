package com.bornsoft.asn.utils.common.convert;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

public class DateConvert extends StrutsTypeConverter {
	private static final String SEC_PATTERN = "yyyy-MM-dd hh:mm:ss";
	private static final String DAY_PATTERN = "yyyy-MM-dd";
	private static final String MONTH_PATTERN = "yyyy-MM";
	private static final String MIN_PATTERN = "yyyy-MM-dd hh:mm";


	public DateConvert() {
		super();
		// TODO Auto-generated constructor stub
	}

	private String convertToStr(Date value) {
		String result = null;
		result = new SimpleDateFormat(SEC_PATTERN).format(value);
		return result;
	}

	private Object convertToDate(String value) {
		Date result = null;
		if(value == null || value.length() == 0)
			return null;
		String[] dataFormats = new String[] {SEC_PATTERN,MIN_PATTERN,DAY_PATTERN,
				MONTH_PATTERN};
		for (String format : dataFormats) {
			try {
				result = new SimpleDateFormat(format).parse(value);
				break;
			} catch (Exception e) {
				continue;
			}
			
		}
		
		if(result == null)
			result = new Date(Long.parseLong(value));
		
		return result;
	}

	@Override
	@SuppressWarnings("rawtypes")
	public Object convertFromString(Map arg0, String[] arg1, Class arg2) {
		// TODO Auto-generated method stub
		return convertToDate(arg1[0]);
	}

	@Override
	@SuppressWarnings("rawtypes")
	public String convertToString(Map arg0, Object arg1) {
		// TODO Auto-generated method stub
		return convertToStr((Date)arg1);
	}
	
}
