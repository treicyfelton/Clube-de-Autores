$(document).ready ->
  $('#admin_select').change ->
    window.location.href = "/admin/categories" if $(@).val() == '1' 
    window.location.href = "/admin/rules/1/edit" if $(@).val() == '2'
    window.location.href = "/admin/users" if $(@).val() == '3'
    window.location.href = "/admin/histories" if $(@).val() == '4'