package com.bornsoft.asn.service.quotation;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jxl.Cell;
import jxl.CellType;
import jxl.DateCell;
import jxl.NumberCell;
import jxl.Sheet;
import jxl.Workbook;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.quotation.QuotationInfo;
import com.bornsoft.asn.bean.quotation.QuotationInfoStat;
import com.bornsoft.asn.bean.quotation.QuotationMarket;
import com.bornsoft.asn.bean.quotation.QuotationProduct;
import com.bornsoft.asn.dao.quotation.QuotationDAO;
import com.bornsoft.asn.dao.quotation.QuotationStatDAO;
import com.bornsoft.asn.exception.ActionException;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.service.member.MemberService;
import com.bornsoft.asn.utils.common.AsnConstLib;
import com.bornsoft.asn.utils.common.sqlMapFactory;

/*
 * package的命名规则 com.bornsoft.asn.分成名称或者工具名词.模块名
 * */

/**
 * 
 * ASN行情信息服务类，行情信息服务包括： 行情信息的新增，批量新增（第二版），统计来源收集器（第三版），修改，删除，查询
 * 
 * @author hooxin
 * 
 */
public class QuotationService {

	/**
	 * 新增 行情信息
	 * 
	 * @param tt
	 *            行情信息
	 * @throws Exception
	 *             SQL异常和自定义异常
	 */
	public static void insertQuotation(QuotationInfo tt) throws Exception {
		try {
			if (tt == null)
				throw new ActionException("行情基本信息 实体为空!!!");
			if (tt.getQuotationCode() == 0)
				throw new ActionException("行情基本信息 行情编号为空!!!");
			sqlMapFactory.getSqlMap().startTransaction();
			QuotationDAO.insert(tt);
			for (int i = 0; tt.getQuoInfoStat() != null
					&& i < tt.getQuoInfoStat().size(); i++) {
				QuotationInfoStat q = tt.getQuoInfoStat().get(i);
				QuotationStatDAO.insert(q);
			}
			sqlMapFactory.getSqlMap().commitTransaction();
		} catch (Exception e) {
			// TODO: handle exception
			Logger log = Logger.getLogger("QuotationService");
			log.info("行情信息  新增出错", e);
			throw e;

		} finally {
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}

	/**
	 * 更改 行情信息
	 * 
	 * @param tt
	 *            行情信息
	 * @throws Exception
	 *             SQL异常和自定义异常
	 */
	public static void updateQuotation(QuotationInfo tt) throws Exception {
		try {
			if (tt == null)
				throw new Exception("行情基本信息 实体为空!!!");
			if (tt.getQuotationCode() == 0) {
				throw new Exception("行情基本信息 行情编号为空!!!");
			}
			sqlMapFactory.getSqlMap().startTransaction();
			QuotationDAO.update(tt);
			for (int i = 0; tt.getQuoInfoStat() != null
					&& i < tt.getQuoInfoStat().size(); i++) {
				QuotationInfoStat q = tt.getQuoInfoStat().get(i);
				if (q.getStatCode() != null) {
					QuotationStatDAO.update(q);
				} else {
					q.setStatCode(((Long) IdMakerService
							.newId(AsnConstLib.quoStatIdType)).intValue());
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					q.setStatDate(new Date());
					QuotationStatDAO.insert(q);
				}
			}
			sqlMapFactory.getSqlMap().commitTransaction();
		} catch (Exception e) {
			Logger log = Logger.getLogger("QuotationService");
			log.info("行情信息  更改出错", e);
			throw e;
		} finally {
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}

	/**
	 * 删除 行情信息
	 * 
	 * @param tt
	 *            行情信息
	 * @throws Exception
	 */
	public static void deleteQuotation(int tt) throws Exception {
		try {
			if (tt == 0)
				throw new Exception("行情基本信息 编号为空!!!");
			QuotationDAO.delete(tt);
		} catch (Exception e) {
			Logger log = Logger.getLogger("QuotationService");
			log.info("行情信息  删除出错");
			throw e;
		}
	}

	/**
	 * 获取 单个行情信息
	 * 
	 * @param tt
	 *            行情信息（需包含行情编号）
	 * @return 一个行情信息
	 * @throws Exception
	 *             SQL异常和自定义异常
	 */
	public static QuotationInfo getQuotation(QuotationInfo tt) throws Exception {

		try {
			if (tt == null)
				throw new Exception("行情基本信息 实体为空!!!");
			return QuotationDAO.get(tt.getQuotationCode());
		} catch (Exception e) {
			Logger log = Logger.getLogger("QuotationService");
			log.info("获得单个行情信息出错");
			throw e;
		}
	}

	public static QuotationInfo getQuotation(int quoCode) throws Exception {

		try {
			if (quoCode <= 0)
				throw new Exception("行情基本信息 行情编号无效!!!");
			
			QuotationInfo qi = QuotationDAO.get(quoCode);
			qi.getQuoInfoStat().size();
			return qi;
		} catch (Exception e) {
			Logger log = Logger.getLogger("QuotationService");
			log.info("获得单个行情信息出错");
			throw e;
		}
	}

	/**
	 * 获取 一个行情信息列表
	 * 
	 * @return 一个行情信息的列表
	 * @throws Exception
	 *             SQL异常和自定义异常
	 */
	public static List<QuotationInfo> getQuotationList() throws Exception {
		try {
			return QuotationDAO.getAllList();
		} catch (Exception e) {
			Logger log = Logger.getLogger("QuotationService");
			log.info("获取行情信息列表出错");
			throw e;
		}

	}

	/**
	 * 获取 一个不带价格统计的行情信息列表
	 * 
	 * @return 一个不带价格统计的行情列表
	 * @throws Exception
	 *             SQL异常和自定义异常
	 */
	public static List<QuotationInfo> getQuotationwoStatList() throws Exception {
		try {
			return QuotationDAO.getAllwoStatList();
		} catch (Exception e) {
			Logger log = Logger.getLogger("QuotationService");
			log.info("获取行情信息列表出错");
			throw e;
		}
	}
	
	/**
	 * 得到行情记录数
	 * @param quoName 行情名称
	 * @param relDateSt 起始发布时间
	 * @param relDateEd 结束发布时间
	 * @return
	 * @throws Exception
	 */
	public static int findQuotationCount(String quoName, 
			String relDateSt, String relDateEd) throws Exception{
		try{
			return QuotationDAO.findQuotationCount(quoName, relDateSt, relDateEd);
		}catch (Exception e) {
			// TODO: handle exception
			Logger log = Logger.getLogger(QuotationService.class);
			log.error("得到行情信息记录数 SERVICE", e);
			throw e;
		}
	}

	/**
	 * 分页得到行情信息
	 * @param startCount 起始记录数
	 * @param endCount 结束记录数
	 * @param quoName 行情名称
	 * @param relDateSt 起始发布日期 
	 * @param relDateEd 结束发布日期
	 * @return
	 * @throws Exception
	 */
	public static List<QuotationInfo> findQuotationwoStatList(int startCount, int endCount, String quoName, 
			String relDateSt, String relDateEd) throws Exception{
		try{
			return QuotationDAO.findQuotationwoStatList(startCount,endCount, quoName, relDateSt, relDateEd);
		}catch (Exception e) {
			Logger log = Logger.getLogger(QuotationInfo.class);
			log.info("获取行情信息列表出错 SERVICE", e);
			throw e;
		}
	}
	/**
	 * 解析excel文件
	 * @param excelFile file类型的excel文件
	 * @return 行情信息列表
	 * @throws Exception
	 */
	public static List<QuotationInfo> parseExcel(File excelFile)
			throws Exception {
		List<QuotationInfo> quoList = new ArrayList<QuotationInfo>();
		try {
			Workbook wb = Workbook.getWorkbook(excelFile);
			Sheet[] shs = wb.getSheets();

			for (Sheet sh : shs) {
				QuotationInfo qi = new QuotationInfo();
				// 左边为横坐标，右边为纵坐标, 初始值0，0
				// 1,0为行情名称
				Cell cell = sh.getCell(1, 0);
				qi.setQuotationName(cell.getContents());
				// 行情来源
				cell = sh.getCell(1, 2);
				qi.setSource(cell.getContents());
				// 行情发布时间
				cell = sh.getCell(3, 2);
				DateCell dateCell = null;
				if(cell.getType() == CellType.DATE) 
					dateCell  = (DateCell)cell;
				qi.setReleaseDate(dateCell.getDate());
				cell = sh.getCell(1, 3);
				// 价格单位
				String priceUnit = cell.getContents();
				// 计量单位
				cell = sh.getCell(3, 3);
				String measureUnit = cell.getContents();
				
				// 市场名称
				cell = sh.getCell(1, 1);
				String marketName = cell.getContents();
				//市场编号
				cell = sh.getCell(3, 1);
				Integer marketCode = new Integer((int)((NumberCell)cell).getValue());
				
				// 行情编号
				qi.setQuotationCode(IdMakerService.newId(
						AsnConstLib.quoInfoIdType).intValue());
				//行情发布人
				qi.setReleasePerson(MemberService.getMemberShortName());
				// 纵坐标Y ＝ 4为产品分隔线，5开始为产品统计信息
				List<QuotationInfoStat> quoStatL = new ArrayList<QuotationInfoStat>();
				// 产品统计列表
				qi.setQuoInfoStat(quoStatL);
				int shRow = sh.getRows();
				for (int i = 5; i < shRow; i++) {
					QuotationInfoStat qis = new QuotationInfoStat();
					try {
						// 产品统计，产品编号
						cell = sh.getCell(0, i);
						QuotationProduct qp = new QuotationProduct();
						qp.setQuotationPCode(new Integer((int) ((NumberCell)cell).getValue()));
						qp = QuotationProductService.getQuoProduct(qp.getQuotationPCode());
						qis.setQuotationProduct(qp);
						
						// 平均价格
						cell = sh.getCell(1, i);
						qis.setAvgPrice(new Float(((NumberCell) cell).getValue()));
						// 备注
						cell = sh.getCell(2, i);
						qis.setComments(cell.getContents());
					} catch (ClassCastException e) {
						// TODO: handle exception
						break;
					}
					// 统计时间
					qis.setStatDate(new Date());
					// 统计的行情编号
					qis.setQuotationCode(qi.getQuotationCode());
					// 统计编号
					qis.setStatCode(IdMakerService.newId(
							AsnConstLib.quoStatIdType).intValue());
					// 统计价格单位
//					qis.setPriceUnit(priceUnit);
					// 统计计量单位
//					qis.setMeasureUnit(measureUnit);
					// 统计市场名称
					QuotationMarket qm = new QuotationMarket();
					qm.setMarketCode(marketCode);
					qm.setMarketName(marketName);
					qis.setQuotationMarket(qm);
					
					quoStatL.add(qis);
				}

				quoList.add(qi);
			}
			return quoList;
		} catch (Exception e) {
			Logger log = Logger.getLogger(QuotationService.class);
			log.error("", e);
			return quoList;
		}

	}

	public static void main(String[] args) {
		try {
			QuotationService.parseExcel(new File("/home/hooxin/Work/行情.xls"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
