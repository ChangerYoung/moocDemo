$(function(){
	/*banner*/
	function mybanner(name1,name2,timer){
	var name3=name1+" ul li";
	console.log(name1+name2+name3)
	$(name3).eq(0).show();//等价于$(".banner .show ul li").eq(index)
	var speed = timer,iNum = 0;
	$(name2+" a").bind('click',function(){//focus　a绑定了click事件
		var aIndex = $(name2+" a").index(this);//取到当前值的索引
		$('.on').removeClass('on');//去除class -on
		$(this).addClass('on');//当前值被选中
		$(name3).fadeOut().eq(aIndex).fadeIn();//对应索引的li显示
		iNum = aIndex;//记录下当前的索引值
	})
	var autoPlay = function(){//图片的自动播放
		iNum++;//索引值自增，达到li的长度之后归0
		if(iNum == $(name3).length){
			iNum=0;
		}
		$('.on').removeClass('on');
		$(name2+" a").eq(iNum).addClass('on');//a对应的索引，被选中
		$(name3).fadeOut().eq(iNum).fadeIn(speed/10);//对应的li显示		
	};
	var timer = setInterval(autoPlay,speed);//设置定时器，也可以在函数后面，绑定时间
	$(name1+name2).hover(function(){//鼠标悬停时，清除定时器
		clearInterval(timer);
	},function(){//鼠标移除时，继续绑定计时器
		timer = setInterval(autoPlay,speed);
	});

}
   mybanner('.show','.focus',5000);

/*个人设置的下拉框*/
$('.udown-tip').click(function(){
	$('.udown-message').toggle(500);
})

/*首页导航点击*/
$('.main-botnav li').click(function(){
	$(this).siblings().removeClass('a-active');
	$(this).addClass('a-active');
})

/*切换*/
$('.click-tag').click(function(){
	console.log('aaaa');
	console.log($(this).parents('.course-part-line').hasClass('h-auto'));
	if($(this).parents('.course-part-line').hasClass('h-auto')){
       $(this).parents('.course-part-line').removeClass('h-auto');
	}
	else{
	   $(this).parents('.course-part-line').addClass('h-auto');
       $(this).text('隐藏更多');

	}
})

/*课程章节列表*/

$('.c-chapter h3').click(function(event){
   $(this).find('i.right').eq(0).toggleClass('fa-minus').toggleClass('fa-plus');
   $(this).parent().next('ul').fadeToggle();
})


})