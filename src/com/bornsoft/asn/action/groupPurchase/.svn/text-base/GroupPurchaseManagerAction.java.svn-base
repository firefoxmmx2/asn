package com.bornsoft.asn.action.groupPurchase;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.groupPurchase.GroupPurchaseDetail;
import com.bornsoft.asn.bean.groupPurchase.GroupPurchaseInfo;
import com.bornsoft.asn.bean.groupPurchase.GroupPurchaseMember;
import com.bornsoft.asn.service.groupPurchase.GroupPurchaseMemberService;
import com.bornsoft.asn.service.groupPurchase.GroupPurchaseService;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.utils.common.PageTool;

/**
 * 团购后台
 * 
 * @author hooxin
 * 
 */
@SuppressWarnings("serial")
public class GroupPurchaseManagerAction extends BaseAction {

	private GroupPurchaseInfo groupPurchaseInfo;
	private String productName; // 产品名称
	private String startTimeStart;
	private String endTimeStart;
	private String startTimeEnd;
	private String endTimeEnd;
	private String title; // 团购名称
	private String status;

	private Long[] groupPurchaseMemberIds;// 团购成员ID
	private List<GroupPurchaseDetail> listGPD;
	private GroupPurchaseMember groupMember;

	public String getStartTimeStart() {
		return startTimeStart;
	}

	public void setStartTimeStart(String startTimeStart) {
		this.startTimeStart = startTimeStart;
	}

	public String getEndTimeStart() {
		return endTimeStart;
	}

	public void setEndTimeStart(String endTimeStart) {
		this.endTimeStart = endTimeStart;
	}

	public String getStartTimeEnd() {
		return startTimeEnd;
	}

	public void setStartTimeEnd(String startTimeEnd) {
		this.startTimeEnd = startTimeEnd;
	}

	public String getEndTimeEnd() {
		return endTimeEnd;
	}

	public void setEndTimeEnd(String endTimeEnd) {
		this.endTimeEnd = endTimeEnd;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	private List<GroupPurchaseInfo> listGroupPurchaseInfo;

	private int page = 1;
	private int pageSize = 10;
	private String pageBar;

	public List<GroupPurchaseInfo> getListGroupPurchaseInfo() {
		return listGroupPurchaseInfo;
	}

	public void setListGroupPurchaseInfo(
			List<GroupPurchaseInfo> listGroupPurchaseInfo) {
		this.listGroupPurchaseInfo = listGroupPurchaseInfo;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String getPageBar() {
		return pageBar;
	}

	public void setPageBar(String pageBar) {
		this.pageBar = pageBar;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public GroupPurchaseInfo getGroupPurchaseInfo() {
		return groupPurchaseInfo;
	}

	public void setGroupPurchaseInfo(GroupPurchaseInfo groupPurchaseInfo) {
		this.groupPurchaseInfo = groupPurchaseInfo;
	}

	public List<GroupPurchaseDetail> getListGPD() {
		return listGPD;
	}

	public void setListGPD(List<GroupPurchaseDetail> listGPD) {
		this.listGPD = listGPD;
	}

	/**
	 * 查询团购信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String toCreateGroupPurchase() throws Exception {
		return SUCCESS;
	}

	public String toUpdateGroupPurchase() throws Exception {
		String id = this.getRequest().getParameter("id");
		Long id1 = Long.parseLong(id);
		groupPurchaseInfo = GroupPurchaseService.getGroupPurchaseById1(id1);
		listGPD = groupPurchaseInfo.getDetails();
		Date startDate = groupPurchaseInfo.getStartTime();
		Date stopDate = groupPurchaseInfo.getStopTime();
		String startTime = parseDateToString(startDate);
		String stopTime = parseDateToString(stopDate);
		this.getRequest().setAttribute("startTime", startTime);
		this.getRequest().setAttribute("stopTime", stopTime);
		return SUCCESS;
	}

	public String listGroupPurchase() throws Exception {
		String pageType = request("pageType"); // 如果是查询按钮的提交，就把页数值为初始值

		if (pageType != null) {
			page = 1;
			pageSize = 10;
		}
		PageTool pageTool = new PageTool();
		int startCount = (page - 1) * pageSize + 1;
		int endCount = page * pageSize;

		int count = GroupPurchaseService.getGroupPurchaseCount(title,
				productName, startTimeStart, endTimeStart, startTimeEnd,
				endTimeEnd, status);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
		pageBar = pageTool.getPageBar();

		listGroupPurchaseInfo = GroupPurchaseService.getGroupPurchase(title,
				productName, startTimeStart, endTimeStart, startTimeEnd,
				endTimeEnd, status, startCount, endCount);

		return SUCCESS;
	}

	/**
	 * 添加团购信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String appendGroupPurchase() throws Exception {
		String time1 = this.getRequest().getParameter("startTime");
		String time2 = this.getRequest().getParameter("stopTime");
		groupPurchaseInfo.setId(IdMakerService.newId("GroupPurchaseInfo"));
		groupPurchaseInfo.setCurrentUsers(0);
		groupPurchaseInfo.setTotalCount(0);
		groupPurchaseInfo.setStartTime(parseStringToDate(time1));
		groupPurchaseInfo.setStopTime(parseStringToDate(time2));
		groupPurchaseInfo
				.setPageAddress("/front/groupPurchase/getGroupPurchaseInfoById?id="
						+ groupPurchaseInfo.getId());
		List<GroupPurchaseDetail> nlistGPD = new ArrayList<GroupPurchaseDetail>();
		if (listGPD != null && listGPD.size() > 0) {
			for (GroupPurchaseDetail gpd : listGPD) {
				if (gpd != null && !gpd.getSpecs().trim().equals("")) {
					gpd.setId(IdMakerService.newId("GroupPurchaseDetail"));
					gpd.setGroupId(groupPurchaseInfo.getId());
					nlistGPD.add(gpd);
				}
			}
		}
		if (nlistGPD != null && nlistGPD.size() > 0) {
			groupPurchaseInfo.setDetails(nlistGPD);
		}
		GroupPurchaseService.appendGroupPurchase(groupPurchaseInfo);

		return SUCCESS;
	}

	private Date parseStringToDate(String s) {
		if (s.equals("0")) {
			return null;
		}
		String[] strings = s.split(" ");
		String s0 = strings[0];
		String s1 = strings[1];
		String s2 = strings[2];
		if (s2.equals("am")) {
			String[] strings1 = s1.split(":");
			String ss1 = strings1[0];
			if (ss1.equals("12")) {
				strings1[0] = "00";
				s1 = strings1[0] + ":" + strings1[1] + ":" + strings1[2];
			}
		}
		if (s2.equals("pm")) {
			String[] strings1 = s1.split(":");
			String ss1 = strings1[0];
			if (!ss1.equals("12")) {
				strings1[0] = 12 + Integer.parseInt(ss1) + "";
				s1 = strings1[0] + ":" + strings1[1] + ":" + strings1[2];
			}
		}

		String parseString = s0 + " " + s1;

		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		ParsePosition p = new ParsePosition(0);
		Date date = null;
		date = sdf.parse(parseString, p);
		return date;
	}

	private String parseDateToString(Date d) {
		if (d == null) {
			return "0";
		}
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		String s = sdf.format(d);// 12/12/2010 10:22:29
		String[] ss = s.split(" ");
		String ss0 = ss[0];
		String ss1 = ss[1];
		String ss2 = "am";
		String[] sss = ss1.split(":");
		String sss0 = sss[0];
		String sss1 = sss[1];
		String sss2 = sss[2];
		Integer i = Integer.parseInt(sss0);
		if (i == 12) {
			ss2 = "pm";
		}
		if (i > 12) {
			ss2 = "pm";
			i = i - 12;
		}
		if (i == 0) {
			i = 12;
		}
		sss0 = i + "";
		ss1 = sss0 + ":" + sss1 + ":" + sss2;
		s = ss0 + " " + ss1 + " " + ss2;
		return s;
	}

	/**
	 * 删除团购信息 cl
	 * 
	 * @return
	 * @throws Exception
	 */
	public String removeGroupPurchase() throws Exception {
		String idset = this.request("idset");
		String[] idArray = idset.split(",");

		for (int i = 0; i < idArray.length; i++) {
			GroupPurchaseService.removeGroupPurchase(idArray[i]);
		}
		return SUCCESS;
	}

	/**
	 * 发布、关闭团购信息 cl
	 * 
	 * @return
	 * @throws Exception
	 */
	public String statusGroupPurchase() throws Exception {
		String idset = this.request("idset");
		String operationType = this.request("operationType");
		String[] idArray = idset.split(",");
		String groupPurchaseStatus = "";
		if (operationType != null && operationType.equals("yes")) {
			groupPurchaseStatus = "Y";
		} else if (operationType != null && operationType.equals("no")) {
			groupPurchaseStatus = "C";
		} else if (operationType != null && operationType.equals("end")) {
			groupPurchaseStatus = "O";
		}

		for (int i = 0; i < idArray.length; i++) {
			GroupPurchaseService.updateStatusGroupPurchase(idArray[i],
					groupPurchaseStatus);
		}
		return SUCCESS;
	}

	/**
	 * 修改团购信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String modifyGroupPurchase() throws Exception {
		String time1 = this.getRequest().getParameter("startTime");
		String time2 = this.getRequest().getParameter("stopTime");
		groupPurchaseInfo.setStartTime(parseStringToDate(time1));
		groupPurchaseInfo.setStopTime(parseStringToDate(time2));
		List<GroupPurchaseDetail> nlistGPD = new ArrayList<GroupPurchaseDetail>();
		if (listGPD != null && listGPD.size() > 0) {
			for (GroupPurchaseDetail gpd : listGPD) {
				if (gpd != null && !gpd.getSpecs().trim().equals("")) {
					gpd.setId(IdMakerService.newId("GroupPurchaseDetail"));
					gpd.setGroupId(groupPurchaseInfo.getId());
					nlistGPD.add(gpd);
				}
			}
		}
		if (nlistGPD != null && nlistGPD.size() > 0) {
			groupPurchaseInfo.setDetails(nlistGPD);
		}
		GroupPurchaseService.modifyGroupPurchase(groupPurchaseInfo);

		return SUCCESS;
	}

	public String displayGroupPurchaseDetail() throws Exception {
		if (groupPurchaseInfo == null || groupPurchaseInfo.getId() == null)
			throw new RuntimeException(
					"groupPurchaseInfo is null or id is null!");
		groupPurchaseInfo = GroupPurchaseService
				.getGroupPurchaseById(groupPurchaseInfo.getId());
		PageTool pageTool = new PageTool();
		int startCount = (page - 1) * pageSize + 1;
		int endCount = page * pageSize;
		request("startCount", startCount);
		request("endCount", endCount);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(groupPurchaseInfo.getGroupMembers().size());
		pageBar = pageTool.getPageBar();
		return SUCCESS;
	}

	public String makeGroupMemberVaild() throws Exception {
		if (groupPurchaseMemberIds != null && groupPurchaseMemberIds.length > 0) {
			for (int i = 0; i < groupPurchaseMemberIds.length; i++)
				GroupPurchaseService.updateGroupMemberStatus("Y",
						groupPurchaseMemberIds[i]);
		}
		return SUCCESS;
	}

	public String makeGroupMemberInvaild() throws Exception {
		if (groupPurchaseMemberIds != null && groupPurchaseMemberIds.length > 0) {
			for (int i = 0; i < groupPurchaseMemberIds.length; i++)
				GroupPurchaseService.updateGroupMemberStatus("N",
						groupPurchaseMemberIds[i]);
		}
		return SUCCESS;
	}

	/**
	 * 获取会员明细
	 * 
	 * @return
	 * @throws Exception
	 */
	public String getMemberBuyDetail() throws Exception {
		String id = request("id");
		if (id == null)
			throw new RuntimeException("group member id is null ");
		groupMember = GroupPurchaseMemberService.getGroupPurchaseMember(Long
				.parseLong(id));

		return SUCCESS;
	}

	/**
	 * 会员的团购信息
	 * @return
	 * @throws Exception
	 */
	public String myGroupPurchases() throws Exception {
		String pageType = request("pageType"); // 如果是查询按钮的提交，就把页数值为初始值

		if (pageType != null) {
			page = 1;
			pageSize = 10;
		}
		PageTool pageTool = new PageTool();
		int startCount = (page - 1) * pageSize + 1;
		int endCount = page * pageSize;
		Long groupMemberId = 0l;
		try{
			groupMemberId=Long.parseLong(MemberService.getMember().getSsoAccount());
		}catch (Exception e) {
			// TODO: handle exception
			
		}
		
		int count = GroupPurchaseService.getGroupPurchasesCount(title,
				productName, startTimeStart, endTimeStart, startTimeEnd,
				endTimeEnd, status, groupMemberId);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
		pageBar = pageTool.getPageBar();

		listGroupPurchaseInfo = GroupPurchaseService.getGroupPurchases(
				startCount, endCount, title, productName, startTimeStart,
				endTimeStart, startTimeEnd, endTimeEnd, status, groupMemberId);

		return SUCCESS;
	}

	/**
	 * 会员的团购详情
	 * @return
	 * @throws Exception
	 */
	public String displayMyGroupPurchaseDetail() throws Exception {
		if (groupPurchaseInfo == null || groupPurchaseInfo.getId() == null)
			throw new RuntimeException(
					"groupPurchaseInfo is null or id is null!");
		Long groupMemberId = 0l;
		try{
			groupMemberId=Long.parseLong(MemberService.getMember().getSsoAccount());
		}catch (Exception e) {
			// TODO: handle exception
			Logger log=Logger.getLogger("");
			log.error(e);
		}
		groupPurchaseInfo = GroupPurchaseService
				.getGroupPurchaseByIdAndMemberId(groupPurchaseInfo.getId(),groupMemberId);
		PageTool pageTool = new PageTool();
		int startCount = (page - 1) * pageSize + 1;
		int endCount = page * pageSize;
		request("startCount", startCount);
		request("endCount", endCount);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(groupPurchaseInfo.getGroupMembers().size());
		pageBar = pageTool.getPageBar();
		return SUCCESS;
	}

	public Long[] getGroupPurchaseMemberIds() {
		return groupPurchaseMemberIds;
	}

	public void setGroupPurchaseMemberIds(Long[] groupPurchaseMemberIds) {
		this.groupPurchaseMemberIds = groupPurchaseMemberIds;
	}

	public GroupPurchaseMember getGroupMember() {
		return groupMember;
	}

	public void setGroupMember(GroupPurchaseMember groupMember) {
		this.groupMember = groupMember;
	}

}
