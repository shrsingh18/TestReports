Feature: To validate the json array

  Scenario: To get the data in json format and validate it using
    Given url 'http://localhost:9897'
    And path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    And match response[0].jobTitle == '#ignore'
    And match response[0].experience[1] == '#notnull'
    And match response[0].project[0].projectName == '#present'
    And match response[0].project[0].technology == '#array'
    And match response[0].project[0].technology[1] == '#string'
    And match response[0].jobId == '#number'
    
    # Complex fuzzy matchers
    And match response[0].jobId == '#number? _ ==1'
    And match response[0].experience[1] == '#string? _.length == 5'
    
    # fuzzy matcher for array validation
    # if we dont specify any numeric value in the [], then it will just validate if it is an array or not
    # requirement: to validate the size of array, the data type of each value inside array should be string
    # and every value should be of length>2
    
    And match response[0].project[0].technology == '#[3] #string? _.length>2'
