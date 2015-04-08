package com.bornsoft.asn.bean.recruitment;

import java.io.Serializable;
import java.util.Date;

public class Recruitment implements Serializable{
	private Long id;
	private String jobName;//职位
	private String workPlace;//工作地点
	private Integer amount;//招聘人数
	private String workYears;//工作年限
	private String eduRecord;//学历
	private String jobDescription;//职位描述
	private String jobRequirement;//职位要求
	private String workType;//工作类型
	private String treatment;//待遇
	private String promptMesg;//应聘提示
	private String phoneNo;//联系电话
	private String mailNo;//联系邮箱
	private Date publishedTime;//发布日期
	private Date createTime;//创建日期
	private Integer belongTo;//招聘单位
	private String status;//职位状态
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	public String getWorkPlace() {
		return workPlace;
	}
	public void setWorkPlace(String workPlace) {
		this.workPlace = workPlace;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public String getWorkYears() {
		return workYears;
	}
	public void setWorkYears(String workYears) {
		this.workYears = workYears;
	}
	public String getEduRecord() {
		return eduRecord;
	}
	public void setEduRecord(String eduRecord) {
		this.eduRecord = eduRecord;
	}
	public String getJobDescription() {
		return jobDescription;
	}
	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}
	public String getJobRequirement() {
		return jobRequirement;
	}
	public void setJobRequirement(String jobRequirement) {
		this.jobRequirement = jobRequirement;
	}
	public String getWorkType() {
		return workType;
	}
	public void setWorkType(String workType) {
		this.workType = workType;
	}
	public String getTreatment() {
		return treatment;
	}
	public void setTreatment(String treatment) {
		this.treatment = treatment;
	}
	public String getPromptMesg() {
		return promptMesg;
	}
	public void setPromptMesg(String promptMesg) {
		this.promptMesg = promptMesg;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getMailNo() {
		return mailNo;
	}
	public void setMailNo(String mailNo) {
		this.mailNo = mailNo;
	}
	public Date getPublishedTime() {
		return publishedTime;
	}
	public void setPublishedTime(Date publishedTime) {
		this.publishedTime = publishedTime;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Integer getBelongTo() {
		return belongTo;
	}
	public void setBelongTo(Integer belongTo) {
		this.belongTo = belongTo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}
