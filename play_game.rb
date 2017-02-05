#!/usr/bin/env ruby

require_relative 'lib/game_engine'

game_engine = GameEngine.new
game_engine.setup_game
game_engine.play
