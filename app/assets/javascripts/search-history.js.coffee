$ ->
	$('#search').click ->
		matches = localStorage['matches'] || ""
		array = matches.split ','
		array.push $('#letters').val()
		localStorage['matches'] = array.toString()