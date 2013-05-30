
# Boot Setup will go here
config = require('./config/load')

settings = (express, app) ->
  app.configure () ->
    app.set 'port', config.port

  app.configure 'development', () ->
    app.use express.errorHandler
      dumpExceptions: true,
      showStack: true

  app.configure 'production', () ->
    app.use express.errorHandler()
    app.set 'port', process.env.PORT

module.exports = settings
