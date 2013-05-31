
Pet = require('./models/pet')

exports.index = (req, res, next) ->
  Pet.find (err, pets) ->
    return next(err) if err
    res.send(pets)
