package com.bornsoft.asn.action.quotation;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.jfree.chart.JFreeChart;

import com.bornsoft.asn.bean.quotation.QuotationInfoStat;
import com.bornsoft.asn.bean.quotation.QuotationMarket;
import com.bornsoft.asn.bean.quotation.QuotationProduct;
import com.bornsoft.asn.exception.ActionException;
import com.bornsoft.asn.service.quotation.QuotationMarketService;
import com.bornsoft.asn.service.quotation.QuotationProductService;
import com.bornsoft.asn.service.quotation.QuotationStatService;
import com.bornsoft.asn.utils.common.CurveGenerator;
import com.bornsoft.asn.utils.common.CurveUtil;
import com.bornsoft.asn.utils.common.WebContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class QuotationCurve extends ActionSupport
{
	// 图片高宽
	private Integer				width	= 600;
	private Integer				height	= 500;

	private QuotationProduct	quoPdt;
	private QuotationMarket		quoMarket;
	private Date				startDate;
	private Date				endDate;
	private String				mode;
	private String				imagePath;

	public String execute() throws Exception
	{
		List<QuotationInfoStat> quostatList = null;
		JFreeChart chart = null;
		Calendar cl = null;

		if (quoPdt == null || quoPdt.getQuotationPCode() == null)
			throw new ActionException("请指定统计产品的编号");

		width = width == 0 ? CurveGenerator.DEFAULT_WIDTH : width;
		height = height == 0 ? CurveGenerator.DEFAULT_HEIGHT : height;

		if (startDate == null && endDate == null)
		{

			cl = Calendar.getInstance();
			cl.setTime(new Date());
			cl.add(Calendar.DAY_OF_YEAR, -7);
			startDate = cl.getTime();
			endDate = new Date();
		}

		quoPdt = QuotationProductService.getQuoProduct(quoPdt
				.getQuotationPCode());

		quoMarket = QuotationMarketService.getMarket(quoMarket.getMarketCode());

		quostatList = QuotationStatService.getQuotationStat(
				quoPdt.getQuotationPCode(),
				quoMarket.getMarketCode(),
				startDate,
				endDate);

		if (mode == null || mode.equals(""))
			mode = CurveGenerator.MODE_AREA;
		if (mode.equals(CurveGenerator.MODE_AREA))
			chart = CurveGenerator.generateCurve(
					quoPdt.getQuotationPName() + "趋势图",
					quoPdt.getQuotationPName(),
					"价格",
					CurveUtil.convertToListMap(quostatList));
		else if (mode.equals(CurveGenerator.MODE_PIE))
			chart = CurveGenerator.generatePie(quoPdt.getQuotationPName()
					+ "趋势图", CurveUtil.convertToListMap(quostatList));
		
		imagePath = CurveGenerator.saveChartOnServerAsPng(
				WebContext.getRequest(),
				chart,
				width,
				height);

		return SUCCESS;
	}

	public QuotationCurve()
	{
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getWidth()
	{
		return width;
	}

	public Integer getHeight()
	{
		return height;
	}

	public QuotationProduct getQuoPdt()
	{
		return quoPdt;
	}

	public QuotationMarket getQuoMarket()
	{
		return quoMarket;
	}

	public void setWidth(Integer width)
	{
		this.width = width;
	}

	public void setHeight(Integer height)
	{
		this.height = height;
	}

	public void setQuoPdt(QuotationProduct quoPdt)
	{
		this.quoPdt = quoPdt;
	}

	public void setQuoMarket(QuotationMarket quoMarket)
	{
		this.quoMarket = quoMarket;
	}

	public Date getStartDate()
	{
		return startDate;
	}

	public Date getEndDate()
	{
		return endDate;
	}

	public void setStartDate(Date startDate)
	{
		this.startDate = startDate;
	}

	public void setEndDate(Date endDate)
	{
		this.endDate = endDate;
	}

	public String getMode()
	{
		return mode;
	}

	public void setMode(String mode)
	{
		this.mode = mode;
	}

	public String getImagePath()
	{
		return imagePath;
	}

	public void setImagePath(String imagePath)
	{
		this.imagePath = imagePath;
	}

}
