Feature: To validate the json array

  Scenario: To get the data in json format
    Given url 'http://localhost:9897'
    And path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    And match response[0].jobTitle == 'Software Engg'
    And match response[0].experience[1] == 'Apple'
    And match response[0].project[0].projectName == 'Movie App'
    And match response[0].project[0].technology[2] == 'Gradle'
    # validate the size of json array
    And match response[0].experience == '#[3]'
    # negative scenario where the size doesn't match
    #And match response[0].project[0].technology == '#[1]'
    # validating using wild card characters
    And match response[0].experience[*] == ['Google' , 'Apple', 'Mobile Iron']
    # using contains keyword
    And match response[0].experience[*] contains ['Mobile Iron']
    And match response[0].project[0].technology[*] contains ['Gradle']
    And match response[*].jobId contains 1
