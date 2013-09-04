$ ->
  $("#star-rating").rating (vote, event) ->
    
    $.ajax
      url: "rate"
      type: "post"
      data: rate: vote, history: (window.location.href).split("\/")[4]; 


$ ->
  $("#heart-fav").fav (checked, event) ->

    $.ajax
      url: "favoriteChecked"
      type: "post"
      data: op: checked, h: (window.location.href).split("\/")[4]; 



  
  
  
  




	
	
	
	
