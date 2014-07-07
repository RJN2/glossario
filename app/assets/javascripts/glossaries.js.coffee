ready = ->
	$("h1#welcome-msg").click ->
  	$('section.page-map').toggle()
  	return

  $('a#addGlossary').click ->
  	$('form#new_term').show()
  	return

	$("#addGlossary").on "show.bs.modal", ->
	  $(".super").addClass "blurred"
	  return

	$("#addGlossary").on "shown.bs.modal", ->
	  $("input#glossary_title").focus()
	  return

	$("#addGlossary").on "hidden.bs.modal", ->
	  $(".super").removeClass "blurred"
	  return

$(document).ready(ready)
$(document).on('page:load', ready)