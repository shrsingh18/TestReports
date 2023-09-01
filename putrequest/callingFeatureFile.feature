Feature: Updating the created job entry using put request
  		 Endpoint: /normal/webapi/update

  # if the jobId is hardcoded value
  Scenario: Updating the created job entry by calling the helper file
    # <Gherkin keyword> <call> <read(<location of file>)>
    Given call  read("helperFile.feature")
    Given url 'http://localhost:9897/normal/webapi/update'
    And request
      """
      {
          "jobId": 190,
          "jobTitle": "Software Engg-190",
          "jobDescription": "To develop web application",
          "experience": [
              "Google",
              "Apple",
              "Amazon"
          ],
          "project": [
              {
                  "projectName": "Movie App-140",
                  "technology": [
                      "Kotlin",
                      "SQL Lite",
                      "Karate Framework"
                  ]
              }
          ]
      }
      """
    And headers {Accept: 'application/json' , Content-Type: 'application/json'}
    When method put
    Then status 200

  # reading or accessing variables from helper file to the calling feature file
  Scenario: Updating the created job entry by calling the helper file
    # <Gherkin keyword> <call> <read(<location of file>)>
    * def postRequestData =  call read("helperFileWithDynamicData.feature")
    Given url 'http://localhost:9897/normal/webapi/update'
    And print "Helper File Variable ---->", postRequestData.jobId
    And request
      """
      {
          "jobId": '#(postRequestData.jobId)',
          "jobTitle": "Software Engg-190",
          "jobDescription": "To develop web application",
          "experience": [
              "Google",
              "Apple",
              "Amazon"
          ],
          "project": [
              {
                  "projectName": "Movie App-140",
                  "technology": [
                      "Kotlin",
                      "SQL Lite",
                      "Karate Framework"
                  ]
              },
              {
                  "projectName": "Movie App-140",
                  "technology": [
                      "Kotlin",
                      "SQL Lite",
                  ]
              }
          ]
      }
      """
    And headers {Accept: 'application/json' , Content-Type: 'application/json'}
    When method put
    Then status 200
    
    # passing variable values from calling feature to helper feature
    Scenario: Updating a job entry by passing variable values from calling feature to helper feature
    # Syntax of calling helper file in this scenario: 
    # <Gherkin Keyword> <call> <read(file_location)> {var1: value1, var2 : value2..}
    * def getRandomValue = function() {return (Math.floor (Math.random() * 100));}
    * def id = getRandomValue()
    * def postRequest =  call read("helperFileWithVariables.feature") {_url : 'http://localhost:9897' , _path : '/normal/webapi/add' , _id : '#(id)'}
	
    
     
