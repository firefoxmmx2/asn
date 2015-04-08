package com.bornsoft.asn.bean.recruitment;

import java.io.Serializable;

public class Experience implements Serializable{
	private Long id;
	private Long employId;
	private String workTimes;//时间段
	private String company;
	private String businessNature;//公司性质
	private String companySize;//公司规模
	private String trade;//行 业
	private String department;//部门
	private String position;//职位
	private String workPlace;//工作地点
	private String jobNature;//工作性质
	private String jobDuty;//工作职责与业绩
	private Boolean studyAbroad;//海外工作经历
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getEmployId() {
		return employId;
	}
	public void setEmployId(Long employId) {
		this.employId = employId;
	}
	public String getWorkTimes() {
		return workTimes;
	}
	public void setWorkTimes(String workTimes) {
		this.workTimes = workTimes;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getBusinessNature() {
		return businessNature;
	}
	public void setBusinessNature(String businessNature) {
		this.businessNature = businessNature;
	}
	public String getCompanySize() {
		return companySize;
	}
	public void setCompanySize(String companySize) {
		this.companySize = companySize;
	}
	public String getTrade() {
		return trade;
	}
	public void setTrade(String trade) {
		this.trade = trade;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getWorkPlace() {
		return workPlace;
	}
	public void setWorkPlace(String workPlace) {
		this.workPlace = workPlace;
	}
	public String getJobNature() {
		return jobNature;
	}
	public void setJobNature(String jobNature) {
		this.jobNature = jobNature;
	}
	public String getJobDuty() {
		return jobDuty;
	}
	public void setJobDuty(String jobDuty) {
		this.jobDuty = jobDuty;
	}
	public Boolean getStudyAbroad() {
		return studyAbroad;
	}
	public void setStudyAbroad(Boolean studyAbroad) {
		this.studyAbroad = studyAbroad;
	}
	
	
	
}
