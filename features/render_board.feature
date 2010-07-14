Feature: Render Board

  Scenario: Empty minefield
    When I run "minesweeper --size 5x3"
    Then the output should contain exactly:
      """
      .....
      .....
      .....

      """

  Scenario: Place Single Mine on small Gameboard

  Scenario: Place Single Mine on large Gameboard

  Scenario: Place Two Mines on large Gameboard

  Scenario: Place Three Mines on large Gameboard
