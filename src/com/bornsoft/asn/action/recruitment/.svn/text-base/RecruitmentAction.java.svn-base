package com.bornsoft.asn.action.recruitment;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.recruitment.Edu;
import com.bornsoft.asn.bean.recruitment.Employee;
import com.bornsoft.asn.bean.recruitment.Experience;
import com.bornsoft.asn.bean.recruitment.Purpose;
import com.bornsoft.asn.bean.recruitment.Recruitment;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.service.recruitment.EmployeeService;
import com.bornsoft.asn.service.recruitment.RecruitmentService;
import com.bornsoft.asn.utils.common.AsnConstLib;
import com.bornsoft.asn.utils.common.PageCreator;
import com.bornsoft.asn.utils.common.PageTool;
import com.bornsoft.asn.utils.common.WebContext;

public class RecruitmentAction extends BaseAction{
	private Recruitment recruitment;
	private List<Recruitment> recruitmentList;
	private int page=1;
    private int pageSize=5 ;
    private String pageBar ;
    private Employee employee;
    private Edu edu;
    private Experience experience;
    private Purpose purpose;
    private String yearOfBirthday;
    private String monthOfBirthday;
    private String dayOfBirthday;
    private String fromYear;
    private String fromMonth;
    private String toYear;
    private String toMonth;
    private String fromYear1;
    private String fromMonth1;
    private String toYear1;
    private String toMonth1;
    private List<Employee> employeeList;
    private File photo;
	public Recruitment getRecruitment() {
		return recruitment;
	}

	public void setRecruitment(Recruitment recruitment) {
		this.recruitment = recruitment;
	}

	public List<Recruitment> getRecruitmentList() {
		return recruitmentList;
	}

	public void setRecruitmentList(List<Recruitment> recruitmentList) {
		this.recruitmentList = recruitmentList;
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

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Edu getEdu() {
		return edu;
	}

	public void setEdu(Edu edu) {
		this.edu = edu;
	}

	public Experience getExperience() {
		return experience;
	}

	public void setExperience(Experience experience) {
		this.experience = experience;
	}

	public Purpose getPurpose() {
		return purpose;
	}

	public void setPurpose(Purpose purpose) {
		this.purpose = purpose;
	}

	public String getYearOfBirthday() {
		return yearOfBirthday;
	}

	public void setYearOfBirthday(String yearOfBirthday) {
		this.yearOfBirthday = yearOfBirthday;
	}

	public String getMonthOfBirthday() {
		return monthOfBirthday;
	}

	public void setMonthOfBirthday(String monthOfBirthday) {
		this.monthOfBirthday = monthOfBirthday;
	}

	public String getDayOfBirthday() {
		return dayOfBirthday;
	}

	public void setDayOfBirthday(String dayOfBirthday) {
		this.dayOfBirthday = dayOfBirthday;
	}

	public String getFromYear() {
		return fromYear;
	}

	public void setFromYear(String fromYear) {
		this.fromYear = fromYear;
	}

	public String getFromMonth() {
		return fromMonth;
	}

	public void setFromMonth(String fromMonth) {
		this.fromMonth = fromMonth;
	}

	public String getToYear() {
		return toYear;
	}

	public void setToYear(String toYear) {
		this.toYear = toYear;
	}

	public String getToMonth() {
		return toMonth;
	}

	public void setToMonth(String toMonth) {
		this.toMonth = toMonth;
	}

	public String getFromYear1() {
		return fromYear1;
	}

	public void setFromYear1(String fromYear1) {
		this.fromYear1 = fromYear1;
	}

	public String getFromMonth1() {
		return fromMonth1;
	}

	public void setFromMonth1(String fromMonth1) {
		this.fromMonth1 = fromMonth1;
	}

	public String getToYear1() {
		return toYear1;
	}

	public void setToYear1(String toYear1) {
		this.toYear1 = toYear1;
	}

	public String getToMonth1() {
		return toMonth1;
	}

	public void setToMonth1(String toMonth1) {
		this.toMonth1 = toMonth1;
	}

	public List<Employee> getEmployeeList() {
		return employeeList;
	}

	public void setEmployeeList(List<Employee> employeeList) {
		this.employeeList = employeeList;
	}

	public File getPhoto() {
		return photo;
	}

	public void setPhoto(File photo) {
		this.photo = photo;
	}

	public String toCreateRecruitment()throws Exception{
		return SUCCESS;
	}
	
	public String createRecruitment()throws Exception{
		recruitment.setCreateTime(new Date());
		recruitment.setId(IdMakerService.newId("recruitment"));
		if(recruitment.getStatus().trim().equals("1")){
			recruitment.setPublishedTime(new Date());
		}
		recruitment.setBelongTo(((Long)MemberService.getMemberId()).intValue());
		RecruitmentService.insertRecruitment(recruitment);
		return SUCCESS;
	}
	
	public String toRecruitmentList()throws Exception{
		Integer belongTo=((Long)MemberService.getMemberId()).intValue();
		String status=WebContext.getRequest().getParameter("status");
		String jobName=WebContext.getRequest().getParameter("jobName");
		if(status==null||status.equals("0")){
			status="1";
		}
		PageTool pageTool=new PageTool();
		int count=RecruitmentService.getRecruitmentListCount(jobName, belongTo,status);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	Integer start=(page-1)*pageSize+1;
	   	Integer end=page*pageSize;
		recruitmentList=RecruitmentService.getRecruitmentList(jobName, belongTo,status,start,end);
		WebContext.getRequest().setAttribute("status", status);
		WebContext.getRequest().setAttribute("jobName", jobName);
		return SUCCESS;
	}
	
	public String setRecruitmentStatus()throws Exception{
		String status=this.getRequest().getParameter("status");
		String ids=this.getRequest().getParameter("ids");
		String[] strings=ids.split(",");
		if(status==null||strings[0]==null||status.trim().equals("")||strings[0].trim().equals("")){
			return INPUT;
		}
		
		//权限判断
		for(String s:strings){
			recruitment=RecruitmentService.getRecruitmentById(s);
			Integer memberId=recruitment.getBelongTo();
			Integer memberId1=((Long)MemberService.getMemberId()).intValue();
			if(!memberId.equals(memberId1)){
				return INPUT;
			}
		}
		//
		RecruitmentService.setRecruitmentStatus(strings, status);
		return SUCCESS;
	}
	
	public String toUpdateRecruitment()throws Exception{
		String id=WebContext.getRequest().getParameter("id");
		recruitment=RecruitmentService.getRecruitmentById(id);
		//权限判断
		Integer memberId=recruitment.getBelongTo();
		Integer memberId1=((Long)MemberService.getMemberId()).intValue();
		if(!memberId.equals(memberId1)){
			return INPUT;
		}
		//
		return SUCCESS;
	}
	
	public String updateRecruitment()throws Exception{
		if(recruitment.getStatus().trim().equals("1")){
			recruitment.setPublishedTime(new Date());
		}
		//权限判断
		Integer memberId=recruitment.getBelongTo();
		Integer memberId1=((Long)MemberService.getMemberId()).intValue();
		if(!memberId.equals(memberId1)){
			return INPUT;
		}
		//
		RecruitmentService.updateRecruitment(recruitment);
		return SUCCESS;
	}
	
	/**前台获取职位列表（根据单位ID）
	 * @return
	 * @throws Exception
	 */
	public String showRecruitmentList()throws Exception
	{
		String belongTo = WebContext.getRequest().getParameter("belongTo");
		if(belongTo==null || belongTo.trim().length()<=0)
			belongTo=null;
		String jobName=WebContext.getRequest().getParameter("jobName");
		
		PageCreator pc=new PageCreator();
		pc.setCurrentPage(page);
		//pc.setTotalRow(RecruitmentService.getRecruitmentListCount(jobName,null,"1"));
		pc.setTotalRow(RecruitmentService.getRecruitmentListCount(jobName, (belongTo==null?null:new Integer(belongTo)), "1"));
		pageBar=pc.getPageBar();
		//recruitmentList=RecruitmentService.getRecruitmentList(jobName, null,"1",pc.getStartCount(),pc.getEndCount());
		recruitmentList=RecruitmentService.getRecruitmentList(jobName, 
				(belongTo==null?null:new Integer(belongTo)),
				"1",
				pc.getStartCount(),pc.getEndCount());
		for(Recruitment r:recruitmentList){
			String edu=AsnConstLib.recruitmentEduRecordMap.get(r.getEduRecord());
			r.setEduRecord(edu);
		}
		return SUCCESS;
	}
	
	public String showRecruitment()throws Exception{
		String id=WebContext.getRequest().getParameter("rid");
		if(id==null||id.trim().equals("")){
			return INPUT;
		}
		recruitment=RecruitmentService.getRecruitmentById(id);
		String company=MemberService.getMember(recruitment.getBelongTo()).getFullName();
		WebContext.getRequest().setAttribute("company", company);
		recruitment.setEduRecord(AsnConstLib.recruitmentEduRecordMap.get(recruitment.getEduRecord()));
		recruitment.setWorkType(AsnConstLib.recruitmentWorkTypeMap.get(recruitment.getWorkType()));
		recruitment.setWorkYears(AsnConstLib.recruitmentWorkYearsMap.get(recruitment.getWorkYears()));
		recruitment.setTreatment(AsnConstLib.recruitmentTreatmentMap.get(recruitment.getTreatment()));
		return SUCCESS;
	}
	
	public String toEmploy()throws Exception{
		String rid=WebContext.getRequest().getParameter("rid");
		if(rid==null||rid.trim().equals("")){
			return INPUT;
		}
		WebContext.getRequest().setAttribute("jobId", rid);
		return SUCCESS;
	}
	
	public String createResume()throws Exception{
		String birth=yearOfBirthday+"-"+monthOfBirthday+"-"+dayOfBirthday;
		employee.setBirthday(birth);
		employee.setId(IdMakerService.newId("employee"));
		employee.setIsUse(false);
		String eduYear=fromYear+"/"+fromMonth+"-"+toYear+"/"+toMonth;
		edu.setEduTimes(eduYear);
		edu.setId(IdMakerService.newId("edu"));
		edu.setEmployId(employee.getId());
		String expYear=fromYear1+"/"+fromMonth1+"-"+toYear1+"/"+toMonth1;
		experience.setWorkTimes(expYear);
		experience.setId(IdMakerService.newId("experience"));
		experience.setEmployId(employee.getId());
		purpose.setId(IdMakerService.newId("purpose"));
		purpose.setEmployId(employee.getId());
		EmployeeService.insertEmployee(employee, edu, experience, purpose,photo);
		return SUCCESS;
	}
	
	public String toEmployeeList()throws Exception{
		String jid=WebContext.getRequest().getParameter("jid");
		if(jid==null||jid.trim().equals("")){
			return INPUT;
		}
		String status=WebContext.getRequest().getParameter("status");
		if(status==null||status.trim().equals("")){
			return INPUT;
		}
		Integer belongTo=((Long)MemberService.getMemberId()).intValue();
		recruitment=RecruitmentService.getRecruitmentById(jid);
		Integer bt=recruitment.getBelongTo();
		if(!belongTo.equals(bt)){
			return INPUT;
		}
		WebContext.getRequest().setAttribute("tip", "应聘"+recruitment.getJobName());
		PageTool pageTool=new PageTool();
		int count=EmployeeService.getEmployeeListCount(jid,status);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	Integer start=(page-1)*pageSize+1;
	   	Integer end=page*pageSize;
		employeeList=EmployeeService.getEmployeeList(jid, start,end,status);
		WebContext.getRequest().setAttribute("jobId", jid);
		WebContext.getRequest().setAttribute("status", status);
		return SUCCESS;
	}
	
	public String deleEmployee()throws Exception{
		String ids=this.getRequest().getParameter("ids");
		String[] strings=ids.split(",");
		String jid=WebContext.getRequest().getParameter("jid");
		String status=this.getRequest().getParameter("status");
		WebContext.getRequest().setAttribute("status", status);
		WebContext.getRequest().setAttribute("jid", jid);
		if(status==null||jid==null||status.trim().equals("")||jid.trim().equals("")){
			return INPUT;
		}
		Integer belongTo=((Long)MemberService.getMemberId()).intValue();
		recruitment=RecruitmentService.getRecruitmentById(jid);
		Integer bt=recruitment.getBelongTo();
		if(!belongTo.equals(bt)){
			return INPUT;
		}
		EmployeeService.deleteEmployee(strings);
		return SUCCESS;
	}
	
	public String showEmployee()throws Exception{
		String eid=this.getRequest().getParameter("eid");
		Map m=EmployeeService.getEmployById(eid);
		employee=(Employee) m.get("Employee");
		employee.setSex(AsnConstLib.employeeSexMap.get(employee.getSex()));
		employee.setWorkYear(AsnConstLib.recruitmentWorkYearsMap.get(employee.getWorkYear()));
		employee.setCertType(AsnConstLib.employeeCertTypeMap.get(employee.getCertType()));
		Integer belongTo=((Long)MemberService.getMemberId()).intValue();
		recruitment=RecruitmentService.getRecruitmentById(employee.getJobId()+"");
		Integer bt=recruitment.getBelongTo();
		if(!belongTo.equals(bt)){
			return INPUT;
		}
		edu=(Edu) m.get("Edu");
		String[] eduTime=edu.getEduTimes().split("-");
		if(eduTime.length>1&&eduTime[1].equals("0/0")){
			eduTime[1]="至今";
			edu.setEduTimes(eduTime[0]+"-"+eduTime[1]);
		}
		
		edu.setEducationalBackground(AsnConstLib.recruitmentEduRecordMap.get(edu.getEducationalBackground()));
		experience=(Experience) m.get("Experience"); 
		String[] exTime=experience.getWorkTimes().split("-");
		if(exTime.length>1&&exTime[1].equals("0/0")){
			exTime[1]="至今";
			experience.setWorkTimes(exTime[0]+"-"+exTime[1]);
		}
		experience.setBusinessNature(AsnConstLib.employeeBusinessNatureMap.get(experience.getBusinessNature()));
		experience.setCompanySize(AsnConstLib.employeeCompanySizeMap.get(experience.getCompanySize()));
		experience.setJobNature(AsnConstLib.employeeJobNatureMap.get(experience.getJobNature()));
		purpose=(Purpose) m.get("Purpose");
		purpose.setExpectedSalary(AsnConstLib.recruitmentTreatmentMap.get(purpose.getExpectedSalary()));
		purpose.setDutyTime(AsnConstLib.employeeDutyTimeMap.get(purpose.getDutyTime()));
		return SUCCESS;
	}
	
	public String setEmployeeUse()throws Exception{
		String id=this.getRequest().getParameter("id");
		String status=this.getRequest().getParameter("status");
		String jid=WebContext.getRequest().getParameter("jid");
		if(id==null||status==null||jid==null||id.trim().equals("")||status.trim().equals("")||jid.trim().equals("")){
			return INPUT;
		}
		Integer belongTo=((Long)MemberService.getMemberId()).intValue();
		recruitment=RecruitmentService.getRecruitmentById(jid);
		Integer bt=recruitment.getBelongTo();
		if(!belongTo.equals(bt)){
			return INPUT;
		}
		WebContext.getRequest().setAttribute("status", status);
		WebContext.getRequest().setAttribute("jid", jid);
		EmployeeService.setEmployeeUse(id, status);
		return SUCCESS;
	}
	
}
