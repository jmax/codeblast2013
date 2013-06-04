
welcome  = require('./apps/welcome/routes')
test     = require('./apps/test/routes')
contacts = require('./apps/contacts/routes')

availableRoutes = (app) ->
  app.get '/',                     welcome.index
  app.get '/test',                 test.index
  app.get '/contacts',             contacts.index
  app.get '/contacts/with-phones', contacts.withPhones
  app.get '/contacts/:letter',     contacts.alphabetically
  app.get '/search/:key',          contacts.search

module.exports = availableRoutes
