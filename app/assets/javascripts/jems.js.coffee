# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery ->
  $('#new-script').fileupload
    dataType: "script"
    add: (e, data) ->
      types = /(\.|\/)(js|css|jpe?g|png|gif)$/i
      file = data.files[0]
      if types.test(file.type) || types.test(file.name)
        data.context = $(tmpl("template-upload", file))
        $('#new-script').append(data.context)
        data.submit()
      else
        alert("#{file.name} is not a Javascript or CSS file")
    progress: (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find('.bar').css('width', progress + '%')
    stop: (e, data) ->
      $('.upload').hide()