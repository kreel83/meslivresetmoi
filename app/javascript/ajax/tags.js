
const like = () => {
  $('.like').click(function(){
    const action = $(this).attr('data-action')
    const id = $(this).parent().parent().attr('id')
    const datas = {id: id, act: action}

    $.ajax({
      url: "/books/"+id+'/like',
      type: "POST",
      headers: {
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      },
      dataType: 'json',
      data: datas,
      //data: {foo: 'bar', cat: $(this).data('cat'), id: $(this).data('id')} ,
      success: function(data) {
        const action = data.like
        const nb = data.add
        const id = data.id

        $(`#${id}`).find(`[data-action='${action}']`).text(nb)




        //location.href = "/books/"+data.status.reading+"/notations"
      },
      error: function(data) {}
    })
  })

}




const test = () => {
  $('.badge').click(function(){

    $('.badge').attr('data-active', 'false');

    $(this).attr('data-active', 'true');

    const category = $(this).data('cat')
    const reading = $(this).data('reading')
    const tag = $('#tag').attr('data-tag')


    //console.log(etat)
    const datas = {id: $(this).data('reading'), cat: category, reading: reading, etat: tag}

    $.ajax({
      url: "/books/"+$(this).data('reading')+'/tags',
      type: "POST",
      headers: {
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      },
      dataType: 'json',
      data: datas,
      //data: {foo: 'bar', cat: $(this).data('cat'), id: $(this).data('id')} ,
      success: function(data) {
        $('#category').html(category)
        console.log(data)
        if (data.status.etat == "none") {
          location.href = "/books/"+data.status.reading+"/notations"
        } else {
          $('#tag').html(data.status.cat)
        }

        //location.href = "/books/"+data.status.reading+"/notations"
      },
      error: function(data) {}
    })
  })
}

export {test, like}



