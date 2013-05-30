
availableRoutes = (app) ->
  require('./apps/welcome/routes')(app)

module.exports = availableRoutes
