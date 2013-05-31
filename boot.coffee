
config   = require('./config/load')
mongoose = require('mongoose')

settings = (express, app) ->

  database     = process.env.MONGOHQ_URL || config.db.uri
  SessionStore = require("session-mongoose")(express)
  global.db    = mongoose.createConnection(database)

  app.configure () ->
    app.set 'views',        __dirname + '/views'
    app.set 'view engine', 'jade'
    app.set 'port',        config.port

    app.use express.bodyParser()
    app.use express.methodOverride()
    app.use express.cookieParser()
    app.use express.session(
      secret: config.secret,
      store: new SessionStore(
        url: database,
        interval: 120000
      )
    )
    app.use express.csrf()

    app.use (req, res, next) ->
      res.locals.token = req.session._csrf
      next()

    app.use require('connect-assets')()
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
