$ ->
  $("#star-rating").rating (vote, event) ->
    
    # we have vote and event variables now, lets send vote to server.
    $.ajax
      url: "rate"
      type: "get"
      data: rate: vote, history: (window.location.href).split("\/")[4]; 


$ ->
  $("#heart-fav").fav (checked, event) ->
    
    $.ajax
      url: "favoriteChecked"
      type: "get"
      data: op: checked, h: (window.location.href).split("\/")[4]; 



  
  
  
  




	
	
	
	
