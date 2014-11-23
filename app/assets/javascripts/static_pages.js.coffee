#
# * Plugin Name: jQuery Tab Slider
# * Version: 1.0
# * Author: Geoffrey Rickaby
# * Author URL: http://www.geoffreyrickaby.com/jQueryPlugins/Tab-Slider
# * License: GNU General Public License, version 3 (GPL-3.0)
# * 
# 
$(document).ready ->
  
  # home page tab slider
  $width = 820 #The width in pixels of your #tab-slider
  $delay = 500 # Pause time between animation in Milliseconds
  $("#section2").find("input").attr "tabindex", "-1"
  $(".tab-slider-wrapper").css width: 2 * $width
  $("i#sign-icon").click (event) ->
    event.stopPropagation()
    $(this).toggleClass "fa-rotate-90"
    animations = ($contentNum) ->
      switch $contentNum
        when 1
          $("body").removeClass()
          $("body").addClass "light"
          $("a.sign-help").attr("src", "/help#forgetful").html "Forgetful?"
        when 2
          $("body").removeClass()
          $("body").addClass "dark"
          $("a.sign-help").attr("src", "/help#what").html "Learn more"

    i = $(this)
    if i.hasClass("fa-rotate-90")
      i.parent().attr
        rel: "2"
        href: "#sign_in"

    else
      i.parent().attr
        rel: "1"
        href: "#sign_up"

    $contentNum = parseInt(i.parent().attr("rel"), 10)
    animations $contentNum
    $("#section" + $contentNum).find("input").attr "tabindex", "1"
    $("#section" + $contentNum).siblings().find("input").attr "tabindex", "-1"
    $(".tab-slider-wrapper").animate(
      marginLeft: "-" + ($width * $contentNum - $width)
    , $delay).promise().done ->
      $("#home-form-field" + $contentNum + " input").focus()
      return

    false

  $("i#help-icon").click ->
    $(".sign-help").toggle()
    return

  return
