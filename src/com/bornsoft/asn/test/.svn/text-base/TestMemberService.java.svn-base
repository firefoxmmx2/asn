package com.bornsoft.asn.test;

import java.sql.SQLException;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.service.member.MemberService;

@SuppressWarnings("serial")
public class TestMemberService extends BaseAction {
	public String execute(){
			
		this.printf("Member Id: %d <br>", MemberService.getMemberId());
		this.printf("Full Name: %s <br>", MemberService.getMemberFullName());
		this.printf("Short Name: %s <br>", MemberService.getMemberShortName());
		
		try {
			Member m=MemberService.getMember();
			printf("Address:%s", m.getAddress());
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}
	
	public String testPara(){
		
		return SUCCESS;
	}
}

