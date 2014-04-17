grabGemRepo = () ->
  jem_id = parseInt( $('#jem_id').text() )

  $.ajax({
    url: '/get_gem_repo'
    dataType: "json"
    data: jem_id: jem_id
    success: (data) ->
      console.log('success grabGemRepo')
      console.log(data)
      $('#gem_repo_link').html("<a target='_blank' href='" + data['gem_repo_link'] + "'>Gem Repository</a>")
      $('#rubygem_link').html("<a target='_blank' href='" + data['rubygem_link'] + "'>Rubygem Link</a>")
    error: (data) ->
      console.log 'error with grabGemRepo'
      console.log(data)
  })

$(document).ready () ->

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

  $('#update_version').click( () -> 
    console.log 'Update version button clicked'
    new_version_number = $('#new_version_number').val()
    jem_id = $('#jem_id').text()
    new_commit_message = $('#new_commit_message').val()
    $.ajax({
      url: '/update_version'
      type: "POST"
      data:
        new_jem_version: new_version_number
        new_commit_message: new_commit_message
        id: jem_id
      success: (data) ->
        #activate generate button
        alert('version updated!')
      error: (data) ->
        alert('failed to update!')
    })
  )

  $('#generate-gem-button').click( () ->
    $('#generate-gem-button').modal('hide')
  )


  