Feature: To validate the GET endpoint
  		 To validate the GET endpoint response

  Background: Defining the base path
    Given url 'http://localhost:9897'

  # i. Validating complete response
  Scenario: To get the data in JSON format
    And path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    And match response ==
      """
      [
       {
      "jobId": 1,
      "jobTitle": "Software Engg",
      "jobDescription": "To develop andriod application",
      "experience": [
        "Google",
        "Apple",
        "Mobile Iron"
      ],
      "project": [
        {
          "projectName": "Movie App",
          "technology": [
            "Kotlin",
            "SQL Lite",
            "Gradle"
          ]
        }
      ]
      }
      ]
      """

  Scenario: To get the data in XML format
    And path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And print response
    And match response ==
      """
      <item>
      <jobId>1</jobId>
      <jobTitle>Software Engg</jobTitle>
      <jobDescription>To develop andriod application</jobDescription>
      <experience>
        <experience>Google</experience>
        <experience>Apple</experience>
        <experience>Mobile Iron</experience>
      </experience>
      <project>
        <project>
          <projectName>Movie App</projectName>
          <technology>
            <technology>Kotlin</technology>
            <technology>SQL Lite</technology>
            <technology>Gradle</technology>
          </technology>
        </project>
      </project>
      </item>
      </List>
      """

  # ii. Using with negative condition
  Scenario: To get the data in JSON format and validate using negate condition
    And path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    And match response !=
      """
      [
       {
      "jobId": 1,
      "jobTitle": "Software Engg",
      "jobDescription": "To develop andriod application",
      "experience": [
        "Google",
        "Apple",
        "Mobile Iron"
      ],
      "project": [
        {
          "projectName": "Movie App",
          "technology": [
            "Kotlin",
            "SQL Lite",
            "Gradle"
          ]
        }
      ]
      }
      ]
      """

  # iii. Validating specific property in json
  Scenario: To get the data in JSON format and validating specific property in json
    And path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    And match response contains deep {"jobDescription": "To develop andriod application"}

  # iv. Validating header values of json
  Scenario: To get the data in JSON format and validating header values in json
    And path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    And match header Content-Type == 'application/json'
