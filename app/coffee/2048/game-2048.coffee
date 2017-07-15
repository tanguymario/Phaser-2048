assert = require '../utils/assert.coffee'
debug       = require '../utils/debug.coffee'
debugThemes = require '../utils/debug-themes.coffee'

class Game2048
  constructor: (game, player, grid) ->
    assert game?, "Game missing"
    assert player?, "Player missing"
    assert grid?, "Grid missing"

    @game = game
    @player = player
    @grid = grid

    @gameOver = false

    @player.move = @move


  endGame: ->
    @gameOver = true


  move: (direction) =>
    if @gameOver
      return

    @grid.move direction

    if @grid.hasChanged
      if @grid.isOver()
        @endGame()


module.exports = Game2048
