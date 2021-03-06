# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("#post__list").infinitescroll
    navSelector: "nav.pagination" # selector for the paged navigation (it will be hidden)
    nextSelector: "nav.pagination a[rel=next]" # selector for the NEXT link (to page 2)
    itemSelector: "#post__list .post__wrap" # selector for all items you'll retrieve
    loading:
      img: 'aseets/images/loading.gif'
      msgText: ''
      finishedMsg: ''
      speed: 0