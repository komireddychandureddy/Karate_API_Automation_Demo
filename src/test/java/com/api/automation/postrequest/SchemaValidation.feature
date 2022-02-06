Feature: To test the Schema validation
  test description

  Background: Setup the Base URL
    Given url 'http://localhost:9897/'
    And print '**********Test*********'

  Scenario: To create job entry with the JSON format schema validation
    Given path '/normal/webapi/add'
    * def body = read("JsonPost.json")
    And request body
    And headers { Accept: 'application/json', Content-Type: 'application/json'}
    When method post
    Then status 201
    And match response ==
      """
      {
         "jobId": '#number',
         "jobTitle": '#string',
         "jobDescription": '#string',
         "experience": '#[] #string',
         "project": '#[] #object'
       }
      """

  Scenario: To create job entry with the JSON format Invalid schema validation
    Given path '/normal/webapi/add'
    * def body = read("JsonPost.json")
    And request body
    And headers { Accept: 'application/json', Content-Type: 'application/json'}
    When method post
    Then status 201
    And match response ==
      """
      {
         "jobId": '#number',
         "jobTitle": '#number',
         "jobDescription": '#string',
         "experience": '#[] #string',
          "FakeKey": '#number',
         "project": '#[] #object'
       }
      """

Scenario: To get the all the data from application in the JSON format
	And path '/normal/webapi/all'
	And header Accept = 'application/json'
	When method get
	Then status 200
	* def projectSchema = { "projectName": '#string',"technology": '#[] #string'}
	* def mainSchema = {"jobId": '#number',"jobTitle": '#string',"jobDescription": '#string', "experience": '#[] #string',"project": '#[] ##(projectSchema)'}
	And print response
	And match response ==
	"""
	'#[] ##(mainSchema)'
	"""