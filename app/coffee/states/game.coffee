Phaser = require 'Phaser'

config      = require '../config/config.coffee'

debug       = require '../utils/debug.coffee'
debugThemes = require '../utils/debug-themes.coffee'

Game2048 = require '../2048/game-2048.coffee'
Grid = require '../2048/grid/grid.coffee'
GridConfig = require '../2048/grid/grid-config.coffee'
PlayerHuman = require '../2048/player/player-human.coffee'
PlayerHumanConfig = require '../2048/player/player-human-config.coffee'

class Game extends Phaser.State
  constructor: ->
    debug 'Constructor...', @, 'info', 30, debugThemes.Phaser
    super


  preload: ->
    debug 'Preload...', @, 'info', 30, debugThemes.Phaser
    @load.pack 'game', config.pack


  create: ->
    debug 'Create...', @, 'info', 30, debugThemes.Phaser

    # Gamepad support
    @game.input.gamepad.start()
    pad1 = @game.input.gamepad.pad1

    # One grid, one player, one gamepad
    grid1 = new Grid @game, GridConfig.normal
    playerHuman1 = new PlayerHuman @game, PlayerHumanConfig.player1, pad1

    # Game creation
    game2048 = new Game2048 @game, playerHuman1, grid1


module.exports = Game
