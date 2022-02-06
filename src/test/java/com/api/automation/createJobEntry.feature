Feature: To test the create job entry request
  test description

  Scenario: To create new job entry and update the job with the JSON format
    Given url 'http://localhost:9897/'
    And path '/normal/webapi/add'
    * def getJobId = function() { return Math.floor((100)* Math.random());}
    * def jobID = getJobId()
    And request {"jobId":'#(jobID)',"jobTitle":"Software Engg7","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers { Accept: 'application/json', Content-Type: 'application/json'}
    When method post
    Then status 201
