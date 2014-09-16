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

	$("#omni-icon").mouseover (ev) ->
	  $("#omni-icon").removeClass("fa-bullseye").addClass "fa-circle"
	  $("#nav-left-side").addClass 'out'
	  return

	$('#nav-left-side').mouseleave (ev) ->
		console.log('working!')
		$('#omni-icon').removeClass('fa-circle').addClass('fa-bullseye')
		$('#nav-left-side').removeClass('out')
		return

	$('#edit-terms').click (ev) ->
		ev.preventDefault()
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