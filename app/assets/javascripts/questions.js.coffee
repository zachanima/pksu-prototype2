jQuery ->
  $('.question:last-child').show()
  $(':radio:not(:checked)')

  # Disable all submit buttons.
  $('.question input[type=submit]').attr('disabled', 'disabled')

  # Enable all submit buttons when radio button is clicked.
  $('.question :radio').click ->
    button = $(@).parents('form').find 'input[type=submit]'
    button.removeAttr 'disabled'
    button.removeAttr 'title'

  # Color given/correct answer according to correctness
  $('.question form').submit ->
    $(@).addClass 'answered'
    $(@).find(':radio').attr('disabled', 'disabled')
    $(@).find('[type=submit]').css('visibility', 'hidden')
    next = $(@).parents('.question').prev()
    next.slideDown 500
    return false
