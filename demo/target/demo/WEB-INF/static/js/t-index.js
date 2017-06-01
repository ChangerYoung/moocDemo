$(function(){

	/*个人设置的下拉框*/
	$('.udown-tip').click(function(){
		$('.udown-message').toggle(500);
	})

	$('.btn-click').click(function(){
		if($(this).next('.hide-field').hasClass('active')){
            $(this).next('.hide-field').removeClass('active')
		}
		else{
			$(this).next('.hide-field').addClass('active')
		}
	})

	/*章节显示隐藏*/
	$('.fa-chevron-circle-down').click(function(event){
		$(this).eq(0).toggleClass('fa-chevron-circle-up').toggleClass('fa-chevron-circle-down');
		$(this).parent().parent().next('ul').fadeToggle();
	})

	/*创建新的课程*/
/*	$('#lala').click(function(){
		console.log('aaaa')
		$('.create-new-chpter').modal('show');
	})*/
})