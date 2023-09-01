Feature: Creating a job entry using post request
  		 Post Endpoint: /normal/webapi/add

  Scenario: Creating a job entry using a post request
    Given url 'http://localhost:9897'
    And path '/normal/webapi/add'
    And request {"jobId":190,"jobTitle":"Software Engg-190","jobDescription":"To develop web and mobile application","experience":["Google","Apple","Mobile Iron","Amazon"],"project":[{"projectName":"Movie App-140","technology":["Kotlin","SQL Lite","Gradle"]},{"projectName":"Movie App-140","technology":["Kotlin","SQL Lite","Gradle","Jenkins"]}]}
    And headers {Accept: 'application/json' , Content-type: 'application/json'}
    When method post
    Then status 201
