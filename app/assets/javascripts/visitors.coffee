# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  movementStrength = 20
  height = movementStrength / $(window).height()
  width = movementStrength / $(window).width()
  $('#main-container').mousemove (e) ->
    pageX = e.pageX - ($(window).width() / 2)
    pageY = e.pageY - ($(window).height() / 2)
    newvalueX = width * pageX * -1
    newvalueY = height * pageY * -1 - 50
    $('#main-container').css 'background-position', newvalueX + 'px     ' + newvalueY + 'px'
    return
  return

$(document).on 'ready', ->
    $('.step-flex').hide()
$(window).on 'scroll', ->
  scroll = $(window).scrollTop()
  console.log scroll
  if scroll > 75
    $('.step-flex').show()
    $('.step-flex').addClass 'animated fadeIn'
  return
