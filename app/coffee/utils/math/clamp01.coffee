clamp = require './clamp.coffee'

module.exports = (value) ->
  return clamp value, 0, 1
