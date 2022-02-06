Feature: To test the post request
  test description

  Background: Setup the Base URL
    Given url 'http://localhost:9897/'
    And print '**********Test*********'

  Scenario: To upload test file to the application
    Given path '/normal/webapi/upload'
    And multipart file file = { read: 'UploadFile.txt', filename: 'UploadFile.txt',  Content-Type: 'multipart/form-data'}
    When method post
    Then status 200
    And print response

  Scenario: To upload test file to the application JSON format
    Given path '/normal/webapi/upload'
    * def jsonfile = 'JsonPost.json'
    And multipart file file = { read: '#(jsonfile)', filename: 'JsonPost.json',  Content-Type: 'multipart/form-data'}
    When method post
    Then status 200
    And print response
    And match response.message contains "JsonPost.json"
