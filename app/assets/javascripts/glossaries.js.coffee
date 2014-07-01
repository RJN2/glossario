ready = ->
	$("h1#welcome-msg").click ->
  	$('section.page-map').toggle()
  	return

$(document).ready(ready)
$(document).on('page:load', ready)