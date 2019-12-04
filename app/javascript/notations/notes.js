const range_init = () => {
  $('.boite').on('mouseover',function() {
    const id = $(this).parent().parent().attr('id')
    console.log(id)
    $('#'+id+' .boite').removeClass("actived").addClass('desactived')
    const pos = $(this).data('id')
    for (let i=0; i<pos; i++) {
      console.log(i)
      $('#'+id+' .boite').eq(i).addClass("actived").removeClass('desactived')
    }

  })
}


export { range_init }


