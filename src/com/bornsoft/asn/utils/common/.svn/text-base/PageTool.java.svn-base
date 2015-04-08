package com.bornsoft.asn.utils.common;

public class PageTool {
	private int currentPage;
	private int pageSize;
	private int totalRow ;
	private int totalPage ;
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
	
	public String getPageBar(){
        StringBuffer str = new StringBuffer("");
        int next, prev;
        prev=currentPage-1;
        next=currentPage+1;   
        
        if (currentPage > 1) {    
            str.append(
                "<a href=\"JavaScript:;\" onclick=\"document.getElementById(\'thePage\').value=1;document.getElementById(\'pageButton\').click();return false;\">首    页</a>&nbsp;");
        } else {
            str.append("<a href=\"JavaScript:;\">首   页</a>&nbsp;");
        }
        
        if (currentPage > 1) {
            str.append(
                "<a href=\"JavaScript:;\" onclick=\"document.getElementById(\'thePage\').value=" +prev + ";document.getElementById(\'pageButton\').click();return false;\">上一页</a>&nbsp;");
        } else {
            str.append("<a href=\"JavaScript:;\">上一页</a>&nbsp;");
        }
        
        if (currentPage < totalPage) {
            str.append(
                "<a href=\"JavaScript:;\" onclick=\"document.getElementById(\'thePage\').value=" +next + ";document.getElementById(\'pageButton\').click();return false;\">下一页</a>&nbsp;");
        } else {
            str.append("<a href=\"JavaScript:;\" >下一页</a>&nbsp;");
        }
        
        if (totalPage > 1 && currentPage != totalPage) {
            str.append(
                "<a href=\"JavaScript:;\"  onclick=\"document.getElementById(\'thePage\').value=" +totalPage + ";document.getElementById(\'pageButton\').click();return false;\">末   页</a>&nbsp;&nbsp;");
        } else {
            str.append("<a href=\"JavaScript:;\" >末  页</a>&nbsp;&nbsp;");
        }
        str.append(" 共" + totalRow + "条记录");
        str.append("  每页<select size=1 name=pagesize onchange='this.form.page.value=1;this.form.pageSize.value=this.value;this.form.submit();'>");
        
        if (pageSize == 5) {
            str.append("<option value=5 selected>5</option>");
        } else {
            str.append("<option value=5>5</option>");
        }
        if (pageSize == 10) {
            str.append("<option value=10 selected>10</option>");
        } else {
            str.append("<option value=10>10</option>");
        }
        if (pageSize == 20) {
            str.append("<option value=20 selected>20</option>");
        } else {
            str.append("<option value=20>20</option>");
        }
        if (pageSize == 50) {
            str.append("<option value=50 selected>50</option>");
        } else {
            str.append("<option value=50>50</option>");
        }
        if (pageSize == 100) {
            str.append("<option value=100 selected>100</option>");
        } else {
            str.append("<option value=100>100</option>");
        }
        str.append("</select>");
        str.append("条 分" + totalPage + "页显示 转到");
        str.append("<select onchange='this.form.page.value=this.value;this.form.submit();'>");
        for (int i = 1; i < totalPage + 1; i++) {
            if (i == currentPage) {
                str.append("<option value=" + i + " selected>" + i +
                           "</option>");
            } else {
                str.append("<option value=" + i + ">" + i + "</option>");
            }
        }
        str.append("</select>页");
        
        str.append("<input type=\"hidden\"  value=" + currentPage + " name=\"page\" id=\"thePage\" > ");
        str.append("<input type=\"hidden\"  value=" + pageSize +
                   " name=\"pageSize\" id=\"thePageSize\"> ");
        str.append("<input type=\"button\" id=\"pageButton\" onclick=\"this.form.submit()\" style=\"display: none;\"></input>");
        
        StringBuffer sbstr = new StringBuffer("");
        sbstr.append("<tr align='right'><td width='98%' align='right'>");
        sbstr.append(str.toString());
        sbstr.append("</td></tr>");
        
        //return str.toString();
       return sbstr.toString();
	}
}
