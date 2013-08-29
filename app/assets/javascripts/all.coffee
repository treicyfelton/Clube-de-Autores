$(document).ready ->
  
  # find the elements to be eased and hook the hover event
  $("div.jimgMenu ul li a").hover (->
    
    # if the element is currently being animated
    if $(this).is(":animated")
      $(this).stop().animate
        width: "50px"
      ,
        duration: 450
        easing: "easeOutQuad"
        complete: "callback"

    else
      
      # ease in quickly
      $(this).stop().animate
        width: "195px"
      ,
        duration: 400
        easing: "easeOutQuad"
        complete: "callback"

  ), ->
    
    # on hovering out, ease the element out
    if $(this).is(":animated")
      $(this).stop().animate
        width: "150px"
      ,
        duration: 400
        easing: "easeInOutQuad"
        complete: "callback"

    else
      
      # ease out slowly
      $(this).stop(":animated").animate
        width: "150px"
      ,
        duration: 450
        easing: "easeInOutQuad"
        complete: "callback"


