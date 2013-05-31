
#= require vendor/jquery-2.0.1.min.js
#= require vendor/mustache.js
#= require vendor/underscore-min.js

renderContacts = (contacts) ->
  contactTemplate = $('#contact').html()

  _.each contacts, (contact) ->
    output = Mustache.render(contactTemplate, contact)
    $('#contacts').append(output)

updateContacts = (targetURL) ->
  $('#contacts').html("")
  $.getJSON targetURL, (data) -> renderContacts(data)

loadContactsList = () -> updateContacts('/contacts')

loadAlphaFilters = () ->
  filterTemplate = $('#alphaFilter').html()

  alphabeth = _.toArray('ABCDEFGHIJKLMNOPQRSTUVWXYZ').reverse()
  _.each alphabeth, (letter) ->
    output = Mustache.render(filterTemplate, { letter: letter })
    $('.breadcrumbs').prepend(output)

jQuery ->

  loadAlphaFilters()
  loadContactsList()

  $('.refreshButton').on 'click', (e) ->
    e.preventDefault()
    loadContactsList()

  $('.filterButton').on 'click', (e) ->
    e.preventDefault()
    updateContacts($(this).attr('href'))
