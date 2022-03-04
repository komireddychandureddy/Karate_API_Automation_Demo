Feature: To test JSON file from external source
test description

Background: Setup the Base URL
 Given url 'http://localhost:9897/'
 And print '**********Test*********'

Scenario: To get the all the data from JSON and Validate from JSON file
#Given url 'http://localhost:9897/normal/webapi/all'
And path '/normal/webapi/all'
And header Accept = 'application/json'
When method get
Then status 200
* def actualResponse = read("JsonPost.json")
And match response == actualResponse
And print "File ==>", actualResponse

Scenario: To get the all the data from application in the XML format
#Given url 'http://localhost:9897/normal/webapi/all'
And path '/normal/webapi/all'
And header Accept = 'application/xml'
When method get
Then status 200
* def actualResponse = read("XMLResponse.xml")
And match response == actualResponse
And print "XML File Response==>", actualResponse