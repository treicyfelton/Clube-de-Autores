$(document).ready ->
  $('#history_historytype').click ()->
    if $(@).val() == '1'
      $('.comic').css({'display': 'none'})
      $('form').find('.history').show()
    else
    	if $(@).val() == '2'
        $('.history').css({'display': 'none'})
        $('form').find('.comic').show()


  $('.combo1').click ->
    $('.combo1').css({'display': 'none'})
    $('form').find('.category2').show()