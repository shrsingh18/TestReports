Feature: To upload the file using karate framework

Background:
Given url 'http://localhost:9897'

Scenario: To execute file upload using karate framework using post endpoint:/normal/webapi/upload 
Given path '/normal/webapi/upload'
# specifying location of file, name of file and content type eader value
# multipart file are keywords used to achienve fileupload
And multipart file file = {read : 'dummy.txt', fileName : 'dummy.txt' , Content-Type : 'multipart/form-data'}
When method post
Then status 200
And print response



Scenario: To execute file upload using karate framework and validating if the file has been uploaded or not
Given path '/normal/webapi/upload'
# specifying location of file, name of file and content type eader value
# multipart file are keywords used to achienve fileupload
And multipart file file = {read : 'dummy.txt', fileName : 'dummy.txt' , Content-Type : 'multipart/form-data'}
When method post
Then status 200
# validation if the file has been uploaded or not
And print response
And match response.message contains "dummy.txt"


Scenario: To execute file upload using karate framework when the file is present in a different package than the feature file and 
					Validating if the file has been uploaded or not
Given path '/normal/webapi/upload'
# specifying location of file, name of file and content type eader value
# multipart file are keywords used to achienve fileupload
And multipart file file = {read : '../externalfile/JsonRequest.json', fileName : 'dummy.txt' , Content-Type : 'multipart/form-data'}
When method post
Then status 200
# validation if the file has been uploaded or not
And print response
And match response.message contains "JsonRequest.json"