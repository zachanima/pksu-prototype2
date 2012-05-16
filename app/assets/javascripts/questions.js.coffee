jQuery ->
  $('.question:last-child').show()

  # Disable all submit buttons.
  $('.question input[type=submit]').attr('disabled', 'disabled')

  # Enable all submit buttons when radio button is clicked.
  $('.question :radio').click ->
    button = $(@).parents('form').find 'input[type=submit]'
    button.removeAttr 'disabled'
    button.removeAttr 'title'

  # Color given/correct answer according to correctness
  $('.question form').submit ->
    answer = $(@).find ':radio:checked'
    text = answer.siblings('label').html()
    header = answer.parents('.question').children 'h1'

    if (answer.attr('value') == 'true')
      header.after('<span class="correct">' + text + '</span>')
    else
      correct = $(@).find(':radio[value=true]').siblings('label').html()
      header.after('<span class="correct">' + correct + '</span>')
      header.after('<span class="incorrect">' + text + '</span>')


    $(@).siblings('h1').css('color', '#999')
    $(@).siblings('a').css('display', 'block')
    next = $(@).parents('.question').prev()
    next.slideDown 500
    $(@).remove()
    return false
