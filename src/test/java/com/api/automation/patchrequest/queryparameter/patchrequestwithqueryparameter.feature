Feature: To test the patch request
  test description

  Background: Setup the Base URL
    Given url 'http://localhost:9897/'
    And print '**********Test*********'

@Ignore
  Scenario: To update job description for the newly created job entry
    # To create job entry
    # <Gherkin keyword> <call> <read(path of feature file) {key:value1,key2:value2}>
    * def getJobId = function() { return Math.floor((100)* Math.random());}
    * def createJobId = getJobId()
    * def postrequest = call read("../../createJobEntrywithVariables.feature") {_url:'http://localhost:9897/', _path:'/normal/webapi/add',_id:'#(createJobId)'}
    # Patch request
    * def jobDes = "To develop android and iOS app"
    Given path '/normal/webapi/update/details'
    And params {id : '#(createJobId)', jobTitle: "Software Engg 2", jobDescription: '#(jobDes)'}
    And headers { Accept: 'application/json', Content-Type: 'application/json'}
    And request {}
    When method patch
    Then status 200
    And response.jobId == createJobId
    And match response.jobDescription == jobDes

  Scenario: To update job description for the newly created job entry with non exist job id
    # To create job entry
    # <Gherkin keyword> <call> <read(path of feature file) {key:value1,key2:value2}>
    * def getJobId = function() { return Math.floor((100)* Math.random());}
    * def createJobId = getJobId()
    * def postrequest = call read("../../createJobEntrywithVariables.feature") {_url:'http://localhost:9897/', _path:'/normal/webapi/add',_id:'#(createJobId)'}
    # Patch request
    * def jobDes = "To develop android and iOS app"
    Given path '/normal/webapi/update/details'
    And params {id : '-4', jobTitle: "Software Engg 2", jobDescription: '#(jobDes)'}
    And headers { Accept: 'application/json', Content-Type: 'application/json'}
    And request {}
    When method patch
    Then status 404

  Scenario: To update job description for the newly created job entry without job title
    # To create job entry
    # <Gherkin keyword> <call> <read(path of feature file) {key:value1,key2:value2}>
    * def getJobId = function() { return Math.floor((100)* Math.random());}
    * def createJobId = getJobId()
    * def postrequest = call read("../../createJobEntrywithVariables.feature") {_url:'http://localhost:9897/', _path:'/normal/webapi/add',_id:'#(createJobId)'}
    # Patch request
    * def jobDes = "To develop android and iOS app"
    Given path '/normal/webapi/update/details'
    And params {id : '#(createJobId)', jobDescription: '#(jobDes)'}
    And headers { Accept: 'application/json', Content-Type: 'application/json'}
    And request {}
    When method patch
    Then status 400
    And match response.message == "Required String parameter 'jobTitle' is not present"
