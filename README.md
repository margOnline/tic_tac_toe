# Tic Tac Toe

## Objective

To refactor an existing implementation of a tic tac toe game with emphasis on enhancement and maintenance.

## Approach

The original codebase was difficult to follow and not well organised. The first steps were to create a test suite and modularise the code to make it more readable. The second step was to enable the game to be run. I chose to run the game where both players were 'computers' because it was the simplest to implement and allowed proof of my approach.

The current codebase is now in a state where new features can be added more easily.

## How to run the game

        ruby lib/play_game.rb

## Next Steps

Implement the following features: 

~~* Enable the user to choose his own moves.~~
~~* Refactor the game_engine and user_interface classes to make use of a presenter.~~
* Validate selection of game type.
* Allow the user to select the level of difficulty (easy, medium, hard). 
~~* Allow the user to choose the game type e.g. (human v. human, computer v. computer, human v. computer)~~
* Allow the user to choose which player goes first.
* Allow the user to decide which marker each player will use to mark their selections on the board.
