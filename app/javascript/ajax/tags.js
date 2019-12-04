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
      },
      error: function(data) {}
    })
  })
 })
}


const test = () => {
  $('.badge').click(function(){

    $('.badge').data('active',false)
    $('.badge').css('backgroundColor','light')
    $(this).data('active', true)
    $(this).css('backgroundColor','red')
    console.log($(this).data('cat'))
    const category = $(this).data('cat')

    const datas = {id: $(this).data('id'), cat: category}

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
        console.log(data)
      },
      error: function(data) {}
    })
  })
}

export {test}



