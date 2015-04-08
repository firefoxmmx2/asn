			function expand(el, openOnly)
			{
				childObj = $("*[menuId="+el+"]").get(0);
				if(!childObj) return;

				if (childObj.style.display == 'none')
				{
					childObj.style.display = 'block';
					document.getElementById("parent"+el).className = "left-title-close";
				}
				else if(!openOnly)
				{
					childObj.style.display = 'none';
					document.getElementById("parent"+el).className = "left-title";
				}

				return;
			}

	// 自动展开菜单
	$(document).ready(function(){
		var winHref=window.location.href;
		$("a").each(function() {
			// 判断是否当前链接
			var isCurrentLink=false;
			if(winHref==this.href){  // 比较href
				isCurrentLink=true;
			}else{  // 比较iref
				var endPos=winHref.indexOf("?");
				if(endPos<1) endPos=winHref.length;
				var lastSection= winHref.substr(0, endPos);
				lastSection=lastSection.substr(winHref.lastIndexOf("/")+1);
				var iref=$(this).attr("iref");
				if(iref){
					var list=iref.split(";");
					for(var i=0; i<list.length; i++){
						if(lastSection==list[i]){
							isCurrentLink=true;
							break;
						}
					}
				}
			}
			// 展开菜单，并设置当前链接属性
			if(isCurrentLink){
				var container=$(this).parents("*[menuId]");
				expand(container.attr("menuId"), true);
				var p=$(this).parents(".left-link");
				p.attr("class", "left-link-selected");
			}
		});
	});

