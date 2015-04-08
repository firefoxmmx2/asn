package com.bornsoft.asn.action.utils.common;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;

import com.bornsoft.asn.utils.common.AsnConstLib;
import com.bornsoft.asn.utils.common.WebContext;
import com.opensymphony.xwork2.ActionSupport;

public class GeoLocManageAction extends ActionSupport{
	private String geoLocData;
	
	public String toView() throws Exception{
		File geoLocFile = new File(WebContext.getRealPath("/")+AsnConstLib.geoLocUrl);
		BufferedReader br = new BufferedReader(new FileReader(geoLocFile));
		String line = null;
		StringBuffer getLocDataSB = new StringBuffer();
		while((line = br.readLine()) != null){
			getLocDataSB.append(line);
		}
		br.close();
		geoLocData = getLocDataSB.toString();
		return SUCCESS;
	}
	
	public String execute() throws Exception {
		return null;
	}
	public String doUpdate() throws Exception {
		File geoLocFile = new File(WebContext.getRealPath("/")+AsnConstLib.geoLocUrl);
		BufferedWriter bw = new BufferedWriter(new FileWriter(geoLocFile));
		if(geoLocData == null)
			geoLocData = "";
		bw.write(geoLocData);
		bw.close();
		return SUCCESS;
	}

	public void setGeoLocData(String geoLocData) {
		this.geoLocData = geoLocData;
	}

	public String getGeoLocData() {
		return geoLocData;
	}
}
