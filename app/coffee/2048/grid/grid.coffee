assert = require '../../utils/assert.coffee'
debug = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

Direction = require '../../utils/direction.coffee'
Matrix = require '../../utils/math/matrix.coffee'

Case = require './case.coffee'

class Grid
  constructor: (game, config) ->
    assert game?, "Game missing"
    assert config?, "Config missing"

    @game = game
    @config = config

    tab = new Array @config.height
    for i in [0...@config.height]
      tab[i] = new Array @config.width
      for j in [0...@config.width]
        tab[i][j] = new Case @game

    @matrix = new Matrix tab, false


  print: ->
    


  move: (direction) ->
    # TODO

module.exports = Grid
