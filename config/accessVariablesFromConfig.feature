Feature: Accessing variables from config.js file

  Background: To get the value of myVarName
    * def localVarName = myVarName
    Given print "Background Variable value --> ", localVarName
    Given url _url
    And print "URL is -->" , _url

  Scenario: To get the value of username and password from karate-config.js
    # we can access the global variables either directly or by defining a variable-> storing in it and then printing it
    * def localUserName = username
    And print "Global Config Values -->" , localUserName, password
