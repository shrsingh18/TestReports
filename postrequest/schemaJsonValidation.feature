Feature: To validate the json schema
  		 To validate the JSON schema for POST request: /normal/webapi/add

  Background: Defining the base path for the request
    Given url 'http://localhost:9897'

  # positive scenario: where all the fields are matching against the schema
  Scenario: To validate the JSON schema
    Given path '/normal/webapi/add'
    * def body = read("externalfile/JsonRequest.json")
    And request body
    And headers {Accept : 'application/json' , Content-Type : 'application/json'}
    When method post
    And status 201
    And match response ==
      """
      {
          "jobId": '#number',
          "jobTitle": '#string',
          "jobDescription": '#string',
          "experience": '#[] #string',
          "project": '#[] #object'
      }
      """

  # negative scenario: mismatch in the type of the fields or introducing some fields that aren't present
  Scenario: To validate the JSON schema negative scenario
    Given path '/normal/webapi/add'
    * def body = read("externalfile/JsonRequest.json")
    And request body
    And headers {Accept : 'application/json' , Content-Type : 'application/json'}
    When method post
    And status 201
    And match response ==
      """
      {
          "jobId": '#string',					#jobId is a number but here we have put it as string
          "jobTitle": '#string',
          "jobDescription": '#string',
          "experience": '#[] #string',
          "fakeKey": '#string',						# this field does not exist in the request 
          "project": '#[] #object'
      }
      """
