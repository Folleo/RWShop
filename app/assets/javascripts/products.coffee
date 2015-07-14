# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(window).load ->
  $('#cart_button').click (e) ->
    $add_to_cart = document.getElementById("cart_button");
    $checkout = document.getElementById("cart_link");
    $add_to_cart.style.display = 'none';
    $checkout.style.display = '';