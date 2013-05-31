
welcome = require('./apps/welcome/routes')
test    = require('./apps/test/routes')

availableRoutes = (app) ->
  app.get '/',     welcome.index
  app.get '/test', test.index

module.exports = availableRoutes
