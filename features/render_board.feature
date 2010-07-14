Feature: Render Board

  Scenario: Empty minefield
    When I run "minesweeper --size 5x3"
    Then it should pass with:
      """
      .....
      .....
      .....

      """

  Scenario: Place Single Mine on small Gameboard
    When I run "minesweeper --size 3x3 --mine 2x2"
    Then it should pass with:
      """
      111
      1*1
      111
      
      """
      
  Scenario: Place Single Mine on large Gameboard

  Scenario: Place Two Mines on large Gameboard

  Scenario: Place Three Mines on large Gameboard

  Scenario: Large Empty minefield
    When I run "minesweeper --size 10x6"
    Then it should pass with:
      """
      ..........
      ..........
      ..........
      ..........
      ..........
      ..........
      
      """
