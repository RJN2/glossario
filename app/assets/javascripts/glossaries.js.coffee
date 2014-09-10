ready = ->
	$("h1#welcome-msg").click ->
  	$('section.page-map').toggle()

	$("#addTerm").on "show.bs.modal", ->
	  $(".super").addClass "blurred"

	$("#addTerm").on "shown.bs.modal", ->
		$("#term_term").focus()

	$("textarea#term_definition").keypress (e) ->
  	$("form#new_term").submit()  if e.which is 13

	$("#addTerm").on "hidden.bs.modal", ->
	  $(".super").removeClass "blurred"

	$('#term-edit').click ->
		$('.term-delete').toggle()

$(document).ready(ready)
$(document).on('page:load', ready)