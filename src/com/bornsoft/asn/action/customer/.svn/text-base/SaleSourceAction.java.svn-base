package com.bornsoft.asn.action.customer;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;

import com.bornsoft.asn.action.BaseAction;
import com.bornsoft.asn.bean.bizOpp.SaleSource;
import com.bornsoft.asn.service.customer.BizOppService;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.supplier.SupplierService;
import com.bornsoft.asn.utils.common.FileUpDownLoad;
import com.bornsoft.asn.utils.common.PageTool;

public class SaleSourceAction extends BaseAction{
    private SaleSource saleSource;
    private List<SaleSource> listss;
	private File file;
	private String fileFileName;
	private int page=1;
    private int pageSize=10 ;
    private String pageBar ;
	public SaleSource getSaleSource() {
		return saleSource;
	}

	public void setSaleSource(SaleSource saleSource) {
		this.saleSource = saleSource;
	}

	public List<SaleSource> getListss() {
		return listss;
	}

	public void setListss(List<SaleSource> listss) {
		this.listss = listss;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
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

	public String toSaleSourceList()throws Exception{
		Long supplierId=SupplierService.getSupplierId();
		String title=this.getRequest().getParameter("title");
		PageTool pageTool=new PageTool();
		int count=BizOppService.getSaleSourceListCount(supplierId, title);
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(count);
	   	pageBar = pageTool.getPageBar();
	   	Integer start=(page-1)*pageSize+1;
	   	Integer end=page*pageSize;
		listss=BizOppService.getSaleSourceList(supplierId, title,start,end);
		if(title!=null&&!title.equals("")){
			this.getRequest().setAttribute("title", title);
		}
		return SUCCESS;
	}
	
	public String toCreateSaleSource()throws Exception{
		
		return SUCCESS;
	}
	
	public String createSaleSource()throws Exception{
		
		saleSource.setId(IdMakerService.newId("SaleSource"));
		saleSource.setCreateTime(new Date());
		saleSource.setSupplierId(SupplierService.getSupplierId());
		if(file!=null){
			saleSource.setFileName(fileFileName);
		}
		
		BizOppService.insertSaleSource(saleSource,file);
		return SUCCESS;
	}
	
	public String viewSaleSource()throws Exception{
		String id=this.getRequest().getParameter("id");
		//权限控制
		Boolean b=check(id,SupplierService.getSupplierId());
		if(!b){
			return INPUT;
		}
		//
		saleSource=BizOppService.getSaleSource(Long.parseLong(id));
		return SUCCESS;
	}
	
//下载方法
	public InputStream getDownloadFile() throws Exception 
	{
		//ServletContext提供getResourceAsStream()方法
		//返回指定文件对应的输入流 
		return ServletActionContext.getServletContext().getResourceAsStream(getFilePath());
	}
	
//文件名称
	private String fileName;
	
	public String getFileName() throws UnsupportedEncodingException {
		return fileName;
	}

	public void setFileName(String fileName) throws UnsupportedEncodingException {
		this.fileName = new String(fileName.getBytes("gb2312"),"iso-8859-1");
	}
	
//文件访问路径
	private String filePath;
	
	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	//action 方法
	public String downloadFile()throws Exception{
		String id=this.getRequest().getParameter("id");
		//权限控制
		Boolean b=check(id,SupplierService.getSupplierId());
		if(!b){
			return INPUT;
		}
		//
		saleSource=BizOppService.getSaleSource(Long.parseLong(id));
		setFileName(saleSource.getFileName());
		setFilePath(FileUpDownLoad.downloadFilePath(saleSource.getSupplierId()+"", saleSource.getFileId()+""));
		return SUCCESS;
	}
	//文件删除
	public String delSaleSource()throws Exception{
		String id=this.getRequest().getParameter("id");
		//权限控制
		Boolean b=check(id,SupplierService.getSupplierId());
		if(!b){
			return INPUT;
		}
		//
		BizOppService.deleteSaleSource(Long.parseLong(id));
		return SUCCESS;
	}
	//文件修改
	public String toModifySaleSource()throws Exception{
		String id=this.getRequest().getParameter("id");
		//权限控制
		Boolean b=check(id,SupplierService.getSupplierId());
		if(!b){
			return INPUT;
		}
		//
		saleSource=BizOppService.getSaleSource(Long.parseLong(id));
		return SUCCESS;
	}
	public String modifySaleSource()throws Exception{
		//权限控制
		Boolean b=check(saleSource.getId()+"",SupplierService.getSupplierId());
		if(!b){
			return INPUT;
		}
		//
		if(file!=null){
			saleSource.setFileName(fileFileName);
		}
		saleSource.setSupplierId(SupplierService.getSupplierId());
		BizOppService.modifySaleSource(saleSource,file);
		return SUCCESS;
	}
	//权限控制
	private Boolean check(String id,Long supplierId) throws Exception, Exception{
		SaleSource ss=BizOppService.getSaleSource(Long.parseLong(id));
		Long sid=ss.getSupplierId();
		if(supplierId.equals(sid)){
			return true;
		}
		return false;
	}
}
