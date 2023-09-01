@Smoke
Feature: To demo scenario tagging
  			Patch request:/normal/webapi/update/details

  Background: Setting up the base url
    Given url 'http://localhost:9897'

  Scenario: Updating the job description for a newly created jobEntry using PATCH request
    # sending a post request to create a new job entry
    Given path '/normal/webapi/add'
    * def getRandomValue = function() {return Math.floor(Math.random() * 200);}
    * def createJobId = getRandomValue()
    * def getJobTitle = 'Accountant'
    And request {"jobId":'#(createJobId)',"jobTitle":'#(getJobTitle)',"jobDescription":"To develop mobile and web application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App-140","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    Then status 201
    # updating the job description using patch request and by sending the info via query params
    * def jobDesc = 'A job title is a specific designation of a post within an organization'
    Given path '/normal/webapi/update/details'
    And params {id: '#(createJobId)' , jobTitle : '#(getJobTitle)' , jobDescription : '#(jobDesc)'}
    And headers {Accept : 'application/json'}
    And request {}
    When method patch
    Then status 200
    And match response.jobDescription == jobDesc

  Scenario: To update the job description for newly added job entry with non-exiting job id
    # sending a post request to create a new job entry
    Given path '/normal/webapi/add'
    * def getRandomValue = function() {return Math.floor(Math.random() * 200);}
    * def createJobId = getRandomValue()
    * def getJobTitle = 'Accountant'
    And request {"jobId":'#(createJobId)',"jobTitle":'#(getJobTitle)',"jobDescription":"To develop mobile and web application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App-140","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    Then status 201
    # updating the job description using patch request and by sending the info via query params
    * def jobDesc = 'A job title is a specific designation of a post within an organization'
    Given path '/normal/webapi/update/details'
    And params {id: '-1' , jobTitle : '#(getJobTitle)' , jobDescription : '#(jobDesc)'}
    And headers {Accept : 'application/json'}
    And request {}
    When method patch
    Then status 404

  Scenario: To update the job description for newly added job entry without job title
    # sending a post request to create a new job entry
    Given path '/normal/webapi/add'
    * def getRandomValue = function() {return Math.floor(Math.random() * 200);}
    * def createJobId = getRandomValue()
    * def getJobTitle = 'Accountant'
    And request {"jobId":'#(createJobId)',"jobTitle":'#(getJobTitle)',"jobDescription":"To develop mobile and web application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App-140","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    Then status 201
    # updating the job description using patch request and by sending the info via query params
    * def jobDesc = 'A job title is a specific designation of a post within an organization'
    Given path '/normal/webapi/update/details'
    And params {id: '-1' , jobDescription : '#(jobDesc)'}
    And headers {Accept : 'application/json'}
    And request {}
    When method patch
    Then status 400
