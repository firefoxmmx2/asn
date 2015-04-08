package com.bornsoft.asn.utils.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileUpDownLoad {
	
	public static void uploadFile(File file,String destination) throws IOException{
		FileInputStream in = null;
		FileOutputStream out = null;
		try {
			in = new FileInputStream(file);
			out = new FileOutputStream(destination);
			byte[] buffer = new byte[1024];
			int len = 0;
			while ((len = in.read(buffer)) > 0)
			{
				out.write(buffer , 0 , len);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		finally{
			in.close();
			out.close();
		}
	}
	
	public static String downloadFilePath(String folderId,String fileId)throws Exception{
		String path=PropertyFactory.getDefaultProperty().getProperty("asn.sale_source");
		String pathAndFolderName=path+"/"+folderId;
		return pathAndFolderName+"/"+fileId;
	}
	
	public static String getDestination(String folderName,String fileName){
		String path=WebContext.getRealPath(PropertyFactory.getDefaultProperty().getProperty("asn.sale_source"));
		String pathAndFolderName=path+"/"+folderName;
		File f=new File(pathAndFolderName);
		if(!f.exists()){
			f.mkdir();
		}
		return pathAndFolderName+"/"+fileName;
	}
	
	public static void deleteFile(String folderName,String fileName)throws Exception{
		String path=WebContext.getRealPath(PropertyFactory.getDefaultProperty().getProperty("asn.sale_source"));
		String filePath=path+"/"+folderName+"/"+fileName;
		File f=new File(filePath);
		if(f.exists()){
			f.delete();
		}
	}
	
}
