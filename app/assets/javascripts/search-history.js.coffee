$ ->
	build_dropdown_items = ->
		array = get_matches()
		if array.length == 0
			$('.dropdown-menu').html('<li class="disabled"><a>No history</a></li>')
		else
			$('.dropdown-menu').html ''
			$(array).each (index, elem) -> 
				$("<li><a href='/search?letters=#{ elem }'>#{ elem }</a></li>").prependTo '.dropdown-menu'
			$('.dropdown-menu').append '<li class="divider"></li>'
			$('.dropdown-menu').append '<li><a href="#" id="clear">Clear</a></li>'

	get_matches = ->
		matches = localStorage['matches']
		if matches
			array = matches.split ','
		else
			array = []
		return array

	save_matches = (matches_array) =>
		localStorage['matches'] = matches_array.slice(-10).toString()

	add_match = (match) =>
		matches_array = get_matches()
		if matches_array.indexOf(match) == -1
			matches_array.push match
		save_matches(matches_array)

	build_dropdown_items()

	$('#clear').click (e) ->
		localStorage.removeItem 'matches'
		build_dropdown_items()
		e.preventDefault()

	$('#search').click ->
		add_match $('#letters').val()