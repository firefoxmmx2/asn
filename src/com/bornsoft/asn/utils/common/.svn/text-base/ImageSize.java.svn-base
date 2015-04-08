package com.bornsoft.asn.utils.common;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;

public class ImageSize {
//	private String originalPath;
//	private String thumbnailPath;
//	private int width;
//	private int height;
//	private char mode;
	
	
	public static void drawImage(String originalPath, String thumbnailPath, int width, int height, char mode) throws Exception{
		File f=new File(originalPath);
		Image originalImage=ImageIO.read(f);
        int towidth = width;
        int toheight = height;
        int ow = originalImage.getWidth(null);
        int oh = originalImage.getHeight(null);
        switch(mode){
        case '#'://指定高宽缩放（可能变形）  
        	break;
        case 'W'://指定宽，高按比例 
        	toheight = oh * width / ow;
            break;
        case 'H'://指定高，宽按比例
        	towidth = ow*height/oh;
        	break;
        case '*'://按比例，排除超高或超宽的情况
        	towidth = ow*height/oh;
        	if(towidth>width){
        		towidth = width;
        		toheight = oh * width / ow;
        	}
        	break;
        }
        BufferedImage image=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
        Graphics g=image.getGraphics();
        int x=(width-towidth)/2;
        int y=(height-toheight)/2;
        g.fillRect(0,0,width,height);
        g.drawImage(originalImage,x,y,towidth,toheight,null);
        ImageIO.write(image, "jpg", new File(thumbnailPath));
	}
	
	public static String drawOriginalPic(File originalPic)throws Exception{
		if(getFormatName(originalPic)==null){
			return drawDefaultImage()[0];
		}
		String picName=System.currentTimeMillis()+".jpg";
		String virtualPath=PropertyFactory.getDefaultProperty().getProperty("asn.product.picPath");
		String realPath=WebContext.getRealPath(virtualPath)+"/"+picName;
		FileOutputStream fos=new FileOutputStream(realPath);
		FileInputStream fis=new FileInputStream(originalPic);
		byte[] buffer=new byte[1024];
		int len=0;
		while((len=fis.read(buffer))>0){
			fos.write(buffer, 0, len);
		}
		fis.close();
		fos.close();
		return virtualPath+"/"+picName;
	}
	
	public static String drawSmallImage(File originalPic) throws Exception{
		String picName=System.currentTimeMillis()+".jpg";
		String tempdir=System.getProperty("java.io.tmpdir");
		if ( !(tempdir.endsWith("/") || tempdir.endsWith("\\")) ){
			  tempdir = tempdir + System.getProperty("file.separator");
		}
		tempdir=tempdir+picName;
		FileOutputStream fos=new FileOutputStream(tempdir);
		FileInputStream fis=new FileInputStream(originalPic);
		byte[] buffer=new byte[1024];
		int len=0;
		while((len=fis.read(buffer))>0){
			fos.write(buffer, 0, len);
		}
		String sPicWidth=PropertyFactory.getDefaultProperty().getProperty("asn.product.smallPicWidth");
		String sPicHeight=PropertyFactory.getDefaultProperty().getProperty("asn.product.smallPicHeight");
		int swidth=Integer.valueOf(sPicWidth);
		int sheight=Integer.valueOf(sPicHeight);
		String virtualPath=PropertyFactory.getDefaultProperty().getProperty("asn.product.picPath");
		String realPath=WebContext.getRealPath(virtualPath)+"/"+picName;
		ImageSize.drawImage(tempdir, realPath, swidth, sheight, '*');
		fos.close();
		fis.close();

		return virtualPath+"/"+picName;
	}
	
	public static String drawBigImage(File originalPic) throws Exception{
		String picName=System.currentTimeMillis()+".jpg";
		String tempdir=System.getProperty("java.io.tmpdir");
		if ( !(tempdir.endsWith("/") || tempdir.endsWith("\\")) ){
			  tempdir = tempdir + System.getProperty("file.separator");
		}
		tempdir=tempdir+picName;
		FileOutputStream fos=new FileOutputStream(tempdir);
		FileInputStream fis=new FileInputStream(originalPic);
		byte[] buffer=new byte[1024];
		int len=0;
		while((len=fis.read(buffer))>0){
			fos.write(buffer, 0, len);
		}
		String bPicWidth=PropertyFactory.getDefaultProperty().getProperty("asn.product.bigPicWidth");
		String bPicHeight=PropertyFactory.getDefaultProperty().getProperty("asn.product.bigPicHeight");
		int bwidth=Integer.valueOf(bPicWidth);
		int bheight=Integer.valueOf(bPicHeight);
		String virtualPath=PropertyFactory.getDefaultProperty().getProperty("asn.product.picPath");
		String realPath=WebContext.getRealPath(virtualPath)+"/"+picName;
		ImageSize.drawImage(tempdir, realPath, bwidth, bheight, '*');
		fos.close();
		fis.close();

		return virtualPath+"/"+picName;
	}
	
	public static String[] drawImage(File originalPic) throws Exception{
		if(getFormatName(originalPic)==null){
			return drawDefaultImage();
		}
		String picName=System.currentTimeMillis()+".jpg";
		String tempdir=System.getProperty("java.io.tmpdir");
		if ( !(tempdir.endsWith("/") || tempdir.endsWith("\\")) ){
			  tempdir = tempdir + System.getProperty("file.separator");
		}
		tempdir=tempdir+picName;
		FileOutputStream fos=new FileOutputStream(tempdir);
		FileInputStream fis=new FileInputStream(originalPic);
		byte[] buffer=new byte[1024];
		int len=0;
		while((len=fis.read(buffer))>0){
			fos.write(buffer, 0, len);
		}
		String bPicWidth=PropertyFactory.getDefaultProperty().getProperty("asn.product.bigPicWidth");
		String bPicHeight=PropertyFactory.getDefaultProperty().getProperty("asn.product.bigPicHeight");
		int bwidth=Integer.valueOf(bPicWidth);
		int bheight=Integer.valueOf(bPicHeight);
		
		String sPicWidth=PropertyFactory.getDefaultProperty().getProperty("asn.product.smallPicWidth");
		String sPicHeight=PropertyFactory.getDefaultProperty().getProperty("asn.product.smallPicHeight");
		int swidth=Integer.valueOf(sPicWidth);
		int sheight=Integer.valueOf(sPicHeight);
		
		String virtualPath=PropertyFactory.getDefaultProperty().getProperty("asn.product.picPath");
		String realPath=WebContext.getRealPath(virtualPath);
		String brealPath=realPath+"/b"+picName;
		String srealPath=realPath+"/s"+picName;
		try{
		ImageSize.drawImage(tempdir, brealPath, bwidth, bheight, '*');
		ImageSize.drawImage(tempdir, srealPath, swidth, sheight, '*');
		}catch(Exception e){
			e.printStackTrace();
		}
		String[] strings=new String[2];
		strings[0]=virtualPath+"/b"+picName;
		strings[1]=virtualPath+"/s"+picName;
		fos.close();
		fis.close();

		return strings;
	}
	
	public static String[] drawDefaultImage()throws Exception{
		String sPicPath=PropertyFactory.getDefaultProperty().getProperty("asn.product.spicDefaultPath");
		String bPicPath=PropertyFactory.getDefaultProperty().getProperty("asn.product.bpicDefaultPath");
		String[] strings=new String[2];
		strings[0]=bPicPath;
		strings[1]=sPicPath;
		return strings;
	}
	
	public static void uploadImage(File picfile,String picName)throws Exception{
		String tempdir=PropertyFactory.getDefaultProperty().getProperty("asn.member.picPath");
		String realpath=WebContext.getRealPath(tempdir);
		realpath = realpath +"/"+ picName;	
		FileOutputStream fos=new FileOutputStream(realpath);
		FileInputStream fis=new FileInputStream(picfile);
		byte[] buffer=new byte[1024*1024];
		int len=0;
		while((len=fis.read(buffer))>0){
			fos.write(buffer, 0, len);
		}
		
		String bPicWidth=PropertyFactory.getDefaultProperty().getProperty("asn.product.bigPicWidth");
		String bPicHeight=PropertyFactory.getDefaultProperty().getProperty("asn.product.bigPicHeight");
		int bwidth=Integer.valueOf(bPicWidth);
		int bheight=Integer.valueOf(bPicHeight);
		
		String sPicWidth=PropertyFactory.getDefaultProperty().getProperty("asn.product.smallPicWidth");
		String sPicHeight=PropertyFactory.getDefaultProperty().getProperty("asn.product.smallPicHeight");
		int swidth=Integer.valueOf(sPicWidth);
		int sheight=Integer.valueOf(sPicHeight);
		String brealPath=WebContext.getRealPath(tempdir)+"/big_"+picName;
		String srealPath=WebContext.getRealPath(tempdir)+"/sml_"+picName;
		try{
		ImageSize.drawImage(realpath, brealPath, bwidth, bheight, '*');
		ImageSize.drawImage(realpath, srealPath, swidth, sheight, '*');
		}catch(Exception e){
			e.printStackTrace();
		}
		
		fos.close();
		fis.close();

	}
	
	//copy的  判断图片类型
    public static String getFormatInFile(File f) {
        return getFormatName(f);
    }
    
    // Returns the format name of the image in the object 'o'.
    // Returns null if the format is not known.
    private static String getFormatName(Object o) {
        try {
            // Create an image input stream on the image
            ImageInputStream iis = ImageIO.createImageInputStream(o);
    
            // Find all image readers that recognize the image format
            Iterator iter = ImageIO.getImageReaders(iis);
            if (!iter.hasNext()) {
                // No readers found
                return null;
            }
    
            // Use the first reader
            ImageReader reader = (ImageReader) iter.next();
    
            // Close stream
            iis.close();
    
            // Return the format name
            return reader.getFormatName();
        } catch (IOException e) {
            //
        }
        
        // The image could not be read
        return null;
    }
    //recruitment
	public static String drawOriginalPic(File originalPic,String path)throws Exception{
		if(getFormatName(originalPic)==null){
			return drawDefaultImage()[0];
		}
		String picName=System.currentTimeMillis()+".jpg";
		String virtualPath=PropertyFactory.getDefaultProperty().getProperty(path);
		String realPath=WebContext.getRealPath(virtualPath)+"/"+picName;
		FileOutputStream fos=new FileOutputStream(realPath);
		FileInputStream fis=new FileInputStream(originalPic);
		byte[] buffer=new byte[1024];
		int len=0;
		while((len=fis.read(buffer))>0){
			fos.write(buffer, 0, len);
		}
		fis.close();
		fos.close();
		return virtualPath+"/"+picName;
	}
}
