# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.parallax').parallax()
  return
  $('.carousel').carousel
    interval: 1000
    pause:  false
  $(document).ready ->
    $(element).backgroundVideo()
    $('video').prop('muted', true)
    return
