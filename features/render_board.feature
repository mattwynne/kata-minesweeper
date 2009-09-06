Feature: Render Board
  In order to satisfy my burning curiosity
  As a player
  I want the entire board to be revealed to me when I quit the game

  Scenario: Empty minefield
    Given I have a 5 x 3 gameboard
    When the game is over
    Then I should see the following output
      """
      .....
      .....
      .....

      """

  Scenario: Place Single Mine on small Gameboard
    Given I have a 3 x 2 gameboard with a mine at the following co-ordinates:
      | x | y |
      | 2 | 1 |
    When the game is over
    Then I should see the following output
      """
      1*1
      111

      """

  Scenario: Place Single Mine on large Gameboard
     Given I have a 12 x 6 gameboard with a mine at the following co-ordinates:
      | x | y |
      | 5 | 4 |
     When the game is over
     Then I should see the following output
       """
       ............
       ............
       ...111......
       ...1*1......
       ...111......
       ............

       """

  Scenario: Place Two Mines on large Gameboard
    Given I have a 12 x 6 gameboard with mines at the following co-ordinates:
      | x | y |
      | 5 | 4 |
      | 7 | 5 |
    When the game is over
    Then I should see the following output
      """
      ............
      ............
      ...111......
      ...1*211....
      ...112*1....
      .....111....

      """
