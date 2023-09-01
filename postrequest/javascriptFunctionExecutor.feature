Feature: To execute the Javascript Function

Scenario: Execute Javascript function without a parameter
* def getIntValue = function() {return 100;}
Then print "Function Value is ==>" , getIntValue()
* def getRandomNumber = function() {return (Math.floor(Math.random() * 101));}
And print "Random Function Value is ==>" , getRandomNumber()

Scenario: Execute Javascript function with a parameter
* def getStringValue = function(s1) {return "Hello " + s1;}
Then print "Function Value is ==>" , getStringValue("To Karate")  # specifying the argument value while calling the function
