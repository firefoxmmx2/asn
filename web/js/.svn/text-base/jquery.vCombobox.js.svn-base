/*
vCombobox 1.0.2 (2009-08-20)

Copyright (c) 2009 Vencislav Dzhambazov (http://venci.vsnet.org)
Dual licensed under the MIT (MIT-LICENSE.txt) and GPL (GPL-LICENSE.txt) licenses.

Built upon jQuery 1.3.2 (http://jquery.com)

Syntax: $(element).vCombobox();
*/
(function($) {
  $.fn.vCombobox = function() {
    var xClass = 'vComboboxClass';		
    var childInput=false;
    var childOver=false;
    
    $(this).bind('focus', function() {
      if (!childInput) {
        $(this).after('<input type="text" value="'+this.options[this.selectedIndex].text+'"/>').next().attr("class",$(this).attr("class")).width(($(this).width()-2)+"px");
        childInput=true;
        var temp = $(this).offset();
	$(this).css( { "position":"absolute", "top":(temp.top+$(this).height()+4)+"px" } ).attr("size","6");
        $(this).next().bind("mouseover", function() { childOver = true; });
        $(this).next().bind("mouseout", function() { childOver = false; });
        $(this).next().bind("blur", function(e) { if (!childOver) vComboboxHide($(this)); });
        $(this).next().bind("keydown", function(e) { if (e.keyCode==9) vComboboxHide($(this)); });
        $(this).next().bind("keypress", function(e) { if (e.keyCode==13) { if ($(this).prev().attr("value")) $(this).attr("value",$(this).prev().attr("value")); vComboboxHide($(this)); } });
        $(this).next().bind("keyup", function(e) {
	  if (e.keyCode==40) { $(this).prev().attr("selectedIndex",$(this).prev().attr("selectedIndex")+1); $(this).attr("value",$(this).prev().attr("value")); }
	  else if (e.keyCode==38) { $(this).prev().attr("selectedIndex",$(this).prev().attr("selectedIndex")-1); $(this).attr("value",$(this).prev().attr("value")); }
          else {
            var temp=$(this).attr("value");
            if (temp) {
              $(this).prev().attr("selectedIndex","-1");
              var temp2=$(this).prev().attr("options").length;
              var temp1=$(this).prev().attr("options");
              for (i=0;i<temp2;i++) if (temp1[i].value.indexOf(temp)===0) { $(this).prev().attr("selectedIndex",i); break; }
            }
          }
        });
        $(this).next().focus().select();
      }
    });
    $(this).bind("blur", function(e) { if (childInput && !childOver) vComboboxHide($(this).next()); });
    $(this).bind('mouseover', function() { childOver = true; });
    $(this).bind('mouseout', function() { childOver = false; });
    $(this).bind('click', function() { $(this).next().attr("value",this.options[this.selectedIndex].text); vComboboxHide($(this).next()); });

    function vComboboxHide(ele) {
      temp=ele.prev();
      if (temp.attr("selectedIndex")<0 || ele.attr("value")!=temp.attr("value")) {
        temp.prepend('<option value="'+ele.attr("value")+'">'+ele.attr("value")+'</option>');
        temp.attr("selectedIndex","0");
      }
      temp.attr("size","1").css( { "position":"static" } ).change();
      ele.remove();
      childInput=false;
    }
  }	
})(jQuery);
