$(document).ready ->
  $('#mod_select').change ->
    window.location.href = "/all/pending" if $(@).val() == '1'