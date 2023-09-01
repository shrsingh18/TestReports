Feature: To create embedded expressions for fields in JSON format

  Background: Creating and initializing the base url
    Given url 'http://localhost:9897'

  Scenario: Creating a post request in json format with embedded expression
    Given path '/normal/webapi/add'
    * def getJobId = function() {return (Math.floor(Math.random() * 100));}
    * def jobId = getJobId()
    * def getJobTitle = function(str1) {return str1;}
    * def jobTitle = getJobTitle("Karate Engg")
    And request {"jobId":'#(jobId)',"jobTitle":'#(jobTitle)',"jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept : 'application/json' , Content-Type : 'application/json'}
    When method post
    Then status 201
    And print response

  Scenario: Creating a post request in xml format with embedded expression
    Given path '/normal/webapi/add'
    * def getJobId = function() {return (Math.floor(Math.random() * 100));}
    * def jobId = getJobId()
    * def getJobTitle = function(str1) {return str1;}
    * def jobTitle = getJobTitle("Karate Engineering")
    And request <item><jobId>#(jobId)</jobId><jobTitle>#(jobTitle)</jobTitle><jobDescription>To develop andriod application</jobDescription><experience><experience>Google</experience><experience>Apple</experience><experience>Mobile Iron</experience></experience><project><project><projectName>Movie App-5</projectName><technology><technology>Kotlin</technology><technology>SQL Lite</technology><technology>Gradle</technology></technology></project></project></item>
    And headers {Accept : 'application/xml' , Content-Type : 'application/xml'}
    When method post
    Then status 201
    And print response
    And match response/Job/jobTitle == '#(jobTitle)'
    
