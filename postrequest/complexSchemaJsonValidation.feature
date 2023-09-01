Feature: To validate the json schema
  		 To validate the JSON schema for POST request: /normal/webapi/add

  Background: Defining the base path for the request
    Given url 'http://localhost:9897'

  Scenario: GET endpoint schema validation
    Given path '/normal/webapi/all'
     And header Accept = 'application/json'
    When method get    # Send the get request
    Then status 200		# the status code response should be 200
    And def projectSchema = { "projectName": '#string',"technology": '#[] #string' }
    And def mainSchema = {"jobId" : '#number' , "jobTitle" : '#string', "jobDescription" : '#string', "experience": '#[] #string', "project": '#[] ##(projectSchema)'}
    And match response ==
      """
			'#[] ##(mainSchema)'
      """
