assert = require '../../utils/assert.coffee'
debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

Direction = require '../../utils/direction.coffee'

class Player
  constructor: (game, grid) ->
    assert game?, "Game missing"
    assert grid?, "Grid missing"

    @game = game
    @grid = grid


  moveLeft: ->
    @move Direction.W


  moveUp: ->
    @move Direction.N


  moveRight: ->
    @move Direction.E


  moveDown: ->
    @move Direction.S


  move: (direction) ->
    console.log direction.toString()
    @grid.move direction


module.exports = Player
