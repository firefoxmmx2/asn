package com.bornsoft.asn.action.storage;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.bornsoft.asn.action.BaseAction;

import com.bornsoft.asn.bean.product.Product;
import com.bornsoft.asn.bean.storage.Storage;
import com.bornsoft.asn.bean.storage.StorageInOut;
import com.bornsoft.asn.bean.storage.StorageInOutDetail;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.product.ProductService;
import com.bornsoft.asn.service.storage.StorageService;
import com.bornsoft.asn.service.supplier.SupplierService;
import com.bornsoft.asn.utils.common.AsnConstLib;
import com.bornsoft.asn.utils.common.PageTool;
import com.bornsoft.asn.utils.common.WebContext;
import com.bornsoft.asn.vo.ProductStorage;
import com.bornsoft.asn.vo.ProductStorageDetail;

public class StorageAction extends BaseAction{
	private List<ProductStorage> listStorage;
	private List<StorageInOut> listStorageInOut;
	private List<ProductStorageDetail> listStorageInOutDetail;
	private int page=1;
    private int pageSize=5 ;
    private String pageBar ;
    private StorageInOut storageInOut;
    private HashMap<String,String> storageMap;//key=productId,value=mdifyAmount
    private HashMap<String,String> storageMap1;//key=productId,value=amount
	public List<ProductStorage> getListStorage() {
		return listStorage;
	}

	public void setListStorage(List<ProductStorage> listStorage) {
		this.listStorage = listStorage;
	}

	public List<StorageInOut> getListStorageInOut() {
		return listStorageInOut;
	}

	public void setListStorageInOut(List<StorageInOut> listStorageInOut) {
		this.listStorageInOut = listStorageInOut;
	}

	public List<ProductStorageDetail> getListStorageInOutDetail() {
		return listStorageInOutDetail;
	}

	public void setListStorageInOutDetail(
			List<ProductStorageDetail> listStorageInOutDetail) {
		this.listStorageInOutDetail = listStorageInOutDetail;
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

	public StorageInOut getStorageInOut() {
		return storageInOut;
	}

	public void setStorageInOut(StorageInOut storageInOut) {
		this.storageInOut = storageInOut;
	}

	public HashMap<String, String> getStorageMap() {
		return storageMap;
	}

	public void setStorageMap(HashMap<String, String> storageMap) {
		this.storageMap = storageMap;
	}

	public HashMap<String, String> getStorageMap1() {
		return storageMap1;
	}

	public void setStorageMap1(HashMap<String, String> storageMap1) {
		this.storageMap1 = storageMap1;
	}

	public String toStorageList()throws Exception{
		Integer supplierId=((Long)SupplierService.getSupplierId()).intValue();
		String productName=this.getRequest().getParameter("productName");
		PageTool pageTool=new PageTool();
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(StorageService.getStorageListCount(supplierId, productName));
		pageBar = pageTool.getPageBar();
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;	
		listStorage=StorageService.getStorageList(supplierId, productName, startCount, endCount);
		WebContext.getRequest().setAttribute("productName", productName);
		return SUCCESS;
	}

	public String toStorageListIn()throws Exception{
		String string=this.getRequest().getParameter("ids");
		String[] ids=string.split(",");
		listStorage=StorageService.getStorageListOnChange(ids);
		//权限控制
		Integer supplierId=((Long)SupplierService.getSupplierId()).intValue();
		for(ProductStorage ps:listStorage){
			Integer productId=ps.getProductId();
			Product p=ProductService.getProductById(productId+"");
			Integer supplierId1=p.getSupplierId();
			if(!supplierId.equals(supplierId1)){
				return INPUT;
			}
		}
		//
		return SUCCESS;
	}
	
	public String toStorageListOut()throws Exception{
		String string=this.getRequest().getParameter("ids");
		String[] ids=string.split(",");
		listStorage=StorageService.getStorageListOnChange(ids);
		//权限控制
		Integer supplierId=((Long)SupplierService.getSupplierId()).intValue();
		for(ProductStorage ps:listStorage){
			Integer productId=ps.getProductId();
			Product p=ProductService.getProductById(productId+"");
			Integer supplierId1=p.getSupplierId();
			if(!supplierId.equals(supplierId1)){
				return INPUT;
			}
		}
		//
		return SUCCESS;
	}
	
	public String insertStorageInOut()throws Exception{
		storageInOut.setId(IdMakerService.newId("storage"));
		storageInOut.setHandleMan(SupplierService.getSupplierId());
		storageInOut.setHandleTime(new Date());
		List<StorageInOutDetail> siods=new ArrayList<StorageInOutDetail>();
		for(String s:storageMap.keySet()){
			StorageInOutDetail siod=new StorageInOutDetail();
			siod.setId(IdMakerService.newId("storage_detail"));
			siod.setStorageInOutId(storageInOut.getId());
			siod.setProductId(Integer.parseInt(s));
			siod.setBillAmount(Integer.valueOf(storageMap.get(s)));
			siods.add(siod);
		}	
		
		List<HashMap<String,Object>> l=new ArrayList<HashMap<String,Object>>();
		Date modifyTime=new Date();
		Long modifyMan=SupplierService.getSupplierId();
		for(String s:storageMap1.keySet()){
			HashMap<String,Object> m=new HashMap<String,Object>();
			m.put("modifyTime", modifyTime);
			m.put("modifyMan", modifyMan);
			m.put("productId", s);
			m.put("stockAmount",storageMap1.get(s) );
			l.add(m);
		}
		
		StorageService.insertStorageInOut(storageInOut, siods,l);

		return SUCCESS;
	}
	
	public String toStorageInOutList()throws Exception{
		String billNum=this.getRequest().getParameter("billNum");
		String id=this.getRequest().getParameter("id");
		String billType=this.getRequest().getParameter("billType");
		if(billType==null||billType.trim().equals("all")){
			billType="";
		}
		Integer supplierId=((Long)SupplierService.getSupplierId()).intValue();
		PageTool pageTool=new PageTool();
		pageTool.setCurrentPage(page);
		pageTool.setPageSize(pageSize);
		pageTool.setTotalRow(StorageService.getStorageInOutByProductIdCount(id, billNum,billType,supplierId));
		pageBar = pageTool.getPageBar();
		int startCount=(page-1)*pageSize+1;
		int endCount=page*pageSize;	
		listStorageInOut=StorageService.getStorageInOutByProductId(id,billNum,billType,supplierId,startCount,endCount);
		for(StorageInOut s:listStorageInOut){
			s.setBillType(AsnConstLib.storageBillTypeMap.get(s.getBillType()));
		}
		this.getRequest().setAttribute("bilNum", billNum);
		this.getRequest().setAttribute("id", id);
		this.getRequest().setAttribute("billType",billType);
		return SUCCESS;
	}
	
	public String toSee()throws Exception{
		String id=this.getRequest().getParameter("id");
		storageInOut=StorageService.getStorageInOutById(id);
		//权限控制
		Integer supplierId=((Long)SupplierService.getSupplierId()).intValue();
		Integer i=storageInOut.getHandleMan().intValue();
		if(!supplierId.equals(i)){
			return INPUT;
		}
		//
		listStorageInOutDetail=StorageService.getStorageInOutDetailByPid(id);

		return SUCCESS;
	}
	
}
