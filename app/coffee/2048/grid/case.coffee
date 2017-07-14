assert = require '../../utils/assert.coffee'
debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

Direction = require '../../utils/direction.coffee'
Coordinates = require '../../utils/coordinates.coffee'

class Case
  @RESET_VALUE = 0

  constructor: (game, grid, gridCoords) ->
    assert game?, "Game missing"
    assert grid?, "Grid missing"
    assert gridCoords instanceof Coordinates, "Grid Coords missing"

    @game = game
    @grid = grid
    @coords = gridCoords
    @value = Case.RESET_VALUE


  isMovable: ->
    # TODO
    return @value != 0


  isFull: ->
    return !@isEmpty()


  isEmpty: ->
    return @value == Case.RESET_VALUE


  resetValue: ->
    @value = Case.RESET_VALUE


  move: (direction) ->
    if @isEmpty()
      return

    assert direction?, "Direction missing"

    neighbourCase = @getNeighbourAt direction
    if not neighbourCase?
      return

    if neighbourCase.isEmpty()
      neighbourCase.value = @value
      @resetValue()
      neighbourCase.move direction
      return

    if neighbourCase.value == @value
      neighbourCase.value += @value
      @resetValue()
      return


  getNeighbourAt: (direction) ->
    neighbourCoords = Coordinates.Add @coords, direction.value
    return @grid.getCaseAtGridCoords neighbourCoords


  toString: ->
    return @value.toString()


module.exports = Case
