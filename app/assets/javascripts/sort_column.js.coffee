jQuery ->
  ascending = true
  $(document).on 'click', 'th', ->
    $('th').removeClass()
    name = $(this).attr('name')
    if ascending == false
      ascending = true
      $(this).addClass('asc')
    else
      ascending = false
      $(this).addClass('desc')
    $.ajax(
      url: "/sort_column"
      type: "GET"
      data: {column: "#{name}", ascending: "#{ascending}"}
      async: true
      )

