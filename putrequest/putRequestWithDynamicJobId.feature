Feature: Updating the job entry using put request
  		 PUT Request endpoint: /normal/webapi/update

  Background: Setting the base url
    Given url 'http://localhost:9897'

  Scenario: Creating a job entry using post request
    Given path '/normal/webapi/add'
    And def getRandomId = function() {Math.floor(Math.random() * 200);}
    * def id = getRandomId()
    And request {"jobId":'#(id)',"jobTitle":"Software Engg","jobDescription":"To develop web and mobile application","experience":["Google","Apple","Mobile Iron","Amazon"],"project":[{"projectName":"Movie App-140","technology":["Kotlin","SQL Lite","Gradle"]},{"projectName":"Movie App-140","technology":["Kotlin","SQL Lite","Gradle","Jenkins","Node JS"]}]}
    And headers {Accept: 'application/json' , Content-Type: 'application/json'}
    When method post
    Then status 201
    And print response
  # Validating if the request is created or not using get request
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    
  # Updating the job entry using put request and storing the jobId in a variable and validating using json path API
    Given path '/normal/webapi/update'
    And request 
    """
     {
      "jobId":'#(id)',
      "jobTitle":"Software Engg - 3",
      "jobDescription":"To develop andriod application and Web Application",
      "experience":[
        "Google",
        "Apple",
        "Mobile Iron",
        "Google"
        "Flipkart"
      ],
      "project":[
        {
           "projectName":"Movie App",
           "technology":[
              "Kotlin",
              "SQL Lite",
              "Gradle",
              "Jenkins"
           ]
        },
        {
           "projectName":"Movie App",
           "technology":[
              "Kotlin",
              "SQL Lite",
              "Gradle",
              "Jenkins"
              "Node JS"
           ]
        }
      ]
      }
    """
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 200
    And print response
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == " + id +")]")
   And print projectArray
   
    Scenario: Updating the job entry for job id that does not exist
    Given path '/normal/webapi/add'
    And def getRandomId = function() {Math.floor(Math.random() * 200);}
    * def id = getRandomId()
    And request {"jobId":'#(id)',"jobTitle":"Software Engg","jobDescription":"To develop web and mobile application","experience":["Google","Apple","Mobile Iron","Amazon"],"project":[{"projectName":"Movie App-140","technology":["Kotlin","SQL Lite","Gradle"]},{"projectName":"Movie App-140","technology":["Kotlin","SQL Lite","Gradle","Jenkins","Node JS"]}]}
    And headers {Accept: 'application/json' , Content-Type: 'application/json'}
    When method post
    Then status 201
    And print response
  # Validating if the request is created or not using get request
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    
  # Updating the job entry using put request and storing the jobId in a variable and validating using json path API
    Given path '/normal/webapi/update'
    And request 
    """
     {
      "jobId":'#(getRandomId())',
      "jobTitle":"Software Engg - 3",
      "jobDescription":"To develop andriod application and Web Application",
      "experience":[
        "Google",
        "Apple",
        "Mobile Iron",
        "Google"
        "Flipkart"
      ],
      "project":[
        {
           "projectName":"Movie App",
           "technology":[
              "Kotlin",
              "SQL Lite",
              "Gradle",
              "Jenkins"
           ]
        },
        {
           "projectName":"Movie App",
           "technology":[
              "Kotlin",
              "SQL Lite",
              "Gradle",
              "Jenkins"
              "Node JS"
           ]
        }
      ]
      }
    """
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 400
   
