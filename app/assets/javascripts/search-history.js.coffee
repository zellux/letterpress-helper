$ ->
	build_dropdown_items = ->
		matches = localStorage['matches'] || ''
		array = matches.split ','
		if array.length == 0
			$('.dropdown-menu').html('<li class="disabled"><a>No history</a></li>')
		else
			$('.dropdown-menu').html ''
			$(array).each (index, elem) -> 
				$("<li><a href='/search?letters=#{ elem }'>#{ elem }</a></li>").prependTo '.dropdown-menu'
			$('.dropdown-menu').append '<li class="divider"></li>'
			$('.dropdown-menu').append '<li><a href="#" id="clear">Clear</a></li>'

	build_dropdown_items()

	$('#clear').click (e) ->
		localStorage['matches'] = ''
		build_dropdown_items()
		e.preventDefault()

	$('#search').click ->
		matches = localStorage['matches'] || ''
		array = matches.split ','
		array.push $('#letters').val()
		localStorage['matches'] = array.toString()