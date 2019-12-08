const definehidden = () => {
  const tag = $('#tag').attr('data-tag')
  if (tag != 'none') {
    $('#avertissement').attr('hidden', true)
    $('#btnNote').attr('hidden', false)
  }

}

export { definehidden }

