package com.bornsoft.asn.utils.common;

import java.math.BigDecimal;
import java.text.DecimalFormat;

public class Calculator {

	public static Double multiply(Double d1,Double d2){
		BigDecimal b1=new BigDecimal(d1.toString());
		BigDecimal b2=new BigDecimal(d2.toString());
		return b1.multiply(b2).doubleValue();
	}
	
	public static Double multiply(Double d1,Integer d2){
		BigDecimal b1=new BigDecimal(d1.toString());
		BigDecimal b2=new BigDecimal(d2.toString());
		return b1.multiply(b2).doubleValue();
	}
	
	public static String keepTwoDecimal(Double db){
		  if(db == 0.0){
			  return "0.00";
		  }else{
			  DecimalFormat   df   =   new   DecimalFormat("#0.00"); 
			  String a = df.format(db);
			  return a; 
		  }
	}
	

	public static String keepOneDecimal(Double db){
		  if(db == 0.0){
			  return "0.0";
		  }else{
			  DecimalFormat   df   =   new   DecimalFormat("#0.0"); 
			  String a = df.format(db);
			  return a; 
		  }
	}
	
	public static String keepTwoDecimal(Float db){
		  if(db == 0.0){
			  return "0.00";
		  }else{
			  DecimalFormat   df   =   new   DecimalFormat("#0.00"); 
			  String a = df.format(db);
			  return a; 
		  }
	}
}
