$(function () {
    $('.detail').click(function () {
        var $that = $(this)
        isid = $(this).parent().attr('isid')
        console.log(isid)
        $.get('/getorder/',{'isid':isid},function (response) {
            console.log(response.listgood)


            for(i in response.listgood){
$that.parent().parent().parent().append($('<div class="showgood">'))
                 $that.parent().parent().parent().find('div').append($('<span>').html(response.listgood[i][0]))
                $that.parent().parent().parent().find('div').append($('<span>').html($('<img>').attr('src',response.listgood[i][1])))
                $that.parent().parent().parent().find('div').append($('<span>').html(response.listgood[i][2]))
                $that.parent().parent().parent().find('div').append($("<span>").html(response.listgood[i][3]))
                 $that.parent().parent().parent().find('div').append($("<span>").html('商品总价'+response.listgood[i][2]*response.listgood[i][3]))
                $that.parent().parent().parent().find('div').append($("<span>").html('收起'))
    $('.showgood span').on('click',function () {
            $(this).parent().remove()
        })
            }
        })

    })



$('.pay').click(function () {
    var num = $(this).attr('num')
    $.get('/pay/',{'num':num},function (response) {
         window.open(response['alipay_url'], target='_self')
    })
})


$('.concer').click(function () {
    var isid = $(this).parent().attr('isid')
    var $that=$(this)
    console.log(isid)
    $.get('/concer/',{'isid':isid},function (response) {
        console.log(1)
$that.parent().parent().remove()

    })
})































})