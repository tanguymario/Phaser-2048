ProbabilitiesTable = require '../../utils/probabilities/probabilities-table.coffee'
ProbabilitiesElement = require '../../utils/probabilities/probabilities-element.coffee'

module.exports =
  normal:
    width: 4
    height: 4
    nbCasesAtStart: 2
    spawnTable: new ProbabilitiesTable([
      new ProbabilitiesElement(2, 0.8)
      new ProbabilitiesElement(4, 0.2)
    ])
