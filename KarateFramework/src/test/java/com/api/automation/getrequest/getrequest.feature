Feature: To test the get end point
test description

Background: Setup the Base URL
 Given url 'http://localhost:9897/'
 And print '**********Test*********'

Scenario: To get the all the data from application in the JSON format
#Given url 'http://localhost:9897/normal/webapi/all'
And path '/normal/webapi/all'
And header Accept = 'application/json'
When method get
Then status 200
And print response
And match response ==
"""
[
  {
    "jobId": 1,
    "jobTitle": "Software Engg",
    "jobDescription": "To develop andriod application",
    "experience": [
      "Google",
      "Apple",
      "Mobile Iron"
    ],
    "project": [
      {
        "projectName": "Movie App",
        "technology": [
          "Kotlin",
          "SQL Lite",
          "Gradle"
        ]
      }
    ]
  }
]
"""

Scenario: To get the all the data from application in the XML format
#Given url 'http://localhost:9897/normal/webapi/all'
And path '/normal/webapi/all'
And header Accept = 'application/xml'
When method get
Then status 200
And print response
And match response ==
"""
<List>
<item>
    <jobId>1</jobId>
    <jobTitle>Software Engg</jobTitle>
    <jobDescription>To develop andriod application</jobDescription>
    <experience>
      <experience>Google</experience>
      <experience>Apple</experience>
      <experience>Mobile Iron</experience>
    </experience>
    <project>
      <project>
        <projectName>Movie App</projectName>
        <technology>
          <technology>Kotlin</technology>
          <technology>SQL Lite</technology>
          <technology>Gradle</technology>
        </technology>
      </project>
    </project>
  </item>
</List>

"""

Scenario: To get the all the data from application in the XML format with negate
#Given url 'http://localhost:9897/normal/webapi/all'
And path '/normal/webapi/all'
And header Accept = 'application/xml'
When method get
Then status 200
And print response
And match response !=
"""
<List>
<item>
    <jobId>1</jobId>
    <jobTitle>Software Engg</jobTitle>
    <jobDescription>To develop andriod application</jobDescription>
    <experience>
      <experience>Google</experience>
      <experience>Apple</experience>
      <experience>Mobile Iron</experience>
    </experience>
    <project>
      <project>
        <projectName>Movie App</projectName>
        <technology>
          <technology>Kotlin</technology>
          <technology>SQL Lite</technology>
          <technology>Gradle</technology>
        </technology>
      </project>
    </project>
  </item>
</List>
"""
Scenario: To get the all the data from application in the JSON format with specific property
#Given url 'http://localhost:9897/normal/webapi/all'
And path '/normal/webapi/all'
And header Accept = 'application/json'
When method get
Then status 200
And print response
#And match response contains deep {"jobDescription": "To develop andriod application"}
#And match response contains {"project": [{"projectName": "Movie App"}
#And match response header Content-Type == 'application/json'
#And match response header Connection == 'keep-alive' 
And match response.[0].jobTitle == 'Software Engg'
And match response.[0].experience[1] == 'Apple'
And match response.[0].project[0].technology[2] == 'Gradle'
#validate array size
And match response.[0].experience == '#[3]'
And match response.[0].project[0].technology == '#[3]'
#validate wild char 
And match response.[0].experience[*] == ["Google","Apple","Mobile Iron"]
And match response.[0].project[0].technology[*] == ["Kotlin", "SQL Lite", "Gradle"]

#validate with contains
And match response.[0].experience[*] contains ["Google","Apple","Mobile Iron"]
And match response.[0].project[0].technology[*] contains ["Kotlin", "SQL Lite", "Gradle"]
And match response.[*].jobId contains 1



Scenario: To get the all the data from application in the XML format with validations
#Given url 'http://localhost:9897/normal/webapi/all'
And path '/normal/webapi/all'
And header Accept = 'application/xml'
When method get
Then status 200
And print response
And match response/List/item/jobId == '1'
And match response/List/item/jobTitle == 'Software Engg'
And match response/List/item/experience/experience[1] == 'Google'
#skip the response keyword
And match /List/item/experience/experience[1] == 'Google'
#Travers the xml similar to JSON 
# index starts from 1 for XML and 0 for JSON
And match response.List.item.experience.experience[0] == 'Google'


Scenario: To get the all the data from application in the JSON format with fuzzy matcher
#Given url 'http://localhost:9897/normal/webapi/all'
And path '/normal/webapi/all'
And header Accept = 'application/json'
When method get
Then status 200
And print response
And match response.[0].jobId == '#present'
And match response.[0].jobId == '#number'
And match response.[0].jobTitle == '#string'
And match response.[0].experience[1] == '#notnull'
And match response.[0].project[0].projectName == '#ignore'
And match response.[0].project[0].technology == '#array'
#And match response.[0].project[0].technology[2] == '#array'
#And match response.[0].project[0].technology[2] == '#array'
#complex fuzzy matcher
And match response.[0].jobId == '#? _ >= 1'
And match response.[0].jobTitle == '#string? _.length >=1'
And match response.[0].jobTitle == '#string? _.length == 13'
#To validate the array
And match response.[0].experience == '#[]'
And match response.[0].experience == '#[3]'
#To validate the array of string
And match response.[0].experience == '#[3] #string'
And match response.[0].experience == '#[3] #string? _.length >=2'


Scenario: To get the all the data from application in the XML format with fuzzy matcher validations
#Given url 'http://localhost:9897/normal/webapi/all'
And path '/normal/webapi/all'
And header Accept = 'application/xml'
When method get
Then status 200
And print response
And match response/List/item/jobId == '#notnull'
And match response/List/item/jobTitle == '#string'
#= '#array' is applicable for JSON only not XML
#And match response/List/item/experience/experience[1] == '#array'
And match response/List/item/experience/experience[1] == '#notnull'
#skip the response keyword
And match /List/item/experience/experience[1] == '#present'
#Travers the xml similar to JSON 
# index starts from 1 for XML and 0 for JSON
And match response.List.item.experience.experience[0] == '#ignore'
#Complex fuzzy matcher
And match response/List/item/jobTitle == '#string? _.length == 13'  
