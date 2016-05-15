# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  imageFile = [
    'giphy.gif'
    'burger.gif'
    'steam.gif'
 
  ]
  currentIndex = 0
  setInterval (->
    if currentIndex == imageFile.length
      currentIndex = 0
    $('body').css 'background', 'url("/assets/' + imageFile[currentIndex++] + '")'
    return
  ), 4000
  return