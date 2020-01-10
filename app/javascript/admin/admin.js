const admin_delete = () => {
  $('.del').click(function(){
    const id = $(this).attr('data-id')
    const datas = {id: id}
    $('#'+id).hide()

    $.ajax({
      url: "/admin/delete",
      type: "POST",
      headers: {
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      },
      dataType: 'json',
      data: datas,      //data: {foo: 'bar', cat: $(this).data('cat'), id: $(this).data('id')} ,
      success: function(data) {

        $('#'+data.id).hide()
      },
      error: function(data) {}
    })
  })

}


const listeAdd = () => {
  $('#addListe').click(function(){

    $(this).attr('hidden',true)
    $('.listeAjout').attr('hidden',false)
  })



}
export { admin_delete, listeAdd }
