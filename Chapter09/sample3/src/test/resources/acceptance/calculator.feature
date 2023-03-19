Feature: Calculator
  Scenario: Sum two numbers
    Given I have two numbers: 1 and 2
    When the calculator sums them
    Then I receive 3 as a result
  
  Scenerio: Divide two numbers
  Given I have a dividend and divisor: 6 and 3
  When the calculator divides them
  Then the quotient is 2