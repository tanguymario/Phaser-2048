assert = require '../../utils/assert.coffee'
debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

class Case
  constructor: (game) ->
    assert game?, "Game missing"
    @value = 0

  isMovable: ->
    return @value != 0


module.exports = Case
