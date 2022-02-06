
Feature: Variables creation in Karate Framework

  # <Gerkins keyword>  <def> <variavle_name> = <variavle_value>
  # * <def> <variavle_name> = <variavle_value>
  
  Background: Create and Initilize Variables
  
		* def name = "Chandu"
		* def roll_no = 20

  Scenario: To create a variable
    Given def var_int = 10
    And def var_string = "karate"
    Then print "Int Variable ++> ", var_int
    And print "String Variable ++> ", var_string
    * def var_int_2 = var_int + 10
    And print "New Variable ==> ", var_int_2
    And print "Background Variables ==> ", name, roll_no
    
    Scenario: Access the Variables
    * def var_int = 1
    * def var_string = "New"
    * def var_int_2 = var_int + 90
    Given print "Previous Scenario ==>", var_int
    And print "Previous Scenario ==>", var_string
    And print "Previous Scenario ==>", var_int_2
    And print "Background Variables ==> ", name, roll_no