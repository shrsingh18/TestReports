Feature: Updating the job entry using put request
  		 PUT Request endpoint: /normal/webapi/update

  Background: Setting the base url
    Given url 'http://localhost:9897'

  Scenario: Creating a job entry using post request
    Given path '/normal/webapi/add'
    And request {"jobId":141,"jobTitle":"Software Engg-141","jobDescription":"To develop web application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App-140","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept: 'application/json' , Content-Type: 'application/json'}
    When method post
    Then status 201
    And print response

  Scenario: Validating if the request is created or not using get request
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response

  Scenario: Updating the job entry using put request
    Given path '/normal/webapi/update'
    And request {"jobId":140,"jobTitle":"Software Engg-140","jobDescription":"To develop web and mobile application","experience":["Google","Apple","Mobile Iron","Amazon"],"project":[{"projectName":"Movie App-140","technology":["Kotlin","SQL Lite","Gradle"]},{"projectName":"Movie App-140","technology":["Kotlin","SQL Lite","Gradle","Jenkins","Node JS"]}]}
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 200
    And print response
    And match response.jobId == 140
