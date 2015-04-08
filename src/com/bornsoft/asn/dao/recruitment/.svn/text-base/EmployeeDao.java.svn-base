package com.bornsoft.asn.dao.recruitment;

import java.util.HashMap;
import java.util.List;

import com.bornsoft.asn.bean.recruitment.Employee;
import com.bornsoft.asn.utils.common.sqlMapFactory;

public class EmployeeDao {

	public static void insertEmployee(Employee e)throws Exception{
		sqlMapFactory.getSqlMap().insert("insertEmployee",e);
	}

	public static List<Employee> getEmployeeList(HashMap m) throws Exception {
		return sqlMapFactory.getSqlMap().queryForList("getEmployeeList", m);
	}
	
	public static Integer getEmployeeListCount(HashMap m) throws Exception {
		return (Integer) sqlMapFactory.getSqlMap().queryForObject("getEmployeeListCount", m);
	}
	
	public static void deleteEmployeeById(String id) throws Exception{
		sqlMapFactory.getSqlMap().delete("deleteEmployeeById", id);
	}

	public static Employee getEmployeeById(String eid) throws Exception{
		return (Employee) sqlMapFactory.getSqlMap().queryForObject("getEmployeeById",eid);
	}
	
	public static void setEmployeeUse(HashMap m)throws Exception{
		sqlMapFactory.getSqlMap().update("setEmployeeUse", m);
	}
}
