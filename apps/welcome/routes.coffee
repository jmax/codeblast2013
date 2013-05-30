
routes = (app) ->

  app.get '/', (req, res) ->
    body = 'Hello World'
    res.setHeader 'Content-Type',   'text/plain'
    res.setHeader 'Content-Length', body.length
    res.end(body)

module.exports = routes
