Feature: To test the JavaScript functions
  test description

  Scenario: To execute javascript executor
    * def intvalue = function() { return 10;}
    And print "constant", intvalue()
    * def randomvalue = function() { return Math.floor((100)* Math.random());}
    And print "randomvalue", randomvalue()
    * def parametervalue = function(arg1) { return "Hello! "+ arg1;}
    And print "constant", parametervalue
