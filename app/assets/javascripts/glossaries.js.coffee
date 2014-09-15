ready = ->
	$('#debug_time').click ->
		$('.debug_dump').toggle();

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

	$.EditLinks = (options) ->
		console.log("working")
		base = this
		base.options = []
		
		base._build = ->
			$.getJSON gon.glossary, (data) ->
				$.each data, (i, term) ->
 					term_links =
 						edit_path: term.edit_path
 						show_path: term.show_path
 					base.options.push term_links
 					return
 				console.log(base.options)
 				return
 		return
 		base._build()
		return

	$.EditLinks()

	$('#edit-terms').click ->
		$('.term-delete').toggle()
		$('.term-text').toggleClass('term-edit')
		$('.term-text').each ->
			glossary = $(this).data('glossary')
			term = $(this).data('term')
			if $(this).hasClass('term-edit')
				$(this).attr 'href', Routes.edit_glossary_term_path(glossary, term)
			else
				$(this).attr 'href', Routes.glossary_term_path(glossary, term)
			return

$(document).ready(ready)
$(document).on('page:load', ready)