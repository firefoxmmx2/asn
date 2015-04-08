package com.bornsoft.asn.utils.common;

import java.io.IOException;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class LinkEncrypt {
	 /**
	  * 对字符串进行BASE64加密
	  */
	 public static String encrypt(String str) {
	  if (str == null || str.equals("")) {
	   return "";
	  }
	  BASE64Encoder encoder = new BASE64Encoder();
	  return encoder.encode(str.getBytes());
	 }

	 /**
	  * 对BASE64加密后的字符串进行解密
	  */
	 public static String unEncrypt(String str){
	  if (str == null || str.equals("")) {
	   return "";
	  }
	  BASE64Decoder decoder = new BASE64Decoder();
	  try {
	   byte[] b = decoder.decodeBuffer(str);
	   return new String(b);
	  } catch (IOException e) {
	   e.printStackTrace();
	  }
	  return "";
	  
	 }
}
