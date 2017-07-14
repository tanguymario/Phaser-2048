assert = require '../../utils/assert.coffee'
debug = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

random = require '../../utils/math/random.coffee'
Direction = require '../../utils/direction.coffee'
Matrix = require '../../utils/math/matrix.coffee'
Coordinates = require '../../utils/coordinates.coffee'

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
        caseCoords = new Coordinates j, i
        tab[i][j] = new Case @game, @, caseCoords

    @matrix = new Matrix tab, false

    # At start we generate 2 random values from the start values
    for i in [0...@config.nbCasesAtStart]
      @generateRandomCaseValue()

    @print()


  generateRandomCaseValue: ->
    currentCase = @getRandomCase()
    while currentCase.isFull()
      currentCase = @getRandomCase()

    currentCase.value = @generateCaseValue()


  generateCaseValue: ->
    return @config.spawnTable.pickElement()


  getRandomCase: ->
    column = Math.round random.between 0, @config.width - 1
    line = Math.round random.between 0, @config.height - 1
    return @matrix.getAt column, line


  isGameOver: ->
    for i in [0...@matrix.height] by 1
      for j in [0...@matrix.width] by 1
        currentCase = @matrix.getAt j, i
        if currentCase.isEmpty()
          return false

    return true


  getCaseAtGridCoords: (coords) ->
    assert coords instanceof Coordinates, "Coords missing"

    if coords.x >= 0 and coords.x < @matrix.width
      if coords.y >= 0 and coords.y < @matrix.height
        return @matrix.getAt coords.x, coords.y

    return null


  move: (direction) ->
    switch direction
      when Direction.W then @moveLeft()
      when Direction.N then @moveUp()
      when Direction.E then @moveRight()
      when Direction.S then @moveDown()
      else
        debug 'Direction not handled', @, 'error'
        return

    noTag = true
    line = 0
    while line < @matrix.height and noTag
      column = 0
      while column < @matrix.width and noTag
        currentCase = @matrix.getAt column, line
        noTag = currentCase.hasTag()
        column += 1
      line += 1

    if noTag
      return

    @generateRandomCaseValue()

    if @isGameOver()
      console.log "GAME OVER"

    @removeCasesTags()

    @print()


  removeCasesTags: ->
    for i in [0...@matrix.height] by 1
      for j in [0...@matrix.width] by 1
        currentCase = @matrix.getAt j, i
        currentCase.removeTags()


  moveLeft: ->
    for column in [0...@matrix.width] by 1
      for line in [0...@matrix.height] by 1
        currentCase = @getCaseAtGridCoords new Coordinates column, line
        currentCase.move Direction.W


  moveUp: ->
    for line in [0...@matrix.height]
      for column in [0...@matrix.width]
        currentCase = @getCaseAtGridCoords new Coordinates column, line
        currentCase.move Direction.S


  moveRight: ->
    column = @matrix.width - 1
    while column >= 0
      for line in [0...@matrix.height]
        currentCase = @getCaseAtGridCoords new Coordinates column, line
        currentCase.move Direction.E
      column -= 1


  moveDown: ->
    line = @matrix.height - 1
    while line >= 0
      for column in [0...@matrix.width]
        currentCase = @getCaseAtGridCoords new Coordinates column, line
        currentCase.move Direction.N
      line -= 1


  print: ->
    console.log "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    console.log @toString()


  toString: ->
    string = ""
    for i in [0...@matrix.height]
      for j in [0...@matrix.width]
        currentCase = @matrix.getAt j, i
        string += "[" + currentCase.toString() + "] "
      string += "\n"

    return string


module.exports = Grid
