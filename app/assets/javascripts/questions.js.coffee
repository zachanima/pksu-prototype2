jQuery ->
  $('.question:last-child').show()

  # Disable all submit buttons.
  $('.question input[type=submit]').attr('disabled', 'disabled')

  # Enable all submit buttons when radio button is clicked.
  $('.question :radio, .question :checkbox').click ->
    button = $(@).parents('form').find 'input[type=submit]'
    button.removeAttr 'disabled'
    button.removeAttr 'title'

  $('.question :checkbox').click ->
    form = $(@).parents('form')
    if form.find(':checkbox:checked').length == 0
      form.find('input[type=submit]').attr('disabled', 'disabled')
    

  # Color given/correct answer according to correctness
  $('.question form').submit ->
    $(@).addClass 'answered'
    $(@).find(':radio, :checkbox').attr('disabled', 'disabled')
    $(@).find('[type=submit]').css('visibility', 'hidden')
    next = $(@).parents('.question').prev()
    next.slideDown 500
    return false
