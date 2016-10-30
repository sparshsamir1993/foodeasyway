# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$(document).on 'keyup', '#item_search', (e) ->
  search_term = $(this).val()
  restaurant_id = $(".r-id").attr('value')
  $.ajax "/restaurants/" + restaurant_id ,
    type: 'GET'
    data: {
      search: search_term,
      template: false
    }
    success:(data, jqxhr, textStatus) ->
      $('#items_table tbody').html data
      console.log 'hey'
    error:(jqxhr, textStatus, errorThrown) ->
      $.jGrowl 'Something went wrong.', life:2000


$(document).on 'ready', ->
    w_height = $('body').height()
    $('.list').css("height",w_height)
    $('body').scrollspy({target: ".nav"})

$(document).on 'click', '.restaurant-text', ->
    target = $(@getAttribute('href'))
    if target.length
        console.log target
        event.preventDefault()
        $('html, body').stop().animate { scrollTop: target.offset().top }, 1000
    return
