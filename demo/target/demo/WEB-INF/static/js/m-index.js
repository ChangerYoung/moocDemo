$(function(){
	/*课程章节列表*/

	$('.c-chapter h3').click(function(event){
		$(this).find('i.right').eq(0).toggleClass('fa-minus').toggleClass('fa-plus');
		$(this).parent().next('ul').fadeToggle();
	})
})