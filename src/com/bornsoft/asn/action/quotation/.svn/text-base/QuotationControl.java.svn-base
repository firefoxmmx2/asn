package com.bornsoft.asn.action.quotation;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.bornsoft.asn.bean.quotation.QuotationInfo;
import com.bornsoft.asn.bean.quotation.QuotationInfoStat;
import com.bornsoft.asn.bean.quotation.QuotationMarket;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.service.quotation.QuotationService;
import com.bornsoft.asn.utils.common.AsnConstLib;
import com.bornsoft.asn.utils.json.Json;
import com.opensymphony.xwork2.ActionSupport;

/*
 * package的命名规则 com.bornsoft.asn.分成名称或者工具名词.模块名
 * */
/**
 * 行情控制
 * @author hooxin
 *
 */
public class QuotationControl extends ActionSupport {

    private QuotationInfo quoInfo;
    //公共的价格单位, 计量单位，市场名称
    private String priceUnit;
    private String measureUnit;
    private String marketName;
    private Integer marketCode;
    //json格式的行情统计列表
    private String quoStatDataList;
    //列表在是
    private List<QuotationInfo> quoInfoList;
    //浏览列表的复选框
    private String quoInfoCodeArr[];
    //批量新增的解析文件
    private List<File> upFiles;
    private List upFilesContentTypes;
    private List fileNames;
    //批量新增预览和提交列表
    private List<QuotationInfo> quoL;
    //页面表单action
    private String formAction;
    //flag 有0和1,2 三个状态,0的时候,qutotation_new.jsp页面quoInfo.quotationCode可编辑，
    //1的时候除了quoInfo.quotationCode以外，都不可写,否则不可编辑.
    //2的时候，quoInfo.quotationCode 不可写，改变提交地点。
    private String flag;

    public Integer getMarketCode() {
        return marketCode;
    }

    public void setMarketCode(Integer marketCode) {
        this.marketCode = marketCode;
    }

    public void setFormAction(String formAction) {
        this.formAction = formAction;
    }

    public String getFormAction() {
        return formAction;
    }

    public List getUpFiles() {
        return upFiles;
    }

    public void setQuoL(List<QuotationInfo> quoL) {
        this.quoL = quoL;
    }

    public List<QuotationInfo> getQuoL() {
        return quoL;
    }

    public void setUpFiles(List upFiles) {
        this.upFiles = upFiles;
    }

    public List getUpFilesContentType() {
        return upFilesContentTypes;
    }

    public void setUpFilesContentType(List upFilesContentTypes) {
        this.upFilesContentTypes = upFilesContentTypes;
    }

    public List getUpFilesFileName() {
        return fileNames;
    }

    public void setUpFilesFileName(List fileNames) {
        this.fileNames = fileNames;
    }

    public QuotationControl() {
    }

    public String getPriceUnit() {
        return priceUnit;
    }

    public void setPriceUnit(String priceUnit) {
        this.priceUnit = priceUnit;
    }

    public String getMeasureUnit() {
        return measureUnit;
    }

    public void setMeasureUnit(String measureUnit) {
        this.measureUnit = measureUnit;
    }

    /**
     * 显示列表
     * @return
     * @throws Exception
     */
    public String toView() throws Exception {
        quoInfoList = QuotationService.getQuotationwoStatList();
        if (quoInfoList == null || quoInfoList.size() == 0) {
            quoInfoList = new ArrayList<QuotationInfo>();
        }
        return "toViewlist";
    }

    /**
     * 跳转到新增页面
     * @return
     * @throws Exception
     */
    public String toNew() throws Exception {
        quoInfo = new QuotationInfo();
        quoInfo.setQuotationCode(((Long) IdMakerService.newId(AsnConstLib.quoInfoIdType)).intValue());
        //初始化发布人,发布日期
        quoInfo.setReleaseDate(new Date());
        quoInfo.setReleasePerson(MemberService.getMemberShortName());

        flag = "0";

        return "toNew";
    }

    /**
     * 更改预处理
     * @return
     * @throws Exception
     */
    public String toUpdate() throws Exception {
        flag = "1";

        return "toUpdate";
    }

    /**
     * 更改预处理2
     * @return
     * @throws Exception
     */
    public String toUpdate2() throws Exception {
        flag = "2";

        quoInfo = QuotationService.getQuotation(quoInfo.getQuotationCode());

        if (quoInfo == null) {
            this.addActionMessage("没有该记录");
            flag = "1";
            return INPUT;
        }
        if (quoInfo.getQuoInfoStat() != null && quoInfo.getQuoInfoStat().size() > 0) {
            quoStatDataList = Json.getString(quoInfo.getQuoInfoStat());
            marketName = quoInfo.getQuoInfoStat().get(0).getQuotationMarket().getMarketName();
            marketCode = quoInfo.getQuoInfoStat().get(0).getQuotationMarket().getMarketCode();

        }
        return "toUpdate";
    }

    public void setQuoInfo(QuotationInfo quoInfo) {
        this.quoInfo = quoInfo;
    }

    public QuotationInfo getQuoInfo() {
        return quoInfo;
    }

    /**
     * 执行新增
     * @return
     * @throws Exception
     */
    public String doNew() throws Exception {
        List<QuotationInfoStat> statList = quoInfo.getQuoInfoStat();
        for (int i = 0; statList != null && i < statList.size(); i++) {
            QuotationInfoStat qis = (QuotationInfoStat) statList.get(i);
            qis.setQuotationCode(quoInfo.getQuotationCode());
            qis.setStatDate(new Date());
            qis.setStatCode(((Long) IdMakerService.newId(AsnConstLib.quoStatIdType)).intValue());
            QuotationMarket qm = new QuotationMarket();
            qm.setMarketCode(marketCode);
            qis.setQuotationMarket(qm);
        }

        QuotationService.insertQuotation(quoInfo);
        return toView();
    }

    /**
     * 执行修改
     * @return
     * @throws Exception
     */
    public String doUpdate() throws Exception {
        //更改人
        quoInfo.setUpdatePerson(MemberService.getMemberShortName());
        //时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh-mm");
        quoInfo.setUpdateDate(new Date());
        List<QuotationInfoStat> statList = quoInfo.getQuoInfoStat();
        for (int i = 0; statList != null && i < statList.size(); i++) {
            QuotationInfoStat qis = (QuotationInfoStat) statList.get(i);
            qis.setQuotationCode(quoInfo.getQuotationCode());
            QuotationMarket qm = new QuotationMarket();
            qm.setMarketCode(marketCode);
            qis.setQuotationMarket(qm);
        }

        QuotationService.updateQuotation(quoInfo);
        return toView();
    }

    /**
     * 执行 删除
     * @return
     * @throws Exception
     */
    public String doDelete() throws Exception {
        if (quoInfoCodeArr != null && quoInfoCodeArr.length != 0) {
            for (int i = 0; i < quoInfoCodeArr.length; i++) {
                QuotationService.deleteQuotation(Integer.parseInt(quoInfoCodeArr[i]));
            }
        }
        return toView();
    }

    /**
     * 跳转到 批量新增
     * @return
     * @throws Exception
     */
    public String toNews() throws Exception {
        flag = "toNews";
        upFiles = new ArrayList<File>();
        upFiles.add(new File(""));
        return "toNews";
    }

    /**
     * 批量新增预览
     * @return 返回到新增页面
     * @throws Exception
     */
    public String doPreview() throws Exception {
        flag = "doPreview";

        quoL = new ArrayList<QuotationInfo>();
        if (upFiles == null || upFiles.size() == 0) {
            this.addActionError("请输入上传文件");
            return INPUT;
        }

        for (int i = 0; i < upFiles.size(); i++) {
            //验证文件类型
            if (!upFilesContentTypes.get(i).equals("application/vnd.ms-excel")) {
                continue;
            }
            List<QuotationInfo> quolist = QuotationService.parseExcel(upFiles.get(i));
            if (quolist != null && quolist.size() > 0) {
                quoL.addAll(quolist);
            } else {
                throw new Exception("excel 文件" + fileNames.get(i) + "格式有问题,请核对");
            }
        }

        if (quoL.isEmpty()) {
            return toNews();
        }
        ServletActionContext.getRequest().getSession().setAttribute("quoL", quoL);
        return SUCCESS;
    }

    /**
     * 执行 批量新增
     * @return 返回到页面
     * @throws Exception
     */
    public String doNews() throws Exception {
        quoL = (List<QuotationInfo>) ServletActionContext.getRequest().getSession().getAttribute("quoL");
        if (quoL == null || quoL.size() <= 0) {
            throw new Exception("批量新增列表为空");
        }
        if (quoInfoCodeArr == null || quoInfoCodeArr.length == 0) {
            return toView();
        }

        for (QuotationInfo qi : quoL) {
            for (int i = 0; i < quoInfoCodeArr.length; i++) {
                if (Integer.parseInt(quoInfoCodeArr[i]) == qi.getQuotationCode()) {
                    QuotationService.insertQuotation(qi);
                }
            }
        }
        ServletActionContext.getRequest().getSession().removeAttribute("quoL");
        return toView();
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getFlag() {
        return flag;
    }

    public void setMarketName(String marketName) {
        this.marketName = marketName;
    }

    public String getMarketName() {
        return marketName;
    }

    public void setQuoStatDataList(String quoStatDataList) {
        this.quoStatDataList = quoStatDataList;
    }

    public String getQuoStatDataList() {
        return quoStatDataList;
    }

    public void setQuoInfoList(List<QuotationInfo> quoInfoList) {
        this.quoInfoList = quoInfoList;
    }

    public List<QuotationInfo> getQuoInfoList() {
        return quoInfoList;
    }

    public void setQuoInfoCodeArr(String[] quoInfoCodeArr) {
        this.quoInfoCodeArr = quoInfoCodeArr;
    }

    public String[] getQuoInfoCodeArr() {
        return quoInfoCodeArr;
    }
}
