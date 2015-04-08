/**
 *  求购信息管理
 *  @author hooxin
 *  
 */

function init() {
	datalist = $.parseJSON($("input[name=dataList]").val());
	purcharManage.init(datalist);
	
}

purcharManage = {
		init:function(datalist){
		this.bean.dataList = datalist;
		
		this.view.rebuild();
		this.view.locationNode();
		this.view.buttonstyle();
		this.btnclick();
		this.validate();
		},
		validate:function(obj) {
			 //yav验证框架规则
	        rules=new Array(
	    			"pst.typeCode:类型编号|required",
	    			"pst.typeName:类型名称|required",
	    			"pst.parentId:父级ID|required",
	    			"pst.parentId:父级ID|numeric",
	    			"pst.priority:优先级|required",
	    			"pst.priority:优先级|numeric"
	    		);
	        yav.init('psForm',rules);
	        ret = yav.performCheck("psForm", rules, "inline");
	        if(!ret)
	        	return ret;
	        if(obj){
	        	//业务逻辑验证 
	        	//验证 类型代码是否已存在
	        	function isExist(){
	        		ret = false;
		        	$("li","#tree").each(function(){
		        		if($(this).attr("typeCode") == $("input[name=pst.typeCode]").val()){
		        			ret = true;
		        		}
		        	});
		        	return ret;
	        	}
	        	if($(obj).attr("name")=="doNew" && isExist()){
	        		alert("error::不能新增 一个产品分类编号为一个已存在的编号");
	        		return false;
	        	}
	        	else if($(obj).attr("name")=="doUpdate" && $("input[name=pst.typeCode]").val() != $("input[name=orgTypeCode]").val() && isExist()){
	        		alert("error::不能修改 一个产品分类编号为一个已存在的编号");
	        		return false;
	        	}
	        }
			return true;
		},
		//按钮动作
		btnclick:function(){
			$("input:button",".btnBar2").each(function (){
			$(this).click(function(){
				action =  $("form").attr("action");
				action_pre = action.substr(0, action.lastIndexOf("/"));
				action = action_pre + "/" + $(this).attr("name");
				btn = this;
				$("form").attr("action",action);
				$("form").submit(function(){
					return purcharManage.validate(btn);
				});
				//为删除操作添加 文本确认信息
				if($(this).attr("name") == "doDelete"){
					//创建一个确认框容器
					if($("#dialog") .length == 0)
						$("<div>",{id:"dialog"}).appendTo("body");
					$("#dialog").dialog("close");
					$("#dialog").dialog({
						title:"删除确认",
						modal: true,
						buttons:{
							"取消":function() {$(this).dialog("close");},
							"删除":function() { $("form").submit(); }
						}
					});
				}
				else{
					$("form").submit();
				}
			});
		});
		}
		
};

/**
 * 供求类型 实体
 * */
purcharManage.bean = {
		addList:[],
		delList:[],
		upList:[],
		dataList:[]
};

/**
 * 供求类型 视图层
 * */
purcharManage.view = {
		tree:null,
		//重构树
		rebuild:function(){
			dataList = purcharManage.bean.dataList;
			
			if(dataList == null || dataList.length == 0){
				alert("类型树 初始化失败!~ 错误原因bean.dataList为空");
				return;
			}
			
			purcharManage.view.tree = $("#tree")[0];
			$(purcharManage.view.tree).tree({
				 ui:{
					theme_name:"apple"
				}, 
				   rules : {
			        droppable : [],
			        multiple : true,
			        deletable : "none",
			        dragrules   : "none",
			        draggable : "none"
			      },
			     plugins:{
			    	//添加右键菜单
			    	  contextmenu:{
						items:{
						create:false,
						rename:false,
						remove:false,
						//新增菜单
						addps:{
						label:"新增",
						//图标
						icon:"",
						//可见
						visible: 1,
						//动作fff
						action:function(NODE,TREEOBJ){
			    	  		TREEOBJ.select_branch(NODE);
							$("input[name=pst.parentId]").val($(NODE).attr("typeId"));
							$("input[name=pst.typeCode]").val($(NODE).attr("typeCode")+"-*");
							$("input[name=pst.typeCode]").focus();
							$("input[name=pst.typeName]").val("");
						},
						separator_before : true
						},
						removeps:{
							label:"删除",
							icon:"",
							visible:1,
							action:function(NODE,TREEOBJ){
								TREEOBJ.select_branch(NODE);
								$("input[name=doDelete]").click();
							},
							separator_before : true
						},
						updateps:{
							label:"修改",
							icon:"",
							visible:1,
							action:function(NODE,TREEOBJ){
								TREEOBJ.select_branch(NODE);
							},
							separator_before : true
						}
					}
				}
			     },
				data:{
					type:"json",
					 opts:{
                        static:[
						{data:"供求类型",
							attributes:{typeId:"root"},
							state:"open",
							children:dataList
						}
					]
				}
				}
				,
				callback:{
					//点击事件 绑定，点击节点传输节点的数据到右边的
					onselect:function(node,treeObj){
						purcharManage.view.showContent(node,treeObj);
					}
				}
			});
		},
		//显示节点内容
		showContent:function(node,treeObj){
			if($(node).attr("typeId") != "root"){
				$("#pcEditWin").find("input:text").each(function(){
					//设置 编辑窗口内的字段相应的值
					name = $(this).attr("name");
					value = $(node).attr(name.split(".")[1]);
					$(this).attr("value",value); 
				});
				$("input[name=orgTypeCode]").val($("input[name=pst.typeCode]").val());
			}
		},
		//美化按钮
		buttonstyle:function() {
			$("input:button",".btnBar2").button();
		},
		//树定位
		locationNode:function() {
			value = $("input[name=pst.typeCode]").val();
			if(value == null || value == "")
				return false;
			node = $("#"+value)[0];
			//遍历打开节点
			while(!$(node).length == 0){
				$.tree.focused().open_branch(node);
				node = $(node).parent("ul").parent("li")[0];
			}
			
		}
		
};


$(document).ready(init);