/**
 * 
 */
package com.bornsoft.asn.utils.common;

/**
 * 安全地将对象转换成字符串、避免空指针错
 * @author kunyun
 * @author hooxin
 */
public class Str {
	
	public static String get(Object value){
		return value==null ? "" : value.toString();
	}
	
	public static String get2(Object value){
		return value==null ? "—" : value.toString();
	}
	
	/**
	 * 模板文本解析器
	 * @param textTemple 模板文本
	 * @param objs 模板參數
	 * @return 解析後的文本
	 */
	public static String parseString(String textTemple, Object[] objs){
		//textTemple为一个包含@N (N为数字)
		String str = textTemple;
		if(objs == null){
			System.err.println("模板参数为空");
			return null;
		}
		
		for(int i=0;i<objs.length;i++){
			str = str.replaceAll("@"+i, (String) objs[i]);
		}
		return str;
	}
	
	public static String splitAndFilterString(String input, int length) {  
        if (input == null || input.trim().equals("")) {  
            return "";  
        }  
        // 去掉所有html元素,  
        String str = input.replaceAll("\\&[a-zA-Z]{1,10};", "").replaceAll(  
                "<[^>]*>", "");  
        str = str.replaceAll("[(/>)<]", "");  
        int len = str.length();  
        if (len <= length) {  
            return str;  
        } else {  
            str = str.substring(0, length);  
            str += "......";  
        }  
        return str;  
    } 
}
