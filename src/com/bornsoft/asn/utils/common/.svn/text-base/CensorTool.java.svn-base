package com.bornsoft.asn.utils.common;

import java.util.regex.Pattern;


public class CensorTool {

	private static final CensorTool instanceCensorTool=new CensorTool();
	
	private CensorTool() {
		
	}
	
	public static CensorTool getInstance(){
		return instanceCensorTool;
	}
	
	public boolean checkCensor(String source) throws Exception{
		String regex=getRegex();
		boolean b=Pattern.compile(regex).matcher(source).find();
		return b;
	}
	
	public String getData() throws Exception{
		return (String) sqlMapFactory.getSqlMap().queryForObject("getCensor");
	}
	
	public void setData(String data) throws Exception{
		sqlMapFactory.getSqlMap().insert("updateCensorword",data);
	}
	
	private String getRegex() throws Exception{
		String string=getData();
		String[] ss=string.split("\n");
		String regex="";
		for(String s:ss){
			s=s.trim();
			String str="";
			for(int i=0;i<s.length()-1;i++){
				str+=s.charAt(i)+".{0,3}";
			}
			s=str+s.charAt(s.length()-1)+"|";
			regex+=s;
		}
		regex=regex.substring(0, regex.length()-1);
		return regex;
	}
}
