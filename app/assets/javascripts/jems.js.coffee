$('document').ready () ->
  $('#new-script').fileupload
    dataType: "script"
    add: (e, data) ->
      types = /(\.|\/)(js|css|jpe?g|png|gif)$/i
      file = data.files[0]
      if types.test(file.type) || types.test(file.name)
        $('#new-script').append(data.context)
        data.submit()
      else
        alert("#{file.name} is not a javascript, CSS, or image file")

  $('#job-id-container').bind('DOMSubtreeModified', queryForPercentage = () ->
    job_id = $('#job_id').text()
    console.log('function called')
    $.ajax({
      url: "/percentage_done"
      data:
        job_id: job_id
      success: (data) ->
        console.log('successful pull ' + data['percentage_done'])
        console.log(data)
        percentage = 'width: ' + data['percentage_done'] + '%;'
        $('#job-progress').attr('style', percentage).text(data['percentage_done'] + '%')
        $('#job_messages h2').text('Progress: ' + data['job_message'])
        if $('#job-progress').text() != '100%'
          setTimeout(queryForPercentage, 1000)
    }) 
  )


  