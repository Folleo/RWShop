fade_flash = ->
  $('#flash_notice').delay(3000).fadeOut 'slow'
  $('#flash_alert').delay(3000).fadeOut 'slow'
  $('#flash_error').delay(10000).fadeOut 'slow'
  return
fade_flash()

show_ajax_message = (msg, type) ->
  if type == 'alert' or type == 'error'
    alert = 'alert'
  $('#flash-message').replaceWith(
      '<div class="row" id="flash-message">' +
        '<div data-alert class="alert-box ' + alert + '" id="flash_' + type + '">' + msg +
        '</div>' +
      '</div>')
  fade_flash()
  return

$(document).ajaxComplete (event, request) ->
  $(document).foundation('equalizer','reflow');
  msg = request.getResponseHeader('X-Message')
  type = request.getResponseHeader('X-Message-Type')
  if type != null
    show_ajax_message msg, type if msg
  $('#flash-message').replaceWith("<div class='row' id='flash-message'></div>") unless msg
  return