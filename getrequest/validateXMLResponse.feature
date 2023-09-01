Feature: To validate the json array

  Scenario: To get the data in xml format
    Given url 'http://localhost:9897'
    And path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And print response
    And match response/List/item/jobId == '1'
    And match response/List/item/jobDescription == 'To develop andriod application'
    And match response/List/item/experience/experience[1] == 'Google'
    And match response/List/item/project/project/projectName == 'Movie App'
		And match response/List/item/project/project/technology/technology[2] == 'SQL Lite'
		# by skipping the response keyword and directly writing the xpath
		And match /List/item/project/project/technology/technology[3] == 'Gradle'
		
		# traverseing the xml similar to json i.e. using "." operator
		# in case of xml index starts with 1 and in json it starts with 0
		And match response.List.item.jobId == '1'
		And match response.List.item.project.project.technology.technology[2] == 'Gradle'