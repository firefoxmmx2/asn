package com.bornsoft.asn.action.tradeReview;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.bean.order.Order;
import com.bornsoft.asn.bean.tradeReview.TradeReview;
import com.bornsoft.asn.exception.ActionException;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.service.tradeReview.TradeReviewService;
import com.bornsoft.asn.utils.common.PropertyFactory;
import com.bornsoft.asn.utils.common.WebContext;
import java.io.PrintWriter;
import java.util.Properties;
import javax.servlet.http.HttpServletResponse;

/**
 * @author hooxin
 *
 */
public class TradeReviewAction {

    private TradeReview tr;
    //0 正常允许评论 1 已评论 2 自我评论
    private int reviewed;
    private Member supplier;
    private Member user;
    //评价列表
    private List<TradeReview> trList;
    //订单列表
    private List<Order> orList;
    private String jsCommand;
    //基本action路径
    private String actionPath;
    //订单链接
    private String orderPath;
    //表单路径
    private String formPath;
    //路径配置文件
    private static Properties pathFactory = PropertyFactory.getDefaultProperty();

    public TradeReviewAction() {
        actionPath = pathFactory.getProperty("asn.tradeReview.action.path");
    }

    public String getActionPath() {
        return actionPath;
    }

    public void setActionPath(String actionPath) {
        this.actionPath = actionPath;
    }

    public String getFormPath() {
        return formPath;
    }

    public void setFormPath(String formPath) {
        this.formPath = formPath;
    }

    public String getOrderPath() {
        return orderPath;
    }

    public void setOrderPath(String orderPath) {
        this.orderPath = orderPath;
    }

    public String getJsCommand() {
        return jsCommand;
    }

    public void setJsCommand(String jsCommand) {
        this.jsCommand = jsCommand;
    }

    public List<Order> getOrList() {
        return orList;
    }

    public void setOrList(List<Order> orList) {
        this.orList = orList;
    }

    public List<TradeReview> getTrList() {
        return trList;
    }

    public void setTrList(List<TradeReview> trList) {
        this.trList = trList;
    }

    public void setTr(TradeReview tr) {
        this.tr = tr;
    }

    public TradeReview getTr() {
        return tr;
    }

    /**
     * 显示一个评价,以及剩余需要评价的记录
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public String toView() throws Exception {
        HttpServletRequest req = WebContext.getRequest();
        long orderId = 0;
        long supplierId = 0;
        if (req.getParameter("orderId") != null && req.getParameter("orderId").trim().length() > 0) {
            orderId = Long.parseLong(req.getParameter("orderId"));
        }
        if (req.getParameter("supplierId") != null && req.getParameter("supplierId").trim().length() > 0) {
            supplierId = Long.parseLong(req.getParameter("supplierId"));
        }

        user = MemberService.getMember();

        List l = TradeReviewService.getTradeReview(user.getMemberId(), orderId);
        if (user.getMemberId() == supplierId) {
            setReviewed(2);
            return "success";
        } else if (l != null && l.size() > 0) {
            setReviewed(1);
            return "success";
        } else {
            setReviewed(0);
        }
        supplier = MemberService.getMember(supplierId);

        tr = new TradeReview();
        tr.setBuyerId(user.getMemberId().longValue());
        tr.setBuyerIp(req.getRemoteAddr());
        tr.setBuyerName(user.getFullName());
        tr.setCommunication(2);
        tr.setDelivery(2);
        tr.setProduct(2);
        tr.setOrderId(orderId);
        tr.setSupplierId(supplierId);
        //得到需要评价的订单列表
        orList = TradeReviewService.getNeedTROrderList(user.getMemberId());
        orderPath = WebContext.getRequest().getContextPath() +
                pathFactory.getProperty("asn.order.findOrderById.action.path");
        return "success";
    }

    /**
     * 显示该供应商的评价列表
     * @return
     * @throws Exception
     */
    public String toViewlist() throws Exception {
        if (tr.getSupplierId() == 0) {
            throw new ActionException("被评价的供应商编号不能为空");
        }

        trList = (List<TradeReview>) TradeReviewService.getTradeReview(tr.getSupplierId());
        orderPath = WebContext.getRequest().getContextPath() +
                pathFactory.getProperty("asn.order.findOrderById.action.path");
        return "toViewlist";
    }

    /***
     * 后台方式执行 新增评价操作
     */
    public String doNew() throws Exception {
        tr.setReviewId(IdMakerService.newId("TradeReview"));
        SimpleDateFormat nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        tr.setReviewTime(nowTime.format(new Date()));
        orderPath = WebContext.getRequest().getContextPath() +
                pathFactory.getProperty("asn.order.findOrderById.action.path");
        try {
            TradeReviewService.addTradeReview(tr);
        } catch (Exception e) {
            HttpServletResponse res = WebContext.getResponse();
            res.setContentType("text/plain;");
            PrintWriter out = res.getWriter();
            //1 表示 成功 0 或者null表示失败
            out.print(0);
            out.close();
            throw e;
        }
        //给前台页面的JS控制命令
        HttpServletResponse res = WebContext.getResponse();
        res.setContentType("text/plain;");
        PrintWriter out = res.getWriter();
        //1 表示 成功 0 或者null表示失败
        out.print(1);
        out.close();
        return null;
    }

    public void setMember(Member member) {
        this.supplier = member;
    }

    public Member getMember() {
        return this.supplier;
    }

    public int getReviewed() {
        return reviewed;
    }

    public void setReviewed(int reviewed) {
        this.reviewed = reviewed;
    }

    public Member getSupplier() {
        return supplier;
    }

    public void setSupplier(Member supplier) {
        this.supplier = supplier;
    }

    public Member getUser() {
        return user;
    }

    public void setUser(Member user) {
        this.user = user;
    }
}
