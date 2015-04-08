package com.bornsoft.asn.action.member;

import java.util.HashMap;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.member.AddMemberService;
import com.bornsoft.asn.service.member.MemberService;

public class AddMemberAction extends BaseAction{

	/**
	 * 新增会员类别
	 * @return
	 * @throws Exception
	 */
	public String addMemberGroup() throws Exception{
		String GROUP_NAME=request("group_name");
		String BELONG_TO="1127";
		HashMap<String,Object> m = new HashMap<String,Object>();
		
		Long id = IdMakerService.newId("groupId");
		
		m.put("GROUP_NAME", GROUP_NAME);
		m.put("BELONG_TO", BELONG_TO);
		m.put("ID", id);
		
		
		AddMemberService.addMemberGroup(m);
		
		return SUCCESS;
	}
}
