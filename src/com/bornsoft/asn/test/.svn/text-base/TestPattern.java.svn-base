package com.bornsoft.asn.test;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class TestPattern {
	public static void main(String[] args) {
		String[] strings={
				"共产党",
				"中国共产党",
				"共产党被打倒",
				"打倒",
				"共啊产啊党",
				"共aaa产aaa党",
				"共*产*党",
				"法輪功",
				"法&輪&功",
				"法的輪的功",
				"GCD",
				"G##C##D",
				"gcd",
				"g*c*d",
				"供应",
				"大米"
//				"cat999",
//				"cat",
//				"cat12345",
//				"catalog",
//				"0000cat"
		};
//		String regex="共.{0,3}产.{0,3}党|法.{0,3}輪.{0,3}功|G.{0,3}C.{0,3}D|";
		String regex="功.{0,3}法|功.{0,3}友|共.{0,3}产|共.{0,3}产.{0,3}党|共.{0,3}党|共.{0,3}匪|共.{0,3}狗|共.{0,3}军";
		Pattern p=Pattern.compile(regex);
		Matcher matcher=null;
		for(String string:strings){
			if(matcher==null){
				matcher=p.matcher(string);
			}else{
				matcher.reset(string);
			}
			if(matcher.find()){
				System.out.println(string+"---匹配到");
			}else{
				System.out.println(string+"---没匹配到");
			}
		}
		
	}
}
