assert = require '../../utils/assert.coffee'
debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

Player = require './player.coffee'
PlayerHumanConfig = require './player-human-config.coffee'

class PlayerHuman extends Player
  @I_GAMEPAD_MOVE_LEFT = Phaser.Gamepad.XBOX360_DPAD_LEFT
  @I_GAMEPAD_MOVE_UP = Phaser.Gamepad.XBOX360_DPAD_UP
  @I_GAMEPAD_MOVE_RIGHT = Phaser.Gamepad.XBOX360_DPAD_RIGHT
  @I_GAMEPAD_MOVE_DOWN = Phaser.Gamepad.XBOX360_DPAD_DOWN

  constructor: (game, grid, config, gamepad = null) ->
    super game, grid

    assert config?, "Config missing"

    @config = config

    # Add keys
    @keys =
      moveLeft: @game.input.keyboard.addKey @config.keys.move_left, @
      moveUp: @game.input.keyboard.addKey @config.keys.move_up, @
      moveRight: @game.input.keyboard.addKey @config.keys.move_right, @
      moveDown: @game.input.keyboard.addKey @config.keys.move_down, @

    # Add function called on down
    for key, keyValue of @keys
      keyValue.onDown.add @keyboardOnDownHandler, @
      keyValue.onUp.add @keyboardOnUpHandler, @

    # Add a gamepad
    if @game.input.gamepad.supported and gamepad?
      @gamepad = gamepad
      @gamepad.onDownCallback = @gamepadOnDownHandler
      @gamepad.onUpCallback = @gamepadOnUpHandler


  keyboardOnDownHandler: (key) =>
    switch key
      when @keys.moveLeft then @moveLeft()
      when @keys.moveUp then @moveUp()
      when @keys.moveRight then @moveRight()
      when @keys.moveDown then @moveDown()


  keyboardOnUpHandler: (key) =>
    # Nothing to do ...


  gamepadOnUpHandler: (button) =>
    # Nothing to do


  gamepadOnDownHandler: (button) =>
    switch button
      when PlayerHuman.I_GAMEPAD_MOVE_LEFT then @moveLeft()
      when PlayerHuman.I_GAMEPAD_MOVE_RIGHT then @moveRight()
      when PlayerHuman.I_GAMEPAD_MOVE_UP then @moveUp()
      when PlayerHuman.I_GAMEPAD_MOVE_DOWN then @moveDown()


module.exports = PlayerHuman
