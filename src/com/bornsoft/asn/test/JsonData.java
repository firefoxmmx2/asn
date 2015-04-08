package com.bornsoft.asn.test;

import java.util.ArrayList;
import java.util.List;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.utils.json.Json;

@SuppressWarnings("serial")
public class JsonData extends BaseAction {
	public String execute(){
		List<Member> list=new ArrayList<Member>();
		Member m=new Member();
		m.setMemberId(1L);
		m.setFullName("刘昆云");
		list.add(m);
		String data=Json.getString(list);
		print(data);
		return null;
	}
}

