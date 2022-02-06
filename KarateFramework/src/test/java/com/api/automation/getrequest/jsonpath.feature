Feature: To test the get end point
test description

Background: Setup the Base URL
 Given url 'http://localhost:9897/'
 And print '**********Test*********'

Scenario: To get the all the data from application in the JSON format
And path '/normal/webapi/all'
And header Accept = 'application/json'
When method get
Then status 200
* def jobTitle = karate.jsonPath(response, "$[?(@.jobId==1)].jobTitle")

* def jobDescrition = karate.jsonPath(response, "$[?(@.jobId==1)].jobDescrition")

* def exeperience = karate.jsonPath(response, "$[?(@.jobId==1)].exeperience")

And print "jobTitle ==>", jobTitle
And print "jobDescrition ==>", jobDescrition
And print "exeperience ==>", exeperience
