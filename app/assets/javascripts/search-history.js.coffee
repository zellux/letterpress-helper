$ ->
	build_dropdown_items = ->
		matches = localStorage['matches'] || ""
		array = matches.split ','
		if array.length > 0
			$('.dropdown-menu').html ''
			$(array).each (index, elem) -> 
				$("<li><a href='/search?letters=#{ elem }'>#{ elem }</a></li>").prependTo '.dropdown-menu'
			$('.dropdown-menu').append '<li class="divider"></li>'
			$('.dropdown-menu').append '<li><a href="#">Clear</a></li>'

	build_dropdown_items()

	$('#search').click ->
		matches = localStorage['matches'] || ""
		array = matches.split ','
		array.push $('#letters').val()
		localStorage['matches'] = array.toString()