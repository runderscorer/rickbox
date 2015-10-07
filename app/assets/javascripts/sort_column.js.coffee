jQuery ->
  ascending = true
  $(document).on 'click', 'th.films', ->
    $('th').attr('id', '')
    name = $(this).attr('name')
    if ascending == false
      ascending = true
      $(this).attr('id', 'asc')
    else
      ascending = false
      $(this).attr('id', 'desc')
    $.ajax(
      url: "/sort_column"
      type: "GET"
      data: {column: "#{name}", ascending: "#{ascending}"}
      async: true
      )

