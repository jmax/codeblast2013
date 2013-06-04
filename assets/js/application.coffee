
#= require vendor/jquery-2.0.1.min.js
#= require vendor/mustache.js
#= require vendor/underscore-min.js
#= require vendor/bootstrap.min.js

cleanUpSelection = () ->
  $('.searchBox').val("")
  $('.active').removeClass('active')

renderContacts = (contacts) ->
  contactTemplate = $('#contact').html()

  _.each contacts, (contact) ->
    output = Mustache.render(contactTemplate, contact)
    $('#contacts').append(output)

updateContacts = (targetURL) ->
  $('#contacts').html("")
  $.getJSON targetURL, (data) -> renderContacts(data)

loadContactsList = () ->
  cleanUpSelection()
  updateContacts('/contacts')

loadAlphaFilters = () ->
  filterTemplate = $('#alphaFilter').html()

  alphabeth = _.toArray('ABCDEFGHIJKLMNOPQRSTUVWXYZ').reverse()
  _.each alphabeth, (letter) ->
    output = Mustache.render(filterTemplate, { letter: letter })
    $('.breadcrumb').prepend(output)

jQuery ->

  loadAlphaFilters()
  loadContactsList()

  $('.refreshButton').on 'click', (e) ->
    e.preventDefault()
    loadContactsList()

  $('.filterButton').on 'click', (e) ->
    e.preventDefault()
    cleanUpSelection()
    $(this).parent().addClass('active')
    updateContacts($(this).attr('href'))

  $('.searchBox').on 'keypress', (e) ->
    if e.which == 13
      $('.active').removeClass('active')
      updateContacts("/search/#{$(this).val()}")
