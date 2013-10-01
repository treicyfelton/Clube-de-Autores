$(document).ready ->
  $('#history_historytype').click ()->
    if $(@).val() == '1'
      $('.comic').css({'display': 'none'})
      $('form').find('.history').show()
    else
      if $(@).val() == '2'
        $('.history').css({'display': 'none'})
        $('form').find('.comic').show()
      else
        if $(@).val() == ''
          $('.history').css({'display': 'none'})
          $('.comic').css({'display': 'none'})

  count = 0
  $('.add').click ()->
    if count < 4
      count = count + 1
      $('#history_category_ids').clone().appendTo('.categories')
      if count == 4
        $('.add').css({'display': 'none'})    




   



















