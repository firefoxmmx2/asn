package com.bornsoft.asn.exception;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;

public class ErrorProcessorFactory {
	private static List<ErrorProcessor> processors;
	public static String filePath;
	public static List<ErrorProcessor> getErrorProcessors(){
		if(processors==null){
			processors=new ArrayList<ErrorProcessor>();
			if(filePath==null||filePath.trim().length()==0)
				throw new RuntimeException("file path is null..");
			
			SAXBuilder build=new SAXBuilder();
			Document doc = null;
			try {
				doc = build.build(new File(filePath));
			} catch (JDOMException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			Element root = (Element) doc.getRootElement();
			List processorNodes=root.getChildren("error-processor");
			if(processorNodes!=null && processorNodes.size()>0)
				for(int i=0;i<processorNodes.size();i++){
					ErrorProcessor processor=null;
					Element processorNode=(Element) processorNodes.get(i);
					String className=processorNode.getAttributeValue("class");
					String code=processorNode.getAttributeValue("code");
					//    temporarily useless
					String id=processorNode.getAttributeValue("id");
					
					if(className==null||className.trim().length()==0)
						throw new RuntimeException("class is required.");
					if(code==null||code.trim().length()==0)
						throw new RuntimeException("code is required.");
					
					try {
						processor=(ErrorProcessor) Class.forName(className).newInstance();
						processor.getClass().getMethod("setId", String.class).invoke(processor,id);
						processor.getClass().getMethod("setCode", String.class).invoke(processor, code);
					} catch (InstantiationException e) {
						e.printStackTrace();
					} catch (IllegalAccessException e) {
						e.printStackTrace();
					} catch (ClassNotFoundException e) {
						e.printStackTrace();
					} catch (SecurityException e) {
						e.printStackTrace();
					} catch (NoSuchMethodException e) {
						e.printStackTrace();
					} catch (IllegalArgumentException e) {
						e.printStackTrace();
					} catch (InvocationTargetException e) {
						e.printStackTrace();
					}
					
					processors.add(processor);
					
				}
			
		}
		
		return processors;
	}
	
	
}