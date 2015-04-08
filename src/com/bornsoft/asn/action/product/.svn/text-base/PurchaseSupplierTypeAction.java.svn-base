package com.bornsoft.asn.action.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bornsoft.asn.bean.product.PurchaseSupplierType;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.product.PurchaseSupplierTypeService;
import com.bornsoft.asn.utils.common.AsnConstLib;
import com.bornsoft.asn.utils.json.Json;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.beanutils.BeanUtils;
public class PurchaseSupplierTypeAction extends ActionSupport{
	private PurchaseSupplierType pst;
	//原始的类型列表
	private String dataList;
	//要添加的类型列表
	@Deprecated
	private String addList;
	//要删除的类型列表
	@Deprecated
	private String delList;
	//新增的类型列表
	@Deprecated
	private String modList;
	
	/**
	 * 初始化页面信息
	 * @return 
	 * @throws Exception
	 */
	public String toView() throws Exception {
		List pstList = PurchaseSupplierTypeService.getPSTypeAll();
		
//		List<PurchaseSupplierType> pstList = new ArrayList<PurchaseSupplierType>();
//		PurchaseSupplierType pst =new PurchaseSupplierType();
//		pst.setTypeId(1);
//		pst.setTypeName("aa");
//		pst.setTypeCode("0001");
//		pst.setParentId(0);
//		pstList.add(pst);
//		pst =new PurchaseSupplierType();
//		pst.setTypeId(2);
//		pst.setTypeName("bb");
//		pst.setTypeCode("0001-0001");
//		pst.setParentId(1);
//		pstList.add(pst);
//		pst =new PurchaseSupplierType();
//		pst.setTypeId(3);
//		pst.setTypeName("cc");
//		pst.setTypeCode("0001-0001-0001");
//		pst.setParentId(2);
//		pstList.add(pst);
		pstList= parseData(0, pstList);
		dataList = Json.getString(pstList);
		return SUCCESS;
	}
	
	private List parseData(int parentId,List <PurchaseSupplierType>datalist){
		int typeId = parentId;
		List children = new ArrayList();
		
		for(PurchaseSupplierType pst  : datalist){
			if(typeId == pst.getParentId()){
				Map node = new HashMap();
				Map attributes = new HashMap();
				node.put("data", pst.getTypeName());
				attributes.put("id", pst.getTypeCode());
				attributes.put("typeId", pst.getTypeId());
				attributes.put("typeName",	pst.getTypeName());
				attributes.put("parentId", pst.getParentId());
				attributes.put("typeCode", pst.getTypeCode());
				attributes.put("priority", pst.getPriority());
				node.put("attributes", attributes);
				children.add(node);
				List child = (List) parseData(pst.getTypeId(), datalist);
				if(child != null && !child.isEmpty())
					node.put("children", child);
			}
		}
		return children;
	}
	
	@Deprecated
	public String doAction() throws Exception {
		return SUCCESS;
	}
	
	/**
	 * 执行 新增
	 * @return
	 * @throws Exception
	 */
	public String doNew() throws Exception {
		pst.setTypeId(IdMakerService.newId(AsnConstLib.psTypeIdType).intValue());
		PurchaseSupplierTypeService.newPSType(pst);
		toView();
		PurchaseSupplierType temp = new PurchaseSupplierType();
		BeanUtils.copyProperties(temp, pst);
		pst =	temp;
		return SUCCESS;
	}
	
	public String doUpdate() throws Exception {
		PurchaseSupplierTypeService.modifyPSType(pst);
		toView();
		return SUCCESS;
	}
	
	public String doDelete() throws Exception {
		PurchaseSupplierTypeService.deletePSType(pst.getTypeId());
		return SUCCESS;
	}

	public void setPst(PurchaseSupplierType pst) {
		this.pst = pst;
	}

	public PurchaseSupplierType getPst() {
		return pst;
	}

	public String getDataList() {
		return dataList;
	}

	public void setDataList(String dataList) {
		this.dataList = dataList;
	}

	public String getAddList() {
		return addList;
	}

	public void setAddList(String addList) {
		this.addList = addList;
	}

	public String getDelList() {
		return delList;
	}

	public void setDelList(String delList) {
		this.delList = delList;
	}

	public String getModList() {
		return modList;
	}

	public void setModList(String modList) {
		this.modList = modList;
	}
}
