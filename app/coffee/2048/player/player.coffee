assert = require '../../utils/assert.coffee'
debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

Direction = require '../../utils/direction.coffee'

class Player
  constructor: (game) ->
    assert game?, "Game missing"

    @game = game


  destroy: ->
    # Abstract


  moveLeft: ->
    @move Direction.W


  moveUp: ->
    @move Direction.N


  moveRight: ->
    @move Direction.E


  moveDown: ->
    @move Direction.S


  move: (direction) ->
    debug 'Game 2048 must reference this move function to the grid', @, 'info'


module.exports = Player
