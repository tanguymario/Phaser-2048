assert = require '../utils/assert.coffee'
debug       = require '../utils/debug.coffee'
debugThemes = require '../utils/debug-themes.coffee'

class Game2048
  constructor: (game, player) ->
    assert game?, "Game missing"
    assert player?, "Player missing"



module.exports = Game2048
