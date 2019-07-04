
$(document).ready(function(){
  
  $('li.hd_menu_tit').mouseleave(function(){
  $(this).find('div.hd_menu_list,div.hd_Shopping_list').show();//you can give it a speed
  });
  $('li.hd_menu_tit').mouseleave(function(){
  $(this).find('div.hd_menu_list,div.hd_Shopping_list').hide();
  });
 $(function(){
	$(".fixed_qr_close").click(function(){
		$(".mod_qr").hide();
	})
});
//产品边框样式
 $("li.gl-item").hover(function(){
			$(this).addClass("hover");
			//$(this).children(".dorpdown-layer").attr('class','');
		},function(){
			$(this).removeClass("hover");
			//$(this).children(".dorpdown-layer").attr('class','');
		}
	);
 //购物车
	 $("div.hd_Shopping_list").hover(function(){
		 $(this).addClass("hover");
		 //$(this).children(".dorpdown-layer").attr('class','');
	 },function(){
			$(this).removeClass("hover");
			//$(this).children(".dorpdown-layer").attr('class','');
		}
	);
 //支付方式
 $("#payment").hover(function(){
			$(this).addClass("hover");
			//$(this).children(".dorpdown-layer").attr('class','');
		},function(){
			$(this).removeClass("hover");
			//$(this).children(".dorpdown-layer").attr('class','');
		}
	);
});

$(document).ready(function(){
	$("#nav li.no_sub").hover(function(){
			$(this).addClass("hover1");
		},function(){
			$(this).removeClass("hover1");
		}
	);
});
$(document).ready(function(){
		$(".clearfix li.list_name, li.list_name").hover(function(){
			$(this).addClass("hd_menu_hover");
			$(this).children("ul li.list_name_bg").attr('class','');
		},function(){
			$(this).removeClass("hd_menu_hover");
			$(this).children("ul li.list_name_bg").attr('class','');
		}
	);
$("#allSortOuterbox li").hover(function(){
		$(this).find(".menv_Detail").show();
	},function(){
		$(this).find(".menv_Detail").hide();
});
	$("#allSortOuterbox li.name").hover(function(){

			$(this).addClass("hover_nav");

		},function(){
			$(this).removeClass("hover_nav" );
		});
		$("div.display ").hover(function(){
		$(this).addClass("hover");
	},function(){
		$(this).removeClass("hover" );
});
});
$(document).ready(function(){
$("#lists li").hover(function(){
		$(this).find(".Detailed").show();
	},function(){
		$(this).find(".Detailed").hide();
});
	$("#lists li").hover(function(){

			$(this).addClass("hover_nav");

		},function(){
			$(this).removeClass("hover_nav" );
		}
	);
});
/**********鼠标移动效果************/
$(document).ready(function(){
	$("ul.products").hover(function() {
		$(this).find("#cell_12428").stop()
		.animate({right: "0", opacity:1}, "fast")
		.css("display","block")

	}, function() {
		$(this).find("#cell_12428").stop()
		.animate({right: "0", opacity: 0}, "fast")
	});
});
$(window).scroll(function() {
		var topToolbar = $("#dd_Section");
		var headerH = $("#Group_outerHeight").outerHeight();
		var headers = $("#header_outerHeight").outerHeight();
		var scrollTop =$(document.body).scrollTop();
			if( scrollTop >= headerH + headers ){
				topToolbar.stop(false,true).addClass("fixToTop");
			}else if( scrollTop < headerH + headers ){
				topToolbar.stop(false,true).removeClass("fixToTop");
			}
});
/********************订单js******************/
$(document).ready(function(){
	 $('#select').find('ul').click(function(){
	$('#select').find('ul').removeClass('active');
	$(this).addClass('active');
  });
   $("#select ul").hover(function(){
			$(this).addClass("hover");
			//$(this).children(".dorpdown-layer").attr('class','');
		},function(){
			$(this).removeClass("hover");
			//$(this).children(".dorpdown-layer").attr('class','');
		}
	);
	   $(".dowebok li").hover(function(){
			$(this).addClass("hover");
			//$(this).children(".dorpdown-layer").attr('class','');
		},function(){
			$(this).removeClass("hover");
			//$(this).children(".dorpdown-layer").attr('class','');
		}
	);
});
/*********************点击事件*********************/
$( document).ready(function(){
  $('.fixed_bar').find('li').click(function(){
	$('.fixed_bar').find('li').removeClass('active');
	$(this).addClass('active');
  });
});
/***********************商品分类顶部浮动固定层菜单栏**************************/
$(window).scroll(function() {
		var topToolbar = $("#ProductMenu");
		var headerH = $("#Preferential_AD").outerHeight();
		var headers = $("#header_outerHeight").outerHeight();
		var scrollTop =$(document.body).scrollTop();
			if( scrollTop >= headerH + headers ){
				topToolbar.stop(false,true).addClass("fixToTop");
			}else if( scrollTop < headerH + headers ){
				topToolbar.stop(false,true).removeClass("fixToTop");
			}
});



