const searchfct = () => {
  $('.card img').click(function(){
    $('#id').val($(this).data('id'))
    $('#form').submit()
  })
}

export { searchfct }

