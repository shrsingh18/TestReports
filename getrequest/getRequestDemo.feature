Feature: To test the endpoint of the given application url

  Background: Defining the base path
    Given url 'http://localhost:9897'
    And print '***********This is background keyword**************'

  # just to print in the console and check if background keyword is working or not
  Scenario: To get all the data from the application in JSON format
    Given path '/normal/webapi/all'
    When method get #Send the get request
    Then status 200 #Status should be 200

  # Since the Given url 'http://localhost:9897' is common in both the scenarios, hence we can move it to background keyword
  # path variable can be used both with Given and And keywords as seen here
  Scenario: To get all the data from the application in JSON format using path variable
    And path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get #Send the get request
    Then status 200 #Status should be 200

  # header kewyord is used to specify the request headers. For example: we want data to be in XML format so we have used as below
  Scenario: To get all the data from the application in XML format using path variable
    And path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get #Send the get request
    Then status 200 #Status should be 200
