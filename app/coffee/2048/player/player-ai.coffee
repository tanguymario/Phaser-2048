assert = require '../../utils/assert.coffee'
debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

Player = require './player.coffee'
PlayerAiConfig = require './player-ai-config.coffee'

class PlayerAI extends Player
  constructor: (game, grid, config) ->
    super game, grid

    assert config?, "Config missing"

    @config = config

module.exports = PlayerAI
