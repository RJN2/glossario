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

	filter = (->		
		filter_input = $('#search')

		focused: ->
			if filter_input.is(':focus')
				return
	)()

	if filter.focused()
		$('ol#terms')

	edit_mode = ->
		$('.delete').toggle()
		$('.term-link').toggleClass('term-edit')
		$('.term-link').each ->
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

	modal = (->
		open: ->
			if $('body').hasClass('modal-open')
				return true
	)()

	terms_menu_item = $('ol#terms li a.term-link')
	# terms_menu_item.first().addClass('selected').focus()
	$(document.documentElement).keydown (e) ->

		selected 		 		= $('.selected')
		filter_input 		= $('#search')
		first_term 	 		= $('ol#terms > :first-child')
		last_term 			= $('ol#terms > :last-child')
		terms_menu_item = $('ol#terms li a.term-link')
		term_link 			= 'a.term-link'
		k 							= e.keyCode

		if modal.open()
			if k is 13 and (not e.shiftKey) and ($('textarea#term_definition').is(":focus"))
				e.preventDefault()
				$('form#new_term').submit()
		else
			if k is 40
				e.preventDefault()
				if filter_input.is(':focus')
					first_term.find(term_link).addClass('selected').focus()
				else
					unless last_term.find(term_link).hasClass('selected')
						selected.removeClass('selected').parentsUntil('ol#terms')
																						.next()
																						.find(term_link)
																						.addClass('selected').focus()

			if k is 38
				e.preventDefault()
				if first_term.find(term_link).hasClass('selected')
					first_term.find(term_link).removeClass('selected')
					filter_input.focus()
				else
					unless first_term.find(term_link).hasClass('selected')
						selected.removeClass('selected').parentsUntil('ol#terms')
																						.prev()
																						.find(term_link)
																						.addClass('selected').focus()
			
			if e.keyCode is 39 # right
				edit_mode()

			if k is 9
				e.preventDefault()
				return


	

	$(document).keyup (e) ->
		if e and ($('#search').is(':focus'))
			search_value = $("input#search").val()
			if search_value.length > 0
				search_mode()
			else
				search_mode_off()

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

	search_mode = ->
		$('body').css('background-color', 'black')
		$('body').css('color', 'white')
		$('a').css('color', 'white')
		$('span').css('color', 'white')
		$('input').css('color', 'white')

	search_mode_off = ->
		$('body').css('background-color', 'white')
		$('body').css('color', 'black')
		$('a').css('color', 'black')
		$('span').css('color', 'black')
		$('input').css('color', 'black')

	filter_list = ->
		options = valueNames: [
		  "term"
		  "acronym"
		]
		userList = new List("term-list", options)

	filter_list()

$(document).ready(ready)
$(document).on('page:load', ready)