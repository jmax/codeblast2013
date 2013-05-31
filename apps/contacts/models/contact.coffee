
Schema = require('mongoose').Schema

PhoneSchema = Schema
  type: String,
  number: Number

ContactSchema = Schema
  firstName: String,
  lastName: String,
  age: Number,
  phones: [PhoneSchema]

ContactSchema.statics.withPhones = (cb) ->
  this.find { phones: { $exists: true } }, cb

ContactSchema.statics.findInDirectory = (letter, cb) ->
  regExp = new RegExp("^#{letter}", "i")
  this.find { lastName: regExp }, cb

module.exports = db.model 'Contact', ContactSchema
