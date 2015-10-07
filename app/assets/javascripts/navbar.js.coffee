jQuery ->
  $(document).on 'page:load', ->
    target_page = $('h2').text()
    $("li:contains('#{target_page}')").addClass('active')