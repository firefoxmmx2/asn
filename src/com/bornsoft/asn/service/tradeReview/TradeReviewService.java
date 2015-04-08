package com.bornsoft.asn.service.tradeReview;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.order.Order;
import com.bornsoft.asn.bean.tradeReview.TradeReview;
import com.bornsoft.asn.dao.tradeReview.TradeReviewDAO;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.service.order.OrderService;
import com.bornsoft.asn.utils.common.AsnConstLib;
import com.bornsoft.asn.utils.common.sqlMapFactory;
import java.util.ArrayList;

/**
 * 评价服务
 * @author hooxin
 *
 */
public class TradeReviewService {

    /**
     * 得到一个买家对一个订单的评价
     * @param buyerId
     * @param orderId
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public static List<TradeReview> getTradeReview(long buyerId, long orderId) throws Exception {
        Map m = new HashMap();
        if (buyerId != 0) {
            m.put("buyerId", buyerId);
        }
        if (orderId != 0) {
            m.put("orderId", orderId);
        }
        List<TradeReview> trlist = null;
        try {
            trlist = (List<TradeReview>) TradeReviewDAO.get(m);
            for (TradeReview tr : trlist) {
                tr.setSupplierName(MemberService.getMember(tr.getSupplierId()).getFullName());
            }
            return trlist;
        } catch (Exception e) {
            // TODO: handle exception
            Logger log = Logger.getLogger(TradeReviewService.class);
            log.error("得到一个评价 错误! SERVICE", e);
            throw e;
        }
    }

    /**
     * 得到一个供应商的所有评价
     * @param supplierId
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public static List<TradeReview> getTradeReview(long supplierId) throws Exception {
        Map m = new HashMap();
        m.put("supplierId", supplierId);
        List<TradeReview> trlist = null;
        try {
            trlist = (List<TradeReview>) TradeReviewDAO.get(m);
            for (TradeReview tr : trlist) {
                tr.setSupplierName(MemberService.getMember(tr.getSupplierId()).getFullName());
            }
            return trlist;
        } catch (Exception e) {
            // TODO: handle exception
            Logger log = Logger.getLogger(TradeReviewService.class);
            log.error("得到一个供应商的所有评价 错误! SERVICE", e);
            throw e;
        }
    }

    /**
     * 添加一个评价
     * @param tr 评价
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public static void addTradeReview(TradeReview tr) throws Exception {
        Map m = new HashMap();

        m.put("buyerId", tr.getBuyerId());
        m.put("orderId", tr.getOrderId());
        try {
            sqlMapFactory.getSqlMap().startTransaction();
            List l = TradeReviewDAO.get(m);
            if ((l == null || l.isEmpty()) && (tr.getBuyerId() != tr.getSupplierId())) {
                TradeReviewDAO.insert(tr);
            }
            sqlMapFactory.getSqlMap().commitTransaction();
        } catch (Exception e) {
            // TODO: handle exception
            Logger log = Logger.getLogger(TradeReviewService.class);
            log.error("添加一个评价 错误! SERVICE", e);
            throw e;
        } finally {
            sqlMapFactory.getSqlMap().endTransaction();
        }
    }

    /**
     * 删除一个评价
     * @param trId 评价ID
     * @throws Exception
     */
    public static void delTradeReview(long trId) throws Exception {
        try {
            sqlMapFactory.getSqlMap().startTransaction();
            TradeReviewDAO.delete(trId);
            sqlMapFactory.getSqlMap().commitTransaction();
        } catch (Exception e) {
            // TODO: handle exception
            Logger log = Logger.getLogger(TradeReviewService.class);
            log.error("删除一个评价 错误! SERVICE", e);
            throw e;
        } finally {
            sqlMapFactory.getSqlMap().endTransaction();
        }
    }

    /**
     * 修改一个评价
     * @param tr 评价
     * @throws Exception
     */
    public static void updateTradeReview(TradeReview tr) throws Exception {
        try {
            sqlMapFactory.getSqlMap().startTransaction();
            TradeReviewDAO.update(tr);
            sqlMapFactory.getSqlMap().commitTransaction();
        } catch (Exception e) {
            // TODO: handle exception
            Logger log = Logger.getLogger(TradeReviewService.class);
            log.error("删除一个评价 错误! SERVICE", e);
            throw e;
        } finally {
            sqlMapFactory.getSqlMap().endTransaction();
        }
    }

    /**
     * 得到需要评价的订单列表
     * @param buyerId 买家ID
     * @return
     * @throws Exception
     */
    public static List<Order> getNeedTROrderList(long buyerId) throws Exception {
        List<Order> orList = OrderService.findFrontOrderList(buyerId, AsnConstLib.ORDER_STATUS_SUCCESS, 1, 10);
        List<TradeReview> trList = TradeReviewService.getTradeReview(buyerId, 0);
        List<Order> newOrList = new ArrayList<Order>();
        if (orList == null) {
            return null;
        }

        for (int i = 0; orList.size() > 0 && i < orList.size(); i++) {
            if (orList.get(i).getSupplierId() != MemberService.getMember().getMemberId()) {
                 //不包含自己作为供应商的订单,也就是说不能自己评价自己
                if (trList == null || trList.isEmpty()) {
                    newOrList.add(orList.get(i));
                } else {
                    for (int j = 0; j < trList.size(); j++) {
                        //已经评价过的不能在评价
                        if (trList.get(j).getOrderId() != orList.get(i).getId()) {
                            newOrList.add(orList.get(i));
                        }
                    }
                }

            }

        }

        return newOrList;
    }
}
