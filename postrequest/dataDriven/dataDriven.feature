Feature: To perform data driven testing using karate framework

  Background: Read the data for data driven
    * def testdata = read("testData.csv")

  # to differentiate between the tests, we can specify some column name in the scenario outline desc
  Scenario Outline: Data driven testing using karate framework <method>
    Given print '<url>'
    When print '<path>'
    Then print '<method>'
    And print '<status>'

    Examples: 
      | url                   | path               | method | status |
      | http://localhost:9898 | /normal/webapi/all | get    |    200 |
      | http://localhost:9898 | /normal/webapi/add | post   |    201 |
      | http://localhost:9898 | /normal/webapi/add | put    |    201 |

  Scenario Outline: Data driven for the job description entry -
    Given url 'http://localhost:9897/normal/webapi/add'
    And request {  "jobId": '#(jobId)',"jobTitle": '#(jobTitle)', "jobDescription": '#(jobDescription)', "experience": [ "Google", "Apple", "Mobile Iron", "Google" ], "project": [ { "projectName": "Movie App", "technology": [ "Kotlin", "SQL Lite","Gradle", "Jenkins" ] } ]}
    And headers {Accept: 'application/json' , Content-Type: 'application/json'}
    When method post
    Then status <status>
    And print response

    Examples: 
      | jobId | jobTitle           | jobDescription                 | status |
      |    11 | Software Engg - 11 | To develop andriod application |    201 |
      | id    | Software Engg - 9  | To develop andriod application |    400 |
      | false | Software Engg - 8  | To develop andriod application |    400 |

  # using csv file
  Scenario Outline: Data driven for the job description entry using csv file
    Given url 'http://localhost:9897/normal/webapi/add'
    And request {  "jobId": '#(jobId)',"jobTitle": '#(jobTitle)', "jobDescription": '#(jobDescription)', "experience": [ "Google", "Apple", "Mobile Iron", "Google" ], "project": [ { "projectName": "Movie App", "technology": [ "Kotlin", "SQL Lite","Gradle", "Jenkins" ] } ]}
    And headers {Accept: 'application/json' , Content-Type: 'application/json'}
    When method post
    Then status <status>
    Examples: 
      #|testdata|
      |read("testData.csv")|
