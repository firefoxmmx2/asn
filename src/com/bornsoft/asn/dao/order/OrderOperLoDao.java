package com.bornsoft.asn.dao.order;

import java.sql.SQLException;
import java.util.List;
import com.bornsoft.asn.bean.order.OrderOperateLog;
import com.bornsoft.asn.utils.common.sqlMapFactory;
import com.ibatis.sqlmap.client.SqlMapClient;

public class OrderOperLoDao {
         static SqlMapClient smc=sqlMapFactory.getSqlMap();
         
         /**
          * 保存订单操作记录
          * @return
          */
         public static OrderOperateLog saveLog(OrderOperateLog log){
     		try {
    			return (OrderOperateLog) smc.insert("saveOrderOperateLog", log);
    		} catch (SQLException e) {
    			e.printStackTrace();
    			return null;
    		}
         }
         
         /**
          * 查询信息
          * @return
          */
         public  static List<OrderOperateLog> findInfos(){
        	return null; 
         }
}
