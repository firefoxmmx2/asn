package com.bornsoft.asn.test;

import java.sql.SQLException;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.common.MessagePage;
import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.utils.common.AsnConstLib;

@SuppressWarnings("serial")
public class TestMessage extends BaseAction {
	public String devide(){
		try{
			Double a=Double.parseDouble(request("a"));
			Double b=Double.parseDouble(request("b"));
			this.printf("%d / %d = %f", a.intValue(), b.intValue(), a/b);
		}catch(Exception e){
			// make a Message Page
			MessagePage mp=new MessagePage(AsnConstLib.MessageType.Error,
					String.format("出错了！错误信息是：%s - %s。", e.getClass().getName(), e.getMessage()))
						.addLink("运行例子", "devide?a=3&b=4", "", 0)
						.addLink("重来一次", "javascript:window.history.go(-1);", "", 0)
						.addLink("转到首页", this.getRequest().getContextPath(), "_top", 15);
			this.getRequest().setAttribute("messagePage", mp);
			return "back-message";
		}
		return null;
	}
	
}

