const range_init = () => {
  $('.boite').on('click',function() {
    const id = $(this).parent().parent().attr('id')
    $('#'+id+' .boite').removeClass("actived").addClass('desactived')
    const pos = $(this).data('id')
    $(this).parent().parent().attr('data-pos', pos)
    for (let i=0; i<pos; i++) {
      $('#'+id+' .boite').eq(i).addClass("actived").removeClass('desactived')
    }
    const criteria = $('.criteria')
    console.log(criteria)
    let s= ''
    criteria.each(function() {
      s = s + $(this).attr('data-pos') + '/'
    })
    s = s + $('#99').attr('data-pos')
    const datas = {note: s}
    $.ajax({
      url: "/books/"+$('#reading').val()+'/notation',
      type: "POST",
      headers: {
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      },
      dataType: 'json',
      data: datas,
      //data: {foo: 'bar', cat: $(this).data('cat'), id: $(this).data('id')} ,
      success: function(data) {
        console.log(data)

        //location.href = "/books/"+data.status.reading+"/notations"
      },
      error: function(data) {}
    })

  })
}






export { range_init}


