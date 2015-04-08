package com.bornsoft.asn.action.facade;

import java.sql.SQLException;
import java.util.Enumeration;
import java.util.List;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.facade.ProductFacade;
import com.bornsoft.asn.service.facade.FacadeService;
import com.opensymphony.xwork2.ognl.OgnlValueStack;

/**
 * list facade define by product code
 * @author kunyun
 *
 */
@SuppressWarnings("serial")
public class FacadeAction extends BaseAction {
	
	private String myName;
	
	public String getMyName() {
		return myName;
	}

	public void setMyName(String myName) {
		this.myName = myName;
	}

	public String listFacadeDefineByPt() throws SQLException{
		List<ProductFacade> list=new FacadeService().listFacadeDefineByPt(this.request("ptCode"));
		String data=com.bornsoft.asn.utils.json.Json.getString(list, "class,value");
		print(data);
		return null;
	}
	
	public String testTiles() throws SQLException{
		this.getRequest().setAttribute("message", "Liuky");
		return "success";
	}
	
	
	
}

