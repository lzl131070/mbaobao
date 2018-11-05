$(function(){
				
	//获取购物车的cookie数据,并用节点显示
	refresh();
	function refresh() {
		
		var arr = $.cookie("cart");
		if (arr && arr.length > 2) {
			arr = JSON.parse(arr);
			
			//先清除旧节点
			$(".goods-list tbody").empty();
			
			//再添加新节点
			var totalPrice = 0; //总价
			var num = 0; //总件数
			//遍历数组
			var shtml ='';
			for (var i=0; i<arr.length; i++) {
				var obj = arr[i];
				
				//创建li节点
				shtml += "<tr>"+
							"<td><a href='detail.html'><img src='"+ obj.headImg+"' width='80' height='80' title='"+obj.name+"'></a></td>"+
							"<td style='text-align: left;'><div class='goods-info'><p class='g-title'><a href='detail.html?id="+ obj.id +"' class='goods-txt-link'>"+obj.name+" </a></p><p class='g-sku'>"+obj.id+"</p></div></td>"+
							"<td>"+obj.unit+obj.price+"</td>"+
							"<td><div class='quantity'><a href='javascript:void(0);' class='reduce' title='购买数量-1'></a><input type='text' class='input-quantity' value='"+obj.num+"' autocomplete='off'></input><a href='javascript:void(0);' class='add' title='购买数量+1'></a></div><div class='quantity-tip' id='quantity-tip'><p>一次最多购买5件</p></div></td>"+
							"<td><div class='price1' id='price1'>"+obj.unit+(obj.price*obj.num)+".00</div></td>"+
							"<td><a href='javascript:void(0);' class='del-goods'>删除</a></td>"+
						"</tr>";
				//计算总价
				totalPrice += obj.price * obj.num;
				num += obj.num;
			}
			$(".goods-list tbody").append(shtml);
			
			//显示总价
			$("#countprices").html("￥" + totalPrice.toFixed(2));
			$("#zgprice").html("￥" + totalPrice.toFixed(2));
			$("#countsnub").html(num +"件");
		}
		else {
			$(".cart-pick-other").show();
		}
	}
	
	//+
	$("tbody").on("click", ".add", function(){
		var index = $(this).index("tbody .add");
		
		//获取cookie并修改
		var arr = JSON.parse($.cookie("cart"));
		arr[index].num++;
		
		
		//覆盖原来的cookie
		$.cookie("cart", JSON.stringify(arr), {expires:30, path:"/"});
		
		//刷新节点数据
		refresh();
	})
	$('tbody').mouseleave
	//-
	$("tbody").on("click", ".reduce",function(){
		var index = $(this).index("tbody .reduce");
		
		//获取cookie并修改
		var arr = JSON.parse($.cookie("cart"));
		arr[index].num--;
		if (arr[index].num < 1) {
			arr[index].num = 1;
		}
		
		//覆盖原来的cookie
		$.cookie("cart", JSON.stringify(arr), {expires:30, path:"/"});
		
		
		//刷新节点数据
		refresh();
	})
	
	
	//删除
	$("tbody").on("click", ".del-goods", function(){
		var index = $(this).index();
		
		//获取cookie并修改
		var arr = JSON.parse($.cookie("cart"));
		arr.splice(index, 1); //删除数组arr的第index个
		
		//覆盖原来的cookie
		$.cookie("cart", JSON.stringify(arr), {expires:30, path:"/"});
		
		$(this).parents('tr').remove();
		var tr_length = $('.goods-list tbody tr').size();
		if(tr_length == 0){
			$(".cart-pick-other").show();
		}
		var totalPrice =0;
		var num = 0;
		for(var i=0;i<arr.length;i++){
			var obj = arr[i];
		totalPrice += obj.price * obj.num;
		num += obj.num;
		}
		
		$("#countprices").html("￥" + totalPrice.toFixed(2));
		$("#zgprice").html("￥" + totalPrice.toFixed(2));
		$("#countsnub").html(num +"件");
		//刷新节点数据
		refresh();
		
	})
	var price=$('.goods-list thead tr td').eq(2).html()
	var nub=$('.goods-list thead tr td').eq(3).html()
	var moeny=price*nub
	$('.goods-list thead tr td').eq(4).html(moeny)
	$('#countsnub').html($('.goods-list-td4').html()+'件')
	$('tr .total-price').html('￥'+$('.goods-list-td4').html()*$('.goods-list-td3').html())
	$('#countprices').html('￥'+$('.goods-list-td4').html()*$('.goods-list-td3').html())
	$('.goods-list thead tr .goods-list-td6 span').eq(0).click(function () {
		var a = $(this).parent().prev().prev().html()
		a--
		$('#countsnub').html(a+'件')

		if (a!=0){
$(this).parent().prev().prev().html(a)
					$(this).parent().prev().html(a*$(this).parent().prev().prev().prev().html())
		$.cookie('num',a,{expires:3,path:'/'})
				$('tr .total-price').html('￥'+a*$(this).parent().prev().prev().prev().html())
		$('#countprices').html('￥'+a*$(this).parent().prev().prev().prev().html())
		}
		else {
			$(this).parent().parent().remove()
			$.cookie('good','',{expires:-1,path:'/'})
			$.cookie('num','',{expires:-1,path:'/'})

		}
    })

	$('.goods-list thead tr .goods-list-td6 span').eq(1).click(function () {
		var a = $(this).parent().prev().prev().html()
		a++
		$(this).parent().prev().prev().html(a)
		$.cookie('num',a,{expires:3,path:'/'})
		$('#countsnub').html(a+'件')
		$('tr .total-price').html('￥'+a*$(this).parent().prev().prev().prev().html())
		$('#countprices').html('￥'+a*$(this).parent().prev().prev().prev().html())
		$(this).parent().prev().html(a*$(this).parent().prev().prev().prev().html())
    })

})