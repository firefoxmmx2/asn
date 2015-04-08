package com.bornsoft.asn.utils.common;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class KeywordTool {
	
	private static final KeywordTool instanceKeywordTool=new KeywordTool();
	
	private KeywordTool(){}
	
	public static KeywordTool getInstatnce(){
		return instanceKeywordTool;
	}
	
	public String[] getKeyword(String source) throws Exception{
		String[] keywords=new String[5];
		Pattern pattern =Pattern.compile(getRegex());
		Matcher matcher=pattern.matcher(source);
		int i=0;
		while(matcher.find()){
			if(keywords[4]!=null){
				break;
			}else{
				String find=matcher.group(); 
				boolean b=true;
				for(String s:keywords){       
					if(s!=null&&s.equals(find)){
						b=false;               
						break;
					}
				}
				if(b){
					keywords[i]=find;          
					i++;
				}
			}
		}
		return keywords;
	}
	
	public String getKeywordString(String source) throws Exception{
		String[] strings=getKeyword(source);
		String keyword="";
		for(String s:strings){
			if(s!=null){
				keyword+=(s+"，");
			}
		}
		if(!keyword.equals("")&&keyword.length()>0){
			keyword=keyword.substring(0,keyword.length()-1);
		}
		return keyword;
	}
	
	public String getData() throws Exception{
		return (String) sqlMapFactory.getSqlMap().queryForObject("getKeyword");
	}
	
	public void setData(String data) throws Exception{
		sqlMapFactory.getSqlMap().insert("updateKeyword",data);
	}
	
	public String getRegex()throws Exception{
		String string=getData();
		String[] ss=string.split("\n");
		String regex="";
		for(String s:ss){
			s=s.trim();
			String str="";
			for(int i=0;i<s.length()-1;i++){
				str+=s.charAt(i);
			}
			s=str+s.charAt(s.length()-1)+"|";
			regex+=s;
		}
		regex=regex.substring(0, regex.length()-1);
		return regex;
	}
}
