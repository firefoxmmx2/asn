quostat = null;
// yav 验证框架配置规则
rules = null;

function init()
{
	quostat = new QuoStat();
	
	if ($("#selectAll")[0] != null)
	{
		$("#selectAll")[0].onclick = function()
		{
			
			if ($("#selectAll")[0].checked == true)
				selectAll($("input[name=quoInfoCodeArr]"));
			else
				unselAll($("input[name=quoInfoCodeArr]"));
		};
	}
	// 对所有按钮的动作初始化
	// $("input:submit").unbind("click");
	$("input:button[name*=action:]").click(function()
	{
		action = $("form").get(0).action;
		action = action.substr(0, action.lastIndexOf("/")) + "/" + this.name.split(":")[1];
		$("form").attr("action", action);
		if (action.indexOf("!doNew") != -1 || action.indexOf("!doUpdate") != -1 || action.indexOf("!doPreview") != -1)
		{
			if (yav.performCheck("quoForm", rules, "inline"))
			{
				$("form").submit();
			}
		}
		else
			$("form").submit();
	});
	// --
	toUpdate();
	doDelete();
	if ($("input[name=flag]").val() == "toNews")
	{
		toNews();
	}
}

/**
 * 对 删除按钮 的初始化
 * 
 * @return
 */
function doDelete()
{
	delBtnQ = $("input[name=action:quotation-control!doDelete]");
	shadowObj(delBtnQ[0]);
	// 复选框和删除按钮联动
	checkBtn = function()
	{
		checkedCHK = $(quoICodeA).filter("input:checked");
		if (checkedCHK.length == 0)
			shadowObj(delBtnQ[0]);
		else
			lightObj(delBtnQ[0]);
		checkedNum = checkedCHK.length;
	}
	// 全选按钮
	$("#selectAll").click(checkBtn);
	quoICodeA = $("input[name=quoInfoCodeArr]");
	checkedNum = 0;
	quoICodeA.click(checkBtn);
	delBtnQ.unbind("click");
	delBtnQ.click(function()
	{
		action = $("form").attr("action");
		action = action.substr(0, action.lastIndexOf("/")) + "/" + this.name.split(":")[1];
		$("form").attr("action", action);
		result = confirm("您选中了" + checkedNum + "条行情记录,是否要删除?");
		if (result)
		{
			$("form").submit();
		}
		
	});
	
}
// quotation_news.jsp
function toNews()
{
	$("input[name=addFiles]").click(function()
	{
		addFiles("tt", "upFiles");
	});
	$("form")[0].enctype = "multipart/form-data";
	// 设置 form 验证
	rules = [ "upFiles:EXCEL文件|required" ];
	// yav.init('quoForm',rules);
	doPreviewQ = $("input:button[name=action:quotation-control!doPreview]");
	doPreviewQ.unbind("click");
	doPreviewQ.click(function()
	{
		action = $("form").get(0).action;
		action = action.substr(0, action.lastIndexOf("/")) + "/" + this.name.split(":")[1];
		$("form").attr("action", action);
		if (action.indexOf("!doNew") != -1 || action.indexOf("!doUpdate") != -1 || action.indexOf("!doPreview") != -1)
		{
			if ($("input[name=upFiles]").val() != "")
			{
				$("form").submit();
			}
			else
				alert("请指定excel文件");
		}
	});
}

function addFiles(objName, fileName)
{
	if (objName == null || objName == "")
	{
		alert("addFile().objName == null");
		return;
	}
	if (fileName == null || fileName == "")
		fileName = "upLoad";
	file = "<div style='height:30px;'>";
	file += "<input type='file' size='50' name='" + fileName + "'/>";
	file += "<div id='errorsDiv_" + fileName + "'></div>";
	file += "</div>";
	$("#" + objName).append(file);
}
// ---------
function selectAll(objs)
{
	for (i in objs)
	{
		objs[i].checked = true;
	}
}

function unselAll(objs)
{
	for (i in objs)
	{
		objs[i].checked = false;
	}
}

/**
 * 更新页面控制。。
 * 
 * @return
 */
function toUpdate()
{
	// toUpdate
	if ($("input[name=flag]").val() == "1")
	{
		// $("input[name=quoInfo.quotationCode]")[0].readOnly = true;
		shadowObjAll($("#toControl")[0]);
		lightObj($("input[name=quoInfo.quotationCode]")[0]);
		lightObj($("input[name=action:quotation-control!toUpdate2]")[0]);
		
		rules = new Array("quoInfo.quotationCode:行情编号|numeric", "quoInfo.quotationCode:行情编号|required");
		
		function entryCheck(evt)
		{
			if (evt.keyCode == 13 || evt.charCode == 13)
			{
				$("input[name=action:quotation-control!toUpdate2]")[0].click();
			}
		};
		
		// 设置回车键监听 ->
		if (document.addEventListener)
			// document.addEventListener("keypress", entryCheck);
			document.onkeypress = entryCheck;
		else
			document.attachEvent("onkeypress", entryCheck);
		
		// 提交时，yav验证
		$('#quoForm').submit(function()
		{
			if ($('#quoForm').attr('action').indexOf('quotation-control!toUpdate2') != -1)
				return yav.performCheck("quoForm", rules, "inline");
		});
		yav.addHelp("quoInfo.quotationCode", "请输入行情编号");
		
		yav.init('quoForm', rules);
		$("input[name=quoInfo.quotationCode]").focus();
	}
	// toUpdate2
	else if ($("input[name=flag]").val() == "2")
	{
		shadowObj($("input[name=quoInfo.quotationCode]")[0]);
		shadowObj($("input[name=action:quotation-control!toUpdate2]")[0]);
		hiddenObj($("input[name=action:quotation-control!toUpdate2]")[0]);
		$("#newStat")[0].onclick = function()
		{
			quostat.newStat("quoStat");
		};
		// 添加市场选择
		$("input:text[name=marketName]").market_select($("input[name=marketCode]"));
		// yav验证框架规则
		rules =
			new Array(
				"quoInfo.quotationCode:行情编号|numeric",
				"quoInfo.quotationCode:行情编号|required",
				"quoInfo.quotationName:详细地址|required",
				"quoInfo.source:来源|required",
				"quoInfo.releasePerson:发布人|required",
				"quoInfo.releaseDate|mask|quoInfo.releaseDate_mask",
				"marketCode:市场|required");
		// 添加 发布日期的 遮照 验证
		yav.addMask("quoInfo.releaseDate_mask", "    -  -  ", "0123456789");
		yav.addHelp("quoInfo.releaseDate", "发布日期请使用2009-2-28的形式");
		// 提交时，yav验证
		$('#quoForm').submit(function()
		{
			if ($('#quoForm').attr('action').indexOf('quotation-control!doUpdate') != -1)
				return yav.performCheck("quoForm", rules, "inline");
		});
		
		yav.init('quoForm', rules);
		// ----
		// json 行情统计数组
		quoStatDataList = $("input[name=quoStatDataList]")[0].value;
		quoStatDataList = $.parseJSON(quoStatDataList);
		quostat.rebuild("quoStat", quoStatDataList);
		
	}
	// new
	else if ($("input[name=flag]").val() == "0")
	{
		shadowObj($("input[name=quoInfo.quotationCode]")[0]);
		$("#newStat")[0].onclick = function()
		{
			quostat.newStat("quoStat");
		};
		// 添加市场选择
		$("input:text[name=marketName]").market_select($("input[name=marketCode]"));
		// yav验证规则
		rules =
			new Array(
				"quoInfo.quotationCode:行情编号|numeric",
				"quoInfo.quotationCode:行情编号|required",
				"quoInfo.quotationName:详细地址|required",
				"quoInfo.source:来源|required",
				"quoInfo.releasePerson:发布人|required",
				"quoInfo.releaseDate|mask|quoInfo.releaseDate_mask",
				"marketCode:市场|required");
		// 添加 发布日期的 遮照 验证
		yav.addMask("quoInfo.releaseDate_mask", "    -  -  ", "0123456789");
		yav.addHelp("quoInfo.releaseDate", "发布日期请使用2009-2-28的形式");
		// 提交时，yav验证
		$('#quoForm').submit(function()
		{
			if ($('#quoForm').attr('action').indexOf("quotation-control!doNew") != -1)
				return yav.performCheck("quoForm", rules, "inline");
		});
		
		yav.init('quoForm', rules);
		
	}
	
}

function shadowObjAll(obj)
{
	
	inputObj = obj.getElementsByTagName("input");
	selectObj = obj.getElementsByTagName("select");
	textareaObj = obj.getElementsByTagName("textarea");
	
	for (i = 0; i < inputObj.length; i++)
	{
		shadowObj(inputObj[i]);
	}
	for (i = 0; i < selectObj.length; i++)
	{
		shadowObj(selectObj[i]);
	}
	for (i = 0; i < textareaObj.length; i++)
	{
		shadowObj(textareaObj);
	}
	
}

function shadowObj(obj, value)
{
	if (value == null)
		value = true;
	if (obj.tagName == "input".toUpperCase())
	{
		if (obj.type == 'text' || obj.type == 'password')
			obj.readOnly = value;
		else
		{
			obj.disabled = value;
		}
	}
	else if (obj.tagName == 'select'.toUpperCase())
	{
		obj.disabled = value;
	}
	else if (obj.tagName == 'textarea'.toUpperCase())
	{
		obj.disabled = value;
	}
	
}

function lightObj(obj)
{
	shadowObj(obj, false);
}
// 设置隐藏
function hiddenObj(obj)
{
	obj.style.visibility = "hidden";
}

function unHiddenObj(obj)
{
	obj.style.visibility = "visible";
}

function QuoStat()
{
	// 表头
	this.tHead = null;
	this.priceUnit = null;
	this.measureUnit = null;
	this.market = null;
	this.fieldPrefix = null;
	this.hidden = null;
	this.fieldNames = null;
	// 上下文路径
	this.contextPath = null;
	num = 0;
	
	this.init =
		function()
		{
			this.tHead = new Object();
			
			this.tHead.title = new Array("产品名称", "平均价格", "备注");
			this.tHead.name = new Array("quotationProduct.quotationPName", "avgPrice", "comments");
			
			this.priceUnit = new Object();
			this.priceUnit.title = "价格单位";
			this.priceUnit.name = "priceUnit";
			
			this.measureUnit = new Object();
			this.measureUnit.title = "计量单位";
			this.measureUnit.name = "measureUnit";
			
			this.market = new Object();
			this.market.title = "市场名称";
			this.market.name = "marketName";
			
			this.fieldPrefix = "quoInfo.quoInfoStat";
			
			this.hidden = new Object();
			this.hidden.title = new Array("统计编号", "统计时间", "产品编号");
			this.hidden.name = new Array("statCode", "statDate", "quotationProduct.quotationPCode");
			
			this.fieldNames =
				new Array(
					"quotationProduct.quotationPName",
					"avgPrice",
					"comments",
					"statDate",
					"statCode",
					"quotationProduct.quotationPCode");
			
			this.contextPath = "/asn";
		};
	
	this.newStat =
		function(locId, quoStatData)
		{
			newstatContainer = "";
			
			loc = $('#' + locId)[0];
			
			if (loc == null)
				return;
			// if(quoStatData == null){
			// quoStatData = new Object();
			// for(i=0;i<this.fieldNames.length;i++)
			// quoStatData[this.fieldNames[i]]="";
			// }
			// 删除一行
			delRow = function(evt)
			{
				targetObj = null;
				if (window.event)
				{
					evt = window.event;
					targetObj = evt.srcElement;
				}
				else
				{
					targetObj = evt.target;
				}
				
				while (targetObj.tagName != "tr".toUpperCase())
				{
					targetObj = targetObj.parentNode;
				}
				trObj = targetObj;
				trFatherObj = trObj.parentNode;
				trFatherObj.deleteRow(trObj.rowIndex);
				
			};
			if (num == 0)
			{
				for (i = 0; i < loc.childNodes.length; i++)
					if (loc.childNodes[i].tagName == 'table'.toUpperCase())
						break;
					else
						newstatContainer += "<table>";
				// newstatContainer += "<tr><td colspan='7'>";
				// newstatContainer += "<table width='790'
				// style='border-bottom:1px
				// #999999 dashed'>";
				// newstatContainer += "<tr>" +
				// "<td height='40'>"+this.priceUnit.title+"：<input
				// type='text'
				// name='"+this.priceUnit.name+"' size='25'
				// value='"+quoStatData.priceUnit+"'/><span
				// id='errorsDiv_"+this.priceUnit.name+"'></span></td>"+
				// "<td>"+this.measureUnit.title+"：<input type='text'
				// name='"+this.measureUnit.name+"' size='25'
				// value='"+quoStatData.measureUnit+"'><span
				// id='errorsDiv_"+this.measureUnit.name+"'></span></td>" +
				// "<td>"+this.market.title+"：<input type='text'
				// name='"+this.market.name+"' size='25'
				// value='"+quoStatData.marketName+"'><span
				// id='errorsDiv_"+this.market.name+"'></span></td>";
				// newstatContainer += "</tr>";
				// newstatContainer += "</table>";
				// newstatContainer += "</td></tr>";
				// 增加yav 验证配置
				newRules = "";
				// newRules +=
				// this.priceUnit.name+":"+this.priceUnit.title+"|required,";
				// newRules +=
				// this.measureUnit.name+":"+this.measureUnit.title+"|required,";
				// newRules +=
				// this.market.name+":"+this.market.title+"|required,";
				
				newstatContainer += "<tr bgcolor='#e8f5fb'>";
				
				for (i = 0; i < this.tHead.title.length; i++)
					newstatContainer += "<td height='28'>&nbsp;" + this.tHead.title[i] + "</td>";
				
				newstatContainer += "<td align='center'>操作</td></tr>";
				
			}
			newstatContainer += "<tr>";
			for (i = 0; i < this.tHead.name.length; i++)
			{
				newstatContainer +=
					"<td height='25'>&nbsp;<input type='text' name='" + this.fieldPrefix + "[" + num + "]."
						+ this.tHead.name[i] + "' size='18' value='";
				var datavalue = "";
				for (f = 0; quoStatData != null && f < this.tHead.name[i].split(".").length; f++)
				{
					if (f == 0)
						datavalue = quoStatData[this.tHead.name[i].split(".")[f]];
					else
						datavalue = datavalue[this.tHead.name[i].split(".")[f]];
				}
				newstatContainer += datavalue;
				newstatContainer += "'/>";
				newstatContainer +=
					"<p><span id='errorsDiv_" + this.fieldPrefix + "[" + num + "]." + this.tHead.name[i] + "'></span>";
				// 添加验证信息
				// 除了备注都加上必需验证
				if (this.tHead.title[i].indexOf("备注") == -1)
					newRules +=
						this.fieldPrefix + "[" + num + "]." + this.tHead.name[i] + ":" + this.tHead.title[i]
							+ "|required,";
				// 价格加上浮点验证
				if (this.tHead.title[i].indexOf("价格") >= 0)
					newRules +=
						this.fieldPrefix + "[" + num + "]." + this.tHead.name[i] + ":" + this.tHead.title[i]
							+ "|double,";
			}
			// 添加隐含字段，统计编号等
			for (j = 0; j < this.hidden.name.length; j++)
			{
				newstatContainer +=
					"<input type='hidden' name='" + this.fieldPrefix + "[" + num + "]." + this.hidden.name[j]
						+ "' value='";
				var datavalue = "";
				for (f = 0; quoStatData != null && f < this.hidden.name[j].split(".").length; f++)
				{
					if (f == 0)
						datavalue = quoStatData[this.hidden.name[j].split(".")[f]];
					else
						datavalue = datavalue[this.hidden.name[j].split(".")[f]];
				}
				newstatContainer += datavalue;
				newstatContainer += "'/>";
			}
			// 添加减号图片
			newstatContainer += "<td height='20' align='left'>";
			newstatContainer +=
				"&nbsp;&nbsp;<img src='"
					+ this.contextPath
					+ "/image/del_32.png' title='删除此行' style='cursor:pointer; width:22px;height:22px;' onclick='delRow(event)'/>";
			newstatContainer += "</td>";
			newstatContainer += "</tr>";
			
			// newRules = newRules.substr(0,newRules.length-1);
			rules = rules.concat(newRules.substr(0, newRules.length - 1).split(","));
			yav.init('quoForm', rules);
			num++;
			// 加载产品选择器
			$newstatContainer = $(newstatContainer).appendTo(loc);
			$newstatContainer.find("input:text[name*=quotationPName]").eq(0).quo_product_select(
				$newstatContainer.find("input[name*=quotationPCode]").eq(0));
			
		};
	
	this.rebuild = function(locId, quoStatList)
	{
		
		if (locId == null || quoStatList == null)
			return;
		for (k = 0; k < quoStatList.length; k++)
		{
			quoStatData = quoStatList[k];
			for (l in quoStatData)
				if (quoStatData[l] == null)
					quoStatData[l] = "";
			this.newStat(locId, quoStatData);
		}
	};
	
	this.init();
}


$(document).ready(init);
