Feature: To access the get request which is secure with basic auth
test description

Background: Setup the Base URL
 Given url 'http://localhost:9897/'
 And print '**********Test*********'

Scenario: To get request which is secure with basic auth
#Given url 'http://localhost:9897/normal/webapi/all'
And path '/secure/webapi/all'
And headers {Accept : 'application/json', Authorization: 'Basic YWRtaW46d2VsY29tZQ=='}
When method get
Then status 200
And match response == '#notnull'

Scenario: To get request which is secure without basic auth
#Given url 'http://localhost:9897/normal/webapi/all'
And path '/secure/webapi/all'
And headers {Accept : 'application/json'}
When method get
Then status 401
And match response == '#notnull'

Scenario: To get request which is secure with non-exit user basic auth
#Given url 'http://localhost:9897/normal/webapi/all'
And path '/secure/webapi/all'
And headers {Accept : 'application/json', Authorization: 'Basic YWRtaWsdfdsfsdfds46d2VsY29tZQ=='}
When method get
Then status 401


Scenario: To get request which is secure with Javascript basic auth
And path '/secure/webapi/all'
* def auth = call read('../../basicAuth.js') {username:'admin', password:'welcome'}
And headers {Accept : 'application/json', Authorization: '#(auth)'}
When method get
Then status 200
And match response == '#notnull'

Scenario: To get request which is secure with Javascript basic auth invalid
And path '/secure/webapi/all'
* def auth = call read('../../basicAuth.js') {username:'admin1', password:'welcome'}
And headers {Accept : 'application/json', Authorization: '#(auth)'}
When method get
Then status 401
