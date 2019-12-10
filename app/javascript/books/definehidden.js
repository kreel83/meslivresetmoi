const definehidden = () => {
  const tag = $('#tag').attr('data-tag')
  if (tag != 'none') {
    $('#avertissement').attr('hidden', true)
    $('#btnNote').attr('hidden', false)
  }

}

const togglebtn = () => {
  $('#btnbuy').click(function() {
    $('.icons').toggle('slide')
    $('.icons').css('display','flex')
  })
}


export { definehidden, togglebtn }

