Feature: To get JWT token
test description

Background: Setup the Base URL
 Given url 'https://jobapplicationjwt.herokuapp.com'
 And print '**********Test*********'

Scenario: Register the user and get token
#Register the user
And path '/users/sign-up'
And headers {Accept : 'application/json', Content-Type:'application/json' }
And request {username: '#(username)', password: '#(password)'}
When method post
Then status 200
#Get the token
Given url 'https://jobapplicationjwt.herokuapp.com/users/authenticate'
And headers {Accept : 'application/json', Content-Type:'application/json'}
And request {username: '#(username)', password: '#(password)'}
When method post
Then status 200
And print response
* def authToken = response.token
