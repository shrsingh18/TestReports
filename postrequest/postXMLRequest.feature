Feature: To create and validate a post request
				 The endpoint of the post method is /normal/webapi/add
				 

				 Background: Creating and initializing the base url
				 Given url 'http://localhost:9897'
				 
				 Scenario: Creating a post request in xml format
				 Given path '/normal/webapi/add'
				 And request <item><jobId>5</jobId><jobTitle>Software Engg-5</jobTitle><jobDescription>To develop andriod application</jobDescription><experience><experience>Google</experience><experience>Apple</experience><experience>Mobile Iron</experience></experience><project><project><projectName>Movie App-5</projectName><technology><technology>Kotlin</technology><technology>SQL Lite</technology><technology>Gradle</technology></technology></project></project></item> 
				 And headers {Accept : 'application/xml' , Content-Type : 'application/xml'}
				 When method post
				 Then status 201
				 And print response
				 And match response/Job/jobTitle == 'Software Engg-5'
				 And match response/Job/jobId == '5'
				 
				 Scenario: Reading the get request in xml format
				 Given path '/normal/webapi/all' 
				 And header Accept = 'application/xml'
				 When method get
				 Then status 200
				 And print response
				 
				 # creating a post request by reading the data from external file
				 Scenario: Creating a post request in xml format from external file
				 Given path '/normal/webapi/add'
				 And def body = read("externalfile/XMLRequest.xml")
				 And request body 
				 And headers {Accept : 'application/xml' , Content-Type : 'application/xml'}
				 When method post
				 Then status 201
				 And print response
				