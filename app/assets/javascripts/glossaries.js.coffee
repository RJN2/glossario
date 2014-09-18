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
	  $('#omni-icon').removeClass('fa-circle').addClass('fa-bullseye')
	  $('ul.extra').css({'opacity': 0, 'width': "0px"}).find('*').css('display', 'none')

	$("#omni-icon").mouseover (ev) ->
	  $("#omni-icon").removeClass("fa-bullseye").addClass "fa-circle"
	  $('ul.extra').css({'opacity': 1, 'width': "210px"}).find('*').css('display', 'inline-block')
	  return

	$('#nav-left-side').mouseleave (ev) ->
		unless $('body').hasClass('modal-open')
			$('#omni-icon').removeClass('fa-circle').addClass('fa-bullseye')
			$('ul.extra').css({'opacity': 0, 'width': "0px"}).find('*').css('display', 'none')
			return

	$('#edit-terms').click (ev) ->
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
		ev.preventDefault()	

$(document).ready(ready)
$(document).on('page:load', ready)