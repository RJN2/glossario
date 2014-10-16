ready = ->
	$('#debug_time').click ->
		$('.debug_dump').toggle();

	$("h1#welcome-msg").click ->
  	$('section.page-map').toggle()

	# form
	$(".modal-form").on "show.bs.modal", ->
	  $(".super").addClass "blurred"

	$('.modal-form').on "shown.bs.modal", ->
		$('form:first *:input[type!=hidden]:first').focus()

	$(".modal-form").on "hidden.bs.modal", ->
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

	edit_mode = ->
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

	$('#edit').click (ev) ->
		edit_mode()
		ev.preventDefault()

	document.onkeydown = (e) ->
		k = e.keyCode
		if (k == 38 or k == 40) and (not ($('body').hasClass('modal-open')))
			e.preventDefault()
			return false


	terms_menu_item = $('ol#terms li span.term a')
	terms_menu_item.first().addClass('selected').focus()
	$(document).keydown (e) ->
		selected = $('.selected')

		if e.keyCode is 40 and (not ($('body').hasClass('modal-open'))) # down
			unless $('ol#terms li:last-child span.term a').hasClass('selected')
				selected.removeClass('selected').parentsUntil('ol#terms')
																				.next()
																				.find('span.term a')
																				.addClass('selected').focus()

		if e.keyCode is 38 and (not ($('body').hasClass('modal-open'))) # down
			unless $('ol#terms li:first-child span.term a').hasClass('selected')
				selected.removeClass('selected').parentsUntil('ol#terms')
																				.prev()
																				.find('span.term a')
																				.addClass('selected').focus()

		if e.keyCode is 39 and (not ($('body').hasClass('modal-open'))) # right
			edit_mode()

		if e.keyCode is 13 and (not e.shiftKey) and ($('textarea#term_definition').is(":focus"))
			e.preventDefault()
			$('form#new_term').submit()


	terms_menu_item.click (ev) ->
		$(terms_menu_item).removeClass "selected"
		$(this).addClass("selected").focus()

	# term_string = $('#term_term').val()
	# acronymize = (ev) ->
	# 	a_regex = /[A-Z]+/
	# 	tester = a_regex.test term_string
	# 	console.log(tester)

	# $(document).keydown (e) ->
	# 	k = e.keyCode
	# 	if k is 9 and ($('body').hasClass('modal-open'))
	# 		$('#term_term').acronymize()

$(document).ready(ready)
$(document).on('page:load', ready)