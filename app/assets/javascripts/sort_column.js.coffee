jQuery ->
  $(document).on 'click', 'th', ->
    name = $(this).attr('name')
    $.ajax(
      url: "/sort_column"
      type: "GET"
      data: {column: "#{name}"}
      async: true
      )