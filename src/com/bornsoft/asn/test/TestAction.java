package com.bornsoft.asn.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.script.ScriptException;
import javax.servlet.http.HttpServletRequest;

import org.apache.tiles.TilesContainer;
import org.apache.tiles.access.TilesAccess;
import org.jfree.util.HashNMap;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.bean.quotation.QuotationInfo;
import com.bornsoft.asn.bean.shoppingCart.Cart;
import com.bornsoft.asn.bean.shoppingCart.CartItem;
import com.bornsoft.asn.exception.ActionException;
import com.bornsoft.asn.service.crm.CrmServPlanService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.service.productType.ProductTypeService;
import com.bornsoft.asn.service.quotation.QuotationService;
import com.bornsoft.asn.utils.common.AsnConstLib;
import com.bornsoft.asn.utils.common.HToken;
import com.bornsoft.asn.utils.common.Javascript;
import com.bornsoft.asn.utils.common.PageAjaxTool;
import com.bornsoft.asn.utils.common.WebContext;
import com.sun.org.apache.bcel.internal.generic.ARRAYLENGTH;

@SuppressWarnings("serial")
public class TestAction extends BaseAction
{

	private List<Map<String,Object>>	ptype;
	private List<QuotationInfo>			quoList;
	private List<Member>				customers;
	private List<Member>				selectedCustomers;
	private Map<Long,Member>			testCheckboxs;
	private List<Long>					valueList;
	private Integer page = 1;
	private String pageBar;
	private Integer pageSize = 1;
	private Integer start=0;
	private Integer end=0;
	
	public String listCart() throws Exception
	{
		Cart c = new Cart();
		c.addItem(new CartItem(213L, 338L, 1));
		c.addItem(new CartItem(214L, 338L, 1));
		c.addItem(new CartItem(223L, 7L, 1));
		c.addItem(new CartItem(213L, 338L, 1));
		String data = c.toJson();
		print(data);
		return null;
	}

	public String test() throws ScriptException
	{
		print(Javascript.eval("'abc'+'def'"));
		print(Javascript.eval("3+5"));
		print(Javascript.eval("x*0.9*y", "x", 35.6, "y", 3));
		print(Javascript.evalFloat("x*y-z", "x", 45, "y", 2, "z", 3));
		print(Javascript.evalInt("x*y-z", "x", 45, "y", 2, "z", 3));
		return null;
	}

	public String htoken() throws Exception
	{
		try
		{
			synchronized(this)
			{
				HttpServletRequest req = WebContext.getRequest();
				HToken ht = HToken.getHToken("cc", 3000, req);
				System.out.println(ht.isAvailable());
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	public String testmap() throws Exception
	{
		return "testmap";
	}

	public String testexcep() throws Exception
	{
		throw new ActionException("你好", new Throwable("asdfasdfasdf"));
	}

	public String testPtype() throws Exception
	{
		ptype = ProductTypeService.getNewProductType(null);
		return "ptype";
	}

	public String testNZPtype() throws Exception
	{
		ptype = ProductTypeService.getNewProductType(AsnConstLib.NZ_PT);

		return "nz_ptype";
	}

	public String testQuotationClip() throws Exception
	{
		quoList = QuotationService.findQuotationwoStatList(
				0,
				10,
				null,
				null,
				null);

		return "quotationClip";
	}

	public List<Map<String,Object>> getPtype()
	{
		return ptype;
	}

	public void setPtype(List<Map<String,Object>> ptype)
	{
		this.ptype = ptype;
	}

	public List<QuotationInfo> getQuoList()
	{
		return quoList;
	}

	public void setQuoList(List<QuotationInfo> quoList)
	{
		this.quoList = quoList;
	}

	public String testTileContainer() throws Exception
	{
		HttpServletRequest request = WebContext.getRequest();
		TilesContainer tc = TilesAccess.getContainer(request
				.getSession()
				.getServletContext());
		tc.render(
				"testTileContainer.test-tileContainer",
				request,
				WebContext.getResponse());
		return "testTileContainer";
	}

	public String testCheckBoxList() throws Exception
	{
		customers = MemberService.getCustomers(1423l);
		selectedCustomers = CrmServPlanService.getPlanCustomers(1423l, 1l);
		System.out.println(customers.size());
		System.out.println(selectedCustomers.size());
		testCheckboxs = new HashMap<Long,Member>();
		valueList = new ArrayList<Long>();
		PageAjaxTool pagetool = new PageAjaxTool();
		pagetool.setPageSize(pageSize);
		pagetool.setCurrentPage(page);
		pagetool.setTotalRow(customers.size());
		start = pagetool.getStartCount();
		end = pagetool.getEndCount();
		pageBar = pagetool.getPageBar();
		for (Member m : selectedCustomers)
		{
			valueList.add(m.getMemberId());
		}
		
		return "checkboxtest";
	}

	public List<Member> getCustomers()
	{
		return customers;
	}

	public List<Member> getSelectedCustomers()
	{
		return selectedCustomers;
	}

	public void setCustomers(List<Member> customers)
	{
		this.customers = customers;
	}

	public void setSelectedCustomers(List<Member> selectedCustomers)
	{
		this.selectedCustomers = selectedCustomers;
	}

	public Map<Long,Member> getTestCheckboxs()
	{
		return testCheckboxs;
	}

	public void setTestCheckboxs(Map<Long,Member> testCheckboxs)
	{
		this.testCheckboxs = testCheckboxs;
	}

	public List<Long> getValueList()
	{
		return valueList;
	}

	public void setValueList(List<Long> valueList)
	{
		this.valueList = valueList;
	}

	public Integer getPage()
	{
		return page;
	}

	public String getPageBar()
	{
		return pageBar;
	}

	public Integer getPageSize()
	{
		return pageSize;
	}

	public void setPage(Integer page)
	{
		this.page = page;
	}

	public void setPageBar(String pageBar)
	{
		this.pageBar = pageBar;
	}

	public void setPageSize(Integer pageSize)
	{
		this.pageSize = pageSize;
	}


	public Integer getStart()
	{
		return start;
	}

	public Integer getEnd()
	{
		return end;
	}

	public void setStart(Integer start)
	{
		this.start = start;
	}

	public void setEnd(Integer end)
	{
		this.end = end;
	}

}
