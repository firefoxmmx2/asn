/**
 * 
 */
package com.bornsoft.asn.utils.common;

import java.util.Date;

/**
 * 时间调试
 * @author kunyun
 *
 */
public class TimeDebug {
	private static long last=0L;
	
	public static void print(String event){
		long now=new Date().getTime();
		if(last==0) {
			last=now;
		}
		long span=now-last;
		last=now;
		System.out.println(String.format("%d\t->\t%s", span, event));
	}
	
	public static void reset(){
		last=0;
	}
}
