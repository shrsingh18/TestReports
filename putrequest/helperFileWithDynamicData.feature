Feature: Creating a job entry using post request
  		 Post Endpoint: /normal/webapi/add

  Scenario: Creating a job entry using a post request
    Given url 'http://localhost:9897'
    And path '/normal/webapi/add'
    And def getRandomNumber = function() {return Math.floor(Math.random() * 10);}
    * def jobId = getRandomNumber()
    And request {"jobId":'#(jobId)',"jobTitle":"Software Engg-Karate Framework","jobDescription":"To develop web and mobile application","experience":["Google","Apple","Mobile Iron","Amazon"],"project":[{"projectName":"Movie App-140","technology":["Kotlin","SQL Lite","Gradle"]},{"projectName":"Movie App-140","technology":["Kotlin","SQL Lite","Gradle","Jenkins"]}]}
    And headers {Accept: 'application/json' , Content-Type: 'application/json'}
    When method post
    Then status 201
