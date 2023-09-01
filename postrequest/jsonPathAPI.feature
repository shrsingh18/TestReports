Feature: To use the JSON Path Expression

Background: Setup the base path
Given url 'http://localhost:9897'

Scenario: To get the value of property using json path expression
Given path '/normal/webapi/all'
And header Accept = 'application/json'
When method get
Then status 200
# using jobId to fetch the values of other properties using json path expression
# Syntax for Json Path API = karate.jsonPath(json doc, expression)
* def jobId = 5
* def jobTitle = karate.jsonPath(response, "$[?(@.jobId == 5)].jobTitle")
* def technology = karate.jsonPath(response, "$[?(@.jobId == 5)]..technology")
* def projectName = karate.jsonPath(response, "$[?(@.jobId == 5)]..projectName")
And print "JobTitle ---->" , jobTitle
And print "Technology ---->" , technology
And print "ProjectName ---->" , projectName