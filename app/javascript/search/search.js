

const searchfct = () => {
  $('.card img').click(function(){
    $('#id').val($(this).data('id'))
    $('#form').submit()
  })
}

const searchAuthor = () => {
  $('.card-author').click(function(){
    $('#author').val($(this).data('author'))

  })
}



export { searchfct, searchAuthor }

