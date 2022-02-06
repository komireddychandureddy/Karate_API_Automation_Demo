Feature: To test the post request
  test description

  Background: Setup the Base URL
    * def testdata = read('testData.csv')
    And print '**********Test*********'

  Scenario Outline: Data Driven for create job entry with  - <jobId>
    Given url 'http://localhost:9897/'
    And path '/normal/webapi/add'
    And request {"jobId":'#(jobId)',"jobTitle":'#(jobTitle)',"jobDescription":'#(jobDescription)',"experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers { Accept: 'application/json', Content-Type: 'application/json'}
    When method <method>
    Then status <status>

    Examples: 
      | jobId | jobTitle       | jobDescription                 | method | status |
      | 9878 | Software Engg1 | To develop andriod application | post   |    201 |
      | id    | Software Engg1 | To develop andriod application | post   |    400 |
      | false | Software Engg1 | To develop andriod application | post   |    400 |
      
  Scenario Outline: Data Driven for create job entry with  - <jobId>
    Given url 'http://localhost:9897/'
    And path '/normal/webapi/add'
    And request {"jobId":'#(jobId)',"jobTitle":'#(jobTitle)',"jobDescription":'#(jobDescription)',"experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers { Accept: 'application/json', Content-Type: 'application/json'}
    When method <method>
    Then status <status>

    Examples: 
      | testdata | 