Feature: To test the patch request
  test description

  Background: Setup the Base URL
    Given url 'http://localhost:9897/'
    And print '**********Test*********'

  Scenario: To created new job entry and delete
    # To create job entry
    # <Gherkin keyword> <call> <read(path of feature file) {key:value1,key2:value2}>
    * def getJobId = function() { return Math.floor((100)* Math.random());}
    * def createJobId = getJobId()
    * def postrequest = call read("../createJobEntrywithVariables.feature") {_url:'http://localhost:9897/', _path:'/normal/webapi/add',_id:'#(createJobId)'}
    Given path '/normal/webapi/remove/'+createJobId
    And params {id : '#(createJobId)', jobTitle: "Software Engg 2", jobDescription: '#(jobDes)'}
    And headers { Accept: 'application/json', Content-Type: 'application/json'}
    When method delete
    Then status 200
    # Get Request
    And path '/normal/webapi/find'
    And params {id : '#(createJobId)', jobTitle: "Software Engg 2"}
    And header Accept = 'application/json'
    When method get
    Then status 404

  Scenario: To created new job entry and delete twice
    # To create job entry
    # <Gherkin keyword> <call> <read(path of feature file) {key:value1,key2:value2}>
    * def getJobId = function() { return Math.floor((100)* Math.random());}
    * def createJobId = getJobId()
    * def postrequest = call read("../createJobEntrywithVariables.feature") {_url:'http://localhost:9897/', _path:'/normal/webapi/add',_id:'#(createJobId)'}
    Given path '/normal/webapi/remove/'+createJobId
    And params {id : '#(createJobId)', jobTitle: "Software Engg 2", jobDescription: '#(jobDes)'}
    And headers { Accept: 'application/json', Content-Type: 'application/json'}
    When method delete
    Then status 200
    # Get Request
    And path '/normal/webapi/find'
    And params {id : '#(createJobId)', jobTitle: "Software Engg 2"}
    And header Accept = 'application/json'
    When method get
    Then status 404
    # Get Request
    And path '/normal/webapi/find'
    And params {id : '#(createJobId)', jobTitle: "Software Engg 2"}
    And header Accept = 'application/json'
    When method get
    Then status 404

  Scenario: chain request demo
    # To create job entry
    # <Gherkin keyword> <call> <read(path of feature file) {key:value1,key2:value2}>
    * def getJobId = function() { return Math.floor((100)* Math.random());}
    * def createJobId = getJobId()
    * def postrequest = call read("../createJobEntrywithVariables.feature") {_url:'http://localhost:9897/', _path:'/normal/webapi/add',_id:'#(createJobId)'}
    * def jobId = postrequest.responseJobId
    * def jobTitle = postrequest.responseJobTitle
    # Patch request
    * def jobDes = "To develop android and iOS app"
    Given path '/normal/webapi/update/details'
    And params {id : '#(jobId)', jobTitle: '#(jobTitle)', jobDescription: '#(jobDes)'}
    And headers { Accept: 'application/json', Content-Type: 'application/json'}
    And request {}
    When method patch
    Then status 200
    And response.jobId == jobId
    And match response.jobTitle == jobTitle
    # Get Request
    And path '/normal/webapi/find'
    And params {id : '#(jobId)', jobTitle: '#(jobTitle)'}
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match response.jobDescription == jobDes
