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
        $.ajax '/orders/send_message',
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
              swal 'Order Sent','', 'success'
            error:(jqxhr, textStatus, errorThrown) ->
              swal 'Something went wrong.','', 'error'

    $(document).on 'click', '#update-contact', (e) ->
        e.preventDefault()
        console.log 'clicked'
        contact = $('#contact_value').val()
        address = $('#address_value').val()
        user_id = $(this).attr('span')
        $.ajax "/users/" + user_id + "/update_contact",
            type: 'POST'
            data:{
                contact: contact
                address: address
                template: false
            }
            dataType: 'text'
            success:(data, textStatus, jqxhr) ->
                # alert 'yay'
                swal 'Contact Updated','', 'success'
            error:(jqxhr, textStatus, errorThrown) ->
                alert 'Not updated','', 'error'
