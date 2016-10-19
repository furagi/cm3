# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#= require video-js.min
#= require videojs-resolution-switcher
ids = $("video[id^=video]").each (i, video) ->
  id = $(video).attr "id"
  videojs("\##{id}").videoJsResolutionSwitcher()
