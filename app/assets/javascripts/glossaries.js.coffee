ready = ->
	$("h1#welcome-msg").click ->
  	$('section.page-map').toggle()

	$("#termForm").on "show.bs.modal", ->
	  $(".super").addClass "blurred"

	$("#termForm").on "shown.bs.modal", ->
		$("#term_term").focus()

	$("textarea#term_definition").keypress (e) ->
  	$("form#new_term").submit()  if e.which is 13

	$("#termForm").on "hidden.bs.modal", ->
	  $(".super").removeClass "blurred"

	$('#edit-terms').click ->
		$('.term-delete').toggle()
		$('.term-text').toggleClass('term-edit')

$(document).ready(ready)
$(document).on('page:load', ready)