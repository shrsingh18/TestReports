Feature: To access the secure get endpoint using username and password
  Get endpoint: /secure/webapi/all

  Background: Setting up the base url
    Given url 'http://localhost:9897'

  Scenario: Accessing the secure get endpoint via js function
    Given path '/secure/webapi/all'
    * def auth = call read('../../basicAuthWithJs.js') {username:'admin',password:'welcome'}
    And print "the encoded sting is:", auth
    And headers {Accept : 'application/json' , Authorization : '#(auth)'}
    When method get
    Then status 200
