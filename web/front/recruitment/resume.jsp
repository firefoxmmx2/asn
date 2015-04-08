<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path=request.getContextPath();
%>
<html>
<head>
<title>r</title>

</head>

<body>
	<s:form action="createResume" namespace="/front/recr">
			<input type="hidden" name="employee.jobId" value="${jobId}"></input>
			<table>
			<thead>基本信息</thead>
			<tr>
				<td>姓名</td>
				<td>
					<input type="text" name="employee.name" />
				</td>
			</tr>
			<tr>
				<td>性别</td>
				<td>
					<input type="radio" name="employee.sex" value="1" checked="checked"/>男
					<input type="radio" name="employee.sex" value="0"/>女
				</td>
			</tr>
			<tr>
				<td>出生日期</td>
				<td>
				<select name="yearOfBirthday" id="YearOfBirthday">
                <option value="2000">2000</option><option value="1999">1999</option><option value="1998">1998</option><option value="1997">1997</option><option value="1996">1996</option><option value="1995">1995</option><option value="1994">1994</option><option value="1993">1993</option><option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option><option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option><option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option><option value="1983">1983</option><option value="1982">1982</option><option value="1981">1981</option><option value="1980">1980</option><option value="1979">1979</option><option value="1978">1978</option><option value="1977">1977</option><option value="1976">1976</option><option value="1975">1975</option><option value="1974">1974</option><option value="1973">1973</option><option value="1972">1972</option><option value="1971">1971</option><option value="1970">1970</option><option value="1969">1969</option><option value="1968">1968</option><option value="1967">1967</option><option value="1966">1966</option><option value="1965">1965</option><option value="1964">1964</option><option value="1963">1963</option><option value="1962">1962</option><option value="1961">1961</option><option value="1960">1960</option><option value="1959">1959</option><option value="1958">1958</option><option value="1957">1957</option><option value="1956">1956</option><option value="1955">1955</option><option value="1954">1954</option><option value="1953">1953</option><option value="1952">1952</option><option value="1951">1951</option><option value="1950">1950</option><option value="1949">1949</option><option value="1948">1948</option><option value="1947">1947</option><option value="1946">1946</option><option value="1945">1945</option><option value="1944">1944</option><option value="1943">1943</option><option value="1942">1942</option><option value="1941">1941</option><option value="1940">1940</option></select>
                              年
                <select name="monthOfBirthday" id="MonthOfBirthday">
                <option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>
                              月
                <select name="dayOfBirthday" id="DayOfBirthday">
                <option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option></select>
                            日 
				</td>
			</tr>
			<tr>
				<td>工作年限</td>
				<td>
				<select name="employee.workYear">
					<option>选择</option>
                	<option value="1">在读学生，应届毕业生</option>
                	<option value="2">1年以上</option>
                	<option value="3">2年以上</option>
                	<option value="4">3年以上</option>
                	<option value="5">4年以上</option>
                	<option value="6">5年以上</option>
                	<option value="7">10年以上</option>
                </select>
				</td>
			</tr>
			<tr>
				<td>证件类型</td>
				<td>
				<select name="employee.certType">
					<option>选择</option>
                	<option value="1">身份证</option>
                	<option value="2">护照</option>
                	<option value="3">军人证</option>
                	<option value="4">香港身份证</option>
                	<option value="0">其它</option>
                </select>
				</td>
			</tr>
			<tr>
				<td>证件号码</td>
				<td>
					<input type="text" name="employee.certNo" />
				</td>
			</tr>
			<tr>
				<td>居住地</td>
				<td>
					<input type="text" name="employee.address" />
				</td>
			</tr>
			<tr>
				<td>联系电话</td>
				<td>
					<input type="text" name="employee.phoneNo" />
				</td>
			</tr>
			<tr>
				<td>联系邮箱</td>
				<td>
					<input type="text" name="employee.mailBox" />
				</td>
			</tr>
			<tr>
				<td>目前年薪</td>
				<td>
					<input type="text" name="employee.curYearlySalary" size="7"/>元
				</td>
			</tr>
		</table>
		<br />
		<table>
			<thead>教育经历--最高学历</thead>
			<tr>
				<td>时间</td>
				<td>
				<select name="fromYear" class="weightyear" id="FromYear">
                    <option value="0">年</option>
                    <option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option><option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option><option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option><option value="2001">2001</option><option value="2000">2000</option><option value="1999">1999</option><option value="1998">1998</option><option value="1997">1997</option><option value="1996">1996</option><option value="1995">1995</option><option value="1994">1994</option><option value="1993">1993</option><option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option><option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option><option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option><option value="1983">1983</option><option value="1982">1982</option><option value="1981">1981</option><option value="1980">1980</option><option value="1979">1979</option><option value="1978">1978</option><option value="1977">1977</option><option value="1976">1976</option><option value="1975">1975</option><option value="1974">1974</option><option value="1973">1973</option><option value="1972">1972</option><option value="1971">1971</option><option value="1970">1970</option><option value="1969">1969</option><option value="1968">1968</option><option value="1967">1967</option><option value="1966">1966</option><option value="1965">1965</option><option value="1964">1964</option><option value="1963">1963</option><option value="1962">1962</option><option value="1961">1961</option><option value="1960">1960</option><option value="1959">1959</option><option value="1958">1958</option><option value="1957">1957</option><option value="1956">1956</option><option value="1955">1955</option><option value="1954">1954</option><option value="1953">1953</option><option value="1952">1952</option><option value="1951">1951</option><option value="1950">1950</option><option value="1949">1949</option><option value="1948">1948</option><option value="1947">1947</option><option value="1946">1946</option><option value="1945">1945</option><option value="1944">1944</option><option value="1943">1943</option><option value="1942">1942</option><option value="1941">1941</option><option value="1940">1940</option>                </select>
                <select name="fromMonth" class="weightmonth" id="FromMonth">
                    <option value="0">月</option>
                    <option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>                </select>
                到                <select name="toYear" class="weightyear" id="ToYear">
                    <option value="0">年</option>
                    <option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option><option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option><option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option><option value="2001">2001</option><option value="2000">2000</option><option value="1999">1999</option><option value="1998">1998</option><option value="1997">1997</option><option value="1996">1996</option><option value="1995">1995</option><option value="1994">1994</option><option value="1993">1993</option><option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option><option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option><option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option><option value="1983">1983</option><option value="1982">1982</option><option value="1981">1981</option><option value="1980">1980</option><option value="1979">1979</option><option value="1978">1978</option><option value="1977">1977</option><option value="1976">1976</option><option value="1975">1975</option><option value="1974">1974</option><option value="1973">1973</option><option value="1972">1972</option><option value="1971">1971</option><option value="1970">1970</option><option value="1969">1969</option><option value="1968">1968</option><option value="1967">1967</option><option value="1966">1966</option><option value="1965">1965</option><option value="1964">1964</option><option value="1963">1963</option><option value="1962">1962</option><option value="1961">1961</option><option value="1960">1960</option><option value="1959">1959</option><option value="1958">1958</option><option value="1957">1957</option><option value="1956">1956</option><option value="1955">1955</option><option value="1954">1954</option><option value="1953">1953</option><option value="1952">1952</option><option value="1951">1951</option><option value="1950">1950</option><option value="1949">1949</option><option value="1948">1948</option><option value="1947">1947</option><option value="1946">1946</option><option value="1945">1945</option><option value="1944">1944</option><option value="1943">1943</option><option value="1942">1942</option><option value="1941">1941</option><option value="1940">1940</option>                </select>
                <select name="toMonth" class="weightmonth" id="ToMonth">
                    <option value="0">月</option>
                    <option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>                </select>
                (后两项不填表示至今)<span style="margin-left:160px;"></span>	
				</td>
			</tr>
			<tr>
				<td>学校</td>
				<td>
					<input type="text" name="edu.schoolName"/>
				</td>
			</tr>
			<tr>
				<td>专业</td>
				<td>
					<input type="text" name="edu.discripline"/>
				</td>
			</tr>
			<tr>
				<td>学历</td>
				<td>
					<select name="edu.educationalBackground">
                		<option>选择</option>
                		<option value="cz">初中</option>
                		<option value="gz">高中/中专</option>
                		<option value="dz">大专</option>
                		<option value="bk">本科</option>
                		<option value="ss">硕士</option>
                		<option value="bs">博士</option>
                	</select>
				</td>
			</tr>
			<tr>
				<td>专业描述</td>
				<td>
					<textarea rows="5" cols="30" name="edu.discriplineDescription"></textarea>
				</td>
			</tr>
			<tr>
				<td>海外学习经历</td>
				<td>
					<input type="radio" name="edu.studyAbroad" value="true"/>有
					<input type="radio" name="edu.studyAbroad" value="false"/>无
				</td>
			</tr>
		</table>
		<br />
		<table>
			<thead>工作经历--最近一份工作</thead>
			<tr>
				<td>时间</td>
				<td>
				<select name="fromYear1" class="weightyear" id="fromYear1">
                    <option value="0">年</option>
                    <option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option><option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option><option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option><option value="2001">2001</option><option value="2000">2000</option><option value="1999">1999</option><option value="1998">1998</option><option value="1997">1997</option><option value="1996">1996</option><option value="1995">1995</option><option value="1994">1994</option><option value="1993">1993</option><option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option><option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option><option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option><option value="1983">1983</option><option value="1982">1982</option><option value="1981">1981</option><option value="1980">1980</option><option value="1979">1979</option><option value="1978">1978</option><option value="1977">1977</option><option value="1976">1976</option><option value="1975">1975</option><option value="1974">1974</option><option value="1973">1973</option><option value="1972">1972</option><option value="1971">1971</option><option value="1970">1970</option><option value="1969">1969</option><option value="1968">1968</option><option value="1967">1967</option><option value="1966">1966</option><option value="1965">1965</option><option value="1964">1964</option><option value="1963">1963</option><option value="1962">1962</option><option value="1961">1961</option><option value="1960">1960</option><option value="1959">1959</option><option value="1958">1958</option><option value="1957">1957</option><option value="1956">1956</option><option value="1955">1955</option><option value="1954">1954</option><option value="1953">1953</option><option value="1952">1952</option><option value="1951">1951</option><option value="1950">1950</option><option value="1949">1949</option><option value="1948">1948</option><option value="1947">1947</option><option value="1946">1946</option><option value="1945">1945</option><option value="1944">1944</option><option value="1943">1943</option><option value="1942">1942</option><option value="1941">1941</option><option value="1940">1940</option></select>
                <select name="fromMonth1" class="weightmonth" id="fromMonth1">
                    <option value="0">月</option>
                    <option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>
                到                <select name="toYear1" class="weightyear" id="toYear1">
                    <option value="0">年</option>
                    <option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option><option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option><option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option><option value="2001">2001</option><option value="2000">2000</option><option value="1999">1999</option><option value="1998">1998</option><option value="1997">1997</option><option value="1996">1996</option><option value="1995">1995</option><option value="1994">1994</option><option value="1993">1993</option><option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option><option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option><option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option><option value="1983">1983</option><option value="1982">1982</option><option value="1981">1981</option><option value="1980">1980</option><option value="1979">1979</option><option value="1978">1978</option><option value="1977">1977</option><option value="1976">1976</option><option value="1975">1975</option><option value="1974">1974</option><option value="1973">1973</option><option value="1972">1972</option><option value="1971">1971</option><option value="1970">1970</option><option value="1969">1969</option><option value="1968">1968</option><option value="1967">1967</option><option value="1966">1966</option><option value="1965">1965</option><option value="1964">1964</option><option value="1963">1963</option><option value="1962">1962</option><option value="1961">1961</option><option value="1960">1960</option><option value="1959">1959</option><option value="1958">1958</option><option value="1957">1957</option><option value="1956">1956</option><option value="1955">1955</option><option value="1954">1954</option><option value="1953">1953</option><option value="1952">1952</option><option value="1951">1951</option><option value="1950">1950</option><option value="1949">1949</option><option value="1948">1948</option><option value="1947">1947</option><option value="1946">1946</option><option value="1945">1945</option><option value="1944">1944</option><option value="1943">1943</option><option value="1942">1942</option><option value="1941">1941</option><option value="1940">1940</option></select>
                <select name="toMonth1" class="weightmonth" id="toMonth1">
                    <option value="0">月</option>
                    <option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>
                (后两项不填表示至今)<span style="margin-left:160px;"></span>
				</td>
			</tr>
			<tr>
				<td>公司</td>
				<td>
					<input type="text" name="experience.company"/>
				</td>
			</tr>
			<tr>
				<td>公司性质</td>
				<td>
				<select name="experience.businessNature">
					<option>选择</option>
                	<option value="1">外资</option>
                	<option value="2">合资</option>
                	<option value="3">国企</option>
                	<option value="4">民营公司</option>
                	<option value="5">外企代表处</option>
                	<option value="6">政府机关</option>
                	<option value="7">事业单位</option>
                	<option value="8">非盈利机关</option>
                	<option value="0">其它性质</option>
                </select>
				</td>
			</tr>
			<tr>
				<td>公司规模</td>
				<td>
				<select name="experience.companySize">
					<option>选择</option>
                	<option value="1">少于50人</option>
                	<option value="2">51-150人</option>
                	<option value="3">151-500</option>
                	<option value="4">500以上</option>
                </select>
				</td>
			</tr>
			<tr>
				<td>行 业</td>
				<td>
					<input type="text" name="experience.trade" />
				</td>
			</tr>
			<tr>
				<td>部门</td>
				<td>
					<input type="text" name="experience.department" />
				</td>
			</tr>
			<tr>
				<td>职位</td>
				<td>
					<input type="text" name="experience.position" />
				</td>
			</tr>
			<tr>
				<td>工作地点</td>
				<td>
					<input type="text" name="experience.workPlace" />
				</td>
			</tr>
			<tr>
				<td>工作性质</td>
				<td>
				<input type="radio" name="experience.jobNature" value="0" checked="checked">全职</input>
                <input type="radio" name="experience.jobNature" value="1">兼职</input>
                <input type="radio" name="experience.jobNature" value="2">实习</input>
                <input type="radio" name="experience.jobNature" value="3">全/兼职</input>
				</td>
			</tr>
			<tr>
				<td>工作职责与业绩</td>
				<td>
				<textarea rows="5" cols="30" name="experience.jobDuty"></textarea>
				</td>
			</tr>
			<tr>
				<td>海外工作经历</td>
				<td>
				<input type="radio" name="experience.studyAbroad" value="true"/>有
				<input type="radio" name="experience.studyAbroad" value="false"/>无
				</td>
			</tr>
		</table>
		<br />
		<table>
			<thead>求职意向</thead>
			<tr>
				<td>期望月薪</td>
				<td>
				<select name="purpose.expectedSalary">
					<option>选择</option>
                	<option value="1">1500以下</option>
                	<option value="2">1500-1999</option>
                	<option value="3">2000-2999</option>
                	<option value="4">3000-3999</option>
                	<option value="5">4000-4999</option>
                	<option value="6">5000-5999</option>
                	<option value="7">6000-6999</option>
                	<option value="8">7000-7999</option>
                	<option value="9">8000-8999</option>
                	<option value="10">9000-9999</option>
                	<option value="11">1万以上</option>
                </select>
				</td>
			</tr>
			<tr>
				<td>到岗时间</td>
				<td>
				<select name="purpose.dutyTime">
					<option>选择</option>
                	<option value="1">即时</option>
                	<option value="2">1周内</option>
                	<option value="3">1个月内</option>
                	<option value="4">1至3个月内</option>
                	<option value="5">3个月后</option>
                	<option value="0">待定</option>
                </select>
				</td>
			</tr>
			<tr>
				<td>自我评价</td>
				<td>
				<textarea rows="5" cols="30" name="purpose.selfEvaluation"></textarea>
				</td>
			</tr>
		</table>
		<div><input type="submit" value="确定"></input></div>
	</s:form>
</body>
</html>