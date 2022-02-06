Feature: To test the create job entry request
  test description

  Scenario: To create new job entry and update the job with the JSON format
    Given url _url
    And path _path
    And print "_url", _url
    And print "_path", _path
    And print "_id", _id
    And request {"jobId":'#(_id)',"jobTitle":"Software Engg7","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers { Accept: 'application/json', Content-Type: 'application/json'}
    When method post
    Then status 201
    * def responseJobId = response.jobId
