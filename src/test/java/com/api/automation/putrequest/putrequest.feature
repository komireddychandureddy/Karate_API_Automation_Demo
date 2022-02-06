Feature: To test the put request
  test description

  Background: Setup the Base URL
    Given url 'http://localhost:9897/'
    And print '**********Test*********'

  Scenario: To create new job entry and update the job with the JSON format
    Given path '/normal/webapi/add'
    * def getJobId = function() { return Math.floor((100)* Math.random());}
    * def jobID = getJobId()
    And request {"jobId":'#(jobID)',"jobTitle":"Software Engg7","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers { Accept: 'application/json', Content-Type: 'application/json'}
    When method post
    Then status 201
    #And print response
    #Update using PUT request
    Given path '/normal/webapi/update'
    And request
      """
      {
          "jobId": '#(jobID)',
          "jobTitle": "Software Engg 2",
          "jobDescription": "To develop andriod application and web application",
          "experience": [
            "Google",
            "Apple",
            "Mobile Iron"
          ],
          "project": [
            {
              "projectName": "Movie App",
              "technology": [
                "Kotlin",
                "SQL Lite",
                "Gradle"
              ]
            },
            {
              "projectName": "Sport App",
              "technology": [
                "Kotlin2",
                "SQL Lite2",
                "Gradle2"
              ]
            }
          ]
        }

      """
    And headers { Accept: 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 200
    #And print response
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == "+jobID+")].project")
    And match projectArray[0] == '#[2]'

  Scenario: To create new job entry and update the job with random jobid
    Given path '/normal/webapi/add'
    * def getJobId = function() { return Math.floor((100)* Math.random());}
    * def jobID = getJobId()
    And request {"jobId":'#(jobID)',"jobTitle":"Software Engg7","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers { Accept: 'application/json', Content-Type: 'application/json'}
    When method post
    Then status 201
    #And print response
    #Update using PUT request
    Given path '/normal/webapi/update'
    And request
      """
      
        {
          "jobId": '#(getJobId())',
          "jobTitle": "Software Engg 2",
          "jobDescription": "To develop andriod application and web application",
          "experience": [
            "Google",
            "Apple",
            "Mobile Iron"
          ],
          "project": [
            {
              "projectName": "Movie App",
              "technology": [
                "Kotlin",
                "SQL Lite",
                "Gradle"
              ]
            },
            {
              "projectName": "Sport App",
              "technology": [
                "Kotlin2",
                "SQL Lite2",
                "Gradle2"
              ]
            }
          ]
        }

      """
    And headers { Accept: 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 404

  Scenario: To create new job entry and update the job with call another feature file
    # <Gherkin keyword> <call> <read(path of feature file)>
    Given call read("../createJobEntry.feature")
    #And print response
    #Update using PUT request
    Given path '/normal/webapi/update'
    And request
      """
      {
          "jobId": '99',
          "jobTitle": "Software Engg 2",
          "jobDescription": "To develop andriod application and web application",
          "experience": [
            "Google",
            "Apple",
            "Mobile Iron"
          ],
          "project": [
            {
              "projectName": "Movie App",
              "technology": [
                "Kotlin",
                "SQL Lite",
                "Gradle"
              ]
            },
            {
              "projectName": "Sport App",
              "technology": [
                "Kotlin2",
                "SQL Lite2",
                "Gradle2"
              ]
            }
          ]
        }

      """
    And headers { Accept: 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 200
    #And print response
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == 99)].project")
    And match projectArray[0] == '#[2]'

  Scenario: To create new job entry and update the job with call scenario and variable from another feature file
    # <Gherkin keyword> <call> <read(path of feature file)>
    * def postrequest = call read("../createJobEntry.feature")
    And print "calling feature ==", postrequest.getJobId()
    And print "calling feature ==", postrequest.jobID
    #And print response
    #Update using PUT request
    Given path '/normal/webapi/update'
    And request
      """
      {
          "jobId": '#(postrequest.jobID)',
          "jobTitle": "Software Engg 2",
          "jobDescription": "To develop andriod application and web application",
          "experience": [
            "Google",
            "Apple",
            "Mobile Iron"
          ],
          "project": [
            {
              "projectName": "Movie App",
              "technology": [
                "Kotlin",
                "SQL Lite",
                "Gradle"
              ]
            },
            {
              "projectName": "Sport App",
              "technology": [
                "Kotlin2",
                "SQL Lite2",
                "Gradle2"
              ]
            }
          ]
        }

      """
    And headers { Accept: 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 200
    #And print response
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == "+postrequest.jobID+")].project")
    And match projectArray[0] == '#[2]'

  Scenario: To create new job entry with variables and update the job with call scenario and variable from another feature file
    # <Gherkin keyword> <call> <read(path of feature file) {key:value1,key2:value2}> 
    * def getJobId = function() { return Math.floor((100)* Math.random());}
    * def id = getJobId()
    * def postrequest = call read("../createJobEntrywithVariables.feature") {_url:'http://localhost:9897/', _path:'/normal/webapi/add',_id:'#(id)'}
    #Update using PUT request
    Given path '/normal/webapi/update'
    And request
      """
      {
          "jobId": '#(id)',
          "jobTitle": "Software Engg 2",
          "jobDescription": "To develop andriod application and web application",
          "experience": [
            "Google",
            "Apple",
            "Mobile Iron"
          ],
          "project": [
            {
              "projectName": "Movie App",
              "technology": [
                "Kotlin",
                "SQL Lite",
                "Gradle"
              ]
            },
            {
              "projectName": "Sport App",
              "technology": [
                "Kotlin2",
                "SQL Lite2",
                "Gradle2"
              ]
            }
          ]
        }

      """
    And headers { Accept: 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 200
    #And print response
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == "+id+")].project")
    And match projectArray[0] == '#[2]'