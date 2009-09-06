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
