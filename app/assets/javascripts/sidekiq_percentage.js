function queryForPercentage() {

  $.ajax({
    url: "/percentage_done",
    data: {
      job_id: @job_id
    },
    success: function(data) {
      $("body").after(data);
      setTimeout(queryForPercentage, 1000);
    }
  });

}

queryForPercentage();