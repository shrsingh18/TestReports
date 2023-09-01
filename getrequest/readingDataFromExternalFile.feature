Feature: Read and validate data using an external json or xml file

  Scenario: Reading and validating data from an external file in json
    Given url 'http://localhost:9897/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    # reading data from external file using read API from karate framework
    * def actual_Response = read("../JsonResponse.json")
    And match response == actual_Response
    And print actual_Response

  Scenario: Reading and validating data from an external file in json
    Given url 'http://localhost:9897/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    # reading data from external file using read API from karate framework
    * def actual_Response = read("../XMLResponse.xml")
    And match response == actual_Response
    And print actual_Response
