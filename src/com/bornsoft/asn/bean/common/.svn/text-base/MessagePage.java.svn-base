/**
 * 
 */
package com.bornsoft.asn.bean.common;

import java.util.ArrayList;
import java.util.List;

import com.bornsoft.asn.utils.common.AsnConstLib;
import com.bornsoft.asn.utils.common.AsnConstLib.MessageType;

/**
 * Message page with links for common navigation
 * @author Ken Liu Kunyun
 *
 */
public class MessagePage {
	private MessageType type;
	private String message;
	private List<HttpLink> links=new ArrayList<HttpLink>();

	public MessagePage(){
	}
		
	public MessagePage(MessageType type, String message){
		this.type=type;
		this.message=message;
	}
	
	public AsnConstLib.MessageType getType() {
		return type;
	}

	public void setType(AsnConstLib.MessageType type) {
		this.type = type;
	}

		
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public MessagePage addLink(String text, String href, String target, int timeSeconds){
		links.add(new HttpLink(text, href, target, timeSeconds));
		return this;
	}
	
	/**
	 * get links
	 * @return
	 */
	public List<HttpLink> getLinks() {
		return links;
	}
	
}
