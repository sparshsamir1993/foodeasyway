# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready', ->
    $('.navbar-brand').addClass('animated fadeIn')

    $(document).on 'click', '#send-btn', (e) ->
        e.preventDefault()
        console.log 'clicked'
        order_id = $(this).data('order_id')
        order_restaurant_id = $(this).data('order_restaurant_id')
        total = $(this).attr('name')
        console.log order_restaurant_id
        console.log order_id
        $.ajax '/order_restaurants/' + order_restaurant_id+ '/confirm.html',
            type: 'POST'
            data:{
                order_restaurant_id: order_restaurant_id
                total: total
                order_id: order_id
            }
            success:(data, textStatus, jqxhr) ->
            #   $("#card_id_"+restaurant_id).addClass('hidden')
            #   $('#thumbs_'+restaurant_id).toggleClass('hidden')
            #   console.log 'insy'
              $('#order_card').html data
              swal 'Order Sent','', 'success'
            error:(jqxhr, textStatus, errorThrown) ->
              swal 'Something went wrong.','', 'error'

    $(document).on 'click', '#update-contact', (e) ->
        e.preventDefault()
        console.log 'clicked'
        contact = $('#contact_value').val()
        address = $('#address_value').val()
        order_id = $('#o-flex').attr('name')
        user_id = $(this).attr('span')
        $.ajax "/users/" + user_id + "/update_contact",
            type: 'POST'
            data:{
                contact: contact
                address: address
                order_id: order_id
                template: false
            }
            success:(data, textStatus, jqxhr) ->
                $('#o-flex').html data
                swal 'Contact Updated','', 'success'
            error:(jqxhr, textStatus, errorThrown) ->
                alert 'Not updated','', 'error'
