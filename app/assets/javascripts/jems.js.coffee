grabGemRepo = () ->
  jem_id = $('#jem_id').text()

  $.ajax({
    url: '/get_gem_repo'
    data: jem_id: jem_id
    success: (data) ->
      console.log('grabGemRepo function called')
      console.log(data)
      $('#gem_repo dd').text(data)
      $('#gem_repo').removeClass('hidden')
      $('#gem_repo').fadeIn()
  })

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
    $.ajax({
      url: "/percentage_done"
      data:
        job_id: job_id
      success: (data) ->
        percentage = 'width: ' + data['percentage_done'] + '%;'
        $('#job-progress').attr('style', percentage).text(data['percentage_done'] + '%')
        $('#job_messages h2').text(data['job_message'])
        if $('#job-progress').text() != '100%'
          setTimeout(queryForPercentage, 1500)
        console.log(data['percentage_done'])
        if data['percentage_done'] == 100
          grabGemRepo()
    }) 
  )


  