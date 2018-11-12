$(function () {

    $.getJSON('../static/json/adv.json','',function (data) {
        $.each(data,function (i,item) {
            var $option = $('<option>')
            $option.html(item['name'])
            $('#sheng').append($option)

        })
        $('#shi').append($('<option>').html(data[0]['city'][0]['name']))
    })

$('#sheng').click(function () {
    $.getJSON('../static/json/adv.json','',function (data) {
        $('#shi option').remove()
        $.each(data,function (i,item){
            if(item['name']==$('#sheng').val()){
                $.each(item['city'],function (j,k) {
                    var $option = $('<option>')
                    $option.html(k['name'])
                    $('#shi').append($option)
                    city=k
                })
            }
        })
        $('#xian option').remove()
        $('#xian').append($('<option>').html(city['area'][0]))
console.log($('#xian').html())
        $('#shi').click(function () {
            $('#xian option').remove()
            $.each(city['area'],function (x,y) {
                var $option=$('<option>')
                $('#xian').append($option.html(y))
            })



})
    })



})





  $('#on').click(function () {
         $.get('/order/',{'sheng':$("#sheng").val(),'shi':$("#shi").val(),'xian':$("#xian").val(),'detail':$("#detail").val()},function (response) {
             console.log(1)
             window.open('/orderdetail/',target='_self')
         })
    })















})