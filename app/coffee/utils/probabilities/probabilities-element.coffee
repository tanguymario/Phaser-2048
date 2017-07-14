assert = require '../assert.coffee'
clamp01 = require '../math/clamp01.coffee'
debug = require '../debug.coffee'
debugThemes = require '../debug-themes.coffee'

class ProbabilitiesElement
  constructor: (value, probability) ->
    assert probability?, "Probability is missing"

    @value = value
    @probability = clamp01 probability


  clone: ->
    return new ProbabilitiesElement @value, @probability


module.exports = ProbabilitiesElement
