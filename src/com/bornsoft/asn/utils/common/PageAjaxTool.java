package com.bornsoft.asn.utils.common;

public class PageAjaxTool {
	private int currentPage=1;
	private int pageSize=10;
	private int totalRow;
	private int totalPage;
    private int cursor = 5;
    private int lineCursor = 10;
    private String ajaxMethod;
    private String styleId="huzxPageDiv";
    
	public PageAjaxTool() {
		super();
	}
	
	public PageAjaxTool(int currentPage, int pageSize, int totalRow,
			int totalPage, int cursor, int lineCursor, String styleId) {
		super();
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.totalRow = totalRow;
		this.totalPage = totalPage;
		this.cursor = cursor;
		this.lineCursor = lineCursor;
		this.styleId = styleId;
	}

	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalRow() {
		return totalRow;
	}
	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
		totalPage = totalRow/pageSize;
		if(totalRow%pageSize > 0){
			 totalPage = totalPage + 1;
		}  
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCursor() {
		return cursor;
	}
	public void setCursor(int cursor) {
		this.cursor = cursor;
	}
	public int getLineCursor() {
		return lineCursor;
	}
	public void setLineCursor(int lineCursor) {
		this.lineCursor = lineCursor;
	} 
	 public String getStyleId() {
		return styleId;
	}
	public void setStyleId(String styleId) {
		this.styleId = styleId;
	}
	public String getAjaxMethod() {
		return ajaxMethod;
	}
	public void setAjaxMethod(String ajaxMethod) {
		this.ajaxMethod = ajaxMethod;
	}

	public String getPageBar(){
		if(totalPage<1){
			return " <div id=\""+styleId+"\">共&nbsp;"+ totalPage +"&nbsp;页 </div> ";
		}else if(totalPage==1){
			return "<div id=\""+styleId+"\">"+getLeftBar()+getCenterBar()+getRightBar()+" 共&nbsp;"+ totalPage +"&nbsp;页 "+getHidden()+"</div>";
		}else{
			return "<div id=\""+styleId+"\">"+getLeftBar()+getCenterBar()+getRightBar()+" 共&nbsp;"+ totalPage +"&nbsp;页 "+getBox()+getHidden()+"</div>";
		} 	
	}
		
	 private String getLeftBar(){
		 StringBuffer leftString;
	     if (currentPage == 1) {
	    	 leftString = new StringBuffer("");
		 }else{
                     //修改<< 为 "上一页" by hooxin 
	    	 leftString = new StringBuffer( "<a href=\"JavaScript:;\" onclick=\'JavaScript:document.getElementById(\"thePage\").value="+(getCurrentPage() - 1)+";"+ajaxMethod+";\'>上一页</a>");
	     }
	     return leftString.toString();
	 }
	 
	 private String getRightBar(){
		 StringBuffer rightString;
	     if (currentPage == totalPage) {
	    	 rightString = new StringBuffer("");
	     } else {
	    	 rightString = new StringBuffer( "<a href=\"JavaScript:;\" onclick=\'JavaScript:document.getElementById(\"thePage\").value="+(getCurrentPage() + 1)+";"+ajaxMethod+";\'>下一页</a>");
	     }
	     return rightString.toString();
	 }
	 
	 private String getCenterBar(){
		 StringBuffer centerString = new StringBuffer("");
		 if (totalPage <= lineCursor){
			  for(int i=1;i<=this.totalPage;i++){
				  if (i == this.currentPage) {
					  centerString.append("<span>"+i+"</span>");
				  }else{
					  centerString.append("<a href=\"JavaScript:;\" onclick=\'JavaScript:document.getElementById(\"thePage\").value="+i+";"+ajaxMethod+";\'>"+i+"</a>");
				  }
			  }
		 }else{
			 if(currentPage>cursor&&((currentPage-cursor+lineCursor)<=totalPage)){
				 for(int i=(currentPage-cursor+1);i<=(currentPage-cursor+lineCursor);i++){
					 if (i == this.currentPage) {
						 centerString.append("<span>"+i+"</span>");
					  }else{
						 centerString.append("<a href=\"JavaScript:;\" onclick=\'JavaScript:document.getElementById(\"thePage\").value="+i+";"+ajaxMethod+";\'>"+i+"</a>");
					  }
				 }
			 }else if(currentPage>cursor&&((currentPage-cursor+lineCursor)>totalPage)){
				 for(int i=(totalPage-lineCursor+1);i<=totalPage;i++){
					 if (i == this.currentPage) {
						 centerString.append("<span>"+i+"</span>");
					  }else{
						 centerString.append("<a href=\"JavaScript:;\" onclick=\'JavaScript:document.getElementById(\"thePage\").value="+i+";"+ajaxMethod+";\'>"+i+"</a>");
					  }
				 }
			 }else{
					for(int i=1;i<=lineCursor;i++){
						if (i == this.currentPage) {
							centerString.append("<span>"+i+"</span>");
						}else{
							centerString.append("<a href=\"JavaScript:;\" onclick=\'JavaScript:document.getElementById(\"thePage\").value="+i+";"+ajaxMethod+";\'>"+i+"</a>");
						}
					} 
				 }
		 }
		 return centerString.toString();
	 }
		 
	 private String getBox(){
		 return "第&nbsp;<input type='text' name='pageBox' id='pageBox' style='width:30px;'>&nbsp;页<input type='button' value='确定' onclick='JavaScript:document.getElementById(\"thePage\").value=document.getElementById(\"pageBox\").value;"+ajaxMethod+"'>  ";
	 }
	 
	 private String getHidden(){
		 return "<input type=\"hidden\" name=\"page\"  value=\" "+currentPage+"\" id=\"thePage\"/><input type=\"button\" id=\"pageButton\" style=\"display: none;\" onclick=\"JavaScript:this.form.submit()\"/><input type=\"hidden\" id=\"totalPage\" value="+totalPage+" />";
	 }
	 
	 /**
	  * 得到起始记录数
	 * @return
	 */
	public int getStartCount(){
		 return (this.currentPage-1)*this.pageSize + 1; 
	 }
	
	/**
	 * 得到结束记录数
	 * @return
	 */
	public int getEndCount(){
		return this.currentPage * this.pageSize;
	}
	
	/**
	 * 得到指定页面的起始记录数
	 * @param page 页数
	 * @return
	 */
	public int getStartCount(int page){
		return (page - 1) * this.pageSize + 1;
	}
	
	/**
	 * 得到指定页数的结束记录数
	 * @param page 页数
	 * @return
	 */
	public int getEndCount(int page){
		return page * this.pageSize;
	}
}