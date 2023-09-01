Feature: Demo deleting a job entry using DELETE endpoint 
				 Endpoint: /normal/webapi/remove/{id}
				 
				 
				 Background: Setting up the base url
				 Given url 'http://localhost:9897'
				 
				 Scenario: To delete a job entry using delete request
				 # Create a new job entry : Post Request
				 # Delete the newly created job entry : Delete Request
				 # Get Request with query param and validate for 404 : Get Request
				 
				 Given path '/normal/webapi/add'
				 * def getRandomValue = function() {return Math.floor(200 * Math.random());}	
				 * def createJobId = getRandomValue()
				 And request {"jobId":'#(createJobId)',"jobTitle":"Software Engg-280","jobDescription":"To develop web application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App-280","technology":["Kotlin","SQL Lite","Gradle"]}]}
				 And headers {Content-Type : 'application/json' , Accept : 'application/json'}
				 When method post
				 Then status 201
				 And match response.jobId == createJobId
				 
				 Given path '/normal/webapi/remove/' +createJobId
				 When method delete
				 Then status 200
				 
				 Given path '/normal/webapi/find'
				 And headers {Accept : 'application/json'}
				 And params {id : '#(createJobId)' , jobTitle: 'Software Engg-280'}
				 When method get
				 Then status 404
				 
				  Scenario: To delete a job entry using delete request twice
				 # Create a new job entry : Post Request
				 # Delete the newly created job entry : Delete Request
				 # Get Request with query param and validate for 404 : Get Request
				 
				 Given path '/normal/webapi/add'
				 * def getRandomValue = function() {return Math.floor(200 * Math.random());}	
				 * def createJobId = getRandomValue()
				 And request {"jobId":'#(createJobId)',"jobTitle":"Software Engg-280","jobDescription":"To develop web application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App-280","technology":["Kotlin","SQL Lite","Gradle"]}]}
				 And headers {Content-Type : 'application/json' , Accept : 'application/json'}
				 When method post
				 Then status 201
				 And match response.jobId == createJobId
				 
				 Given path '/normal/webapi/remove/' +createJobId
				 When method delete
				 Then status 200
			
				 Given path '/normal/webapi/remove/' +createJobId
				 When method delete
				 Then status 404
				 
		 
				
				 