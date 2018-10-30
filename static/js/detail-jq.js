$(function(){
	$("#menu-m,#menu-c").hover(function(){
			$("#menu-c").show();
		},
		function(){
			$("#menu-c").hide();
		})

	//小图width/大图width == 小区域width/大区域width
	$(".cloud-zoom-lens").width( $("#goods-zoom").width() * $(".mousetrap").width() / $("#cloud-zoom-big").width() );
	$(".cloud-zoom-lens").height( $("#goods-zoom").height() * $(".mousetrap").height() / $("#cloud-zoom-big").height() );
	
	//放大系数
	var scale = $("#cloud-zoom-big").width() / $("#goods-zoom").width();
	
	//在小图中移动
	$("#goods-zoom").mousemove(function(e){
		$(".cloud-zoom-lens").show(); //显示小区域
		$(".mousetrap").show(); //显示大区域
		
		
		var x = e.pageX - $("#goods-zoom").offset().left - $(".cloud-zoom-lens").width()/2;
		var y = e.pageY - $("#goods-zoom").offset().top - $(".cloud-zoom-lens").height()/2;
		
		//控制不超出左右边界
		if (x < 0){
			x = 0;
		}
		else if (x > $("#goods-zoom").width()-$(".cloud-zoom-lens").width()){
			x = $("#goods-zoom").width()-$(".cloud-zoom-lens").width();
		}
		//控制不超出上下边界
		if (y < 0){
			y = 0
		}
		else if (y > $("#goods-zoom").height()-$(".cloud-zoom-lens").height()) {
			y = $("#goods-zoom").height()-$(".cloud-zoom-lens").height();
		}
		
		//小区域移动
		$(".cloud-zoom-lens").css({left:x, top:y});
		
		//大图移动
		$("#cloud-zoom-big").css({left: -scale*x,top: -scale*y});
	})
	
	//移除小图
	$("#goods-zoom").mouseleave(function(){
		$(".cloud-zoom-lens").hide(); //隐藏小区域
		$(".mousetrap").hide(); //隐藏大区域
	})
	//鼠标点击和移入选中小图改变大图
	$(".picture-smallpic-s").on("click mouseenter","li",function(){
		var src = $(this).find('img').attr("src");
		$(this).find("a").css("border","1px solid red").parent().siblings().find("a").css("border","1px solid #ccc");
		$("#goods-zoom img").attr("src",src.replace('.jpg','_1.jpg'));
		$(".cloud-zoom-big").attr("src",src.replace('.jpg','_1.jpg'));
	})
	
	$("#item-nav").on("click","li",function(){
		var index = $(this).index();
		$(this).addClass("status-on").siblings().removeClass("status-on");
		$(".content-bd .feature-item").eq(index).show().siblings().hide();
	})
	
	
	//获取从首页传过来的id
	// location.search : 参数部门， 如:?id=1002&name=lisi
	var param = location.search.substring(1);
	var pid = getParams(param, "id");
//	console.log(pid);
	
	var arr = [];
	//获取json中的数据
	// $.get("static/json/index-detail.json", function(data){
	// 	var arr = data;
	// 	for (var i=0; i<arr.length; i++) {
	// 		var obj = arr[i]; //每个商品数据
	//
	// 		//找到id相同的商品后，就可以使用obj了
	// 		if (obj.id == pid) {
	// 			loadUI(obj);
	// 		}
	// 	}
	//
	// })
	
	// function loadUI(obj){
	// 	$(".goods-spic-url").attr("src", obj.picNum);
	// 	$(".cloud-zoom-big").attr("src",obj.picNum);
	// 	$(".pic1>img").attr("src",obj.pic1);
	// 	$(".pic2>img").attr("src",obj.pic2);
	// 	$(".pic3>img").attr("src",obj.pic3);
	// 	$(".pic4>img").attr("src",obj.pic4);
	// 	$(".pic5>img").attr("src",obj.pic5);
	// 	$(".pic6>img").attr("src",obj.pic6);
	// 	$(".pic7>img").attr("src",obj.pic1);
	// 	$(".goods-name").html( obj.name );
	// 	$(".yuan").html(obj.unit);
	// 	$(".price-num").html(obj.price);
	// 	$(".goods-status").html( "<s>麦包价：<b class='yuan'>"+obj.unit +"</b>"+obj.mbbPrice+"</s>" );
	// 	$(".mini-price").html(obj.unit+"<em>"+obj.price+"</em>");
	// 	$(".crumb-location").html("当前位置：<a href='index.html' target='_black'>麦包包</a> &gt; "+obj.name);
	//
	// 	//点击商品
	// 	$(".goods-btn-buy,.mini-btn-buy,.goods-btn-collect").click(function(){
	//
	// 		//将当前点击的商品数据加入购物车（cookie）
	// 		var arr2 = $.cookie("cart") ? JSON.parse($.cookie("cart")) : [];
	//
	// 		//判断原来的购物车中是否有相同商品
	// 		var isExist = false;
	// 		for (var i=0; i<arr2.length; i++) {
	// 			if (arr2[i].id == obj.id) {
	// 				arr2[i].num++;
	// 				isExist = true;
	// 				break;
	// 			}
	// 		}
	// 		if (isExist ==  false) {
	// 			obj.num = 1;
	// 			obj.checked = true; //是否选中， 默认选中
	// 			arr2.push(obj);
	// 		}
	//
	// 		//将arr2添加到cookie中
	// 		$.cookie("cart", JSON.stringify(arr2), {expires:30, path:"/"});
	//
	// 	})
	// }
	//
	
	
	//查找参数对应的值
	function getParams(str, name){
		var arr = str.split("&");
		for (var i=0; i<arr.length; i++) {
			var str1 = arr[i]; // id=1002 
			var arr1 = str1.split("=");
			if (arr1[0] == name) {
				return arr1[1];
			}
		}
		return "";
	}
	
	
	
	var num1 = 0;		
	var arr3 = JSON.parse($.cookie("cart"));
	for(var j=0;j<arr3.length;j++){
		var obj1 = arr3[j];
		num1 += obj1.num;
	}
	$(".down em").html(num1);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

})