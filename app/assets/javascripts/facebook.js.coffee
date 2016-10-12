# jQuery ->
#   $('body').prepend('<div id="fb-root"></div>')
#
#   $.ajax
#     url: "#{window.location.protocol}//connect.facebook.net/en_US/all.js"
#     dataType: 'script'
#     cache: true
#
#
# window.fbAsyncInit = ->
#   FB.init(appId: '977470122361795', cookie: true)
#
#   $('#sign_in').click (e) ->
#     e.preventDefault()
#     FB.login (response) ->
#         request = $.param(signed_request: response.authResponse.signedRequest)
#
#         if response.authResponse
#             window.location = '/users/auth/facebook/callback?' + request
#         console.log request
#   $('#sign_out').click (e) ->
#     FB.getLoginStatus (response) ->
#       FB.logout() if response.authResponse
#     true
jQuery ->
  $('body').prepend('<div id="fb-root"></div>')

  $.ajax
    url: "#{window.location.protocol}//connect.facebook.net/en_US/all.js"
    dataType: 'script'
    cache: true


window.fbAsyncInit = ->
  FB.init(appId: '977470122361795', cookie: true)

  $('#sign_in').click (e) ->
    e.preventDefault()
    FB.login (response) ->
      window.location = '/users/auth/facebook/callback?' +  $.param({ signed_request: response.authResponse.signedRequest })
  $('#sign_out').click (e) ->
    FB.getLoginStatus (response) ->
      FB.logout() if response.authResponse
    true
