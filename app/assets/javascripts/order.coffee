# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready', ->
    $('.navbar-brand').addClass('animated fadeIn')

$(document).on 'click', '#send-btn', (e) ->
    e.preventDefault()
    console.log 'clicked'
    restaurant_id = $('#send-btn').attr('value')
    order_id = $('#send-btn').attr('name')
    $.ajax this.href,
        type: 'POST'
        data:{
            restaurant_id: restaurant_id
        }
        dataType: 'text'
        success:(data, textStatus, jqxhr) ->
          console.log 'insy'
          alert 'sent'
        error:(jqxhr, textStatus, errorThrown) ->
          alert 'Something went wrong.', life:2000
