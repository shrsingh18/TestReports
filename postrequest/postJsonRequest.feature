Feature: To create and validate a post request
				 The endpoint of the post method is /normal/webapi/add
				 

				 Background: Creating and initializing the base url
				 Given url 'http://localhost:9897'
				 
				 Scenario: Creating a post request in json format
				 Given path '/normal/webapi/add'
				 And request {"jobId":4,"jobTitle":"Software Engg-4","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]} 
				 And headers {Accept : 'application/json' , Content-Type : 'application/json'}
				 When method post
				 Then status 201
				 And print response
				 And match response.jobId == 4
				 
				 Scenario: Reading the get request in json format
				 Given path '/normal/webapi/all' 
				 And header Accept = 'application/json'
				 When method get
				 Then status 200
				 And print response
				 
				 # creating a post request by reading the data from external file
				  Scenario: Creating a post request in json format by reading the data from external file
				 Given path '/normal/webapi/add'
				 * def body = read("externalfile/JsonRequest.json")
				 And request body
				 And headers {Accept : 'application/json' , Content-Type : 'application/json'}
				 When method post
				 Then status 201
				 And print response
				
				 
				 Scenario: Reading the get request in json format after it has been created by external file
				 Given path '/normal/webapi/all' 
				 And header Accept = 'application/json'
				 When method get
				 Then status 200
				 And print response