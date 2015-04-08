/**
 * new product type js file
 * 
 * @author hooxin
 */

var delay_close = null;
function hover_active()
{
	var _self = this;
	var pos = $(_self).offset();
	var sub_left = parseInt(pos.left) + $(_self).width() + 5;
	var sub_top = parseInt(pos.top);
	
	
	clearTimeout(delay_close);
	$('.pop_subentry').css('left',sub_left+'px').css('top',sub_top+'px');
	
	$('.pop_subentry').children().addClass('hidden');
	$('div[id=subentry_' + $(_self).attr('id').split('_')[1] + ']').removeClass('hidden');
	$('.pop_subentry').removeClass('hidden');
}

function hover_out()
{
	var _self = this;
	
	delay_close = setTimeout(function()
	{
		$('.pop_subentry').addClass('hidden');
		
	}, 1000);
}
function hover_active_pop()
{
	clearTimeout(delay_close);
	$('.pop_subentry').removeClass('hidden');
}

$(function()
{
	$('.extend_item').hover(hover_active, hover_out);
	$('.pop_subentry').hover(hover_active_pop, hover_out);
	
});