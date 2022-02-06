Feature: To test the put request
  test description

  Background: Setup the Base URL
    Given url 'http://localhost:9897/'
    And print '**********Test*********'

  Scenario: To create new job entry with variables and update the job with QueryParameter
    # <Gherkin keyword> <call> <read(path of feature file) {key:value1,key2:value2}>
    * def getJobId = function() { return Math.floor((100)* Math.random());}
    * def createJobId = getJobId()
    * def postrequest = call read("../../createJobEntrywithVariables.feature") {_url:'http://localhost:9897/', _path:'/normal/webapi/add',_id:'#(createJobId)'}
    Given path '/normal/webapi/find'
    #And param id = createJobId
    #And param jobTitle: "Software Engg 2"
    And params {id : '#(createJobId)', jobTitle: "Software Engg 2"}
    And headers { Accept: 'application/json', Content-Type: 'application/json'}
    When method get
    Then status 200
    And response.jobId == createJobId

  Scenario: To create new job entry with variables and update the job with QueryParameter
    # <Gherkin keyword> <call> <read(path of feature file) {key:value1,key2:value2}>
    * def getJobId = function() { return Math.floor((100)* Math.random());}
    * def createJobId = getJobId()
    * def postrequest = call read("../../createJobEntrywithVariables.feature") {_url:'http://localhost:9897/', _path:'/normal/webapi/add',_id:'#(createJobId)'}
    Given path '/normal/webapi/find'
    And param id = 1235566
    And param jobTitle = "Software Engg 2"
    #And params {id : '#(createJobId)', jobTitle: "Software Engg 2"}
    And headers { Accept: 'application/json', Content-Type: 'application/json'}
    When method get
    Then status 404
    And response.jobId == createJobId
