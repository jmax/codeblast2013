
config = require('./config/load')

settings = (express, app) ->

  SessionStore = require("session-mongoose")(express)

  app.configure () ->
    app.set 'port', config.port

    app.use express.bodyParser()
    app.use express.methodOverride()
    app.use express.cookieParser()
    app.use express.session(
      secret: config.secret,
      store: new SessionStore(
        url: process.env.MONGOHQ_URL || config.db.uri,
        interval: 120000
      )
    )

    app.use app.router
    app.use express.static('public')

  app.configure 'development', () ->
    app.use express.errorHandler
      dumpExceptions: true,
      showStack: true

  app.configure 'production', () ->
    app.use express.errorHandler()
    app.set 'port', process.env.PORT

module.exports = settings
