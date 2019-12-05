const badge = () => {
 badges = document.querySelectorAll('.badge')
 console.log(badges)
 badges.forEach((badge) => {
   badge.addEventListener('click',(event) => {
    badges.forEach((b) => {
      b.style.backgroundColor = 'lightgray'
      b.dataset.active = false
    })
    badge.style.backgroundColor = 'blue'
    badge.dataset.active = true
    Rails.ajax({
      url: "/books/"+badge.dataset.id+"/tags/"+badge.dataset.cat,
      type: "GET",
      headers: { "Content-Type" : "application/json" },
      dataType: 'json',
      //data: {foo: 'bar', cat: badge.dataset.cat, id: badge.dataset.id} ,
      success: function(data) {
        console.log(data)
        $('#category').html(badge.dataset.cat)
      },
      error: function(data) {}
    })
  })
 })
}



const getTag = () => {

}


const test = () => {
  $('.badge').click(function(){

    $('.badge').attr('data-active', 'false');

    $(this).attr('data-active', 'true');

    const category = $(this).data('cat')
    const reading = $(this).data('reading')
    const tag = $('#tag').html().trim()


    //console.log(etat)
    const datas = {id: $(this).data('id'), cat: category, reading: reading, etat: tag}

    $.ajax({
      url: "/books/"+$(this).data('id')+'/tags',
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
        if (data.status.etat == "[]") {
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

export {test}



