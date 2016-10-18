# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready', ->
    $('.navbar-brand').addClass('animated fadeIn')

    $(document).on 'click', '#send-btn', (e) ->
        e.preventDefault()
        console.log 'clicked'
        restaurant_id = $(this).attr('value')
        total = $(this).attr('name')
        $.ajax 'orders/send_message',
            type: 'POST'
            data:{
                restaurant_id: restaurant_id
                total: total
            }
            dataType: 'text'
            success:(data, textStatus, jqxhr) ->
              $("#card_id_"+restaurant_id).addClass('hidden')
              $('#thumbs_'+restaurant_id).toggleClass('hidden')
              console.log 'insy'
              alert 'sent'
            error:(jqxhr, textStatus, errorThrown) ->
              alert 'Something went wrong.', life:2000
