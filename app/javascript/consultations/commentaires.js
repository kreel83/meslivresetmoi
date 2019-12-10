
const displaycomment = () => {
  $('.comment').click(function(){
    const d= $(this).parent().parent().parent().parent().next()
    console.log(d)
    $(this).parent().parent().parent().parent().next().toggle('slide')
  })
}

export { displaycomment }
