# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready', ->
    console.log 'reday'
    $('.order-flex-items').hide()
    $(document).on 'change', "#<%= @sec %>_log", ->
            console.log 'togg'
            $('.order-flex-items').show()
            $('.order-flex-items').addClass('animated fadeIn')
