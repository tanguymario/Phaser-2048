assert = require '../assert.coffee'
debug = require '../debug.coffee'
debugThemes = require '../debug-themes.coffee'

class ProbabilitiesTable
  constructor: (probElements, copy=true) ->
    assert probElements?, "Elements are missing"
    assert Array.isArray probElements, "Elements are not an array"
    assert probElements.length > 0, "There must be at least one element"

    @nbElements = probElements.length
    @elements = new Array @nbElements

    if (copy)
      for i in [0...@nbElements]
        @elements[i] = probElements[i].clone()
    else
      @elements = probElements

    # Calculate the sum
    probaSum = 0
    for i in [0...@elements.length]
      probaSum += @elements[i].probability

    # If sum is not equals to 1, we have to update values of our elements
    if probaSum != 1
      for i in [0...@nbElements]
        @elements[i].probability /= probaSum

    # Assign a range of probability (elements will not have their native proba)
    currentProbability = 0
    for i in [0...@nbElements]
      element = @elements[i]
      element.probability += currentProbability
      currentProbability += element.probability


  pickElement: ->
    randomValue = Math.random()
    for i in [0...@nbElements]
      element = @elements[i]
      if randomValue > element.probability
        continue

      return element.value

    debug 'Error - could not pick element', @, 'error', 20, debugThemes.Other

module.exports = ProbabilitiesTable
