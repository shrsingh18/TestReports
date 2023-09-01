Feature: To send the request for JWT token
         GET https://jobapplicationjwt.herokuapp.com/auth/webapi/all

  Scenario: Send the Get request to obtain the JWT token
    * def getToken = call read('../../getToken.feature') {username:'admin' , password: 'nimda'}
    Given url 'https://jobapplicationjwt.herokuapp.com/auth/webapi/all'
    And headers {Accept: 'application/json' , Authorization : '#("Bearer " + getToken.authToken)'}
    When method get
    Then status 200
	