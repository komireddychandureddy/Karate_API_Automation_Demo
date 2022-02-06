Feature: To test the post request
test description

Background: Setup the Base URL
 Given url 'http://localhost:9897/'
 And print '**********Test*********'

Scenario: To create job entry with the JSON format
	Given path '/normal/webapi/add'
	* def body = read("JsonPost.json")
	And request body
	And headers { Accept: 'application/json', Content-Type: 'application/json'}
	When method post
	Then status 201
	And print response
	And match response.jobTitle == "Software Engg7"
	
	Scenario: To create job entry with the XML format with JSON response
	Given path '/normal/webapi/add'
	* def body = read("XmlPost.xml")
	And request body
	And headers { Accept: 'application/json', Content-Type: 'application/xml'}
	When method post
	Then status 201
	And print response
	And match response.jobId == 11
