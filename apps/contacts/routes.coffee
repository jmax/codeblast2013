
Contact = require('./models/contact')

respond_with = (res, err, contacts) ->
  return next(err) if err
  res.send(contacts)

exports.index = (req, res, next) ->
  Contact.find (err, contacts) -> respond_with(res, err, contacts)

exports.withPhones = (req, res, next) ->
  Contact.withPhones (err, contacts) -> respond_with(res, err, contacts)

exports.alphabetically = (req, res, next) ->
  Contact.findInDirectory req.params.letter, (err, contacts) ->
    respond_with(res, err, contacts)
