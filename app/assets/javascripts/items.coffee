# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'keyup', '#item_search', () ->
	search_term = $(this).val()
	$.ajax '/restaurant/show.html',
  console.log("2222222");
		type: 'GET'
		data: {
			search_term: search_term,
			template: false
		}
		success:(data, jqxhr, textStatus) ->
			$('#items_table tbody').html data
		error:(jqxhr, textStatus, errorThrown) ->
			$.jGrowl 'Something went wrong.', life:2000
