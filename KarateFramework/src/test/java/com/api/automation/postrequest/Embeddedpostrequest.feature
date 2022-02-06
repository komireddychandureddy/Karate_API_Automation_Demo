Feature: To test the post request
test description

Background: Setup the Base URL
 Given url 'http://localhost:9897/'
 And print '**********Test*********'

Scenario: To create job entry with the JSON format with Embedded expression
	Given path '/normal/webapi/add'
	* def getJobId = function() { return Math.floor((100)* Math.random());}
	And request {"jobId":'#(getJobId())',"jobTitle":"Software Engg7","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
	And headers { Accept: 'application/json', Content-Type: 'application/json'}
	When method post
	Then status 201
	#And print response
	And match response.jobTitle == "Software Engg7"
	
	Scenario: To create job entry with the XML format with Embedded expression and JSON response
	Given path '/normal/webapi/add'
	* def getJobId = function() { return Math.floor((100)* Math.random());}
	* def jobID = getJobId()
	And request <item><jobId>#(jobID)</jobId><jobTitle>Software Engg6</jobTitle><jobDescription>To develop andriod application</jobDescription><experience><experience>Google</experience><experience>Apple</experience><experience>Mobile Iron</experience></experience><project><project><projectName>Movie App</projectName><technology><technology>Kotlin</technology><technology>SQL Lite</technology><technology>Gradle</technology></technology></project></project></item>
	And headers { Accept: 'application/json', Content-Type: 'application/xml'}
	When method post
	Then status 201
	And print response
	And match response.jobId == '#(jobID)'
	