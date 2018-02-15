# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

url = window.location.href
pathname = window.location.pathname
len = pathname.length
user_id = pathname.substring(7,len)

get_chat = ->
  $.ajax "/showchat/#{user_id}",
    type: 'GET',
    dataType: 'text'
    error: (textStatus, jqXHR, error) ->
    success: (res, textStatus, jqXHR) ->
      $("#divi").html(res)
      $("#divi").animate({ scrollTop: $('#divi').prop("scrollHeight")}, 1000)


setInterval(get_chat, 2000);
