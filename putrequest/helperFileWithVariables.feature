# Helper file for variables being passing from calling feature to helper feature
Feature: Creating a job entry using post request
  		 Post Endpoint: /normal/webapi/add

  Scenario: Creating a job entry using a post request
    Given url _url
    And path _path
    And print "Helper File --->" , _url
    And print "Helper File ---->" , _path
    And print "Helper File ----." , _id
    And request {"jobId":'#(_id)',"jobTitle":"Software Engg","jobDescription":"To develop web and mobile application","experience":["Google","Apple","Mobile Iron","Amazon"],"project":[{"projectName":"Movie App-140","technology":["Kotlin","SQL Lite","Gradle"]},{"projectName":"Movie App-140","technology":["Kotlin","SQL Lite","Gradle","Jenkins"]}]}
    And headers {Accept: 'application/json' , Content-Type: 'application/json'}
    When method post
    Then status 201
