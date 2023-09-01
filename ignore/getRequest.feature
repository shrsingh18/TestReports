Feature: To test the end point of given application
#Note: a given feature can have multiple scenarios
Scenario: To test the end point with JSON data
Given the application url 'www.google.com'
And the context path is '/getdata'
When I send the request
Then the status code should be 200
And the format should be JSON

@ignore
Scenario: To test the end point with XML data
Given the application url 'www.google.com'
And the context path is '/getdata'
When I send the request
Then the status code should be 200
And the format should be XML