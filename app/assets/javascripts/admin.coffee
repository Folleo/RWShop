root = exports ? this
root.create_new_product = () ->
    $('#new-product').html('<a href="/products/new" data-remote="true">Добавить новый продукт</a>');
root.create_new_category = () ->
  $('#new-category').html('<a href="/categories/new" data-remote="true">Добавить новую категорию</a>');