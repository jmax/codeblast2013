
Schema = require('mongoose').Schema

PhoneSchema = Schema
  type: String,
  number: Number

ContactSchema = Schema
  firstName: String,
  lastName: String,
  email: String,
  age: Number,
  phones: [PhoneSchema]

ContactSchema.statics.withPhones = (cb) ->
  this.find { phones: { $exists: true } }, cb

ContactSchema.statics.findInDirectory = (letter, cb) ->
  regExp = new RegExp("^#{letter}", "i")
  this.find { lastName: regExp }, cb

ContactSchema.statics.searchByName = (key, cb) ->
  regExp = new RegExp("#{key}", "i")
  this.find { firstName: regExp }, cb

module.exports = db.model 'Contact', ContactSchema
