root = exports ? this
root.create_new_product = () ->
    $('#new-product').html('<a href="/products/new" data-remote="true">Create new product</a>');
root.create_new_category = () ->
  $('#new-category').html('<a href="/categories/new" data-remote="true">Create new category</a>');