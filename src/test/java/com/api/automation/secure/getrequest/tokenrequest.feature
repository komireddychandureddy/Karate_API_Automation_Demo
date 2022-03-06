Feature: To access the get request with token
  test description

  Scenario: To get request get request with token
    * def token = call read('../../getToken.feature') {username: 'sean tear', password:'jhon'}
    Given url 'https://jobapplicationjwt.herokuapp.com/auth/webapi/all'
    And headers {Accept : 'application/json', Authorization: '#("Bearer " + token.authToken)'}
    When method get
    Then status 200

  Scenario: To get request get request without token
    Given url 'https://jobapplicationjwt.herokuapp.com/auth/webapi/all'
    And headers {Accept : 'application/json'}
    When method get
    Then status 401
