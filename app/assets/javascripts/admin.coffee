$(window).load ->
  $('#cart_button').click (e) ->
    $add_to_cart = document.getElementById("cart_button");
    $checkout = document.getElementById("cart_link");
    $add_to_cart.style.display = 'none';
    $checkout.style.display = '';