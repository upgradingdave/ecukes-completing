Feature: Test Completing using ecukes
  In order to test functions that use completing method calls
  As an Ecukes user
  I want to run this feature successfully

Scenario: Choose Color
  When I press "M-x et-choose-color"
  And I press "RET"
  And I type "CadetBlue"
  And I press "RET"
  Then et-curr-color should be "CadetBlue"
