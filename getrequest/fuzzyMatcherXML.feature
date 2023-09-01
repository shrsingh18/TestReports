Feature: To validate the json array

  Scenario: To get the data in xml format and validate it using fuzzy matchers
    Given url 'http://localhost:9897'
    And path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And print response
    And match response/List/item/jobId == '#ignore'
    And match response/List/item/experience/experience == '#array'
    And match response/List/item/project/project/projectName == '#present'
    And match response/List/item/project/project/technology/technology[2] == '#notnull'
    
    # Complex fuzzy matchers
    And match response/List/item/project/project/projectName == '#string? _.length == 9'
    And match response/List/item/project/project/projectName.projectId == '#notpresent'