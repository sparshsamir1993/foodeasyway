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

$(document).on 'click', '#products_index_add_to_cart', (e) ->
  restaurant_id = $(this).attr('data-restaurant')
  user_id = $(this).attr('data-user')
  item_id = $(this).attr('data-item')
  name = $(this).attr('data-item-name')
  id = 'quantity_' + item_id
  quantity = $("#quantity_"+ item_id).val()
  total = $(this).attr('data-total')
  console.log total
  $.ajax "/order_items" ,
    type: 'POST'
    data: {
      restaurant_id: restaurant_id
      user_id: user_id
      item_id: item_id
      quantity: quantity
      name: name
      template: false
    }
    success:(data, jqxhr, textStatus) ->
      $('#items_table tbody').html data
      swal "#{quantity} added to cart.",'', 'success'
    error:(jqxhr, textStatus, errorThrown) ->
      $.jGrowl 'Something went wrong.', life:2000

$(document).on 'ready', ->
    w_height = $('#content').height()
    $('.list').css("height",w_height)
    $('body').scrollspy({target: ".nav"})

$(document).on 'click', '.restaurant-text', ->
    target = $(@getAttribute('href'))
    if target.length
        console.log target
        event.preventDefault()
        $('html, body').stop().animate { scrollTop: target.offset().top }, 1000
    return
