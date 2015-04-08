/**
 * this is a ellipsis plugin for jquery 這是一個實現多餘字符省略號效果的插件 基於JQUERY
 * 
 * @author hooxin
 * 
 */

if(JQELLIPSIS == undefined){
	var JQELLIPSIS = 1;
	
	(function($)
		{
			$.fn.ellipsis = function(enableUpdating)
			{
				var s = document.documentElement.style;
				if (!('textOverflow' in s || 'OTextOverflow' in s))
				{
					return this.each(function()
					{
						var el = $(this);
						if (el.css("overflow") == "hidden")
						{
							var originalText = el.html();
							var w = el.width();
							
							var t = $(this.cloneNode(true)).hide().css({
							'position' : 'absolute',
							'width' : 'auto',
							'overflow' : 'visible',
							'max-width' : 'inherit'
							});
							el.after(t);
							
							var text = originalText;
							while (text.length > 0 && t.width() > el.width())
							{
								text = text.substr(0, text.length - 1);
								t.html(text + "...");
							}
							el.html(t.html());
							
							t.remove();
							
							if (enableUpdating == true)
							{
								var oldW = el.width();
								setInterval(function()
								{
									if (el.width() != oldW)
									{
										oldW = el.width();
										el.html(originalText);
										el.ellipsis();
									}
								}, 200);
							}
						}
					});
				}
				else
					return this;
			};
			
		})(jQuery);
}

