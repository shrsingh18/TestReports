Feature: To test the GET endpoint with query param
  		 GET : /normal/webapi/find

  Background: Setting up the base url
    Given url 'http://localhost:9897'
    
    Scenario: Creating a job entry and then using the GET endpoint to find the entry using query params
    # creating a job entry using post request
    * def postRequest = call read("com/api/automation/putrequest/helperFileWithDynamicData.feature")
    # finding the job entry using get request
    Given path '/normal/webapi/find'
    And param id = postRequest.jobId
    And param jobTitle = 'Software Engg-Karate Framework'
    And headers {Accept: 'application/json' , Content-Type:'application/json'}
    When method get
    Then status 200
    And response.jobId == id
