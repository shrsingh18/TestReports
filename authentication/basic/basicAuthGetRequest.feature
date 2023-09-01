Feature: To access the secure get endpoint using username and password
				 Get endpoint: /secure/webapi/all
				 
				 Background: Setting up the base url
				 Given url 'http://localhost:9897'
				 
				 Scenario: To access the GET endpoint with basic auth
				 Given path '/secure/webapi/all'
				 And headers {Accept : 'application/json' , Authorization : 'Basic YWRtaW46d2VsY29tZQ=='}
				 When method get
				 Then status 200
				 
				 
				  Scenario: To access the GET endpoint without basic auth
				 Given path '/secure/webapi/all'
				 And headers {Accept : 'application/json'}
				 When method get
				 Then status 401
				 
				  Scenario: To access the GET endpoint with wrong basic auth
				 Given path '/secure/webapi/all'
				 And headers {Accept : 'application/json' , Authorization : 'YXV0aG9yOndlbGNvbWU='}
				 When method get
				 Then status 401